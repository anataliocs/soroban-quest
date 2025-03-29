#!/bin/bash
set -e

touch "${containerEnv:HOME}/log/devcontainer_build.log"
LOG_FILE="${containerEnv:HOME}/log/devcontainer_build.log"

# Create bash aliases
echo "alias dlogs='echo ${LOG_FILE}'" >>"${remoteEnv:HOME}"/.bashrc
echo "alias dlogs='echo ${LOG_FILE}'" >>"${remoteEnv:HOME}"/.zshrc
