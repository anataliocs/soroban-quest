#!/bin/bash

# Define devcontainer configuration directory
devcontainer_dir=".devcontainer"

# Define configuration file path
config_file="devcontainer.json"

# Prebuild image on dockerhub https://hub.docker.com/repository/docker/chrisstellar/vsc-soroban-quest-b12b9-prebuild/general
pre_build_image="chrisstellar/vsc-soroban-quest-b12b9-prebuild"

build_details="z-dc-build-info/build-details.json"

# Build the devcontainer
output=$(devcontainer build \
  --workspace-folder . \
  --config $devcontainer_dir/$config_file \
  --cache-from $pre_build_image:latest)

#--dotfiles-repository

# Check the exit status and provide informative output
if [ "${output}" ]; then
  echo " ✅ Devcontainer built successfully"

  # Extract imageName from JSON output using jq
  image_name=$(echo "$output" | jq -r '.imageName[0]')
  echo "🔹 Image name: $image_name"
  docker inspect "$image_name" >> $build_details

  # Push new pre-build
  docker tag "$image_name":latest $pre_build_image:latest
  docker push $pre_build_image:latest
  echo " 🛠️ New prebuild pushed"

  echo 'Y' | docker image prune

else
  echo " ❌ Error building devcontainer. Please check logs above."
  exit 1
fi
