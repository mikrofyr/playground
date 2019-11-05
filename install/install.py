#!/usr/bin/env python3

import argparse
import yaml
import os.path
import sys
import logging

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

for item in ydata:
  #logging.info(item)
  if item == args.target or args.target == "all":
    logging.info("Found target")

