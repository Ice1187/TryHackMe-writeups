# Information
## Credential
- wade:parzival
## Email 
- (Wade) darkstar@darkstar7471.com

## 80: Web Server
- IIS 10.0
- HTTP method: Trace
- Hidden pages: `/retro/`
### `/retro/`
- Login page: `/retro/wp-login.php`
- In the post 'Ready Player One', the post and the comment reveal the credential `wade:parzival`.
> I honestly feel a deep connection to the main character Wade. I keep **mistyping the name of his avatar whenever I log in** ...
> Leaving myself a note here just in case I forget how to spell it: **parzival**
### `wp-admin`
- WordPress 5.2.1 running 90s Retro theme
- Found Wade's email: darkstar@darkstar7471.com

## 3389: RDP
- Use Wade's credential to login


# Path
## User
1. nmap
2. gobuster found `/retro/
3. Found Wade's credential
4. Use Wade's credential to login RDP, and get user flag.
## Root
5. There is a `hhupd.exe.` on the desktop. Google 'hhupd cve' and found an video from Zero Day Initiative use it to demo CVE-2018-1388, which is an EoP through UAC.
6. Just follow the steps shown in the [video](https://www.youtube.com/watch?v=3BQKpPNlTSo), and get root flag.


