## DNS Exfiltration 
[How Does DNS Exfiltration Work?](https://www.youtube.com/watch?v=fQ4Y8napHzw)

- In pcap, there is `DNS	155	Standard query 0xaafe A 43616e64792043616e652053657269616c204e756d6265722038343931.holidaythief.com`.
- Use python to decode the subdomain part, `43616e64792043616e652053657269616c204e756d6265722038343931`, see `dns_exfiltration.py`.

## Files in traffic
- Save the files from traffic using wireshark: File -> Export Objects -> HTTP... -> Click `christmaslists.zip` -> Save

## Crack zip
```
$ /opt/john/run/zip2john christmaslists.zip | tee christmaslists.hash
ver 1.0 efh 5455 efh 7875 christmaslists.zip/christmaslistdan.tx PKZIP Encr: 2b chk, TS_chk, cmplen=91, decmplen=79, crc=FF67349B
ver 2.0 efh 5455 efh 7875 christmaslists.zip/christmaslistdark.txt PKZIP Encr: 2b chk, TS_chk, cmplen=91, decmplen=82, crc=5A38B7BB
ver 2.0 efh 5455 efh 7875 christmaslists.zip/christmaslistskidyandashu.txt PKZIP Encr: 2b chk, TS_chk, cmplen=108, decmplen=116, crc=BCA00B27
ver 2.0 efh 5455 efh 7875 christmaslists.zip/christmaslisttimmy.txt PKZIP Encr: 2b chk, TS_chk, cmplen=105, decmplen=101, crc=7069EA51
NOTE: It is assumed that all files in each archive have the same password.
If that is not the case, the hash may be uncrackable. To avoid this, use
option -o to pick a file at a time.
christmaslists.zip:$pkzip2$3*2*1*0*8*24*5a38*9a4d*bcd294895922fb3b1f3a8ae538eac901dc3d265f1d7aa3f84998f2159d4df62bc5851007*1*0*8*24*bca0*9a74*29b0d0b149fad86a6a63ab18f12d8dbbeb9c5a208234d1f975b37f0e35271cb1f043b994*2*0*5b*4f*ff67349b*0*4d*0*5b*ff67*9a34*9cd3081b24188cef2cbcf85a13f06a9ab222dbdbf7f039719e05caaae2255438f3b0f8b6f899a676abacf02a2b35307baff03e3d9497843da564054a07c0dd7ff76971bb6d7bcdb4aaf2a7a44056d015aff7c7c834fd06fc21cf2b*$/pkzip2$::christmaslists.zip:christmaslistdan.tx, christmaslistdark.txt, christmaslistskidyandashu.txt:christmaslists.zip
$ john --wordlist=/opt/SecLists/Passwords/Leaked-Databases/rockyou.txt christmaslists.hash
Using default input encoding: UTF-8
Loaded 1 password hash (PKZIP [32/64])
Will run 4 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
december         (christmaslists.zip)
1g 0:00:00:00 DONE (2021-06-22 09:20) 100.0g/s 819200p/s 819200c/s 819200C/s 123456..total90
Use the "--show" option to display all of the cracked passwords reliably
Session completed
```
 
## Hidden in JPG
```
$ steghide --extract -sf TryHackMe.jpg
Enter passphrase:
wrote extracted data to "christmasmonster.txt".
$ cat christmasmonster.txt
                              ARPAWOCKY
                               RFC527

                    Twas brillig, and the Protocols
                         Did USER-SERVER in the wabe.
                    All mimsey was the FTP,
                         And the RJE outgrabe,

                    Beware the ARPANET, my son;
                         The bits that byte, the heads that scratch;
                    Beware the NCP, and shun
                         the frumious system patch,

                    He took his coding pad in hand;
                         Long time the Echo-plex he sought.
                    When his HOST-to-IMP began to limp
                         he stood a while in thought,

                    And while he stood, in uffish thought,
                         The ARPANET, with IMPish bent,
                    Sent packets through conditioned lines,
                         And checked them as they went,

                    One-two, one-two, and through and through
                         The IMP-to-IMP went ACK and NACK,
                    When the RFNM came, he said "I'm game",
                         And sent the answer back,

                    Then hast thou joined the ARPANET?
                         Oh come to me, my bankrupt boy!
                    Quick, call the NIC! Send RFCs!
                         He chortled in his joy.

                    Twas brillig, and the Protocols
                         Did USER-SERVER in the wabe.
                    All mimsey was the FTP,
                         And the RJE outgrabe.

                                                            D.L. COVILL
                                                            May 1973
```

