#!/bin/bash

# Setup a work space called `WORKSPACE` with 1 window
# The window has 2 panes
# The first pane set at 65%, split horizontally, set path to $HOME
# The second panel is split vertically 65% horizontally

new_workspace () { 
	local session='workplace'
	# set up tmux
	tmux start-server

	# create a new tmux session, starting vim from a saved session in the new window
	tmux new-session -d -n $session 

	# Split pane 1 horizontally by 85%
	tmux split-window -h -p 15
	# Split pane 2 vertically by 85%
	# tmux split-window -v -p 15
	# # Split pane 3 horizontally by 50% 
	# tmux split-window -h -p 100
	
    # tmux select-pane -t 3
	# tmux send-keys "cd $dotfiles/modules/others;./trackmac.py" Enter   #track my working time
	# tmux select-pane -t 3
    # tmux clock-mode            # show clock
	tmux select-pane -t 0
    tmux send-keys "cd $work" Enter #go to my workplace

	tmux selectp -t 0
	tmux attach -t0
}

if [ $(tmux list-sessions) ]; then
	tmux attach
else
	new_workspace
fi