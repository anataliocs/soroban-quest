#!/bin/bash

echo "🔍 Logging all dependencies to $DEP_LOG_FILE"

echo "APT-installed packages:" >"$DEP_LOG_FILE"
dpkg-query -l >>"$DEP_LOG_FILE" 2>/dev/null || echo "👻 Apt not used here." >>"$DEP_LOG_FILE"

echo -e "\n\nHomebrew-installed packages:" >>"$DEP_LOG_FILE"
brew list --versions >>"$DEP_LOG_FILE" 2>/dev/null || echo "🍺 Homebrew not found." >>"$DEP_LOG_FILE"

echo -e "\n\nAlpine (apk) installed packages:" >>"$DEP_LOG_FILE"
apk info -vv >>"$DEP_LOG_FILE" 2>/dev/null || echo "🏔️ Apk (alpine) not used here." >>"$DEP_LOG_FILE"

echo -e "\n\nCargo Dependencies:" >>"$DEP_LOG_FILE"
(cargo tree || cargo metadata --format-version=1 | jq '.packages[].name') \
  >>"$DEP_LOG_FILE" 2>/dev/null || echo "🦀 Cargo command unavailable." >>"$DEP_LOG_FILE"

echo "✅ Dependency logging completed successfully!"

echo "${DEP_LOG_FILE}"
