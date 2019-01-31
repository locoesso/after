#/bin/sh

sudo pacman -S cifs-utils

echo "Samba user credentials"
read -p "Username:   " username
read -p "Password:   " password
	echo username="$username" >$HOME/.smbcredentials
	echo password="$password" >>$HOME/.smbcredentials
echo "$HOME/.smbcredentials:"
more $HOME/.smbcredentials
sudo chown root ~/.smbcredentials
sudo chmod 600 ~/.smbcredentials

echo "Backup fstab"
now=$(date +"%d-%m-%Y_%H.%M.%S")
sudo cp /etc/fstab /etc/fstab.$now

sudo mkdir -p /media/altair
sudo mkdir -p /media/betelgeuse
sudo mkdir -p /mnt/apophis
#sudo mkdir -p /mnt/data


echo "//phobos/Altair		/media/altair		cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "//phobos/Betelgeuse	/media/betelgeuse	cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "/dev/disk/by-uuid/74911197-06fb-442d-aa97-ea63d6f16ea4 /mnt/apophis auto nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Apophis 0 0" | sudo tee -a /etc/fstab
#echo "/dev/disk/by-uuid/10B07312B072FE12 /mnt/Data ntfs-3g nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Data 0 0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
