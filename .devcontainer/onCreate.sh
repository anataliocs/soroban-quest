#!/bin/bash
set -e

# Install pre-reqs
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# Add Doppler's GPG key
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo apt-key add -

# Add Doppler's apt repo
echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list

# Fetch and install latest doppler cli
sudo apt-get update && sudo apt-get install -y doppler

# Check the exit status and provide informative output
if [ $? -eq 0 ]; then
  echo "✅ onCreate() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing onCreate(). " >>"${remoteEnv:BUILD_LOG_FILE}"
fi
