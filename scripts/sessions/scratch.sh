#!/bin/bash

HOME_DIRECTORY=~
SESSION="scratch"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $HOME_DIRECTORY || exit
  # Create windows for scratch
  tmux new -s "$SESSION" -d
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
