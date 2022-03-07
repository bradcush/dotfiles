#!/bin/sh

# Use vi/vim mode in the shell
set -o vi

# Enable colored output
export CLICOLOR=1

# Init for nvm node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Add pyenv executable to PATH and
# enable shims by adding the following
# to ~/.profile and ~/.zprofile:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Init for pyenv Python version manager
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Hide virtual environment in prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Launch nvim instead of vim
VIM_EDITOR="nvim"
alias vim='$VIM_EDITOR'
# Set default editor to nvim
export EDITOR=${VIM_EDITOR}

# Theme for bat syntax highlighting
# export BAT_THEME="base16-onedark"
export BAT_THEME="base16"

# One dark colorscheme for fzf
# https://github.com/fnune/base16-fzf
. /Users/bcushing/Documents/repos/base16-fzf/bash/base16-onedark.config

# For clangd and other llvm related binaries
export PATH="/usr/local/opt/llvm/bin:$PATH"

# Source env script for adding the
# cargo binary to path for Rust
. /Users/bcushing/.cargo/env
