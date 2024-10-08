#!/bin/bash

# Use vi/vim mode in the shell
set -o vi

# Enable colored output
export CLICOLOR=1

# Init for nvm node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

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
. "$HOME/Documents/repos/base16-fzf/bash/base16-onedark.config"

# For clangd and other llvm related binaries
# export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# GPG requires setting tty
export GPG_TTY="$TTY"

# Source env script for adding the
# cargo binary to path for Rust
# . /Users/bradleycushing/.cargo/env

# Add Golang binaries to path
export PATH="$HOME/go/bin:$PATH"
