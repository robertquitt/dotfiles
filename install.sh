#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Installing dotfiles from $DIR

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo Installing vim-plug...
  curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cp -iv $DIR/.vimrc ~/.vimrc
cp -iv $DIR/.tmux.conf ~/.tmux.conf

echo Installing Vim plugins

vim -E -c "PlugInstall" -c "q" -c "q"

