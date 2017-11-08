#!/bin/sh

if zenity --entry \
--title="Mount shares" \
--text="Password:" \
--hide-text
  then
    mkdir -p /home/$USER/esahan
    mkdir -p /home/$USER/itpaja
    mount –t cifs 10.1.1.35:/homes /$USER/esahan –o username=$USER,password=$?,workgroup=workgroup
    mount –t cifs 10.1.1.35:/itpaja /$USER/itpaja –o username=$USER,password=$?,workgroup=workgroup
  else
    echo "No name entered"
fi
