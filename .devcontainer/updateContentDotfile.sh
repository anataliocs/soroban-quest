#!/bin/bash

# Check the exit status and provide informative output
if [ $? -eq 0 ] && [ -f "${remoteEnv:BUILD_LOG_FILE}" ]; then
  echo "✅ updateContentDotfile() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing postAttach() "
  echo "${remoteEnv:BUILD_LOG_FILE}"
fi
