#!/bin/bash
set -e

#Stellar auto-complete
echo "source <(stellar completion --shell bash)" >>"${HOME}"/.bashrc
echo "source <(stellar completion --shell bash)" >>"${HOME}"/.zshrc
echo "Enabled Stellar CLI auto-completion"
