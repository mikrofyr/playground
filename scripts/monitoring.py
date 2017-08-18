#!/usr/bin/env python3

import time
import datetime
import subprocess
import sys
import os.path
import argparse

#TODO:
# 1) Add hostname to logging
# 2) Cron adaptions?

# Parameters
SAMPLES = 4  # Number of samples per run
T_SLEEP = 1  # Sleep time between sample

# Arguments
parser = argparse.ArgumentParser(description='Log time spend on COMMAND to FILE')
parser.add_argument('-c','--command', help='Command to run', required=True)
parser.add_argument('-f','--file', help='File to store result', required=True)

args = parser.parse_args()
COMMAND = args.command
FILE = args.file

# Timestamp of measurement
#2017-05-16 14:10:20
timestamp = time.strftime("%Y-%m.%d %H:%M:%S")

# 1 min load average
uptime = subprocess.check_output("uptime", shell=True).decode('utf-8').strip().split()[9].replace(',','')
#print(uptime)

# Sample loop
samples = []
for i in range (0,SAMPLES):
  # Grab sample
  start = time.time() 
  out = subprocess.check_output(COMMAND, shell=True)
  end = time.time()
  samples.append(end-start)
  # Sleep
  time.sleep(T_SLEEP)
 
#for sample in samples:
#  print(sample)

sample_min = min(float(f) for f in samples)
sample_max = max(float(f) for f in samples)
#print("%s , %s" %(sample_max,sample_min))

# Check if log file exists
doInit = not os.path.isfile(FILE)

with open(FILE, 'a') as out:
  # Add header if new file
  if doInit:
    out.write("Time;Uptime;Max;Min\n")
  out.write("%s;%s;%f;%f\n" %(timestamp,uptime,sample_max,sample_min))


