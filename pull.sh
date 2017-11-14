#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Copying dotfiles back into $DIR

cp -v ~/.vimrc $DIR/.vimrc
cp -v ~/.tmux.conf $DIR/.tmux.conf

