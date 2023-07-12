#!/bin/bash

NYU_TANDON_DIRECTORY=~/Documents/repos/nyu-tandon-bridge
NYUX_DIRECTORY=~/Documents/repos/nyux-cppprg1
SESSION="study"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $NYU_TANDON_DIRECTORY || exit
  # Create windows for nyu tandon
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for nyux
  tmux new-window -t "$SESSION" -c $NYUX_DIRECTORY
  tmux new-window -t "$SESSION" -c $NYUX_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
