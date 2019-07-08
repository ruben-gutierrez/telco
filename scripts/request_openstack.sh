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
         curl -s -H DELETE http://$OS_IP_OPENSTACK/compute/v2.1/servers/$2 -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1"

          ;;
     create_flavor)
           curl -s -H  POST http://$OS_IP_OPENSTACK/compute/v2.1/flavors -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"flavor": {"vcpus": "'$2'", "disk": "'$3'", "name": "'$4'", "os-flavor-access:is_public": true, "rxtx_factor": 1.0, "OS-FLV-EXT-DATA:ephemeral": 0, "ram": "'$5'", "id": null, "swap": 0}}'| python -m json.tool
          ;;
    rezise_server)
        #  openstack --debug server resize --flavor <id_flavor> <id_server>
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}a172b63d7eb23453cc2d7d7030499c514fc1d9b5ca91c6953fa36de1432719d7" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"resize": {"flavorRef": "6146d540-20fb-4721-8e62-857393daed5c"}}'
           sleep 30
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}4ea26fc2b3c8a6877778ee18daf492217792e7487583993467cbd5d5126762b5" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"confirmResize": null}'
          ;;
    stop_server)
        #  openstack --debug server stop <id_server>
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}ff380c6150324d41139f6af690be550c56ef02dc29ce7a6f18f70baf82f0ef43" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-stop": null}'
          ;;
    start_server)
        #  openstack --debug server start <id_server>
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}c54ddf71473ec39a3361a90e8d4dcd732a1ba40c6c6cd5d4b1a32cba450c5785" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"os-start": null}'
          ;;
    pause_server)
        #  openstack --debug server pause <id_server>
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}92dfbcdf8e91bd5878663f52bf10c91b885824e04584a2c7c623e40fc82d4038" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"pause": null}'
          ;;
    unpause_server)
        #  openstack --debug server unpause <id_server>
           curl -g -i -X POST http://10.55.5.155/compute/v2.1/servers/f86f1533-0793-4e81-84b3-5264b530f7d1/action -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: {SHA256}e18a3491bb638ee8a282cd465d1694803ee309b8a71023703d55cc0e707b094e" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"unpause": null}'
          ;;
     create_router)
    #  openstack router create router3
           curl -g -i -X POST http://10.55.5.155:9696/v2.0/routers -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}5da84c3afab55868856ed3f127b25685b04d38816895620f94a537f94337bb3a" -d '{"router": {"name": "router2", "admin_state_up": true}}'
          ;;
     conect_router_netPublic)
            #  openstack --debug router set --external-gateway public router3
           curl -g -i -X PUT http://10.55.5.155:9696/v2.0/routers/4e624b6f-661d-466f-9311-b0c6ca3a951d -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}84e8e5cf252b969f5bdb8c4b5798ad86cae936ab81a62faa051f5d9f64c921de" -d '{"router": {"external_gateway_info": {"network_id": "badd953d-4495-47ea-a6c0-c4f8cc4190c9"}}}'
          ;;
     conect_router_netPrivate)
            #  openstack --debug  router add subnet router3 test2
           curl -g -i -X PUT http://10.55.5.155:9696/v2.0/routers/4e624b6f-661d-466f-9311-b0c6ca3a951d/add_router_interface -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}3fa280910416f379136c5cd64da225b7e1c226e0e52a4bea136f971700e9d249" -d '{"subnet_id": "056ee9b7-d388-459a-a50d-d99b7fd6d82b"}'
          ;;
     add_ipFloat_server)
            #  openstack server add floating ip <id_server> <ipFloat>
           curl -g -i -X PUT http://10.55.5.155:9696/v2.0/routers/4e624b6f-661d-466f-9311-b0c6ca3a951d/add_router_interface -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}3fa280910416f379136c5cd64da225b7e1c226e0e52a4bea136f971700e9d249" -d '{"subnet_id": "056ee9b7-d388-459a-a50d-d99b7fd6d82b"}'
          ;;
     create_ipfloat)
            #  openstack --debug floating ip create <id_net_float>
           curl -g -i -X POST http://10.55.5.155:9696/v2.0/floatingips -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: {SHA256}ef3d2bcc305d3a89f96a20dd5ce1056dc1956ef7c46ba001ccbdc5ea316d6680" -d '{"floatingip": {"floating_network_id": "badd953d-4495-47ea-a6c0-c4f8cc4190c9"}}'
          ;;
     *)
          echo "error"
          ;;
esac