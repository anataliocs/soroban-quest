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
  cat .devcontainer/dotfiles/.bashrc | echo > "${remoteEnv:HOME}"/.bashrc
fi

if [ -e .devcontainer/dotfiles/.zshrc ]; then
  cat .devcontainer/dotfiles/.zshrc | echo > "${remoteEnv:HOME}"/.zshrc
fi

if [ -e .devcontainer/dotfiles/.fluxbox/menu ]; then
  mv -n .devcontainer/dotfiles/.fluxbox/menu "${remoteEnv:HOME}"/.fluxbox
fi

