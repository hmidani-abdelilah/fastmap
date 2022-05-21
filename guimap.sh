#!/bin/bash

echo "Welcome to GUIMap.........................................................." | randtype -t 5,12000 | lolcat
read -p "Press enter to start" null0x1

while [ 1 -lt 2 ] ; do  
    listval1=`zenity --list \
        --title="Command to execute" \
        --column="Command" --column="Description" \
        arpscan "Performs network scan" \
        port "Performs port scan on specified host" \
        lp "Lists all open ports cleanly" \
        synscan "Performs syn scan" \
        scanon "Scans operating system based on MAC address of specified targets" \
        quit "exits the program" \
        --width="700" --height="500"`

    echo $listval1 > list1guimap.psv
    cat list1guimap.psv
    
    if [[ $listval1 == "arpscan" ]] ; then

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"
        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="500" --height="350"`
        nmap -sn $netmaphost > temp.txt
        notify-send "ARP SCAN COMPLETED :)"
        zenity --text-info \
            title="Arp Scan Output" \
            --filename="temp.txt" \
            --width="500" --height="350"

    elif [[ $listvar1 == "port" ]] ; then

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"
        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="500" --height="350"`
            sudo nmap -p0- -A -T4 -vvv $netmaphost > temp.txt
            notify-send "PORT SCAN COMPLETED :)"
            zenity --text-info \
                title="Porn Scan Output" \
                --filename="temp.txt" \
                --width="500" --height="350"

    elif [[ $listval1 == "quit" ]] ; then
        break
    else
        echo "Please select a value"
    fi
done
echo "Thank you for using GUIMap!!"
figlet -f slant "Goodbye" | randtype -t 5,2000| lolcat
