import json
import requests as rq

url = 'http://10.10.169.100:3000/'
# {"value":"s","next":"f"}

flag = ''
val = ''
while True:
    res = json.loads(rq.get(url+val).text)
    if res['value'] == 'end':
        break
    flag += res['value']
    val = res['next']
    print(res)

print(flag)
