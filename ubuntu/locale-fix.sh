#!/bin/sh

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo update-locale LANGUAGE=en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
sudo dpkg-reconfigure locales
