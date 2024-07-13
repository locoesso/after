#/bin/sh

#sudo pacman -S cifs-utils
mkdir $HOME/.smb
echo "Samba user credentials"
read -p "Username:   " username
read -p "Password:   " password
	echo username="$username" >$HOME/.smb/credentials
	echo password="$password" >>$HOME/.smb/credentials
sudo echo "$HOME/.smb/credentials:"
more $HOME/.smb/credentials
sudo chown root ~/.smb/credentials
sudo chmod 600 ~/.smb/credentials

echo "Backup fstab"
now=$(date +"%d-%m-%Y_%H.%M.%S")
sudo cp /etc/fstab /etc/fstab.$now

sudo mkdir -p /mnt/raijin
#sudo mkdir -p /media/prometheus

echo "//fujin/Raijin	/mnt/raijin    cifs comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/credentials,uid=1000	0	0" | sudo tee -a /etc/fstab

#echo "//saturn/Prometheus /media/prometheus    cifs comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/credentials,uid=1000	0	0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
