## Password hash
```
$ sh linpeas.sh
[+] Backup files (limited 100)
-rw-r--r-- 1 root root 1702 Oct 10  2019 /etc/nsswitch.conf.bak
-rw-r--r-- 1 root root 26834 Dec  4  2019 /var/log/dmesg.old
-rwxr-xr-x 1 root root 783 Dec  4  2019 /var/shadow.bak
...
$ cat /var/shadow.bak
```
