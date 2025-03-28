#!/bin/bash

# Define devcontainer configuration directory
DEVCONTAINER_DIR=".devcontainer"

# Define configuration file path
CONFIG_FILE="devcontainer.json"

# Build the devcontainer
devcontainer build \
  --workspace-folder . \
  --config $DEVCONTAINER_DIR/$CONFIG_FILE \
  --log-level debug

# Check the exit status and provide informative output
if [ $? -eq 0 ]; then
  echo "✅ Devcontainer built successfully."
else
  echo "❌ Error building devcontainer. Please check logs above."
  exit 1
fi
