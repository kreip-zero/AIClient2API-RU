#!/bin/bash
# Версии AIClient2API, на которых русификатор проверен
SUPPORTED_VERSIONS="3.5.6 3.5.7"
SUPPORTED_SHOW="v3.5.6, v3.5.7"

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
if [[ " $SUPPORTED_VERSIONS " != *" $INSTALLED_VERSION "* || -z "$INSTALLED_VERSION" ]] && [ "$RU_FORCE" != "1" ]; then
    echo "[ОШИБКА] Русификатор рассчитан на AIClient2API $SUPPORTED_SHOW, а у вас версия: ${INSTALLED_VERSION:-неизвестна}."
    echo "Установка на другую версию может сломать панель управления."
    echo "Обновите программу до одной из этих версий или найдите подходящую версию русификатора:"
    echo "  https://github.com/kreip-zero/AIClient2API-RU/tags"
    echo "Установить все равно (на свой риск):"
    echo "  curl -sL https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.sh | RU_FORCE=1 bash"
    exit 1
fi

echo "[ИНФО] Скачивание файлов перевода с GitHub..."
curl -sL -o ru_patch.zip "https://github.com/kreip-zero/AIClient2API-RU/archive/refs/heads/main.zip" || { echo "[ОШИБКА] Не удалось скачать архив."; exit 1; }

echo "[ИНФО] Распаковка..."
unzip -q -o ru_patch.zip || { echo "[ОШИБКА] Не удалось распаковать архив (нужна утилита unzip)."; rm -f ru_patch.zip; exit 1; }

echo "[ИНФО] Установка..."
cp -r AIClient2API-RU-main/src_files/static/* ./static/

echo "[ИНФО] Очистка временных файлов..."
rm -rf AIClient2API-RU-main ru_patch.zip

echo ""
echo "[УСПЕХ] Русификатор успешно установлен!"
echo "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)."
echo "================================================="
