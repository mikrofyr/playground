#!/bin/bash
#
# Adjust volume via pacmd, icremental by 10% of normal

if [ $# -lt 0 ]; then
 exit 1
fi

SINK="alsa_output.pci-0000_00_1b.0.analog-stereo"

INCREMENT="0x1000"
OLD_VOLUME=`pacmd dump | grep  "set-sink-volume" | grep $SINK | cut -d ' ' -f 3`

BC_ARG0=`echo $OLD_VOLUME | cut -d 'x' -f 2 |awk '{print toupper($0)}'`
BC_ARG1=`echo $INCREMENT | cut -d 'x' -f 2 | awk '{print toupper($0)}'`

#echo $BC_ARG0
#echo $BC_ARG1

NEW_VOLUME=10000
if [ $1 == "up" ]; then
  #NEW_VOLUME=`echo "obase=16;ibase=16; $BC_ARG0 + $BC_ARG1" | bc`
  #amixer -c 0 sset Master 5%+
  amixer -D pulse sset Master 5%+
elif [ $1 == "down" ]; then
  #NEW_VOLUME=`echo "obase=16;ibase=16; $BC_ARG0 - $BC_ARG1" | bc`
  #amixer -c 0 sset Master 5%-
  amixer -D pulse sset Master 5%-
elif [ $1 == "mute" ]; then
  #NEW_VOLUME="0000"
  #amixer -c 0 sset Master toggle
else
  exit 1
fi

#echo $NEW_VOLUME

#PACMD_IN="0x${NEW_VOLUME}"
#echo $PACMD_IN
#pacmd set-sink-volume 1 $PACMD_IN


