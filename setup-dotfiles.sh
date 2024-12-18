#!/bin/bash

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Hide files we are not explicitly tracking yet.
dotfiles config --local status.showUntrackedFiles no

# Checkout dotfiles. Existing files will be renamed with .bak in the end
dotfiles checkout dotfiles 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} {}.bak

