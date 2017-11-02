#!/bin/bash

sudo apt-get -y install python3-pip fish
mkdir -p ~/.config/fish
echo "set -Ux EDITOR vim" >> ~/.config/fish/config.fish
sudo chsh -s $(which fish) $(whoami)
sudo pip install flake8 green

wget https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
mkdir -p ~/.vim/autoload
mv pathogen.vim ~/.vim/autoload

ln -s .vimrc ~/.vimrc 
ln -s .tmux.conf ~/.tmux.conf
ln -s .tmux.conf.local ~/.tmux.conf.local
ln -s .i3 ~/.i3
ln -s .Xresources ~/.Xresources

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/nvie/vim-flake8.git
git clone https://github.com/tpope/vim-sensible.git

is_ubuntu=$(python -mplatform | grep -qi Ubuntu)
if [[ -z $is_ubuntu ]]; then
    sudo apt-get -y install build-essential cmake
    sudo apt-get -y install python-dev python3-dev
    git clone https://github.com/Valloric/YouCompleteMe
    cd YouCompleteMe
    freemem=$(free -bt | grep Mem | sed "s/^\s*Mem:\s*//" | cut -d' ' -f1)
    git submodule update --init --recursive
    if [[ $freemem > 4*1024*1024*1024 ]]; then
        ./install.py --clang-completer
    else
        ./install.py
    fi
fi
