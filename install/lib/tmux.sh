#!/bin/bash

echo "usr.sh"

TMUX_PATH="../usr/share/tmux"
pwd

if [ ! -d $TMUX_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

ln -s $PWD/$TMUX_PATH/.tmux.conf ~/.tmux.conf
ln -s $PWD/$TMUX_PATH/.tmux.conf.local ~/.tmux.conf.local
cp $PWD/$TMUX_PATH/.tmux.conf.shell ~/.tmux.conf.shell
