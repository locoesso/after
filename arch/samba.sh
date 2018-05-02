#/bin/sh

echo "********************"
echo "***** USE SUDO *****"
echo "********************"
read -p "Press any key..."

now=$(date +"%d-%m-%Y_%H.%M.%S")

sudo pacman -Syu samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.$now
sudo cp smb.conf.phobos /etc/samba/smb.conf
sudo smbpasswd -a locoesso

sudo systemctl enable smbd nmbd
sudo systemctl start smbd nmbd

