#!/bin/zsh

if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

SCRIPT_PATH="/opt/homebrew/opt/fzf/shell"

# Auto-completion fzf setup
[[ $- == *i* ]] && source "$SCRIPT_PATH/completion.zsh" 2> /dev/null

# Key bindings for fzf
source "$SCRIPT_PATH/key-bindings.zsh"

# source <(fzf --zsh)
