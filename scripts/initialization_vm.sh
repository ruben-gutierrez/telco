#!/bin/bash

ssh-keygen -f "/root/.ssh/known_hosts" -R $1
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 "sudo useradd usuario"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 'echo "usuario:usuario" | sudo chpasswd'
a='$a'
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 "sudo sed -i '$a usuario    ALL=(ALL:ALL) ALL' /etc/sudoers"

#ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 "sudo apt-get update"
#ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 "sudo apt-get -y install openssl;"
#ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/terminal_testbed/key.pem ubuntu@$1 "sudo apt-get -y install shellinabox"

