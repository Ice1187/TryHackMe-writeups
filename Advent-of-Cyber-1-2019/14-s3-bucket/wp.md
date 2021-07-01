## Found bucket
```
$ s3scanner scan -b advent-bucket-one
advent-bucket-one | bucket_exists | AuthUsers: [], AllUsers: [Read, Write, ReadACP]
$ s3scanner dump -b advent-bucket-one --dump-dir bucket/
advent-bucket-one | Enumerating bucket objects...
advent-bucket-one | Total Objects: 2, Total Size: 11.0B
advent-bucket-one | Dumping contents using 4 threads...
advent-bucket-one | Dumping completed 
$ ls bucket/
total 16K
drwxr-xr-x 2 ice1187 ice1187 4.0K Jun 22 10:55 .
drwxr-xr-x 3 ice1187 ice1187 4.0K Jun 22 10:54 ..
-rw-r--r-- 1 ice1187 ice1187    7 Jun 22 10:55 employee_names.txt
-rw-r--r-- 1 ice1187 ice1187    4 Jun 22 10:55 test.txt
```
