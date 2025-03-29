#!/bin/bash
set -e

#Stellar auto-complete
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.bashrc
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.zshrc
echo "Enabled Stellar CLI auto-completion"

# Check the exit status and provide informative output
if [ $? -eq 0 ]; then
  echo "✅ postAttach.sh executed successfully" >>"${containerEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing postAttach.sh " >>"${containerEnv:BUILD_LOG_FILE}"
fi
