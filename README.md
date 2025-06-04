# dotfiles

Arch Linux dotfiles, install, and configuration. The approach for organization
of this repository is that we intend to use a single operating system and
organize dotfiles relative to their actual linked path. system.

## Configuration

- Alacritty
- DWM (Linux)
- DMENU
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
make install
```

## Symlink

This repository is used as the source of truth for all configuration files
which are then symlinked to their expected location in the file system.
[stuff](https://github.com/bradcush/stuff) is used to manage linking of files
from this repository to their required location.

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
make ssl
```

## Shell

Both `bash` and `zsh` are supported with all shared configuration declared in
`scripts/shell.sh`. The shared config is sourced in the `.bashrc` and `.zshrc`
files respectively. Configuration specific to fzf is contained in `.fzf.bash`
and `.fzf.zsh` and sourced in their respective shell configs. Additional
profile and environment related files for both shells are also tracked
regardless of if they are empty or contain additional configuration.

## Network

Connecting to the NYU school network requires a configuration file to be
specified. You'll need to have root access to copy the configuration file to
`/var/lib/iwd/nyu.8021x`. This repository contains the configuration file
without the password which should be set to 600 so only root has access.

## DWM

The best way to keep track of changes to DWM `config.h` is using patches just
like what's recommended for extending DWM for the community. This repository
keeps track of a patch `config.h.patch` which can be applied to the `config.h`
file tracked by the DWM repository.

## License

[dotfiles MIT License](LICENSE)
