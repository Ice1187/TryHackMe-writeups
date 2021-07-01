1. Run gobuster to find `/panel` webpage.
2. Upload `rev.pHP5` to get shell.
3. Get user flag
4. Run linpeas and found that `/usr/bin/python` has suid with owner root.
5. Search on GTFObins and found how to [EoP with suid python binary](https://gtfobins.github.io/gtfobins/python/#suid)
6. Get root flag.

