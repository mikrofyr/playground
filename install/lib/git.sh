#!/bin/bash

echo "git.sh"

if [ ! -f ~/.gitconfig ]; then
  touch ~/.gitconfig
fi

CNT=`grep -c include ~/.gitconfig`
if [ ! $CNT -eq 0 ]; then
  echo "Error: Already include in .gitconfig"
fi

GIT_PATH="../usr/share/git/.gitconfig"

if [ ! -f $GIT_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

echo "echoes"
GITCONFIG=$PWD/$GIT_PATH
echo -e "[include]" >> ~/.gitconfig
echo -e "  path = ${GITCONFIG}" >> ~/.gitconfig

