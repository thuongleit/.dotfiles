#!/bin/bash

# Setup a work space called `WORKSPACE` with 1 window
# The window has 3 panes
# The first pane set at 65%, split horizontally, set path to $HOME
# The second panel is split vertically 65% horizontally
unset TMUX

new_workspace() {
    local session='workplace'

    # Start tmux server
    tmux start-server

    # Create a new tmux session with name $session
    tmux new-session -d -s $session

    # Split pane 1 horizontally by 85%
    tmux split-window -h -p 15

    # Split pane 2 vertically by 85%
    tmux split-window -v -p 10

    # Show clock in pane 3
    tmux select-pane -t 3
    tmux clock-mode

    # Go to workplace directory in pane 1
    tmux select-pane -t 1
    tmux send-keys "cd $work" Enter

    # Go to HOME directory in pane 2
    tmux select-pane -t 2
    tmux send-keys "cd $HOME" Enter

    # Attach to the new session
    tmux select-pane -t 1
    tmux attach-session -t $session
}

# Check if any tmux sessions exist
if [ "$(tmux list-sessions)" ]; then
    tmux attach
else
    new_workspace
fi