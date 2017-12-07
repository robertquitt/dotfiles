#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Installing dotfiles from $DIR

if [ ! -e ~/.vim/autoload/plug.vim ]; then
  echo Installing vim-plug...
  curl -s -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

for FILE in .vimrc .tmux.conf .gitconfig .ssh/authorized_keys
do
  diff -q $DIR/$FILE ~/$FILE || cp -i -v $DIR/$FILE ~/$FILE
done

echo Installing Vim plugins

vim -E -c "PlugInstall" -c "q" -c "q"

