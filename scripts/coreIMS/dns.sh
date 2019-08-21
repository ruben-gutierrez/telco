#!/bin/bash
echo "Instalación DNS comando: apt-get install bind9"
apt-get install bind9 --yes

echo "Crear Zona DNS"
cd /etc/bind/
touch telco2.dnszones
DNS_ZONES=/etc/bind/telco2.dnszones
echo "Configurando DNS ZONES"
echo '$TTL 5m ; Default TTL

; SOA, NS and A record for DNS server itself
@                 3600 IN SOA  testbed1.unicauca.edu.co. root.testbed1.unicauca.edu.co. ( 2014010800 ; Ser$
                                          3600       ; Refresh
                                          3600       ; Retry
                                          3600       ; Expire
                                          300 )      ; Minimum TTL
@                 3600 IN NS   testbed4.unicauca.edu.co.
;@                 3600 IN A     10.55.5.52; IPv4 address of BIND server


bono                    IN A  192.168.1.11
nodo-bono               IN A  192.168.1.11
@                       IN A  192.168.1.11

@                      IN NAPTR 1 1 "S" "SIP+D2T" "" _sip._tcp
_sip._tcp              IN SRV   0 0 5060 bono


sprout                 IN A  192.168.1.12
sprout-1               IN A  192.168.1.12
scscf.sprout           IN A  192.168.1.12


sprout                 IN NAPTR 1 1 "S" "SIP+D2T" "" _sip._tcp.sprout
_sip._tcp.sprout       IN SRV   0 0 5054 sprout
scscf.sprout           IN NAPTR 1 1 "S" "SIP+D2T" "" _sip._tcp.scscf.sprout
_sip._tcp.scscf.sprout IN SRV   0 0 5054 sprout


icscf.sprout            IN A    192.168.1.12
_sip._tcp.icscf.sprout IN SRV   0 0 5052 sprout


dime                   IN A   192.168.1.16
dime-1                 IN A   192.168.1.16

hs                     IN A   192.168.1.16
ralf                   IN A   192.168.1.16


homer                  IN A     192.168.1.14
homer-1                IN A     192.168.1.14
vellum                 IN A     192.168.1.15
vellum-1               IN A     192.168.1.15
ellis                  IN A     192.168.1.13
ellis-1                IN A     192.168.1.13
ibcf                   IN A     192.168.1.17 ' > $DNS_ZONES
#cat $DNS_ZONES

echo "Configurar archivo name.conf.local"
DNS_ZONES1=/etc/bind/named.conf.local
echo "Configurando DNS ZONES"

echo 'zone "testbed1.unicauca.edu.co" IN {
        type master; file "/etc/bind/telco2.dnszones";
        };' >> $DNS_ZONES1

#cat $DNS_ZONES1 


echo "Archivos configurados ZONA TELCO 2"
cat $DNS_ZONES1
echo "Archivos configurados archivo name.conf.local"
cat $DNS_ZONES

echo "Reiniciar servicios DNS comando: /etc/init.d/bind9 restart"
/etc/init.d/bind9 restart

# Instalar shellinbox

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
