import requests as rq

url = 'http://10.10.6.211/content/'

payload = {
    'user': 'manager',
    'passwd': 'Password123',
    'remeberMe': ''
}

s = rq.Session()
login = s.post(url+'as/?type=signin', data=payload)
print(login.text)


