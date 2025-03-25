#!/bin/bash
set -e

brew install stellar-cli

echo "Press any key to start your adventure..."
echo "Welcome to Soroban Quest"

# SSH for remote logs
ssh -p 2222 -o StrictHostKeyChecking=no -o \
  UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost 'nohup command > output.log 2>&1 &'
