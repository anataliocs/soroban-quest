#!/bin/bash
set -e

# Stellar CLI and oauth2 CLI
#brew install cloudentity/tap/oauth2c

cargo install --locked stellar-cli --features opt

echo "Installed Stellar CLI"
#echo "Installed OAuth2 CLI"


