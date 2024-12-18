# Backup & Sync of .dotfiles

This rougly follows the descriptions:
 * <https://www.atlassian.com/git/tutorials/dotfiles>
 * <https://news.ycombinator.com/item?id=11071754>

## Setup on a new System

```
git clone --bare git@github.com:andizimmerer/.dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
./setup-dotfiles.sh
```

## Notes

### Dotfiles are on branch `dotfiles`
The .dotfiles themselves all live on a separate branch `dotfiles`. The reason for this is that (i) your local home directory will not be spammed with the setup script and README and (ii) the setup process is simplified. The default branch is `setup`, which you will likely only check out when initially setting up a new system.

### Repository is in directory `.dotfiles`
In order to avoid conflicts with other `.git` folders, this repository tracks changes in `.dotfiles` (which is basically just a renamed `.git` folder).
However, this means that you have to tell `git` which directory to use. Therefore, this repository defines an `alias dotfiles=git ...` in the contained `.bashrc`.
This means that if you want to commit changes to your dotfiles, you should use
```
dotfiles add <file>
dotfiles commit -m "commit message"
```

### Pulling new changes
Pulling new changes should be as easy as
```
dotfiles pull
```
There might be conflicts. Maybe I should add a script that fixes these conflicts.

