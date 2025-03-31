#!/bin/bash
set -e

# Check the exit status and provide informative output
if [ $? -eq 0 ] && [ -f "${remoteEnv:BUILD_LOG_FILE}" ]; then
  echo "✅ onCreate() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing onCreate() "
  echo "${remoteEnv:BUILD_LOG_FILE}"
fi
