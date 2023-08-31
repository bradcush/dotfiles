# dotfiles

macOS and Arch Linux dotfiles, install, and configuration. The hypothesis for
organization of this repository is that tools for operating systems are
configured similarly enough that it makes sense to share most things.

## Configuration

Applications and utilities are used on both systems unless otherwise noted.
Operating system specifics like paths are conditionally set per script. Most
scripts are meant to be run on for operating system.

- Alacritty
- Awesome (Linux)
- Bash
- Bat
- FZF
- Git
- Neovim
- Starship
- Tmux
- Z shell

## Install

Install all dependencies for Neovim and general command-line tools. Arch Linux
dependencies include what's needed for a more customized and usable operating
system. This script is not recommended to be run and instead should be used as
a guide and recommendation for what is desired to be installed on the system.
Dependency requirements and order can change over time which may or may not
require manual attention for a given dependency during or after install.

``` sh
make install-arch # Arch Linux systems
make install-macos # macOS systems
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
make arduino
make bradcush
make datalgo
make deeps
make dotfiles
make mark
make nyu
make presentations
make problems
make scratch
```

## Shell

Both `bash` and `zsh` are supported with all shared configuration declared in
`scripts/shell.sh`. The shared config is sourced in the `.bashrc` and `.zshrc`
files respectively. Configuration specific to fzf is contained in `.fzf.bash`
and `.fzf.zsh` and sourced in their respective shell configs. Additional
profile and environment related files for both shells is tracked also
regardless of if they are empty or contain addition configuration.

## License

[dotfiles MIT License](LICENSE)
