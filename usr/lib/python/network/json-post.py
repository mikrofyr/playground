#!/usr/bin/env python3

import urllib.request
import json      

body = {'data': "example"}  

myurl = "localhost:9090"
req = urllib.request.Request(myurl)
req.add_header('Content-Type', 'application/json; charset=utf-8')
jsondata = json.dumps(body)
jsondataasbytes = jsondata.encode('utf-8')   # needs to be bytes
req.add_header('Content-Length', len(jsondataasbytes))
print (jsondataasbytes)
response = urllib.request.urlopen(req, jsondataasbytes) 
