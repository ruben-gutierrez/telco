#!/bin/bash

echo "local_ip= $1 ">local_config
echo "public_ip= $2">>local_config
echo "hostname = $3">>local_config
echo "etcd= '$4 , $5, $6'">>local_config

