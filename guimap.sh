#!/bin/bash

echo "Welcome to GUIMap.........................................................." | randtype -t 5,12000 | lolcat
read -p "Press enter to start" null0x1

zenity --version

listval1=`zenity --list \
    --title ="Command to execute" \
    --column="Command" --column="Description" \
    netmap "performs network scan"`

echo $listval1 > list1guimap.psv
cat list1guimap.psv

if [[ $listval1 == "netmap" ]] ; then
    netmaphost=`zenity --entry \
        --title="Host/subnet to scan" \
        --text="Enter host/subnet to scan" \
        --entry-text "192.168.1.1"`
    nmap -sn $netmaphost > temp.txt
    notify-send "Scan Completed!"
    zenity --text-info \
        title="Output" \
        --filename="temp.txt" \

else
    echo "sdfghjkl"
fi
