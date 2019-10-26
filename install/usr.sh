#!/bin/bash

echo "usr.sh"

if [ -d ~/usr/bin ]; then
  echo "Error: ~/usr/bin already exists"
  exit 1
fi

if [ -d ~/usr/lib ]; then
  echo "Error: ~/usr/lib already exists"
  exit 1
fi
if [ -d ~/usr/share ]; then
  echo "Error: ~/usr/share already exists"
  exit 1
fi

BIN_PATH="../usr/bin"
LIB_PATH="../usr/lib"
SHARE_PATH="../usr/share"
pwd

if [ ! -d $BIN_PATH ] ||  [ ! -d $LIB_PATH ] || [ ! -d $SHARE_PATH ]; then
  echo "Error: Could not find source folders"
  exit 1
fi

ln -s $PWD/$BIN_PATH ~/usr/bin
ln -s $PWD/$LIB_PATH ~/usr/lib
ln -s $PWD/$SHARE_PATH ~/usr/share

