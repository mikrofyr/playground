#! /usr/bin/python
import os
import sys
import shutil

if len(sys.argv) <3:
	print "usage: genericdel [path] [pattern]"
	sys.exit(0)
else:
	path = sys.argv[1]
	for root, dirs, files in os.walk(path):
		for d in dirs:
			if d == sys.argv[2]:
				print ("removing %s/%s") %(root,d)
				os.system("rm "+root+"/"+d+" -Rf")
		
		for f in files:
			if f == sys.argv[2]:
				print ("removing %s/%s") %(root,f)
				os.system("rm "+root+"/"+f+" -Rf")
