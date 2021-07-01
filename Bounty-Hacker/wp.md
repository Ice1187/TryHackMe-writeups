1. Download the files from FTP
2. Hydra with user `lin` and password wordlist `locks.txt`
3. sudo -l
```bash
lin@bountyhacker:/home$ sudo -l
Matching Defaults entries for lin on bountyhacker:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User lin may run the following commands on bountyhacker:
    (root) /bin/tar
```
4. GTFOBins find how to EoP from `tar`
