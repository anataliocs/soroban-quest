# Use the official Rust image as a base
FROM mcr.microsoft.com/devcontainers/rust:bullseye

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && apt-get install -y firefox-esr

# [Optional] Copy project files into the container
# COPY . /app

# [Optional] Set the working directory
# WORKDIR /app

# [Optional] Expose ports
# EXPOSE 8080

# [Optional] Define default command
# CMD ["cargo", "run"]