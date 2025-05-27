#!/bin/bash

COMPUTATION_DIRECTORY=~/Documents/repos/csci-ua-0453
CRYPTO_BLOCKCHAINS_DIRECTORY=~/Documents/repos/csci-ga-3033-107
CRYPTO_RESEARCH_DIRECTORY=~/Documents/repos/csci-ga-3813
SESSION="study"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $COMPUTATION_DIRECTORY || exit
  # Create windows for computation
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for cryptography of blockchains
  tmux new-window -t "$SESSION" -c $CRYPTO_BLOCKCHAINS_DIRECTORY
  tmux new-window -t "$SESSION" -c $CRYPTO_BLOCKCHAINS_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for cryptography research
  tmux new-window -t "$SESSION" -c $CRYPTO_RESEARCH_DIRECTORY
  tmux new-window -t "$SESSION" -c $CRYPTO_RESEARCH_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
