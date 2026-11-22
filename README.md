# Clore Panel

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-db61a2?logo=githubsponsors)](https://github.com/sponsors/dotradepro)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-FF5E5B?logo=ko-fi&logoColor=white)](https://ko-fi.com/dotradepro)

Панель мониторинга и **автоматизации заработка** на GPU-серверах [Clore.ai](https://clore.ai): автоцена,
майнинг в простое, арбитраж (аренда чужих GPU под майнинг, когда это выгоднее) и Claude-помощник в Telegram.
Работает на **Linux и Windows**. Только Python 3 из стандартной библиотеки — без внешних зависимостей.

**Русский** · [English](#clore-panel-english)

---

## ⚡ Установка

**Linux** (одна строка, нужен Python 3 и драйвер NVIDIA):

```bash
curl -fsSL https://raw.githubusercontent.com/dotradepro/clore-panel/main/packaging/install.sh | sudo bash
```

**Windows 10/11:** скачайте `ClorePanelSetup-<версия>.exe` из [последнего релиза](https://github.com/dotradepro/clore-panel/releases/latest) и запустите — права администратора и Python не нужны. Установщик пока без цифровой подписи: если Windows покажет «Система Windows защитила ваш компьютер», нажмите «Подробнее» → «Выполнить в любом случае».

Затем откройте панель (на Windows — ярлык «Clore Panel», на Linux — **http://localhost:8080** или приложение в меню) и введите ключи в «Настройки → Аккаунты и ключи».

## 🚀 Что умеет

- **Мониторинг** — баланс, серверы онлайн/в аренде, доход за день/7/30 дней, температура и загрузка GPU, события.
- **Автоцена** — считает цену от медианы реально сданных серверов с такой же картой; пол = доход майнинга + запас. Спот можно держать дешевле постоянной аренды.
- **Майнинг в простое** (Kryptex) — свободная карта сама майнит выгоднейшую монету (Pearl/Quantus) и останавливается на время аренды. Воркеры, доход, награды за 31 день и доходность сети — из официального API пула; по желанию вход в Kryptex (вы логинитесь сами) открывает реальный баланс и изменение настроек майнера прямо из панели.
- **Арбитраж** 🅿️ — арендует чужие GPU и майнит на них, когда это дешевле дохода; решает по окупаемости и марже, учится на результатах, проверяет подлинность железа (предупреждения по карточке + сверка чипа PCI в контейнере), фильтрует плохие хосты и бот-снайперов, платит в BTC/CLORE.
- **Claude-помощник в Telegram** 🅿️ — отвечает на вопросы о серверах, арендах, арбитраже и деньгах (данные берёт из панели), присылает утренний бриф; действия (отмена аренды, режим арбитража) — только после вашей кнопки «Выполнить». Доступ — ключом API Anthropic или подпиской Claude (Claude Code ставится из панели кнопкой).
- **Приложение для Windows** — своё окно и значок в трее: цвет по состоянию, «Сдано», «Доход сегодня», уведомления о важных событиях, запуск при входе в Windows.
- **Анти-майнер** — режет частоту арендаторам, которые майнят (владельца не трогает).
- **Обслуживание** — драйвер NVIDIA, обновления, перезагрузка; свои сервера через агента.
- **Безопасность** — код агента обновляется только с подписью владельца; сами команды и настройки агентам подписаны ключом вашей панели (подменить их, зная токен или встав посередине соединения, нельзя); опасные действия из браузера (смена ключей, восстановление бэкапа, удаление агента, драйвер, разгон, авто-арбитраж) подтверждаются кодом из Telegram; ключи и пароли в настройках хранятся зашифрованными.
- **Проверка обновлений** — панель сама видит новую версию на GitHub: на Windows кнопка «Обновить» скачивает и ставит её в один клик, на Linux открывает терминал с командой (пароль root вводите вы), в веб-версии показывает команду.

🅿️ — функции тарифа **Pro**.

## 💳 Free и Pro

| Free (бесплатно) | Pro (подписка/разово) |
|---|---|
| Мониторинг, графики, доходы/P&L | Арбитраж |
| Обслуживание серверов | Обучение на результатах |
| Просмотр майнинга | Автоцена — авто-режим, Claude-помощник в Telegram |
| Автоцена — режим «совет» | Мультивалютный майнинг, рыночная аналитика |

**Как купить Pro:** прямо в панели — «Настройки → Аккаунты и ключи → Лицензия → Купить Pro»:
- **$49 — навсегда** (разовый платёж) или **$5 в месяц** (подписка, отменяется в любой момент в кабинете PayPal);
- оплата через PayPal, можно банковской картой без аккаунта PayPal;
- после оплаты Pro включается сам — ключ вводить не нужно.

❤ Поддержать мои проекты можно на [GitHub Sponsors](https://github.com/sponsors/dotradepro) или [Ko-fi](https://ko-fi.com/dotradepro) — это именно поддержка, Pro там не продаётся.

## 📖 Документация

Подробный мануал со скриншотами (установка на Linux и Windows, каждая вкладка, арбитраж, автоцена, Claude-помощник, FAQ) — в **[Wiki](https://github.com/dotradepro/clore-panel/wiki)**.

## 📄 Лицензия

Проприетарная — см. [LICENSE](LICENSE). Программа работает автономно и тратит ваш баланс в заданных вами лимитах; используете на свой риск.

---

# Clore Panel (English)

A monitoring and **earnings-automation** panel for [Clore.ai](https://clore.ai) GPU hosts: auto-pricing,
idle mining, arbitrage (renting other people's GPUs to mine when it's cheaper than the yield) and a Claude
assistant in Telegram. Runs on **Linux and Windows**. Pure Python 3 standard library — no external dependencies.

[Русский](#clore-panel) · **English**

## ⚡ Install

**Linux** (one line; needs Python 3 and the NVIDIA driver):

```bash
curl -fsSL https://raw.githubusercontent.com/dotradepro/clore-panel/main/packaging/install.sh | sudo bash
```

**Windows 10/11:** download `ClorePanelSetup-<version>.exe` from the [latest release](https://github.com/dotradepro/clore-panel/releases/latest) and run it — no admin rights or Python needed. The installer isn't code-signed yet: if Windows shows “Windows protected your PC”, click “More info” → “Run anyway”.

Then open the panel (Windows: the “Clore Panel” shortcut; Linux: **http://localhost:8080** or the app in the menu) and enter your keys under *Settings → Accounts & keys*.

## 🚀 Features

- **Monitoring** — balance, servers online/rented, earnings per day/7/30d, GPU temp & load, events.
- **Auto-pricing** — prices from the median of actually-rented servers with the same GPU; floor = mining income + margin. Spot can be kept cheaper than on-demand.
- **Idle mining** (Kryptex) — a free GPU mines the most profitable coin (Pearl/Quantus) and stops while rented. Workers, income, 31-day rewards and network profitability come from the official pool API; optionally, signing into Kryptex (you log in yourself) unlocks the real balance and editing miner settings right from the panel.
- **Arbitrage** 🅿️ — rents other GPUs and mines on them when cheaper than the yield; decides by payback and margin, learns from results, verifies hardware authenticity (listing warnings + PCI-chip check in the container), filters bad hosts and sniper bots, pays in BTC/CLORE.
- **Claude assistant in Telegram** 🅿️ — answers questions about servers, rentals, arbitrage and money (using the panel's data), sends a morning brief; actions (cancel a rental, arbitrage mode) only after you press “Run”. Access via an Anthropic API key or a Claude subscription (Claude Code is installed from the panel with one click).
- **Windows app** — its own window and tray icon: status colour, rented servers, today's income, notifications about important events, start at sign-in.
- **Anti-miner** — throttles renters who mine (never the owner).
- **Maintenance** — NVIDIA driver, updates, reboot; your own servers via an agent.
- **Security** — agent code updates only with the owner's signature; commands and settings sent to agents are signed by your panel's own key (they can't be forged with the agent token or a man-in-the-middle); dangerous actions from the browser (changing keys, restoring a backup, removing an agent, driver, overclocking, automatic arbitrage) require a code from Telegram; keys and passwords are stored encrypted.
- **Update check** — the panel spots a new version on GitHub: on Windows the “Update” button downloads and installs it in one click, on Linux it opens a terminal with the command (you type the root password), on the web it shows the command.

🅿️ — **Pro** tier features.

## 💳 Free vs Pro

| Free | Pro (subscription / one-time) |
|---|---|
| Monitoring, charts, earnings/P&L | Arbitrage |
| Server maintenance | Learning from results |
| Mining view | Auto-pricing — automatic, Claude assistant in Telegram |
| Auto-pricing — advise mode | Multi-coin mining, market intel |

**How to buy Pro:** right in the panel — *Settings → Accounts & keys → License → Buy Pro*:
- **$49 — lifetime** (one-time) or **$5 a month** (subscription, cancel anytime in your PayPal account);
- pay with PayPal, or with a bank card without a PayPal account;
- Pro turns on by itself after payment — no key to enter.

❤ You can support my projects on [GitHub Sponsors](https://github.com/sponsors/dotradepro) or [Ko-fi](https://ko-fi.com/dotradepro) — that's pure support; Pro isn't sold there.

## 📖 Documentation

A detailed manual with screenshots (Linux and Windows install, every tab, arbitrage, auto-pricing, Claude assistant, FAQ) lives in the **[Wiki](https://github.com/dotradepro/clore-panel/wiki)**.

## 📄 License

Proprietary — see [LICENSE](LICENSE). The software runs autonomously and spends your balance within the limits you set; use at your own risk.
