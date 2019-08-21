# #!/bin/bash
bash -c '{ echo "#!/bin/bash" ; \
echo "set -e" ; \
echo "mkdir /home/ubuntu/install"; \
echo "install_repo=http://repo.cw-ngv.com/stable # filled in by make_ovf.sh" ; \
echo "updates_repo=http://repo.cw-ngv.com/stable # filled in by make_ovf.sh" ; \
echo "curl -L https://raw.githubusercontent.com/Metaswitch/clearwater-infrastructure/master/scripts/clearwater-aio-install.sh | sudo bash -s clearwater-auto-config-generic $install_repo $updates_repo >/home/ubuntu/install/install.log 2>&1" ; \
echo "mv /etc/rc2.d/S99zclearwater-aio-first-boot /home/ubuntu/install/" ; \
echo "poweroff" ; } > /etc/rc2.d/S99zclearwater-aio-first-boot ; \
chmod a+x /etc/rc2.d/S99zclearwater-aio-first-boot'


#Ejecutar Comando
/etc/rc2.d/S99zclearwater-aio-first-boot

if [ ! -f "/etc/default/shellinabox" ]; then
    sudo apt-get update;
    sudo apt-get -y install openssl shellinabox;
    sudo useradd usuario
    echo usuario:usuario | chpasswd 
    sudo sed -i '$a usuario    ALL=(ALL:ALL) ALL' /etc/sudoers
fi
echo "Should shellinaboxd start automatically" > /etc/default/shellinabox;
echo "SHELLINABOX_DAEMON_START=1" >> /etc/default/shellinabox;
echo "SHELLINABOX_PORT=7676" >> /etc/default/shellinabox;
echo "SHELLINABOX_ARGS='--no-beep --disable-ssl'" >> /etc/default/shellinabox;
sudo killall shellinaboxd
sudo service shellinabox start
