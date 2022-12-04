#/bin/sh

sudo pacman -S cifs-utils

echo "Samba user credentials"
read -p "Username:   " username
read -p "Password:   " password
	echo username="$username" >$HOME/.smb/credentials
	echo password="$password" >>$HOME/.smb/credentials
echo "$HOME/.smb/credentials:"
more $HOME/.smb/credentials
sudo chown root ~/.smb/credentials
sudo chmod 600 ~/.smb/credentials

echo "Backup fstab"
now=$(date +"%d-%m-%Y_%H.%M.%S")
sudo cp /etc/fstab /etc/fstab.$now

sudo mkdir -p /media/hyperion
sudo mkdir -p /media/prometheus

echo "//saturn/Hyperion	/media/hyperion    cifs comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/credentials,uid=1000	0	0" | sudo tee -a /etc/fstab

echo "//saturn/Prometheus /media/prometheus    cifs comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/credentials,uid=1000	0	0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
