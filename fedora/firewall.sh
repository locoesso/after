sudo firewall-cmd --permanent --zone=FedoraServer --add-service=synergy
sudo firewall-cmd --permanent --zone=FedoraServer --add-service=dropbox-lansync
sudo firewall-cmd --permanent --zone=FedoraServer --add-service=transmission-client

#ark-server
sudo firewall-cmd --zone=FedoraServer --add-port=7777/udp --permanent
sudo firewall-cmd --zone=FedoraServer --add-port=7778/udp --permanent
sudo firewall-cmd --zone=FedoraServer --add-port=27015/udp --permanent
sudo firewall-cmd --zone=FedoraServer --add-port=32330/tcp --permanent

#transmission-remote
sudo firewall-cmd --zone=FedoraServer --add-port=9091/tcp --permanent

sudo firewall-cmd --reload
sudo firewall-cmd --list-all

docker run -d -p 7778:7778 -p 7778:7778/udp -p 27015:27015 -p 27015:27015/udp -e SESSIONNAME=phobos -e ADMINPASSWORD="perse78" --name ark turzam/ark