# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/bradleycushing/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/bradleycushing/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/bradleycushing/.vim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/bradleycushing/.vim/plugged/fzf/shell/key-bindings.zsh"
