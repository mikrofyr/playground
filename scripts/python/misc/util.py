#!/usr/bin/env python3 

# -- Imports
#import argsparse
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

# -- Input args
parser = argparse.ArgumentParser(description='Argparse example')
parser.add_argument('-x','--xml', help='Some XML file', required=True)
parser.add_argument('-p','--product', help='Product name', required=True)
parser.add_argument('-d','--dfile', help='Delta file', required=False)
parser.add_argument('-w','--wfile', help='Whitelist file', required=False)

# -- Formatting with file
header = '{0:60} {1:50} {2:50} {3:5}'.format("Item", "XML Tag", "Tag", "Last changed by")
outfile.write(header+"\n")
for item in result:
  line = '{0:60} {1:50} {2:50} {3:5}'.format(item.base, item.xtag, item.lrtag, item.user)
  outfile.write(line+"\n")
outfile.close()
print("Wrote tag results to %s" %(FILENAME))

 
