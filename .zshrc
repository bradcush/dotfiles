# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Source shared configuration
source ~/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bcushing/.fzf.zsh ] && source /Users/bcushing/.fzf.zsh

# Highlight tab selections
zstyle ':completion:*' menu select

# Init starship shell prompt
eval "$(starship init zsh)"
