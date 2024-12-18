#!/bin/bash

# Checkout dotfiles. Existing files will be renamed with .bak in the end
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout dotfiles 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} {}.bak
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout dotfiles

# Hide files we are not explicitly tracking yet.
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

