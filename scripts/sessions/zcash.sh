#!/bin/bash

LIBRUSTZCASH_DIRECTORY=~/Documents/repos/librustzcash
ZCASH_DEVTOOL_DIRECTORY=~/Documents/repos/zcash-devtool
SESSION="zcash"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $LIBRUSTZCASH_DIRECTORY || exit
  # Create windows for librustzcash
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for zcash-devtool
  tmux new-window -t "$SESSION" -c $ZCASH_DEVTOOL_DIRECTORY
  tmux new-window -t "$SESSION" -c $ZCASH_DEVTOOL_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
