1. Found code word: `vigilante` in `/island`
2. Try ftp, found `vigilante` is the username
3. Gobuster `/island`, found `/island/2100`
4. Gobuster `/island/2100` with ext `.ticket`, found `/island/2100/green_arrow.ticket` (use directory-list-2.3-medium)
5. Use 'From Base58' in CyberChef to decode the text `RTy8yhBQdscX` from `/island/2100/green_arrow.ticket` into `!#th3h00d`
