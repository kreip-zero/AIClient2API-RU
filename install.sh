#!/bin/bash
# Версия AIClient2API, под которую собран русификатор
SUPPORTED_VERSION="3.5.6"

echo "================================================="
echo "  Установка русской локализации AIClient2API"
echo "================================================="
echo ""

if [ ! -f "static/app/i18n.js" ]; then
    echo "[ОШИБКА] Пожалуйста, запустите эту команду находясь в корневой папке AIClient2API!"
    echo "Пример: cd /путь/до/AIClient2API"
    exit 1
fi

# Русификатор заменяет файлы интерфейса целиком, поэтому версия программы должна совпадать
INSTALLED_VERSION=$(tr -d '[:space:]' < VERSION 2>/dev/null)
if [ "$INSTALLED_VERSION" != "$SUPPORTED_VERSION" ] && [ "$RU_FORCE" != "1" ]; then
    echo "[ОШИБКА] Русификатор рассчитан на AIClient2API v$SUPPORTED_VERSION, а у вас версия: ${INSTALLED_VERSION:-неизвестна}."
    echo "Установка на другую версию может сломать панель управления."
    echo "Обновите программу до v$SUPPORTED_VERSION или найдите подходящую версию русификатора:"
    echo "  https://github.com/kreip-zero/AIClient2API-RU/tags"
    echo "Установить все равно (на свой риск):"
    echo "  curl -sL https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.sh | RU_FORCE=1 bash"
    exit 1
fi

echo "[ИНФО] Скачивание файлов перевода с GitHub..."
curl -sL -o ru_patch.zip "https://github.com/kreip-zero/AIClient2API-RU/archive/refs/heads/main.zip" || { echo "[ОШИБКА] Не удалось скачать архив."; exit 1; }

echo "[ИНФО] Распаковка..."
unzip -q -o ru_patch.zip || { echo "[ОШИБКА] Не удалось распаковать архив (нужна утилита unzip)."; rm -f ru_patch.zip; exit 1; }

BACKUP_DIR="ru_backup_$(date +%Y%m%d_%H%M%S)"
echo "[ИНФО] Резервная копия заменяемых файлов: $BACKUP_DIR"
(cd AIClient2API-RU-main/src_files && find static -type f) | while read -r file; do
    if [ -f "$file" ]; then
        mkdir -p "$BACKUP_DIR/$(dirname "$file")"
        cp "$file" "$BACKUP_DIR/$file"
    fi
done

echo "[ИНФО] Установка..."
cp -r AIClient2API-RU-main/src_files/static/* ./static/

echo "[ИНФО] Очистка временных файлов..."
rm -rf AIClient2API-RU-main ru_patch.zip

echo ""
echo "[УСПЕХ] Русификатор успешно установлен!"
echo "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)."
echo "Вернуть исходные файлы можно из папки $BACKUP_DIR."
echo "================================================="
