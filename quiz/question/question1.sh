#!/bin/bash
set -e

answer=$1
hashed_name=$(echo "$answer" | base64)

if [[ "$hashed_name" = "SXQgaW5kaWNhdGVzIGEgc21hcnQgY29udHJhY3Qgd2lsbCBub3QgdXNlIHRoZSBSdXN0IHN0YW5k
YXJkIGxpYnJhcnksIGFjaGlldmluZyBhIHNtYWxsZXIgbWVtb3J5IGZvb3RwcmludCB3aXRoIGEg
bWluaW1hbCBsaWJyYXJ5Cg==" ]]; then
  echo "$hashed_name" | base64 >"./quiz/answer/answer1.txt"
  figlet "Correct answer"
  echo " ✅ You got the 1 question right!!! ❤️ Move on to the next one! ⏭️"

else
  figlet "Try again"
  echo " ❌ Not exactly. 📚 Go back and re-read the section on [no_std] and try again"
fi
