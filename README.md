<div align="center">

# Русификатор AIClient2API 🇷🇺

**Русский перевод панели управления AIClient2API: больше 1240 строк интерфейса, страницы плагинов и китайские надписи, которые были вшиты прямо в код. Ставится одной командой на Windows, Linux и macOS.**

</div>

<div align="center">

[![Совместимость](https://img.shields.io/badge/AIClient2API-v3.5.6%20%7C%20v3.5.7-brightgreen.svg)](https://github.com/justlovemaki/AIClient-2-API)
[![GitHub stars](https://img.shields.io/github/stars/kreip-zero/AIClient2API-RU.svg?style=flat&label=Star)](https://github.com/kreip-zero/AIClient2API-RU/stargazers)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

</div>

---

> [!NOTE]  
> **Совместимость версий**: текущая версия русификатора собрана и проверена на **AIClient2API v3.5.6 и v3.5.7**. В v3.5.7 файлы интерфейса не менялись, поэтому перевод для обеих версий одинаковый.
>
> Русификатор заменяет файлы интерфейса целиком, поэтому на другой версии программы он может сломать панель управления. Установщики проверяют версию (файл `VERSION` в папке программы) и не дадут поставить перевод на неподходящую версию. Перевод для старых версий (v3.3.8 – v3.4.0) доступен в теге [`for-aiclient-3.4.0`](https://github.com/kreip-zero/AIClient2API-RU/tree/for-aiclient-3.4.0).

---

## Установка

Откройте PowerShell (или Terminal) **внутри папки с установленной программой AIClient2API** и выполните одну команду. Скачивать вручную ничего не нужно.

### Для Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.ps1 | iex
```

### Для Linux / macOS (Terminal)
```bash
curl -sL https://raw.githubusercontent.com/kreip-zero/AIClient2API-RU/main/install.sh | bash
```

> [!IMPORTANT]  
> После успешной установки **обязательно** обновите страницу панели управления в браузере с полным сбросом кэша:
> * Windows / Linux: `Ctrl + F5`
> * macOS: `Cmd + Shift + R`

Раньше здесь были и другие способы: установщик `.exe` в разделе Releases, офлайн-скрипт для Linux/macOS и ручная замена файлов. Их убрали из-за банальной неудобности, ведь ввести одну команду намного проще.

---

## Что переведено
* **Панель управления**: все строки интерфейса (меню, настройки, пулы провайдеров, модальные окна, лимиты, логи, песочница, плагины, GitHub Copilot), всего больше 1240 строк.
* **Страницы плагинов**: API Potluck (администратор и пользователь) и статистика использования моделей.
* **Описания плагинов** в разделе «Плагины» показываются на русском.
* **Переключатель языков**: пункт «Русский» на странице входа и в шапке панели, на кнопке видно «RU».
* **Вшитые в код элементы**: карточки WeChat и поддержки проекта, подписи QR-кодов, всплывающие сообщения авторизации Kiro, ошибки загрузки моделей.

## Какие файлы заменяются
Все файлы лежат в папке `src_files/static` и копируются в папку `static` программы:

* `app/i18n.js`: словарь переводов (добавлен язык `ru-RU`, китайский и английский не тронуты);
* `app/language-switcher.js`, `login.html`: переключатель языка;
* `app/modal.js`, `app/provider-manager.js`, `app/plugin-manager.js`: вшитые китайские строки заменены на переводимые;
* `potluck.html`, `potluck-user.html`, `model-usage-stats.html`: страницы плагинов.
