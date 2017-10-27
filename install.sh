#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Installing dotfiles in $DIR \n

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo Installing vim-plug...
  curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cp $DIR/.vimrc ~/.vimrc

echo Installing Vim plugins \n

vim -E -c "PlugInstall" -c "q" -c "q"

