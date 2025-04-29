#!/bin/bash
set -e

code_space_name=$1
echo $code_space_name > ./quiz/answer/qc1.txt

gh api user/codespaces/$1 | jq -r '.state'
