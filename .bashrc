#!/bin/bash

# Source shared configuration
source /Users/bcushing/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bcushing/.fzf.bash ] && source /Users/bcushing/.fzf.bash

# Source env script for adding bin path
source /Users/bcushing/.cargo/env

# Init starship shell prompt
eval "$(starship init bash)"
