# Credential
username: R1ckRul3s
password: Wubbalubbadubdub

# Website (80)
## /
- username R1ckRul3s in html

## robots.txt
- Wubbalubbadubdub

## login.php 
- Can login with the credential above

## portal.php (logined)
- Found base64 Vm1wR1UxTnRWa2RUV0d4VFlrZFNjRlV3V2t0alJsWnlWbXQwVkUxV1duaFZNakExVkcxS1NHVkliRmhoTVhCb1ZsWmFWMVpWTVVWaGVqQT0== in html, output is 'rabbit hole'.

### Command Panel
- `cat`, `head`, `tail` are disabled, we still got `tac` to use.
- First flag `mr. meeseek hair` is in the `./` dir.
		```bash
		$ ls
		Sup3rS3cretPickl3Ingred.txt
		assets
		clue.txt
		denied.php
		index.html
		login.php
		portal.php
		robots.txt
		$ tac Sup3rS3cretPickl3Ingred.txt 
		mr. meeseek hair
		```
- Second flag `1 jerry tear` is in the `/home/rick/second ingredient`.
	```bash
	$ tac /home/rick/second*
	1 jerry tear
	```
- We can do `sudo` without any password, so we can view the third flag `fleeb juice` in `/root/3rd.txt`.
	```bash
	$ sudo tac /root/3rd.txt
	3rd ingredients: fleeb juice
	```

# Flags
mr. meeseek hair
1 jerry tear
fleeb juice
