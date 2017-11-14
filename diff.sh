#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Diffing dotfiles

diff $DIR/.vimrc ~/.vimrc || git diff $DIR/.vimrc ~/.vimrc
diff $DIR/.tmux.conf ~/.tmux.conf || git diff $DIR/.tmux.conf ~/.tmux.conf

