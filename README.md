# Dotfiles

Dotfiles for Vim, tmux, bash, ssh, git

## Install

```
$ git clone git@github.com:robertquitt/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install.sh
```

## Terminal Setup (Git Bash/MinTTY)

These dotfiles are for a 256 color terminal. To change this on MinTTY, do the
following steps.

1. Right-click the top of the MinTTY window
1. Click "Options ..."
1. Click "Terminal"
1. Under "Type", select "xterm-256color"

## Custom Keybindings

### tmux

Name | Key Combination
--- | ---
leader | `C-Space`
switch panes | `C-h`,`C-j`,`C-k`,`C-l`
switch panes | `M-h`,`M-j`,`M-k`,`M-l`

### Vim

Name | Key Combination
--- | ---
Leader | `\\ `
Toggle NERDTree | `<F7>`, `Leader+7`
Toggle CTags | `<F8>`, `Leader+8`

## Todo

- Work with inputrc
- Make bashrc nicer
- Make install.sh aware of existing .ssh/authorized keys
- Add .ssh/config to dotfiles
- Make .gitconfig installation work better (merge?)
- Make this repo more accesible
