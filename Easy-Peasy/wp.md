# Readlly Bad Box

## Path
### flag 1
- Use gobuster to find `/hidden/whatever`

### flag 2
- In `:65524/robots.txt`, it shows a User-Agent much like a hash. Crack it with the provided `easypeasy.txt`.
- Use [this website](https://md5hashing.net/hash/md5/a18672860d0510e5ab6699730763b250) to decrypt.
```
User-Agent:*
Disallow:/
Robots Not Allowed
User-Agent:a18672860d0510e5ab6699730763b250
Allow:/
This Flag Can Enter But Only This Flag No More Exceptions
```

### flag 3
- In the `/` page of apache (port 65524)

### flag 4
- In `:65524/`, it shows a encoded message, which is base62 encode. => /n0th1ng3ls3m4tt3r
```
<p hidden>its encoded with ba....:ObsJmP173N2X6dOrAgEAL0Vu</p>
```

### flag 5
- `mypasswordforthatjob`

### flag 6
- `iconvertedmypasswordtobinary`
