#!/usr/bin/env python3

import argparse
import yaml
import os.path
import sys
import logging
import tempfile
import shutil

# Logging
logging.basicConfig(level=logging.DEBUG)

# -- Input args
parser = argparse.ArgumentParser(description='Installer')
parser.add_argument('-y','--yaml', help='Path to dirs.yaml', required=False)
parser.add_argument('-t','--target', help='Target to install', required=True)
args = parser.parse_args()

if args.yaml == None:
	args.yaml = "./dirs.yaml"

if not os.path.isfile(args.yaml):
	logging.error("No dirs.yaml file found")
	sys.exit(1)

if not os.path.isfile(args.yaml):
  print("Error: Could not open {}".format(args.yaml))
  sys.exit(1)

with open(args.yaml, 'r') as stream:
  try:
    ydata = yaml.load(stream)
  except yaml.YAMLError as exc:
    print(exc)
    sys.exit(1)

tmpfolders = []

for item in ydata:
  #logging.info(item)
  if item == args.target or args.target == "all":
    logging.debug("Checking {} files".format(item))
    tmpfolder = tempfile.mkdtemp()
    tmpfolders.append("{}:{}".format(item,tmpfolder))
    
    for dir in ydata[item]:
      #abspath = os.path.expandvars("$HOME/".format(fname))     
      abspath = os.path.expanduser("{}".format(dir))
      if os.path.isfile(abspath) or os.path.isdir(abspath) or os.path.islink(abspath):
        logging.info("{} exists".format(abspath))
        shutil.move(abspath,tmpfolder) 
      #shutil.rmtree(dirpath)

logging.info("---------------------------------")
logging.info("Listing all tmpdirs with moved files:")
for item in tmpfolders:
  print(item)
 
