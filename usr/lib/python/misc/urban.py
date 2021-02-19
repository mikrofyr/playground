#!/usr/bin/env python3

import urllib.request
import json      
import argparse

parser = argparse.ArgumentParser(description='Argparse example')
parser.add_argument('-q','--query', help='Word to search for', required=True)
args = parser.parse_args()

myurl = "http://api.urbandictionary.com/v0/define?term={}".format(args.query)
req = urllib.request.Request(myurl)
#req.add_header('Content-Type', 'application/json; charset=utf-8')
#jsondata = json.dumps(body)
#jsondataasbytes = jsondata.encode('utf-8')   # needs to be bytes
#req.add_header('Content-Length', len(jsondataasbytes))
#print (jsondataasbytes)
response = urllib.request.urlopen(req)
jd = response.read()
#print(jd)
data =json.loads(jd.decode('utf-8'))
#print(data)
max = 0
word = ""
#for item in data['list']:
#  if item['thumbs_up'] > max:
#    max = item['thumbs_up']
#    word = item['definition']
    
print("Definition: {}".format(data['list'][0]['definition']))
print("Example: {}".format(data['list'][0]['example']))
