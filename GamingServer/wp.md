## Path
### User
1. By enum,  found `/secret` has private key and `/uploads` has a wordlist `dict.lst`. Use both to get key passphrase.
2. Found user `john` in the source of webpage.
### Root
1. `john` is in the `lxd` group, and we can use this to gain root.
2. Follow [this](https://www.hackingarticles.in/lxd-privilege-escalation/)
3. Get root flag!
