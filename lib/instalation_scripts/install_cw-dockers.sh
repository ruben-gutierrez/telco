#!/bin/bash
# -*- ENCODING: UTF-8 -*-
# script para instalar el  arquitectura clearwater-docker usando compose, en un sistema operativo ubuntu
#ejecutar como root

wget -qO- https://get.docker.com/ | sh

git clone --recursive https://github.com/Metaswitch/clearwater-docker.git
ip=$(ip route get 1.2.3.4 | awk '{print $7}')

echo "PUBLIC_IP="$ip > clearwater-docker/.env




sudo apt-get install python-pip -y

sudo pip install -U docker-compose

cd clearwater-docker

sudo docker build -t clearwater/base base

sudo docker-compose -f minimal-distributed.yaml up -d

# instalar el monitor de dockers
sudo curl -L git.io/scope -o /usr/local/bin/scope
sudo chmod a+x /usr/local/bin/scope
scope launch #lanza el monitor de dockers por ende se debe lanzar este comando siempre
