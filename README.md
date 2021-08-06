# dotfiles

dotfiles and vim configuration

## install

Install all dependencies for Neovim and general command-line tools. This
script is not recommended to be run and instead should be used as a guide and
recommendation for what is desired to be installed on the system. Dependency
requirements and order can change over time which may or may not require manual
attention for a given dependency during or after install.

``` sh
make install
```

## symlink

Symlink all dotfiles in repository with home directory

``` sh
make symlink
```

## Sessions

Start a given tmux session

``` sh
make extension
make personal
make presentations
make sae
```
