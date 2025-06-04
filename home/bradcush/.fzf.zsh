#!/bin/zsh

SCRIPT_PATH="/usr/share/fzf"

# Auto-completion fzf setup
[[ $- == *i* ]] && source "$SCRIPT_PATH/completion.zsh" 2> /dev/null

# Key bindings for fzf
source "$SCRIPT_PATH/key-bindings.zsh"
