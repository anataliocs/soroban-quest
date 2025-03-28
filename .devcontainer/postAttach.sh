#!/bin/bash
set -e

#Stellar auto-complete
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.bashrc
echo "source <(stellar completion --shell bash)" >>"${remoteEnv:HOME}"/.zshrc
echo "Enabled Stellar CLI auto-completion"
