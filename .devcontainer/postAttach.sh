#!/bin/bash
set -e

#Stellar auto-complete
echo "source <(stellar completion --shell bash)" >> ~/.bashrc
echo "source <(stellar completion --shell zsh)" >> ~/.zshrc
echo "Enabled Stellar CLI auto-completion"


