#!/bin/bash

# Populate dotfiles
mkdir -p .vscode/

chmod +w ~/.fluxbox

if [ -e .devcontainer/dotfiles/.vscode/settings.json ]; then
  mv -n .devcontainer/dotfiles/.vscode/settings.json .vscode/
fi

if [ -e .devcontainer/dotfiles/.vscode/tasks.json ]; then
  mv -n .devcontainer/dotfiles/.vscode/tasks.json .vscode/
fi

if [ -e .devcontainer/dotfiles/.vscode/launch.json ]; then
  mv -n .devcontainer/dotfiles/.vscode/launch.json .vscode/
fi

if [ -e .devcontainer/dotfiles/.fluxbox/menu ]; then
  mv -n .devcontainer/dotfiles/.fluxbox/menu ~/.fluxbox
fi
