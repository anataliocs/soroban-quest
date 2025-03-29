#!/bin/bash

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
  mv -n .devcontainer/dotfiles/.bashrc "${remoteEnv:HOME}"/
fi

if [ -e .devcontainer/dotfiles/.zshrc ]; then
  mv -n .devcontainer/dotfiles/.zshrc "${remoteEnv:HOME}"/
fi

if [ -e .devcontainer/dotfiles/dnote.db ]; then
  mv -n .devcontainer/dotfiles/dnote.db "${remoteEnv:HOME}"/.dnote
fi

if [ -e .devcontainer/dotfiles/.fluxbox/menu ]; then
  mv -n .devcontainer/dotfiles/.fluxbox/menu "${remoteEnv:HOME}"/.fluxbox
fi

# Check the exit status and provide informative output
if [ $? -eq 0 ] && [ -f "${remoteEnv:BUILD_LOG_FILE}" ]; then
  echo "✅ updateContentDotfile() executed successfully" >>"${remoteEnv:BUILD_LOG_FILE}"
else
  echo "❌ Error executing postAttach() "
  echo "${remoteEnv:BUILD_LOG_FILE}"
fi
