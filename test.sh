#!/bin/bash

tmux
tmux split-window -h
tmux select-window -t 1
tmux send "echo "hi"" ENTER; 
sleep 2
tmux select-window -t 0
echo "hello"
sleep 2