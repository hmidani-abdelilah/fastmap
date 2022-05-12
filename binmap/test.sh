#!/bin/bash

read -p "Enter tty number for terminal 1>>> " tty_0x1
read -p "Enter tty number for terminal 2>>> " tty_0x2
echo -e "Something on /dev/pts/$tty_0x1"
echo "hi" > /dev/pts/$tty_0x1