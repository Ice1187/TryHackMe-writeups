## Info
### Credential
- c0ldd:cybersecurity
- hugo
- philip


### Web
- `/wp-login.php`
- `/hidden`
- `/wp-includes`
- Wordpress 4.1.31
- Theme: Twenty Fifteen

### MySQL (local)
- db: `colddbox`


## Path
### User, Root
1. After trying on `/wp-login.php`, it reveals that the username is `C0ldd`.
2. Use hydra to brute force C0ldd's password: `9876543210`
3. Upload `rev.zip` as plugin from admin panel, then activate it to execute the reverse shell
4. Found the credential in `wp-config.php`
```
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'colddbox');

/** MySQL database username */
define('DB_USER', 'c0ldd');

/** MySQL database password */
define('DB_PASSWORD', 'cybersecurity');

/** MySQL hostname */
define('DB_HOST', 'localhost');
```
5. Found port `4512` and MySQL (local) running, and 4512 turns out to be SSH.
```
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 *:4512                  *:*                     LISTEN
tcp        0      0 localhost:mysql         *:*                     LISTEN
$ telnet $ip 4512
Trying 10.10.34.39...
Connected to 10.10.34.39.
Escape character is '^]'.
SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.10
```
6. `/usr/bin/find` has setuid, use it to gain root.

