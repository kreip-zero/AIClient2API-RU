#!/bin/bash
cd "$(dirname "$0")"

echo "================================================="
echo "  Установка русской локализации AIClient2API"
echo "================================================="
echo ""

if [ ! -d "src_files" ]; then
    echo "[ОШИБКА] Не могу найти папку 'src_files'!"
    echo "Убедитесь, что вы распаковали весь архив русификатора."
    echo ""
    exit 1
fi

TARGET_DIR=""

# Auto-detect paths
SEARCH_PATHS=("./" "../" "$HOME/AIClient2API" "/opt/AIClient2API")

for path in "${SEARCH_PATHS[@]}"; do
    if [ -f "${path}/static/app/i18n.js" ]; then
        # Resolve absolute path for cleaner display
        abs_path=$(cd "$path" 2>/dev/null && pwd)
        echo "[ИНФО] Обнаружена программа AIClient2API в папке:"
        echo "  $abs_path"
        read -p "Установить русификатор сюда? [Y/n]: " confirm
        if [[ $confirm == [yY] || $confirm == [yY][eE][sS] || -z $confirm ]]; then
            TARGET_DIR="$path"
            break
        fi
    fi
done

# Prompt manual entry if not found or rejected
while [ -z "$TARGET_DIR" ]; do
    echo ""
    echo "[ИНФО] Не удалось автоматически найти папку программы."
    read -p "Пожалуйста, введите полный путь до папки AIClient2API (ту, в которой лежит папка static): " user_path
    
    # Clean up tilde and quotes
    user_path="${user_path/#\~/$HOME}"
    user_path="${user_path%\"}"
    user_path="${user_path#\"}"

    if [ -f "${user_path}/static/app/i18n.js" ]; then
        TARGET_DIR="$user_path"
    else
        echo "[ОШИБКА] В указанной папке не найден файл 'static/app/i18n.js'!"
        echo "Пожалуйста, укажите правильную корневую папку AIClient2API."
    fi
done

echo ""
echo "[ИНФО] Копирование файлов в $TARGET_DIR..."
cp -r src_files/* "$TARGET_DIR/"

if [ $? -eq 0 ]; then
    echo "[УСПЕХ] Файлы успешно скопированы!"
    echo "Теперь перезагрузите страницу с AIClient2API в браузере (Ctrl+F5)."
else
    echo "[ОШИБКА] Не удалось скопировать файлы! Проверьте права доступа (может потребоваться sudo)."
fi
echo ""
