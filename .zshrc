# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Source shared configuration
source ~/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bcushing/.fzf.zsh ] && source /Users/bcushing/.fzf.zsh

# zsh-autosuggestions setup
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-autocomplete setup
# source /Users/bcushing/Documents/repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh

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

# zsh-syntax-highlighting setup must be sourced last
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source pnpm tabtab for packages
[[ -f /Users/bcushing/config/tabtab/zsh/__tabtab.zsh ]] \
  && source /Users/bcushing/config/tabtab/zsh/__tabtab.zsh
