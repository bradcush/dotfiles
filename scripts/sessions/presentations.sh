#!/bin/bash

PRESENTATIONS_DIRECTORY=~/Documents/repos/presentations
SESSION="presentations"
PYENV="pyenv activate presentations"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $PRESENTATIONS_DIRECTORY
  tmux new -s "$SESSION" -d
  tmux send-keys -t "$SESSION" "$PYENV" C-m
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$PYENV && $VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
