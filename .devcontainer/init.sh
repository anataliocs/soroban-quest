#!/bin/bash
set -e

# Populate dotfiles
mkdir -p .vscode/

if [ -e .devcontainer/dotfiles/settings.json ]; then
  mv -n .devcontainer/dotfiles/settings.json .vscode/
fi

if [ -e .devcontainer/dotfiles/tasks.json ]; then
  mv -n .devcontainer/dotfiles/tasks.json .vscode/
fi

if [ -e .devcontainer/dotfiles/launch.json ]; then
  mv -n .devcontainer/dotfiles/launch.json .vscode/
fi

if [ -e .devcontainer/dotfiles/.bashrc ]; then
  mv -n .devcontainer/dotfiles/.bashrc "$HOME"/
fi

if [ -e .devcontainer/dotfiles/.zshrc ]; then
  mv -n .devcontainer/dotfiles/.zshrc "$HOME"/
fi

if [ -e .devcontainer/dotfiles/dnote.db ]; then
  mv -n .devcontainer/dotfiles/dnote.db "$HOME"/
fi

if [ -e .devcontainer/dotfiles/.fluxbox/menu ]; then
  mv -n .devcontainer/dotfiles/.fluxbox/menu "$HOME"/.fluxbox
fi

export "${CARGO_TARGET_DIR}"="${containerWorkspaceFolder}./target"
