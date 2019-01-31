#/bin/sh

sudo cp nvidia.conf /etc/X11/mhwd.d/nvidia.conf
sudo mhwd-gpu --setmod nvidia --setxorg /etc/X11/mhwd.d/nvidia.conf
