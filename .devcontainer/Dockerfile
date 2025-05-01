FROM mcr.microsoft.com/devcontainers/rust:1.0.9-1

ENV DEBIAN_FRONTEND=noninteractive \
    PKG_CONFIG_PATH='/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig' \
    CARGO_INCREMENTAL=0 \
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse \
    RUST_VERSION=1.81

WORKDIR "/workspace/soroban-quest"

RUN mkdir -p "${containerWorkspaceFolder}/log/devcontainer" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/devcontainer_build.log" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/dependencies.log" && chmod -R 664 "${containerWorkspaceFolder}/log/devcontainer/"

RUN apt-get update && apt-get install -y \
  libdbus-1-dev \
  libudev-dev \
  pkg-config \
  openssl \
  firefox-esr \
  figlet && apt-get clean && \
  rm -rf /var/lib/apt/lists/*
