#/bin/sh

# sudo apt install cifs-utils smbclient
# sudo dnf install cifs-utils smbclient
# sudo pacman -S cifs-utils smbclient

echo "Samba user credentials"
mkdir $HOME/.smb
read -p "Username:   " username
read -p "Password:   " password
	echo username="$username" >$HOME/.smb/smbcredentials
	echo password="$password" >>$HOME/.smb/smbcredentials
echo "$HOME/.smb/smbcredentials:"
more $HOME/.smb/smbcredentials
sudo chown root ~/.smb/smbcredentials
sudo chmod 600 ~/.smb/smbcredentials

now=$(date +"%d-%m-%Y_%H.%M.%S")
sudo cp /etc/fstab /etc/fstab.$now

#sudo mkdir -p /mnt/apophis
sudo mkdir -p /mnt/data
sudo mkdir -p /media/altair
sudo mkdir -p /media/betelgeuse
sudo mkdir -p /media/deneb
sudo mkdir -p /media/downloads

#echo "/dev/disk/by-uuid/74911197-06fb-442d-aa97-ea63d6f16ea4   /mnt/apophis   auto   nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Apophis 0 0" | sudo tee -a /etc/fstab
echo "/dev/disk/by-uuid/10B07312B072FE12                       /mnt/data      ntfs-3g   nosuid,nodev,nofail,x-gvfs-show,x-gvfs-name=Data 0 0" | sudo tee -a /etc/fstab

echo "//phobos.local/altair       /media/altair       cifs   comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000 0 0" | sudo tee -a /etc/fstab
echo "//phobos.local/betelgeuse   /media/betelgeuse   cifs   comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000 0 0" | sudo tee -a /etc/fstab
echo "//phobos.local/deneb        /media/deneb        cifs   comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000 0 0" | sudo tee -a /etc/fstab
echo "//phobos.local/downloads    /media/downloads    cifs   comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000 0 0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
