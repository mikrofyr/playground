#!/bin/bash
# https://seacloud.cc/group/3/wiki/seafile-cli-manual

#
seaf-cli init -d .config/seafile/

#
seaf-cli start

#
seaf-cli download -l 1909324e-95a9-4092-a506-8e7c84fa6304 -s https://mikrofyr.no:7078 -d ~/Data/seafile -u vegarend@gmail.com -p
