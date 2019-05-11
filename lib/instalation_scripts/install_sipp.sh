#!/bin/bash
# -*- ENCODING: UTF-8 -*-
# script para instalar el servidor sipp para la arquitectura clearwater, en un sistema operativo ubuntu 14server
#ejecutar como root


echo "deb http://repo.cw-ngv.com/stable binary/" >> /etc/apt/sources.list.d/clearwater.list
# # descargar las listas
curl -L http://repo.cw-ngv.com/repo_key | sudo apt-key add -
# verificar la clave
sudo apt-key finger
# actualizar
apt-get update

# #crear archivo local-config
mkdir /etc/clearwater
# obtener la direccion ip, se debe tener solo una interfaz activa de lo contrario no funcionara
ip=$(hostname -I)
# agregar contenido al archivo del nuclo local config
echo "local_ip="$ip > /etc/clearwater/local_config
# instalar programa sipp de la arquitectura clearwater

sudo apt-get -y install clearwater-sip-stress-coreonly 

sudo apt-get -y install clearwater-sip-stress