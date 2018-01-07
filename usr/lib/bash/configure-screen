#!/bin/bash

T_SLEEP=2

#if [ $1 -eq "--sleep" ]; then
#  sleep $T_SLEEP
#fi

xset dpms 0 0 0
xset s off
xsetroot -solid "#333333"

#xrandr --output HDMI1 --mode 1280x720
xrandr --output HDMI1 --mode 1360x768
#xrandr --output HDMI1 --mode 1280x1024
#xrandr --dpi 140
#i3-msg reload

compton --config ~/.config/compton.conf -b
