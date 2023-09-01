#!/bin/bash

# Stop if not running interactively
[[ $- != *i* ]] && return

# Defaults from Arch
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Source shared configuration
source "$HOME/Documents/repos/dotfiles/scripts/shell.sh"

# Init starship shell prompt
eval "$(starship init bash)"
