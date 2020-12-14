#/bin/bash

sudo apt -y update
#sudo apt -y upgrade

# TODO: Config file (python + yaml?)
# Debug first
#exit 1

# -- Common tools
sudo apt -y install git
sudo apt -y install vim
sudo apt -y install aptitude
sudo apt -y install ncdu
sudo apt -y install nfs-common
sudo apt -y install silversearcher-ag
sudo apt -y install gmtp
sudo apt -y install tmux
sudo apt -y install tmuxinator
# -- Window manager + addon
if [ $DO_WM -eq 1 ]; then
  sudo apt -y install i3
  sudo apt -y install compton
  sudo apt -y install lxappearance
fi

# -- Dev tools
if [ $DO_DEV -eq 1 ]; then
  sudo apt -y install maven
  sudo apt -y install sqlitebrowser
fi

# -- Spotify
if [ $DO_SPOTIFY -eq 1 ]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
  echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
  sudo apt update
  sudo apt -y install spotify-client
fi

# -- Virtualbox
#sudo apt -y install virtualbox-guest-dkms

