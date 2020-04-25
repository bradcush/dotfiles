# Use vi/vim mode in the shell
set -o vi

# Init for nvm node version manager
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Init for rbenv Ruby version manager
eval "$(rbenv init -)"

# npm and vault globals
# export NPM_TOKEN="<NPM_TOKEN>"
# export VAULT_ADDR="<VAULT_ADDR>"

# Launch nvim instead of vim
VIM_EDITOR="nvim"
alias vim=${VIM_EDITOR}
# export EDITOR=${VIM_EDITOR}

# Base16 Shell setup
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# Set a shell theme
# (Better to configure in terminal directly)
# base16

# Theme for bat syntax highlighting
# export BAT_THEME="base16-onedark"
export BAT_THEME="base16"
