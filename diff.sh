#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Diffing dotfiles

diff -q $DIR/.vimrc ~/.vimrc || vimdiff $DIR/.vimrc ~/.vimrc
diff -q $DIR/.tmux.conf ~/.tmux.conf || vimdiff $DIR/.tmux.conf ~/.tmux.conf

