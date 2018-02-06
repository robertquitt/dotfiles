#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Diffing dotfiles

diff $DIR/.vimrc ~/.vimrc || vimdiff $DIR/.vimrc ~/.vimrc
diff $DIR/.tmux.conf ~/.tmux.conf || vimdiff $DIR/.tmux.conf ~/.tmux.conf

