#!/bin/bash
set -e

answer=$1
hashed_name=$(echo "$answer" | base64)

if [[ "$hashed_name" = "U21hbGxlciBiaW5hcnkgc2l6ZQo=" ]]; then
  echo "$hashed_name" | base64 >"./quiz/answer/answer2.txt"
  figlet "Correct answer"
  echo " ✅ Nice job! You got Question 2 right!!! 💕 Next one! ⏭️"

else
  figlet "Try again"
  echo " ❌ Nope. 📚 Try again 😑"
fi
