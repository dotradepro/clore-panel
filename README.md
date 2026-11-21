# Clore Panel

[![Sponsor](https://img.shields.io/badge/Sponsor-%E2%9D%A4-db61a2?logo=githubsponsors)](https://github.com/sponsors/dotradepro)

Панель мониторинга и **автоматизации заработка** на GPU-серверах [Clore.ai](https://clore.ai): автоцена,
майнинг в простое, арбитраж (аренда чужих GPU под майнинг, когда это выгоднее) и Telegram-оператор на базе Claude.
Только Python 3 из стандартной библиотеки — без внешних зависимостей.

**Русский** · [English](#clore-panel-english)

---

## ⚡ Установка (одна строка)

На Linux с видеокартой NVIDIA:

```bash
curl -fsSL https://raw.githubusercontent.com/dotradepro/clore-panel/main/packaging/install.sh | sudo bash
```

Откройте **http://localhost:8080** и введите ключи в «Настройки → Аккаунты». Нужен Python 3 (есть в любом современном Ubuntu/Debian) и драйвер NVIDIA.

## 🚀 Что умеет

- **Мониторинг** — баланс, серверы онлайн/в аренде, доход за день/7/30 дней, температура и загрузка GPU, события.
- **Автоцена** — считает цену от медианы реально сданных серверов с такой же картой; пол = доход майнинга + запас. Спот можно держать дешевле постоянной аренды.
- **Майнинг в простое** (Kryptex) — свободная карта сама майнит выгоднейшую монету (Pearl/Quantus) и останавливается на время аренды. Воркеры, доход, награды за 31 день и доходность сети — из официального API пула; по желанию вход в Kryptex (вы логинитесь сами) открывает реальный баланс и изменение настроек майнера прямо из панели.
- **Арбитраж** 🅿️ — арендует чужие GPU и майнит на них, когда это дешевле дохода; решает по окупаемости и марже, учится на результатах, проверяет подлинность железа (предупреждения по карточке + сверка чипа PCI в контейнере), фильтрует плохие хосты и бот-снайперов, платит в BTC/CLORE.
- **Telegram-оператор** 🅿️ — автономное управление 24/7, советуется с Claude в рамках ваших лимитов.
- **Анти-майнер** — режет частоту арендаторам, которые майнят (владельца не трогает).
- **Обслуживание** — драйвер NVIDIA, обновления, перезагрузка; свои сервера через агента.
- **Безопасное самообновление** — код агента на серверах обновляется только с валидной подписью владельца (RSA, fail-closed): подменить обновление по сети нельзя.
- **Проверка обновлений панели** — панель сама видит новую версию на GitHub и предлагает установить: в приложении кнопка открывает терминал с командой (пароль root вводите вы), в вебе — показывает команду.

🅿️ — функции тарифа **Pro**.

## 💳 Free и Pro

| Free (бесплатно) | Pro (подписка/разово) |
|---|---|
| Мониторинг, графики, доходы/P&L | Арбитраж |
| Обслуживание серверов | Обучение на результатах |
| Просмотр майнинга | Telegram-оператор (Claude) |
| Автоцена — режим «совет» | Автоцена — авто-режим |
| | Мультивалютный майнинг, рыночная аналитика |

Pro оформляется через [GitHub Sponsors](https://github.com/sponsors/dotradepro): после оформления войдите в панели через GitHub — Pro включится автоматически.

## 📖 Документация

Подробный мануал со скриншотами (установка, каждая вкладка, арбитраж, автоцена, Telegram, FAQ) — в **[Wiki](https://github.com/dotradepro/clore-panel/wiki)**.

## 📄 Лицензия

Проприетарная — см. [LICENSE](LICENSE). Программа работает автономно и тратит ваш баланс в заданных вами лимитах; используете на свой риск.

---

# Clore Panel (English)

A monitoring and **earnings-automation** panel for [Clore.ai](https://clore.ai) GPU hosts: auto-pricing,
idle mining, arbitrage (renting other people's GPUs to mine when it's cheaper than the yield) and a Claude-powered
Telegram operator. Pure Python 3 standard library — no external dependencies.

[Русский](#clore-panel) · **English**

## ⚡ Install (one line)

On Linux with an NVIDIA GPU:

```bash
curl -fsSL https://raw.githubusercontent.com/dotradepro/clore-panel/main/packaging/install.sh | sudo bash
```

Open **http://localhost:8080** and enter your keys under *Settings → Accounts*. Requires Python 3 (present on any modern Ubuntu/Debian) and the NVIDIA driver.

## 🚀 Features

- **Monitoring** — balance, servers online/rented, earnings per day/7/30d, GPU temp & load, events.
- **Auto-pricing** — prices from the median of actually-rented servers with the same GPU; floor = mining income + margin. Spot can be kept cheaper than on-demand.
- **Idle mining** (Kryptex) — a free GPU mines the most profitable coin (Pearl/Quantus) and stops while rented. Workers, income, 31-day rewards and network profitability come from the official pool API; optionally, signing into Kryptex (you log in yourself) unlocks the real balance and editing miner settings right from the panel.
- **Arbitrage** 🅿️ — rents other GPUs and mines on them when cheaper than the yield; decides by payback and margin, learns from results, verifies hardware authenticity (listing warnings + PCI-chip check in the container), filters bad hosts and sniper bots, pays in BTC/CLORE.
- **Telegram operator** 🅿️ — autonomous 24/7 operation, consults Claude within your limits.
- **Anti-miner** — throttles renters who mine (never the owner).
- **Maintenance** — NVIDIA driver, updates, reboot; your own servers via an agent.
- **Secure self-update** — the agent code on your servers updates only with a valid owner signature (RSA, fail-closed): a man-in-the-middle can't swap in a tampered update.
- **Panel update check** — the panel spots a new version on GitHub and offers to install it: in the app a button opens a terminal with the command (you type the root password), on the web it shows the command.

🅿️ — **Pro** tier features.

## 💳 Free vs Pro

| Free | Pro (subscription / one-time) |
|---|---|
| Monitoring, charts, earnings/P&L | Arbitrage |
| Server maintenance | Learning from results |
| Mining view | Telegram operator (Claude) |
| Auto-pricing — advise mode | Auto-pricing — automatic |
| | Multi-coin mining, market intel |

Pro is handled via [GitHub Sponsors](https://github.com/sponsors/dotradepro): after sponsoring, sign in with GitHub inside the panel — Pro unlocks automatically.

## 📖 Documentation

A detailed manual with screenshots (install, every tab, arbitrage, auto-pricing, Telegram, FAQ) lives in the **[Wiki](https://github.com/dotradepro/clore-panel/wiki)**.

## 📄 License

Proprietary — see [LICENSE](LICENSE). The software runs autonomously and spends your balance within the limits you set; use at your own risk.
