#! /bin/bash
tmux splitw -h -d
tmux resize -t 1 -x 25
tmux splitw -d -t 1
#gotop
tmux select-pane -t 2
tmux send-keys -t 1 'gotop -m' Enter
tmux send-keys -t 2 'ranger' Enter
tmux select-pane -t 3
