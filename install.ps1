Write-Host "=================================================" -ForegroundColor Cyan
Write-Host "  Установка русской локализации AIClient2API" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan
Write-Host ""

if (-Not (Test-Path "static\app\i18n.js")) {
    Write-Host "[ОШИБКА] Пожалуйста, запустите эту команду находясь в корневой папке AIClient2API!" -ForegroundColor Red
    Write-Host "Пример: cd C:\Путь\К\AIClient2API" -ForegroundColor Red
    exit
}

Write-Host "[ИНФО] Скачивание файлов перевода с GitHub..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "https://github.com/kreip-zero/AIClient2API-RU/archive/refs/heads/main.zip" -OutFile "ru_patch.zip"

Write-Host "[ИНФО] Распаковка и установка..." -ForegroundColor Yellow
Expand-Archive -Path "ru_patch.zip" -DestinationPath "ru_patch_temp" -Force
Copy-Item -Path "ru_patch_temp\AIClient2API-RU-main\src_files\static\*" -Destination "static" -Recurse -Force

Write-Host "[ИНФО] Очистка временных файлов..." -ForegroundColor Yellow
Remove-Item -Path "ru_patch_temp" -Recurse -Force
Remove-Item -Path "ru_patch.zip" -Force

Write-Host ""
Write-Host "[УСПЕХ] Русификатор успешно установлен!" -ForegroundColor Green
Write-Host "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)." -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Cyan
