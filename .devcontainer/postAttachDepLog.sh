#!/bin/bash

echo "🔍 Logging all dependencies to ${remoteEnv:DEP_LOG_FILE}"

echo "APT-installed packages:" >"${remoteEnv:DEP_LOG_FILE}"
dpkg-query -l >>"${remoteEnv:DEP_LOG_FILE}" 2>/dev/null || echo "👻 Apt not used here." >>"${remoteEnv:DEP_LOG_FILE}"

echo -e "\n\nHomebrew-installed packages:" >>"${remoteEnv:DEP_LOG_FILE}"
brew list --versions >>"${remoteEnv:DEP_LOG_FILE}" 2>/dev/null || echo "🍺 Homebrew not found." >>"${remoteEnv:DEP_LOG_FILE}"

echo -e "\n\nAlpine (apk) installed packages:" >>"${remoteEnv:DEP_LOG_FILE}"
apk info -vv >>"${remoteEnv:DEP_LOG_FILE}" 2>/dev/null || echo "🏔️ Apk (alpine) not used here." >>"${remoteEnv:DEP_LOG_FILE}"

echo -e "\n\nCargo Dependencies:" >>"${remoteEnv:DEP_LOG_FILE}"
(cargo tree || cargo metadata --format-version=1 | jq '.packages[].name') \
  >>"${remoteEnv:DEP_LOG_FILE}" 2>/dev/null || echo "🦀 Cargo command unavailable." >>"${remoteEnv:DEP_LOG_FILE}"

echo "✅ Dependency logging completed successfully!"

echo "${DEP_LOG_FILE}"
