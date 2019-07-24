#!/bin/bash
sudo apt-get update
sudo apt-get install openssl shellinabox
sudo vim /etc/default/shellinabox
rm /etc/default/shellinabox
echo 'Should shellinaboxd start automatically
SHELLINABOX_DAEMON_START=1                                                                                                                           
                                                                                                                                                     
# TCP port that shellinboxds webserver listens on
SHELLINABOX_PORT=7676                                                                                                                                
                                                                                                                                                     
# Parameters that are managed by the system and usually should not need
# changing:
# SHELLINABOX_DATADIR=/var/lib/shellinabox
# SHELLINABOX_USER=shellinabox
# SHELLINABOX_GROUP=shellinabox
                                                                                                                                                     
# Any optional arguments (e.g. extra service definitions).  Make sure
# that that argument is quoted.
#
#   Beeps are disabled because of reports of the VLC plugin crashing
#   Firefox on Linux/x86_64.
SHELLINABOX_ARGS="--no-beep --disable-ssl"' > /etc/default/shellinabox

sudo service shellinabox restart

