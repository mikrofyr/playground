#!/bin/bash

echo "bash.sh"

CONFIG_PATH="../usr/share/bash"

if [ ! -d $CONFIG_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

BASHRC_PATH="$PWD/$CONFIG_PATH/.bashrc"
FZFRC_PATH="$PWD/$CONFIG_PATH/.fzf.bash"

echo "linking common bashrc ..."

echo -e "\n\n" >>  ~/.bashrc
echo -e "# -- Bash common" >>  ~/.bashrc
echo -e "source $BASHRC_PATH" >>  ~/.bashrc
