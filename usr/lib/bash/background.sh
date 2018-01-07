#!/bin/bash

if [ $# -lt 1 ]; then
  exit 1
fi

COMMAND="$*"

#if [ $1 == "vlc" ]; then
#  ARGS="--http-host 10.0.0.22 --http-port 9092"
#  COMMAND="$COMMAND $ARGS"
#fi

#if [ $COMMAND == "wicd" ];
#  COMMAND="$COMMAND "
#fi


echo $COMMAND

$COMMAND 1>/dev/null 2>&1 &

