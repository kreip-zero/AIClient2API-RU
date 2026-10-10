# Версии AIClient2API, на которых русификатор проверен
$SupportedVersions = @("3.5.6", "3.5.7")
$SupportedShow = "v3.5.6, v3.5.7"

Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  Установка русской локализации AIClient2API" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

if (-Not (Test-Path "static\app\i18n.js")) {
    Write-Host "[ОШИБКА] Пожалуйста, запустите эту команду находясь в корневой папке AIClient2API!" -ForegroundColor Red
    Write-Host "Пример: cd C:\Путь\К\AIClient2API" -ForegroundColor Red
    return
}

# Русификатор заменяет файлы интерфейса целиком, поэтому версия программы должна совпадать
$InstalledVersion = ""
if (Test-Path "VERSION") { $InstalledVersion = (Get-Content "VERSION" -Raw).Trim() }
if (($SupportedVersions -notcontains $InstalledVersion) -and $env:RU_FORCE -ne "1") {
    if (-Not $InstalledVersion) { $InstalledVersion = "неизвестна" }
    Write-Host "[ОШИБКА] Русификатор рассчитан на AIClient2API $SupportedShow, а у вас версия: $InstalledVersion." -ForegroundColor Red
    Write-Host "Установка на другую версию может сломать панель управления." -ForegroundColor Red
    Write-Host "Обновите программу до одной из этих версий или найдите подходящую версию русификатора:" -ForegroundColor Yellow
    Write-Host "  https://github.com/kreip-zero/AIClient2API-RU/tags" -ForegroundColor Yellow
    Write-Host "Установить все равно (на свой риск):" -ForegroundColor Yellow
    Write-Host '  $env:RU_FORCE="1"; irm https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.ps1 | iex' -ForegroundColor Yellow
    return
}

try {
    Write-Host "[ИНФО] Скачивание файлов перевода с GitHub..." -ForegroundColor Yellow
    Invoke-WebRequest -Uri "https://github.com/kreip-zero/AIClient2API-RU/archive/refs/heads/main.zip" -OutFile "ru_patch.zip" -UseBasicParsing

    Write-Host "[ИНФО] Распаковка..." -ForegroundColor Yellow
    Expand-Archive -Path "ru_patch.zip" -DestinationPath "ru_patch_temp" -Force

    $SourceRoot = (Resolve-Path "ru_patch_temp\AIClient2API-RU-main\src_files").Path
    $BackupDir = "ru_backup_" + (Get-Date -Format "yyyyMMdd_HHmmss")
    Write-Host "[ИНФО] Резервная копия заменяемых файлов: $BackupDir" -ForegroundColor Yellow
    Get-ChildItem -Path "$SourceRoot\static" -Recurse -File | ForEach-Object {
        $Relative = $_.FullName.Substring($SourceRoot.Length + 1)
        if (Test-Path $Relative) {
            $Target = Join-Path $BackupDir $Relative
            New-Item -ItemType Directory -Force -Path (Split-Path $Target) | Out-Null
            Copy-Item -Path $Relative -Destination $Target -Force
        }
    }

    Write-Host "[ИНФО] Установка..." -ForegroundColor Yellow
    Copy-Item -Path "$SourceRoot\static\*" -Destination "static" -Recurse -Force
}
catch {
    Write-Host "[ОШИБКА] $($_.Exception.Message)" -ForegroundColor Red
    return
}
finally {
    Write-Host "[ИНФО] Очистка временных файлов..." -ForegroundColor Yellow
    if (Test-Path "ru_patch_temp") { Remove-Item -Path "ru_patch_temp" -Recurse -Force }
    if (Test-Path "ru_patch.zip") { Remove-Item -Path "ru_patch.zip" -Force }
}

Write-Host ""
Write-Host "[УСПЕХ] Русификатор успешно установлен!" -ForegroundColor Green
Write-Host "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)." -ForegroundColor Green
Write-Host "Вернуть исходные файлы можно из папки $BackupDir." -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Cyan
