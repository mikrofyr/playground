#!/bin/bash

# Link library scripts

if [ $# -gt 0 ]; then
  PREFIX=$1
else 
  PREFIX="."
fi

if [ ! -d $PREFIX ]; then
  echo "PREFIX directory does not exist"
  exit 1
fi

# Link the library (scripts) to a folder
ln -sf ${PWD}/../lib/bash/background.sh          ${PREFIX}/background
ln -sf ${PWD}/../lib/bash/batterystat.sh         ${PREFIX}/batterystat
ln -sf ${PWD}/../lib/perl/bulkmv.pl              ${PREFIX}/bulkmv
ln -sf ${PWD}/../lib/python/misc/genericdel.py   ${PREFIX}/genericdel
ln -sf ${PWD}/../lib/bash/ipfilter.sh            ${PREFIX}/ipfilter
ln -sf ${PWD}/../lib/bash/ismeltdown.sh          ${PREFIX}/ismeltdown
ln -sf ${PWD}/../lib/bash/md5uniq.sh             ${PREFIX}/md5uniq
ln -sf ${PWD}/../lib/bash/mywanip.sh             ${PREFIX}/mywanip


