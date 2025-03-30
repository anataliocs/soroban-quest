# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

ENV CARGO_INCREMENTAL=0
ENV RUSTFLAGS='-C target-cpu=native'

WORKDIR "/workspace/soroban-quest"

RUN mkdir -p "${containerWorkspaceFolder}/log/devcontainer" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/devcontainer_build.log" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/dependencies.log" && chmod -R 664 "${containerWorkspaceFolder}/log/devcontainer/"


RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y firefox-esr && \
  apt-get install -y xfce4-clipman-plugin && apt-get install -y fonts-powerline && apt-get install -y figlet



