#!/bin/sh

sudo mkdir -p /etc/X11/xorg.conf.d

echo "
Section "Device"
    Driver         "nvidia"
    Option         "UseEdidDpi" "False"
    Option         "DPI" "96 x 96"
    Option         "NoLogo" "True"
EndSection
" > /etc/X11/xorg.conf.d/20-nvidia.conf
