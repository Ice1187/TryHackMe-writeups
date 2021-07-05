## Path
- `joker:*axA&GF8dP`
### User
1. Found `thm.jpg` in the source of apache default page.
2. Investigate the magic number and first server bytes of thm.png, I found it is a jpg file start at 0x12 with corrupted magic number. So `dd` out the file and fix the first 4 bytes to `ffdb`, then open it. In the image, it give us the hidden directory: `th1s_1s_h1dd3n`.
```
$ dd if=thm.jpg of=thm_fixed.jpg bs=1 skip=18
$ vim thm_fixed.jpg
$ xxd thm_fixed.jpg | head
00000000: ffd8 ffdb 0043 0003 0202 0302 0203 0303  .....C..........
00000010: 0304 0303 0405 0805 0504 0405 0a07 0706  ................
00000020: 080c 0a0c 0c0b 0a0b 0b0d 0e12 100d 0e11  ................
00000030: 0e0b 0b10 1610 1113 1415 1515 0c0f 1718  ................
```
3. Fuzz to found the number, and it give us a string `y2RPJ4QaPF!B`.
```
$ ffuf -v -u http://$ip/th1s_1s_h1dd3n/?secret=FUZZ -w 0-99.txt -fw 45
```
4. Use the string above to decode the info in the fixed jpg.
```
$ steghide extract -sf thm_fixed.jpg
Enter passphrase:
wrote extracted data to "hidden.txt".
```

