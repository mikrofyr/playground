#!/bin/bash

echo "usr.sh"

SOURCE_PATH="../usr/share/fzf"

if [ ! -d $SOURCE_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

INSTALL_PATH="$PWD/$SOURCE_PATH/install"

if [ -d ~/.fzf ]; then
  echo "fzf directory already exists"
  exit 1
fi

ln -sf $PWD/$SOURCE_PATH ~/.fzf
cd $SOURCE_PATH; ./install
