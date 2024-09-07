#!/bin/bash

DS_DIRECTORY=~/Documents/repos/csci-ga-2433
CRYPTO_DIRECTORY=~/Documents/repos/csci-ga-3210
SESSION="study"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $DS_DIRECTORY || exit
  # Create windows for operating systems
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for mathematical techniques
  tmux new-window -t "$SESSION" -c $CRYPTO_DIRECTORY
  tmux new-window -t "$SESSION" -c $CRYPTO_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
