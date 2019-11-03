#!/bin/bash

echo "usr.sh"

CONFIG_PATH="../usr/share/bash"

if [ ! -d $CONFIG_PATH ] ; then
  echo "Error: Could not find source folder"
  exit 1
fi

BASHRC_PATH="$PWD/$CONFIG_PATH/.bashrc"
FZFRC_PATH="$PWD/$CONFIG_PATH/.fzf.bash"

echo -e "\n\n" | tee -a ~/.bashrc
echo -e "# -- Bash common" | tee -a ~/.bashrc
echo -e "source $BASHRC_PATH" | tee -a ~/.bashrc
