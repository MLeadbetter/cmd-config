#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "Please run as root"
	exit
fi

sudo apt-get -y install python3-pip fish
sudo pip install flake8 green
sudo chsh -s $(which fish) $(whoami)

ln -s ~/.vimrc .vimrc
ln -s ~/.tmux.conf .tmux.conf
ln -s ~/.tmux.conf.local .tmux.conf.local
mkdir -p .vim/bundle
cd .vim/bundle
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/tpope/vim-sensible.git

is_ubuntu=$(0python -mplatform | grep -qi Ubuntu)
if [[ -z $is_ubuntu ]]; then
    sudo apt-get -y install build-essential cmake
    sudo apt-get -y install python-dev python3-dev
    git clone https://github.com/Valloric/YouCompleteMe
    cd YouCompleteMe
    git submodule update --init --recursive
    ./install.py --clang-completer
fi
