#!/bin/bash

echo "Welcome to GUIMap.........................................................." | randtype -t 5,12000 | lolcat
read -p "Press enter to start" null0x1

while [ 1 -lt 2 ] ; do  

    echo "" > temp.txt

    listval1=`zenity --list \
        --title="Command to execute" \
        --column="Command" --column="Description" \
        arpscan "Performs ARP network scan" \
        port "Performs port scan on specified host" \
        lp "Lists all open ports cleanly" \
        synscan "Performs syn scan" \
        scanos "Scans operating system based on MAC address of specified targets" \
        tpackets "Uses TCPDUMP to collect packets using promiscous mode on network" \
        quit "exits the program" \
        --width="700" --height="500"`

    echo $listval1 > list1guimap.psv
    cat list1guimap.psv

    if [[ $listval1 == "arpscan" ]] ; then

        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="500" --height="350"`

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"

        sudo python3 pymap.py --target $netmaphost > temp.txt
		cat temp.txt | grep -v -e "-----------------------------------" -e "IP Address" -e "MAC Address" | wc -l >> temp.txt
        echo "Hosts online" >> temp.txt

        notify-send "ARP SCAN COMPLETED :)"
        zenity --text-info \
            title="Arp Scan Output" \
            --filename="temp.txt" \
            --width="600" --height="450"

    elif [[ $listval1 == "port" ]] ; then

        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="550" --height="400"`

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"
        sudo python3 pyport.py $netmaphost > temp.txt
        notify-send "PORT SCAN COMPLETED :)"
        
        zenity --text-info \
            title="Port Scan Output" \
            --filename="temp.txt" \
            --width="600" --height="450"

    elif [[ $listval1 == "lp" ]] ; then

         netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="550" --height="400"`

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"

        sudo nmap -p0- -A -T4 -vvv $netmaphost | grep "open port" > temp.txt
        cat temp.txt | wc -l >> temp.txt 
		echo "Amount of open ports" >> temp.txt
        echo "     ========================" >> temp.txt

        notify-send "PORT SCAN COMPLETED :)"

        zenity --text-info \
            title="Port Scan Output" \
            --filename="temp.txt" \
            --width="600" --height="450"

    elif [[ $listval1 == "synscan" ]] ; then

        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="550" --height="400"`

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"
        sudo nmap -sS -vvv $netmaphost > temp.txt
        notify-send "SYN SCAN COMPLETED :)"
        
        zenity --text-info \
            title="Port Scan Output" \
            --filename="temp.txt" \
            --width="600" --height="450"
    
    elif [[ $listval1 == "scanos" ]] ; then

        netmaphost=`zenity --entry \
            --title="Host/subnet to scan" \
            --text="Enter host/subnet to scan" \
            --entry-text "192.168.1.1" \
            --width="550" --height="400"`

        echo "SCREEN WILL REMAIN BLANK TILL OUTPUT IS COLLECTED"
        sudo nmap -O -vvv  $netmaphost > temp.txt
        notify-send "SYN SCAN COMPLETED :)"
        
        zenity --text-info \
            title="OS Scan Output" \
            --filename="temp.txt" \
            --width="600" --height="450"
    
    elif [[ $listval1 == "tpackets" ]] ; then

        tcpdump -D > temp.txt
        cat temp.txt

        zenity --text-info \
            --title="CHECK TERMINAL FOR INTERFACE LIST" \
            --filename="temp.txt" \
            --width="600" --height="450"

        netmaphost=`zenity --entry \
            --title="Network Interface to use" \
            --text="Type in Interface name" \
            --entry-text "wlan0" \
            --width="500" --height="350"`

    elif [[ $listval1 == "quit" ]] ; then
        break
    else
        echo "Please select a value"
    fi
done
echo "Thank you for using GUIMap!!"
figlet -f slant "Goodbye" | randtype -t 5,2000| lolcat
