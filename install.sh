#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -e

echo Installing dotfiles from $DIR

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo Installing vim-plug...
  curl -s -Lo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

for FILE in .vimrc .tmux.conf .gitconfig .ssh/authorized_keys .ssh/config
do
  if [[ $(uname -s) = *"NT"* ]]; then
    diff -q $DIR/$FILE ~/$FILE || ln -iv $DIR/$FILE ~/$FILE
  else
    diff -q $DIR/$FILE ~/$FILE || ln -ivs $DIR/$FILE ~/$FILE
  fi
done

echo Installing Vim plugins

vim -E -c "PlugInstall" -c "q" -c "q"

# vim: sw=2 et ts=2
