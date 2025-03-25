#!/bin/bash
set -e

# NPM install
bash -i -c 'nvm install --lts'
git config devcontainers-theme.hide-status 1

# SSH for remote logs
ssh -p 2222 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost
