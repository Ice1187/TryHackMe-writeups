## dst IP & Chritmas list
Statistics -> Conversations

## Password
```
$ john --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt password.txt --format=sha512crypt
Using default input encoding: UTF-8
Loaded 1 password hash (sha512crypt, crypt(3) $6$ [SHA512 256/256 AVX2 4x])
Cost 1 (iteration count) is 5000 for all loaded hashes
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
rainbow          (?)
1g 0:00:00:00 DONE (2021-06-22 07:37) 11.11g/s 5688p/s 5688c/s 5688C/s 123456..letmein
Use the "--show" option to display all of the cracked passwords reliably
Session completed
```
