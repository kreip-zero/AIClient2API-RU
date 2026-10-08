<div align="center">

# Русификатор AIClient2API 🇷🇺

**Русский перевод панели управления AIClient2API: больше 1240 строк интерфейса, страницы плагинов и китайские надписи, которые были вшиты прямо в код. Ставится одной командой на Windows, Linux и macOS.**

</div>

<div align="center">

[![Совместимость](https://img.shields.io/badge/AIClient2API-v3.5.6-brightgreen.svg)](https://github.com/justlovemaki/AIClient-2-API)
[![GitHub stars](https://img.shields.io/github/stars/kreip-zero/AIClient2API-RU.svg?style=flat&label=Star)](https://github.com/kreip-zero/AIClient2API-RU/stargazers)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

</div>

---

> [!NOTE]  
> **Совместимость версий**: текущая версия русификатора собрана и протестирована для **AIClient2API v3.5.6**.
>
> Русификатор заменяет файлы интерфейса целиком, поэтому на другой версии программы он может сломать панель управления. Установщики проверяют версию (файл `VERSION` в папке программы) и не дадут поставить перевод на неподходящую версию. Перевод для старых версий (v3.3.8 – v3.4.0) доступен в теге [`for-aiclient-3.4.0`](https://github.com/kreip-zero/AIClient2API-RU/tree/for-aiclient-3.4.0).

---

## Быстрая установка (рекомендуется)

Быстрее всего поставить русификатор одной командой, **вручную ничего скачивать не нужно**.
Откройте PowerShell (или Terminal) **внутри папки с установленной программой AIClient2API** и выполните команду:

### Для Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.ps1 | iex
```

### Для Linux / macOS (Terminal)
```bash
curl -sL https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.sh | bash
```

> [!IMPORTANT]  
> Перед заменой установщик сохраняет исходные файлы в папку `ru_backup_<дата>` внутри папки программы, оттуда можно вернуть оригинал.
>
> После успешной установки **обязательно** обновите страницу панели управления в браузере с полным сбросом кэша:
> * Windows / Linux: `Ctrl + F5`
> * macOS: `Cmd + Shift + R`

---

## Другие способы установки

<details>
<summary><b>Способ 2: установщик .exe для Windows</b></summary>

1. Перейдите в раздел [**Releases**](https://github.com/kreip-zero/AIClient2API-RU/releases) справа на этой странице.
2. Скачайте файл **`AIClient2API_RU_Windows_Installer.exe`**.
3. Запустите его. Установщик автоматически попытается найти папку с вашей программой. Если он её не найдет, нажмите «Обзор...» и выберите корневую папку `AIClient2API`.
4. Нажмите «Установить».
</details>

<details>
<summary><b>Способ 3: офлайн-скрипт для Linux/macOS</b></summary>

1. Скачайте этот репозиторий (кнопка `Code` -> `Download ZIP`) и распакуйте.
2. Откройте терминал в папке с распакованным архивом.
3. Запустите мастер установки:
   ```bash
   bash AIClient2API_RU_Linux_Mac_Installer.sh
   ```
4. Скрипт сам найдет программу или попросит вас ввести путь до папки.
</details>

<details>
<summary><b>Способ 4: замена файлов вручную</b></summary>

Если вы хотите всё контролировать сами:
1. Зайдите в папку `src_files` в этом репозитории.
2. Скопируйте папку `static`.
3. Вставьте её в корневую директорию вашей программы `AIClient2API` и подтвердите замену файлов.
</details>

---

## Что переведено
* **Панель управления**: все строки интерфейса (меню, настройки, пулы провайдеров, модальные окна, лимиты, логи, песочница, плагины, GitHub Copilot), всего больше 1240 строк.
* **Страницы плагинов**: API Potluck (администратор и пользователь) и статистика использования моделей.
* **Описания плагинов** в разделе «Плагины» показываются на русском.
* **Переключатель языков**: пункт «Русский» на странице входа и в шапке панели; кнопка корректно показывает «RU».
* **Вшитые в код элементы**: карточки WeChat и поддержки проекта, подписи QR-кодов, всплывающие сообщения авторизации Kiro, ошибки загрузки моделей.

## Какие файлы заменяются
Все файлы лежат в папке `src_files/static` и копируются в папку `static` программы:

* `app/i18n.js`: словарь переводов (добавлен язык `ru-RU`, китайский и английский не тронуты);
* `app/language-switcher.js`, `login.html`: переключатель языка;
* `app/modal.js`, `app/provider-manager.js`, `app/plugin-manager.js`: вшитые китайские строки заменены на переводимые;
* `potluck.html`, `potluck-user.html`, `model-usage-stats.html`: страницы плагинов.
