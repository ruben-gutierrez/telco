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
            ipfloat)
                especificRecuest=:9696/v2.0/floatingips
            ;;
            *)
                echo "error"
                # curl -g -i -X GET http://10.55.5.155:9696/v2.0/floatingips -H "Accept: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}c2b35efb3df4d7f1d998f3f0b17473fed0282df89b758289b035fd3394602876"
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
        #  curl -s -H DELETE http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2 -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1"
        curl -s -H DELETE http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2 -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token:  $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1"
          ;;
     create_flavor)
           curl -s -H  POST http://$OS_IP_OPENSTACK/compute/v2.1/flavors -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"flavor": {"vcpus": "'$2'", "disk": "'$3'", "name": "'$4'", "os-flavor-access:is_public": true, "rxtx_factor": 1.0, "OS-FLV-EXT-DATA:ephemeral": 0, "ram": "'$5'", "id": null, "swap": 0}}'| python -m json.tool
          ;;
    rezise_server)
        #  openstack --debug server resize --flavor <id_flavor> <id_server>
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"resize": {"flavorRef": "'$3'"}}'
           sleep 30
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"confirmResize": null}'
          ;;
    stop_server)
        #  openstack --debug server stop <id_server>
<<<<<<< HEAD
           curl s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2 -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-stop": null}'
          ;;
    start_server)
        #  openstack --debug server start <id_server>
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2 -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-start": null}'
=======
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-stop": null}'
          ;;
    start_server)
        #  openstack --debug server start <id_server>
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-start": null}'
>>>>>>> 1a67e44a09a849ec076a71ae22eb8a8570aa4a9d
          ;;
    pause_server)
        #  openstack --debug server pause <id_server>
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"pause": null}'
          ;;
    unpause_server)
        #  openstack --debug server unpause <id_server>
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"unpause": null}'
          ;;
     create_router)
    #  openstack router create router3
           curl -s -H POST http://$OS_IP_OPENSTACK:9696/v2.0/routers -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"router": {"name": "'$2'", "admin_state_up": true}}'
          ;;
     conect_router_netPublic)
            #  openstack --debug router set --external-gateway public router3
           curl -s -H PUT http://$OS_IP_OPENSTACK:9696/v2.0/routers/$2 -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"router": {"external_gateway_info": {"network_id": "'$3'"}}}'
          ;;
     conect_router_netPrivate)
            #  openstack --debug  router add subnet router3 test2
           curl -s -H PUT http://$OS_IP_OPENSTACK:9696/v2.0/routers/$2/add_router_interface -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet_id": "'$3'"}'
          ;;
     add_ipFloat_server)
            #  openstack server add floating ip <id_server> <ipFloat>
           curl -s -H PUT http://$OS_IP_OPENSTACK:9696/v2.0/routers/$2/add_router_interface -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet_id": "'$3'"}'
          ;;
     create_ipfloat)
            #  openstack --debug floating ip create <id_net_float>
           curl -s -H POST http://$OS_IP_OPENSTACK:9696/v2.0/floatingips -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"floatingip": {"floating_network_id": "'$2'"}}'
          ;;
     *)
          echo "error"
          ;;
esac