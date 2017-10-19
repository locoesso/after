#! /bin/bash
echo
echo "Change 1 to 0"
sleep 5
sudo nano /etc/default/avahi-daemon
echo 
echo Change
echo "start on (filesystem and started dbus)" to
echo "start on never and filesystem and started dbus)"
sleep 5
sudo nano /etc/init/avahi-daemon.conf
