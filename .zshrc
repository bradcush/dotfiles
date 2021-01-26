# Default template for .zshrc file auto-generated when installing ohmyzsh
# (https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template)

# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bcushing/.oh-my-zsh"

# Set ZSH theme by name
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bundles"

# Ignore permission issues to load completion
ZSH_DISABLE_COMPFIX=true

# Display red dots while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Use another custom folder besides $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins to be loaded
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    zsh-autosuggestions
    fzf # Conflicts with waiting dots
    git
)

# Declare last but before user config
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Source other files after "oh-my-zsh.sh" to avoid overwriting
source ~/Documents/repos/dotfiles/scripts/shell.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
