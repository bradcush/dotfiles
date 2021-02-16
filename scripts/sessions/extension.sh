#!/bin/bash

EXTENSION_DIRECTORY=~/Documents/repos/extension
LEELOO_DIRECTORY=~/Documents/repos/leeloo/packages/leeloo
CARBON_DIRECTORY=~/Documents/repos/carbon
SESSION="ext"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $EXTENSION_DIRECTORY
  # Create windows for extension
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for leeloo
  tmux new-window -t "$SESSION" -c $LEELOO_DIRECTORY
  tmux new-window -t "$SESSION" -c $LEELOO_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for carbon
  tmux new-window -t "$SESSION" -c $CARBON_DIRECTORY
  tmux new-window -t "$SESSION" -c $CARBON_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
