#!/bin/bash

# Source shared configuration
source /Users/bcushing/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bcushing/.fzf.bash ] && source /Users/bcushing/.fzf.bash

# Init starship shell prompt
eval "$(starship init bash)"
