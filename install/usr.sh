#!/bin/bash

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

BIN_PATH="../../usr/bin"
LIB_PATH="../../usr/lib"
SHARE_PATH="../../usr/share"

if [ ! -d $BIN_PATH ] ||  [ ! -d $LIB_PATH ] || [ ! -d $SHARE_PATH ]; then
  echo "Error: Could not find source folders"
  exit 1
fi

ln -s $BIN_PATH ~/usr/bin
ln -s $LIB_PATH ~/usr/lib
ln -s $SHARE_PATH ~/usr/share

