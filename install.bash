#!/bin/bash

MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
MY_PATH="$(cd -- "$MY_PATH" && pwd)"

ln -s $MY_PATH/.vimrc ~/.vimrc 
ln -s $MY_PATH/.tmux.conf ~/.tmux.conf
ln -s $MY_PATH/.tmux.conf.local ~/.tmux.conf.local
ln -s $MY_PATH/.Xresources ~/.Xresources
ln -s $MY_PATH/.i3 ~/.i3
ln -s $MY_PATH/.xinitrc ~/.xinitrc
