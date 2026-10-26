#!/bin/zsh

# Source shared configuration
source "$HOME/Documents/repos/dotfiles/scripts/shell.sh"

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Source fzf configuration
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

ZSH_PLUGINS_PATH="/opt/homebrew/share"

# zsh-autosuggestions setup
source "$ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting setup must be sourced last
source "$ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Completion configuration
autoload -Uz compinit # Mark compinit function
compinit # Load complist module
zmodload zsh/complist # Load completion list
zstyle ':completion:*' menu select # Highlight tab selections
_comp_options+=(globdots) # Show hidden files for completion

# Use vi/vim bindings for selections
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Init starship shell prompt
eval "$(starship init zsh)"

# Bun auto-completion for zsh
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Add Bun to path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Setup keychain with ssh and gpg keys
# GPG key only needs to be entered one time
# eval $(keychain --eval --quiet --noask \
#   id_ed25519_arch_github_personal 0DC07BB23793C014)

# You may need to add the command to your ~/.zshrc file
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh
# Redirect output to /dev/null so we don't log messages in shells
ssh-add --apple-use-keychain ~/.ssh/id_ed25519_macos_github_uniswap_signing 2>/dev/null

# zsh history is weak by default so we allow more
# entries, save it, and share it accross sessions
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# GPG pinentry through tty
export GPG_TTY=$(tty)

# Added by fzf install
export PATH="$HOME/.local/bin:$PATH"

# Claude Code: default to max effort level
# Overrides everything, don't use, can't change
# export CLAUDE_CODE_EFFORT_LEVEL=max
export CLAUDE_CODE_EFFORT_LEVEL=auto

# bun completions
[ -s "/Users/bradley.cushing/.bun/_bun" ] && source "/Users/bradley.cushing/.bun/_bun"
