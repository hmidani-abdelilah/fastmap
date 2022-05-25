echo "UPDATING FASTMAP................................................." | randtype -t 5,12000 | lolcat
bash update.sh
echo "UPDATE COMPLETE :)..............................................." | randtype -t 5,12000 | lolcat
echo "UPDATING PACKAGE LIST............................................" | randtype -t 5,12000 | lolcat
bash install.sh
echo "All Packages upgraded :)" | randtype -t 5,12000 | lolcat
read -p "Press Enter to start fastmap" null
echo "RUNNING FASTMAP" | randtype -t 5,12000 | lolcat
bash fastmap.sh
