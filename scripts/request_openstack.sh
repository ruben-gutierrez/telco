#!/bin/bash
#DIRECCION IP DE OPENSTACK
OS_IP_OPENSTACK=10.55.5.155

# Obtener el token
token=$(./scripts/createToken.sh)
# token=$(./createToken.sh)
# echo $token

# request destination

# 
# especificRecuest=/compute/v2.1/flavors/detail
# especificRecuest=/compute/v2.1/servers/detail
# curl -s -H GET http://$OS_IP_OPENSTACK$especificRecuest -H  "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" | python -mjson.tool 

case $1 in
     consult)
        case $2 in
            flavor)
                especificRecuest=/compute/v2.1/flavors/detail
            ;;
            networks)
                especificRecuest=:9696/v2.0/networks
            ;;
            images)
                especificRecuest=/image/v2/images
            ;;
            servers)
                especificRecuest=/compute/v2.1/servers/detail
            ;;
            subnets)
                especificRecuest=:9696/v2.0/subnets
            ;;
            *)
                echo "error"
            ;;
        esac
            # curl -g -i -X GET http://10.55.5.155:9696/v2.0/subnets -H "Accept: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')"
            curl -s -H GET http://$OS_IP_OPENSTACK$especificRecuest -H  "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" | python -mjson.tool 
          ;;
     create_network)
          curl -s -H POST http://$OS_IP_OPENSTACK:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "'$2'", "description":"'$3'","admin_state_up": true}}' | python -m json.tool
          ;;
     delete_network)
            #openstack --debug network delete <name_net>
          curl -g -i -X DELETE http://$OS_IP_OPENSTACK:9696/v2.0/networks/$2 -H "Accept: " -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')"
          ;;
     subnet)
          curl -g -i -X POST http://$OS_IP_OPENSTACK:9696/v2.0/subnets -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet": {"ip_version": 4, "network_id": "'$2'", "cidr": "'$3'/24", "name": "'$4'"}}'
          ;; 
     create_vm)
        #   curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"server": {"name": "'$2'", "imageRef": "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "key_name": "demo", "flavorRef": "42", "max_count": 1, "min_count": 1, "networks": [{"uuid": "5eae8c15-476a-4b53-9c6e-107fb1b35f8e"}]}}' | python -m json.tool
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"server": {"name": "'$2'", "imageRef": "'$3'", "key_name": "demo", "flavorRef": "'$4'", "max_count": 1, "min_count": 1, "networks": [{"uuid": "'$5'"}]}}' | python -m json.tool
          ;;
    delete_vm)
         curl -g -i -X DELETE http://10.55.5.155/compute/v2.1/servers/b984181a-8437-4434-8c01-f76334443fc1 -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}50d3f742eddd5fd73aea82c581c4e1b22f2eaf6ebbc51dca175b18a0a1bb5a54" -H "X-OpenStack-Nova-API-Version: 2.1"

          ;;
     create_flavor)
           curl -s -H  POST http://$OS_IP_OPENSTACK/compute/v2.1/flavors -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"flavor": {"vcpus": "'$2'", "disk": "'$3'", "name": "'$4'", "os-flavor-access:is_public": true, "rxtx_factor": 1.0, "OS-FLV-EXT-DATA:ephemeral": 0, "ram": "'$5'", "id": null, "swap": 0}}'| python -m json.tool
          ;;
     change_flavor)
        #  openstack server resize --flavor --confirm <name flavor> 
           
          ;;
     *)
          echo "error"
          ;;
esac