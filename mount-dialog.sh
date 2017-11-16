#!/bin/sh
input=$(zenity --hide-text --text "Password:" --entry)
#retval=$?
#case $retval in
#0)
#mkdir -p /home/$USER/esahan;
#mkdir -p /home/$USER/itpaja;
sudo mount //10.1.1.35/esahan /home/esahan/esahan –o username=esahan,password=$input
#mount –t cifs 10.1.1.35:/itpaja /home/$USER/itpaja –o username=$USER,password=$input,workgroup=workgroup;;
#echo $USER;
echo $input
#1)
#echo "Cancelled.";;
#sac
