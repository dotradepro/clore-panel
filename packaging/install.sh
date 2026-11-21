#!/usr/bin/env bash
# Clore Panel — установка в одну строку.
#   curl -fsSL https://raw.githubusercontent.com/dotradepro/clore-panel/main/packaging/install.sh | sudo bash
# Скачивает последний релиз .deb из GitHub Releases и ставит его. Переустановка/обновление — тем же.
# Удаление:  ... | sudo bash -s uninstall      (данные остаются; purge — вместе с данными)
set -euo pipefail

# Репозиторий можно переопределить переменной окружения CLORE_REPO=owner/repo
REPO="${CLORE_REPO:-dotradepro/clore-panel}"
ACTION="${1:-install}"

if [ "$(id -u)" != "0" ]; then echo "Запустите через sudo." >&2; exit 1; fi

if [ "$ACTION" = "uninstall" ]; then
  apt-get remove -y clore-panel && echo "Удалено (данные в /var/lib/clore-panel сохранены; 'apt purge clore-panel' — вместе с ними)."
  exit 0
fi

echo "→ Ищу последний релиз $REPO…"
API="https://api.github.com/repos/$REPO/releases/latest"
URL="$(curl -fsSL "$API" | grep -o '"browser_download_url": *"[^"]*\.deb"' | head -1 | sed 's/.*"browser_download_url": *"\([^"]*\)".*/\1/')"
if [ -z "${URL:-}" ]; then
  echo "Не нашёл .deb в последнем релизе $REPO. Проверьте, что репозиторий и релиз доступны." >&2
  exit 1
fi

TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
echo "→ Качаю: $URL"
curl -fsSL "$URL" -o "$TMP/clore-panel.deb"
echo "→ Устанавливаю…"
apt-get install -y "$TMP/clore-panel.deb"

echo
echo "✓ Готово. Панель: http://localhost:8080"
echo "  Введите ключи (Clore API и др.) в «Настройки → Ключи и интеграции»."
echo "  Pro-возможности включаются ключом лицензии в «Настройки → Лицензия»."
