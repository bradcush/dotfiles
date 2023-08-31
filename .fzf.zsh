#!/bin/zsh

if [[ $OSTYPE == "darwin"* ]]; then
  # PATH setup needed for fzf running on macOS
  if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
    export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
  fi
  SCRIPT_PATH="/opt/homebrew/opt/fzf/shell"
else
  SCRIPT_PATH="/usr/share/fzf"
fi

# Auto-completion fzf setup
[[ $- == *i* ]] && source "$SCRIPT_PATH/completion.zsh" 2> /dev/null

# Key bindings for fzf
source "$SCRIPT_PATH/key-bindings.zsh"
