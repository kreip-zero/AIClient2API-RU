#!/bin/bash
echo "================================================="
echo "  Установка русской локализации AIClient2API"
echo "================================================="
echo ""

if [ ! -f "static/app/i18n.js" ]; then
    echo "[ОШИБКА] Пожалуйста, запустите эту команду находясь в корневой папке AIClient2API!"
    echo "Пример: cd /путь/до/AIClient2API"
    exit 1
fi

echo "[ИНФО] Скачивание файлов перевода с GitHub..."
curl -sL -o ru_patch.zip "https://github.com/kreip-zero/AIClient2API-RU/archive/refs/heads/main.zip"

echo "[ИНФО] Распаковка и установка..."
unzip -q ru_patch.zip
cp -r AIClient2API-RU-main/src_files/static/* ./static/

echo "[ИНФО] Очистка временных файлов..."
rm -rf AIClient2API-RU-main ru_patch.zip

echo ""
echo "[УСПЕХ] Русификатор успешно установлен!"
echo "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)."
echo "================================================="
