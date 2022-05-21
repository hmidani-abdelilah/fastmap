#!/bin/bash

zenity --forms --title="Question" --add-entry="Question" &

sleep 1

window="$(xdotool search --name 'Question')"

xdotool windowactivate "$window"

xdotool type 'some text'
