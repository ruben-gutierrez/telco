#!/bin/bash
a='$a'
# ssh-keygen -f "/home/ruben/.ssh/known_hosts" -R "$1"
ssh-keygen -f "/root/.ssh/known_hosts" -R $1

sudo chmod 700 /var/www/html/telco/scripts/Testbed_vIMS.pem
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo useradd usuario"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo useradd usuario"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 'echo "usuario:usuario" | sudo chpasswd'
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i '$a usuario    ALL=(ALL:ALL) ALL' /etc/sudoers"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo apt-get -y install snmp snmpd snmp-mibs-downloader"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i 's/agentAddress  udp:127.0.0.1:161/#agentAddress  udp:127.0.0.1:161/g' /etc/snmp/snmpd.conf"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i '$a agentAddress udp:161,udp6:[::1]:161' /etc/snmp/snmpd.conf"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo service snmpd restart"

sudo chmod 775 /var/www/html/telco/scripts/Testbed_vIMS.pem
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo useradd usuario"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo useradd usuario"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 'echo "usuario:usuario" | sudo chpasswd'
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i '$a usuario    ALL=(ALL:ALL) ALL' /etc/sudoers"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo apt-get -y install snmp snmpd snmp-mibs-downloader"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i 's/agentAddress  udp:127.0.0.1:161/#agentAddress  udp:127.0.0.1:161/g' /etc/snmp/snmpd.conf"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo sed -i '$a agentAddress udp:161,udp6:[::1]:161' /etc/snmp/snmpd.conf"
ssh -o "StrictHostKeyChecking no" -i /var/www/html/telco/scripts/Testbed_vIMS.pem ubuntu@$1 "sudo service snmpd restart"
