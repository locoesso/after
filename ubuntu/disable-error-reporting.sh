sudo service apport stop
echo "Change to enabled=0"
sleep 5
sudo nano /etc/default/apport
