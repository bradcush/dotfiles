#!/bin/zsh

# Source shared configuration
source "$HOME/Documents/repos/dotfiles/scripts/shell.sh"

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# Source fzf configuration
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

if [[ $OSTYPE == 'linux-gnu' ]]; then
  ZSH_PLUGINS_PATH="/usr/share/zsh/plugins"
else
  ZSH_PLUGINS_PATH="/opt/homebrew/share"
fi

# zsh-autosuggestions setup
source "$ZSH_PLUGINS_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting setup must be sourced last
source "$ZSH_PLUGINS_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh-autocomplete setup
# source /Users/bradleycushing/Documents/repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh

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

if [[ $OSTYPE == "linux-gnu" ]]; then
  # Setup keychain with ssh and gpg keys
  # GPG key still needs to be entered every time
  eval $(keychain --eval --quiet --agents ssh,gpg --noask \
    id_ed25519_arch_github_personal 0DC07BB23793C014)
fi

# zsh history is weak by default so we allow more
# entries, save it, and share it accross sessions
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

# Enable dark theming
export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
export QT_STYLE_OVERRIDE="Adwaita-Dark"
