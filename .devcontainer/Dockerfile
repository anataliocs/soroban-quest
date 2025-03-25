# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y firefox-esr

RUN sudo sudo passwd $(whoami) | ssh -p 2222 -o StrictHostKeyChecking=no -o \
      UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost 'nohup command > output.log 2>&1 &'

# Expose port 2222 for ssh
EXPOSE 2222