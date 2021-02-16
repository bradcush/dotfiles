#!/bin/bash

DOTFILES_DIRECTORY=~/Documents/repos/dotfiles
MARK_DIRECTORY=~/Documents/repos/mark
DATALGO_DIRECTORY=~/Documents/repos/datalgo
SESSION="personal"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $DOTFILES_DIRECTORY
  # Create windows for dotfiles
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for mark
  tmux new-window -t "$SESSION" -c $MARK_DIRECTORY
  tmux new-window -t "$SESSION" -c $MARK_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for datalgo
  tmux new-window -t "$SESSION" -c $DATALGO_DIRECTORY
  tmux new-window -t "$SESSION" -c $DATALGO_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
