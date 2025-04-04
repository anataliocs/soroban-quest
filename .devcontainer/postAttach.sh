#!/bin/bash
set -e

#Stellar auto-complete
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.bashrc
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.zshrc
echo "Enabled Stellar CLI auto-completion"

echo "Build Results:"
echo "${remoteEnv:BUILD_LOG_FILE}"

# Check the exit status and provide informative output
if [ $? -eq 0 ] && [ -f "${remoteEnv:BUILD_LOG_FILE}" ]; then
  echo "✅ postAttach() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing postAttach() "
  echo "${remoteEnv:BUILD_LOG_FILE}"
fi
