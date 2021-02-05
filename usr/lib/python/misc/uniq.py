#!/usr/bin/env python3 

# -- Imports
import argparse
#import json
#import sys
#import getpass
#import getopt
#import getpass
#import json
#import os
#import re
#import sys
#import urllib
#import urllib.parse
#import urllib.request
#import xml.etree.ElementTree as ET
#import subprocess
#import threading
#import queue
# -- Input args
parser = argparse.ArgumentParser(description='Argparse example')
parser.add_argument('-d','--dir', help='Some XML file', required=True)
args = parser.parse_args()



import sys
import hashlib

def hash(file):
	# BUF_SIZE is totally arbitrary, change for your app!
	BUF_SIZE = 65536  # lets read stuff in 64kb chunks!
	#md5 = hashlib.md5()
	sha1 = hashlib.sha1()
	with open(file, 'rb') as f:
		while True:
			data = f.read(BUF_SIZE)
			if not data:
					break
			#md5.update(data)
			sha1.update(data)
	return sha1.hexdigest()

import os
for root, dirs, files in os.walk(args.dir):
  for file in files:
    path = os.path.join(root, file)
    np = os.path.join(root,"{}.{}".format(hash(path),os.path.splitext(path)[1]))
    print("{} --> {}".format(path,np))
    os.rename(path,np)

