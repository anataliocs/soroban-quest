# SSH for remote logs
ssh -f -p 2222 -o StrictHostKeyChecking=no -o \
  UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null vscode@localhost 'nohup command > output.log 2>&1 &'
