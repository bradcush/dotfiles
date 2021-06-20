#!/bin/bash

# Source shared configuration
source ~/Documents/repos/dotfiles/scripts/shell.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Init starship shell prompt
eval "$(starship init bash)"
