#!/bin/bash

echo "🔍 Logging all dependencies to $LOG_FILE"

echo "APT-installed packages:" >"$LOG_FILE"
dpkg-query -l >>"$LOG_FILE" 2>/dev/null || echo "👻 Apt not used here." >>"$LOG_FILE"

echo -e "\n\nHomebrew-installed packages:" >>"$LOG_FILE"
brew list --versions >>"$LOG_FILE" 2>/dev/null || echo "🍺 Homebrew not found." >>"$LOG_FILE"

echo -e "\n\nAlpine (apk) installed packages:" >>"$LOG_FILE"
apk info -vv >>"$LOG_FILE" 2>/dev/null || echo "🏔️ Apk (alpine) not used here." >>"$LOG_FILE"

echo -e "\n\nCargo Dependencies:" >>"$LOG_FILE"
(cargo tree || cargo metadata --format-version=1 | jq '.packages[].name') \
  >>"$LOG_FILE" 2>/dev/null || echo "🦀 Cargo command unavailable." >>"$LOG_FILE"

echo "✅ Dependency logging completed successfully!"

echo ${LOG_FILE}
