#!/bin/bash
set -e

# Stellar CLI and oauth2 CLI
#brew install cloudentity/tap/oauth2c

cargo install --locked stellar-cli --features opt

echo "Installed Stellar CLI"
#echo "Installed OAuth2 CLI"

# Check the exit status and provide informative output
if [ $? -eq 0 ] && [ -f "${remoteEnv:BUILD_LOG_FILE}" ]; then
  echo "✅ updateContentCargo() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing postAttach() "
  echo "${remoteEnv:BUILD_LOG_FILE}"
fi
