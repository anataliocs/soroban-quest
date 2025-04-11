#!/bin/bash

# Populate dotfiles
mkdir -p .vscode/

chmod +w ~/.fluxbox

if [ -e .devcontainer/dotfiles/settings.json ]; then
  mv -n .devcontainer/dotfiles/settings.json .vscode/
fi

if [ -e .devcontainer/dotfiles/tasks.json ]; then
  mv -n .devcontainer/dotfiles/tasks.json .vscode/
fi

if [ -e .devcontainer/dotfiles/launch.json ]; then
  mv -n .devcontainer/dotfiles/launch.json .vscode/
fi

if [ -e .devcontainer/dotfiles/.fluxbox/menu ]; then
  mv -n .devcontainer/dotfiles/.fluxbox/menu ~/.fluxbox
fi
