#!/bin/sh
input=$(zenity --hide-text --text "Password:" --entry)
retval=$?
case $retval in
0)
#mkdir -p /home/$USER/esahan;
#mkdir -p /home/$USER/itpaja;
#mount –t cifs 10.1.1.35:/homes /home/$USER/esahan –o username=$USER,password=$input,workgroup=workgroup;
#mount –t cifs 10.1.1.35:/itpaja /home/$USER/itpaja –o username=$USER,password=$input,workgroup=workgroup;;
echo $USER;
echo $input;;
1)
echo "Cancelled.";;
esac
