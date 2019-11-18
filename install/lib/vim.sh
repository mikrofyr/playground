#!/bin/bash

echo "usr.sh"

if [ -d ~/.vimrc ]; then
  echo "Error: ~/.vimrc already exists"
  exit 1
fi

if [ -d ~/.vim ]; then
  echo "Error: ~/.vim already exists"
  exit 1
fi

VIM_PATH="../usr/share/vim"
pwd

if [ ! -d $VIM_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

ln -s $PWD/$VIM_PATH ~/.vim
cd ~/
ln -s .vim/.vimrc
