# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Source shared configuration
source ~/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bcushing/.fzf.zsh ] && source /Users/bcushing/.fzf.zsh

# zsh-autosuggestions setup
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
