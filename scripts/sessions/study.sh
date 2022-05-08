#!/bin/bash

NYU_DIRECTORY=~/Documents/repos/nyux-cppprg1
CPPLAY_DIRECTORY=~/Documents/repos/cpplay
SESSION="study"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $NYU_DIRECTORY || exit
  # Create windows for nyux
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for cpplay
  tmux new-window -t "$SESSION" -c $CPPLAY_DIRECTORY
  tmux new-window -t "$SESSION" -c $CPPLAY_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
