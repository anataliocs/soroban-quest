#!/bin/bash
set -e

# Stellar CLI and oauth2 CLI
brew install stellar-cli && brew install cloudentity/tap/oauth2c

echo "Press any key to start your adventure..."
echo "Welcome to Soroban Quest"

code --uninstall-extension github.github-vscode-theme --force
code --uninstall-extension ms-vscode.live-server
code --uninstall-extension github.vscode-pull-request-github
