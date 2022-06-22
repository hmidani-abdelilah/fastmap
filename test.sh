#!/bin/bash
tmux new -d -s my_session2 "gping google.com" ENTER
tmux split-pane
tmux send-keys 1 "ping google.com" ENTER
tmux attach-session