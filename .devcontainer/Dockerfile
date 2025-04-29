# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

ENV CARGO_INCREMENTAL=0 \
    CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse \
    RUSTFLAGS='-C target-cpu=native' \
    PKG_CONFIG_PATH='/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig'

WORKDIR "/workspace/soroban-quest"

RUN mkdir -p "${containerWorkspaceFolder}/log/devcontainer" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/devcontainer_build.log" && \
  touch "${containerWorkspaceFolder}/log/devcontainer/dependencies.log" && chmod -R 664 "${containerWorkspaceFolder}/log/devcontainer/"

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y \
  firefox-esr \
  xfce4-clipman-plugin \
  fonts-powerline \
  figlet \
  libdbus-1-dev \
  libudev-dev \
  pkg-config \
  openssl && apt-get clean && \
  rm -rf /var/lib/apt/lists/*


