#!/bin/bash


if [ ! -f "/etc/default/shellinabox" ]; then
    sudo apt-get update;
    sudo apt-get -y install openssl shellinabox;
    sudo useradd usuario
    echo usuario:usuario | chpasswd 
    sudo sed -i '$a usuario    ALL=(ALL:ALL) ALL' /etc/sudoers
fi
echo "Should shellinaboxd start automatically" > /etc/default/shellinabox
echo "SHELLINABOX_DAEMON_START=1" >> /etc/default/shellinabox
echo "SHELLINABOX_PORT=7676" >> /etc/default/shellinabox
echo "SHELLINABOX_ARGS='--no-beep --disable-ssl'" >> /etc/default/shellinabox

