#!/bin/bash
set -e

brew install stellar-cli

apt-get update && export DEBIAN_FRONTEND=noninteractive &&
  curl -sSL https://dl.google.com/linux/direct/google-chrome-stable_current_$(dpkg --print-architecture).deb -o /tmp/chrome.deb &&
  apt-get -y install /tmp/chrome.deb

echo "Press any key to start your adventure..."
echo "Welcome to Soroban Quest"
