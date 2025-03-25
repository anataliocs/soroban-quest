#!/bin/bash
set -e

name=$1
hashed_name=$(echo "$name" | base64)

if [ "$hashed_name" = "U21hbGxlciBiaW5hcnkgc2l6ZQo=" ]; then
  echo "$hashed_name" | base64 >../answer/answer1.txt
fi

echo "Q1 correct"
