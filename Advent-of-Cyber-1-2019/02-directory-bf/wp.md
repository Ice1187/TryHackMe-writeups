## Hidden page
```
$ gobuster dir -u http://10.10.62.30:3000 -w /opt/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt
===============================================================
Gobuster v3.1.0
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.62.30:3000
[+] Method:                  GET
[+] Threads:                 10
[+] Wordlist:                /opt/SecLists/Discovery/Web-Content/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2021/06/22 07:40:43 Starting gobuster in directory enumeration mode
===============================================================
/home                 (Status: 302) [Size: 28] [--> /login]
/login                (Status: 200) [Size: 1713]
/admin                (Status: 302) [Size: 27] [--> /home]
/Home                 (Status: 302) [Size: 28] [--> /login]
/assets               (Status: 301) [Size: 179] [--> /assets/]
/css                  (Status: 301) [Size: 173] [--> /css/]
/Login                (Status: 200) [Size: 1713]
/js                   (Status: 301) [Size: 171] [--> /js/]
/logout               (Status: 302) [Size: 28] [--> /login]
/sysadmin             (Status: 200) [Size: 1733]
/Admin                (Status: 302) [Size: 27] [--> /home]
```

## Password
See the comment in the `/sysadmin` page.
