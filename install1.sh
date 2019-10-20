#!/bin/sh
#
pkg install -y pkg
pkg install -y wget
rehash
cd /etc
wget -N --no-check-certificate https://nednl.com/install/install2.sh
chmod 755 install2.sh
./install2.sh
