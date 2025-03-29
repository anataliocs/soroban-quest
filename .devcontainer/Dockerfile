# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

ENV CARGO_INCREMENTAL=0
ENV RUSTFLAGS='-C target-cpu=native'

RUN touch "${containerEnv:PATH}/log/devcontainer_build.log" && \
  touch "${containerEnv:PATH}/log/dependencies.log" && \


RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y firefox-esr && \
    apt-get install -y xfce4-clipman-plugin && apt-get install -y fonts-powerline


