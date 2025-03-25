#!/bin/bash
set -e

brew install stellar-cli && brew install cloudentity/tap/oauth2c

echo "Press any key to start your adventure..."
echo "Welcome to Soroban Quest"

# SSH for remote logs
ssh -f host xterm -p 2222 -o StrictHostKeyChecking=no -o \
  UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost 'nohup command > output.log 2>&1 &'
