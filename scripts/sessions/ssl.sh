#!/bin/bash

GITTUF_DIRECTORY=~/Documents/repos/gittuf
GITTUF_DELEGATION_DIRECTORY=~/Documents/repos/gittuf-delegation
SESSION="ssl"
VIM="vim"

tmux has-session -t "$SESSION" 2>/dev/null

# An error means there is no session
if [[ $? != 0 ]]; then
  cd $GITTUF_DIRECTORY || exit
  # Create windows for nyu ssl
  tmux new -s "$SESSION" -d
  tmux new-window -t "$SESSION"
  tmux send-keys -t "$SESSION" "$VIM" C-m
  # Create windows for nyux
  tmux new-window -t "$SESSION" -c $GITTUF_DELEGATION_DIRECTORY
  tmux new-window -t "$SESSION" -c $GITTUF_DELEGATION_DIRECTORY
  tmux send-keys -t "$SESSION" "$VIM" C-m
else
  echo "$SESSION already exists"
fi

# Attach to the session regardless
tmux attach -t "$SESSION"
