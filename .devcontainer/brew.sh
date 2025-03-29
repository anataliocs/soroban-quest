#!/bin/bash
set -e

# Stellar CLI and oauth2 CLI
brew install stellar-cli && brew install cloudentity/tap/oauth2c

echo "Installed Stellar CLI"
echo "Installed OAuth2 CLI"

# Check the exit status and provide informative output
if [ $? -eq 0 ]; then
  echo "✅ brew.sh executed successfully" >>"${containerEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing brew.sh " >>"${containerEnv:BUILD_LOG_FILE}"
fi
