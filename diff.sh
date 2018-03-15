#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Diffing dotfiles

for FILE in .vimrc .tmux.conf .gitconfig .ssh/authorized_keys
do
  diff -q $DIR/$FILE ~/$FILE || vimdiff $DIR/$FILE ~/$FILE
done

