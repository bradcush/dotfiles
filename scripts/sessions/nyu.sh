#!/bin/bash

NETWORKING_DIRECTORY=~/Documents/repos/csci-ga-2262
CRYPTOGRAPHY_DIRECTORY=~/Documents/repos/csci-ga-3205
ALGORITHMS_DIRECTORY=~/Documents/repos/csci-ga-1170
SESSION="study"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $NETWORKING_DIRECTORY || exit
  # Create windows for networking
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for cryptography
  tmux new-window -t "$SESSION" -c $CRYPTOGRAPHY_DIRECTORY
  tmux new-window -t "$SESSION" -c $CRYPTOGRAPHY_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for algorithms
  tmux new-window -t "$SESSION" -c $ALGORITHMS_DIRECTORY
  tmux new-window -t "$SESSION" -c $ALGORITHMS_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
