1. After some guessing, it shows that we can execute command through `/api/cmd/<cmd>`, e.g., `/api/cmd/whoami`
2. We are already root.
3. URL encode `cat /home/bestadmin/user.txt` and send it to get user.txt

