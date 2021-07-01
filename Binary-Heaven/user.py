enc = 'kym~humr'
username = ''
for i in enc:
	username += chr((ord(i) -8)^4)

print(username)
