#!/bin/bash

# Source shared configuration
source /Users/bradleycushing/Documents/repos/dotfiles/scripts/shell.sh
[ -f /Users/bradleycushing/.fzf.bash ] && source /Users/bradleycushing/.fzf.bash

# Init starship shell prompt
eval "$(starship init bash)"

# Source pnpm tabtab for packages
# [ -f /Users/bradleycushing/.config/tabtab/bash/__tabtab.bash ] \
#   && source /Users/bradleycushing/.config/tabtab/bash/__tabtab.bash
