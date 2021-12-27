# dotfiles

macOS dotfiles, install, and configuration

## Configuration

- Alacritty
- Bash
- Bat
- FZF
- Git
- Neovim
- Starship
- Tmux
- Z shell

## Install

Install all dependencies for Neovim and general command-line tools. This
script is not recommended to be run and instead should be used as a guide and
recommendation for what is desired to be installed on the system. Dependency
requirements and order can change over time which may or may not require manual
attention for a given dependency during or after install.

``` sh
make install
```

## Symlink

Symlink all dotfiles in repository with home directory

``` sh
make symlink
```

## Sessions

Start a given tmux session

``` sh
make bradcush
make datalgo
make extension
make personal
make presentations
make problems
make sae
```

## Shell

Both `bash` and `zsh` are supported with all shared configuration declared in
`scripts/shell.sh`. The shared config is sourced in the `.bashrc` and `.zshrc`
files respectively. Configuration specific to fzf is contained in `.fzf.bash`
and `.fzf.zsh` and sourced in their respective shell configs.
