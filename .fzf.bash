#!/bin/bash

# PATH setup needed for fzf
if [[ $PATH != */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion fzf setup
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2>/dev/null

# Key bindings for fzf
source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
