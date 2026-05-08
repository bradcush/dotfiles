#!/bin/bash

UNIVERSE_DIRECTORY=~/Documents/repos/universe
SESSION="uniswap"
VIM="vim"
CLAUDE="claude"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $UNIVERSE_DIRECTORY || exit
  # Create windows for uniswap
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$CLAUDE" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
