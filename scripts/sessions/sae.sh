#!/bin/bash

SAE_DIRECTORY=~/Documents/repos/safariawakens
SESSION="sae"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $SAE_DIRECTORY || exit
  # Create windows for safariawakens
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
