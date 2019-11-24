#!/bin/sh

now=$(date +"%d-%m-%Y_%H.%M.%S")

sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$now

sudo dnf install samba
sudo systemctl enable smb nmb
sudo firewall-cmd --add-service=samba --permanent
sudo firewall-cmd --reload

sudo setsebool -P samba_enable_home_dirs on

sudo pdbedit -a esso

sudo cp smb.conf.phobos /etc/samba/smb.conf

sudo systemctl restart smb nmb
