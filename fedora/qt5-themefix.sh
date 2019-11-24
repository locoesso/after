#!/bin/sh

sudo echo "QT_QPA_PLATFORMTHEME=qt5ct >>/etc/environment"
sudo dnf install qt5ct qt5-qtstyleplugins
