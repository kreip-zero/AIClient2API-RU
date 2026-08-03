<div align="center">

# AIClient2API - Русификатор 🇷🇺

**Полная русская локализация интерфейса панели управления AIClient2API. Более 1160 переведенных строк, удобные скрипты автоматической установки одной командой и поддержка всех платформ.**

</div>

<div align="center">

[![Совместимость](https://img.shields.io/badge/AIClient2API-v3.3.8-brightgreen.svg)](https://github.com/justlovemaki/AIClient-2-API)
[![GitHub stars](https://img.shields.io/github/stars/kreip-zero/AIClient2API-RU.svg?style=flat&label=Star)](https://github.com/kreip-zero/AIClient-2-API-RU/stargazers)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

</div>

---

> [!NOTE]  
> **Совместимость версий**: Данный русификатор создан и протестирован **строго для AIClient2API версии v3.3.8**. В будущих обновлениях оригинальной программы текст может измениться.

---

## 🚀 Быстрая Установка (Рекомендуется)

Самый быстрый способ установить русификатор — использовать автоматические команды. **Не нужно ничего скачивать вручную!**
Просто откройте PowerShell (или cmd) **внутри папки с установленной программой AIClient2API** и выполните одну команду:

### Для Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.ps1 | iex
```

### Для Linux / macOS (Terminal)
```bash
curl -sL https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.sh | bash
```

> [!IMPORTANT]  
> После успешной установки **обязательно** обновите страницу панели управления в браузере с полным сбросом кэша, иначе интерфейс останется английским:
> * Windows / Linux: `Ctrl + F5`
> * macOS: `Cmd + Shift + R`

---

## 🛠️ Альтернативные способы установки

<details>
<summary><b>Способ 2: Использование Автоустановщика (.exe) для Windows</b></summary>

1. Перейдите в раздел [**Releases**](https://github.com/kreip-zero/AIClient2API-RU/releases) справа на этой странице.
2. Скачайте файл **`AIClient2API_RU_Windows_Installer.exe`**.
3. Запустите его. Установщик автоматически попытается найти папку с вашей программой. Если он её не найдет, просто нажмите "Обзор..." и выберите корневую папку `AIClient2API`.
4. Нажмите "Установить".
</details>

<details>
<summary><b>Способ 3: Офлайн-скрипт для Linux/macOS</b></summary>

1. Скачайте этот репозиторий (кнопка `Code` -> `Download ZIP`) и распакуйте.
2. Откройте терминал в папке с распакованным архивом.
3. Выполните команду запуска мастера установки:
   ```bash
   bash AIClient2API_RU_Linux_Mac_Installer.sh
   ```
4. Скрипт сам найдет программу или попросит вас ввести путь до папки.
</details>

<details>
<summary><b>Способ 4: Ручная замена файлов</b></summary>

Если вы хотите всё контролировать сами:
1. Зайдите в папку `src_files` в этом репозитории.
2. Скопируйте папку `static`.
3. Вставьте её в корневую директорию вашей программы `AIClient2API` и подтвердите замену файлов.
</details>

---

## 💡 Что было переведено?
* **Словарь**: Все 1160+ строк интерфейса (меню, тонкие настройки, пулы, модальные окна и логи).
* **Селектор языков**: В меню локализации добавлена полноценная кнопка "Русский".
* **Вшитые элементы**: Переведены жестко заданные в коде ссылки, карточки магазина, видеоуроки и формат отображения времени (Uptime).
