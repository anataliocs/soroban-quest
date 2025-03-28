#!/bin/bash
set -e

# Stellar CLI and oauth2 CLI
brew install stellar-cli && brew install cloudentity/tap/oauth2c

echo "Installed Stellar CLI"
echo "Installed OAuth2 CLI"
