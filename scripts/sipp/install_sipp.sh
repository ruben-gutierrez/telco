#!/bin/bash  
repo="deb http://repo.cw-ngv.com/stable binary/" 
echo $repo >/etc/apt/sources.list.d/clearwater.list  
curl -L http://repo.cw-ngv.com/repo_key | sudo apt-key add - 
sudo apt-key -y finger  
sudo apt-get -y update 
mkdir /etc/clearwater 
ip=`hostname -I` 
local="local_ip=$ip" 
echo $local>/etc/clearwater/local_config  
home_domain="home_domain= $1" 
echo $home_domain>/etc/clearwater/shared_config  
sudo apt-get -y install clearwater-sip-stress  
sudo apt-get -y install clearwater-sip-stress-coreonly