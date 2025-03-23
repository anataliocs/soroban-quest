#!/bin/bash
set -e

name=$1

if [ -e "$name" ]; then
  echo "$name"
fi

echo "Done"
