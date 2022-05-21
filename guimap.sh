#!/bin/bash

echo "Welcome to GUIMap.........................................................." | randtype -t 5,12000 | lolcat
read -p "Press enter to start" null0x1

zenity --version

listval1=`zenity --list \
    --title ="Command to execute" \
    --column="Command" --column="Description" \
    pwd1 "Prints working directory"`

echo $listval1 > list1guimap.psv
cat list1guimap.psv