#/bin/sh

sudo apt install cifs-utils smbclient

echo "Samba user credentials"
read -p "Username:   " username
read -p "Password:   " password
	sudo echo username="$username" >$HOME/.smbcredentials
	sudo echo password="$password" >>$HOME/.smbcredentials
echo "$HOME/.smbcredentials:"
more $HOME/.smbcredentials
sudo chown root ~/.smbcredentials
sudo chmod 600 ~/.smbcredentials

now=$(date +"%d-%m-%Y_%H.%M.%S")
sudo cp /etc/fstab /etc/fstab.$now

sudo mkdir -p /media/altair
sudo mkdir -p /media/betelgeuse

echo "//phobos/altair		/media/altair			cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "//phobos/betelgeuse	/media/betelgeuse		cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
