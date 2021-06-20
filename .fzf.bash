# PATH setup needed for fzf
if [[ $PATH != */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion fzf setup
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2>/dev/null

# Key bindings for fzf
source "/usr/local/opt/fzf/shell/key-bindings.bash"
