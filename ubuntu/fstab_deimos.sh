#/bin/sh

sudo apt install cifs-utils smbclient

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

sudo mkdir -p /media/altair
sudo mkdir -p /media/betelgeuse
sudo mkdir -p /media/deneb
sudo mkdir -p /media/downloads

echo "//phobos/altair		/media/altair			cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "//phobos/betelgeuse	/media/betelgeuse		cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "//phobos/deneb		/media/deneb			cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab
echo "//phobos/downloads	/media/downloads		cifs	comment=systemd.automount,iocharset=utf8,credentials=$HOME/.smb/smbcredentials,uid=1000	0	0" | sudo tee -a /etc/fstab

echo "Mount filesystems"
sudo mount -a
