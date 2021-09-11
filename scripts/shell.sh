#!/bin/sh

# Use vi/vim mode in the shell
set -o vi

# Enable colored output
export CLICOLOR=1

# Init for nvm node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile and ~/.zprofile:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Init for pyenv Python version manager
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Launch nvim instead of vim
VIM_EDITOR="nvim"
alias vim='$VIM_EDITOR'
# Set default editor to nvim
export EDITOR=${VIM_EDITOR}

# Theme for bat syntax highlighting
# export BAT_THEME="base16-onedark"
export BAT_THEME="base16"

# For clangd and other llvm related binaries
export PATH="/usr/local/opt/llvm/bin:$PATH"
