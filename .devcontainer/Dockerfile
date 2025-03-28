# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y firefox-esr && \
    && apt-get apt install xfce4-clipman-plugin && apt-get install fonts-powerline

# Expose port 2222 for ssh
EXPOSE 2222