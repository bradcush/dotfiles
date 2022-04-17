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

Symlink all dotfiles in repository with home directory. This repository is used
as the source of truth for all configuration files which are then symlinked to
their expected location in the file system.

``` sh
make symlink
```

## Sessions

Start a given tmux session for working on a specific project. In some cases a
session will also setup an environment or open multiple repositories.

``` sh
make bradcush
make datalgo
make extension
make personal
make presentations
make problems
make sae
make scratch
make study
```

## Shell

Both `bash` and `zsh` are supported with all shared configuration declared in
`scripts/shell.sh`. The shared config is sourced in the `.bashrc` and `.zshrc`
files respectively. Configuration specific to fzf is contained in `.fzf.bash`
and `.fzf.zsh` and sourced in their respective shell configs. Additional
profile and environment related files for both shells is tracked also
regardless of if they are empty or contain addition configuration.
