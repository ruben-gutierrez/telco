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
          #curl -g -i -X POST http://$OS_IP_OPENSTACK/compute/v2.1/servers -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"server": {"name": "'$2'", "imageRef": "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "key_name": "demo", "flavorRef": "42", "max_count": 1, "min_count": 1, "networks": [{"uuid": "007f2f87-9e26-4c5f-9fd5-d824b9f811e1"}]}}' | python -m json.tool
           curl -s -H POST http://$OS_IP_OPENSTACK/compute/v2.1/servers -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"server": {"name": "'$2'", "imageRef": "'$3'", "key_name": "demo", "flavorRef": "'$4'", "max_count": 1, "min_count": 1, "networks": [{"uuid": "'$5'"}]}}' | python -m json.tool
          ;;
     *)
          echo "error"
          ;;
esac

# curl -g -i -X POST http://$OS_IP_OPENSTACK/compute/v2.1/servers -H "Accept: application/json" -H "Content-Type: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -H "X-OpenStack-Nova-API-Version: 2.1" -d '{"server": {"name": "ruben", "imageRef": "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "key_name": "demo", "flavorRef": "42", "max_count": 1, "min_count": 1, "networks": [{"uuid": "007f2f87-9e26-4c5f-9fd5-d824b9f811e1"}]}}'


# if [ $1 == 'consult' ]
# then
#     if [ $2 == 'networks']
#     then
#         especificRecuest=:9696/v2.0/networks
#     fi
#     curl -s -H GET http://$OS_IP_OPENSTACK$especificRecuest -H  "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" | python -mjson.tool 
# fi


# if [ $1 == 'network' ]
# then
#     curl -s -H POST http://$OS_IP_OPENSTACK:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "'$2'", "description":"'$3'","admin_state_up": true}}' | python -m json.tool
# fi

# if [ $1 == 'subnet' ]
# then
#     curl -g -i -X POST http://$OS_IP_OPENSTACK:9696/v2.0/subnets -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet": {"ip_version": 4, "network_id": "'$2'", "cidr": "'$3'/24", "name": "'$4'"}}'
# fi




# echo $subnet
# echo $respuesta | jq '.[]'
# id= $net | jq '.network.id'
# echo $id
# name_net=test1

#crear red
#openstack network create test5 --enable
# en cURL
# curl -s -H POST http://10.55.5.155:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "'$1'", "description":"'$2'","admin_state_up": true}}' | python -m json.tool
# curl -s -H POST http://10.55.5.155:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "chavis gay", "description":"chavis bien marica","admin_state_up": true}}' | python -m json.tool

#crear subred
#openstack subnet create test_subnet --network ruben2 --gateway 192.168.3.1 --subnet-range 192.168.3.0/24
# curl -s -X POST http://10.55.5.155:9696/v2.0/subnets -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet": {"ip_version": 4, "network_name": "test1", "cidr": "192.168.3.0/24", "gateway_ip": "192.168.3.1", "name": "test_subnet"}}'
# curl -g -i -X POST http://10.55.5.155:9696/v2.0/subnets -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet": {"ip_version": 4, "network_id": "'$id_net'", "cidr": "'$4'/24", "name": "'$2'"}}'







# curl -g -i -X GET http://10.55.5.155/compute/v2.1/flavors/detail?is_public=None -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $token)" -H "X-OpenStack-Nova-API-Version: 2.1"
# Quita el return carry de la respuesta obtenida
# echo $token | tr -d '[[:space:]]'

# con este comando se obtiene el token
# curl -v -s -X POST $OS_AUTH_URL/auth/tokens?nocatalog   -H "Content-Type: application/json"   -d '{ "auth": { "identity": { "methods": ["password"],"password": {"user": {"domain": {"name": "'"$OS_USER_DOMAIN_NAME"'"},"name": "'"$OS_USERNAME"'", "password": "'"$OS_PASSWORD"'"} } }, "scope": { "project": { "domain": { "name": "'"$OS_PROJECT_DOMAIN_NAME"'" }, "name":  "'"$OS_PROJECT_NAME"'" } } }}' | python -m json.tool

#estas lineas de comando es para crear un archivo con los comandos 

# # crea archivo con el comando que se ejecutará
# echo "#!/bin/bash ">testCurl.txt
# #consultar capacidades de maquinas virtuales --> "flavors"
# # printf "curl -g -i -X GET http://10.55.5.155/compute/v2.1/flavors/detail  ">>testCurl.txt
# # consultar instancias --> RESPONDE CON "servers"
# # printf "curl -s -H GET http://$OS_IP_OPENSTACK/compute/v2.1/servers/detail  ">>testCurl.txt
# # consultar dominios --> RESPONDE CON "domains"
# # printf "curl -s -H GET http://$OS_IP_OPENSTACK/identity/v3/domains  ">>testCurl.txt
# # consultar redes --> RESPONDE CON "networks"
# printf "curl -s -H GET http://$OS_IP_OPENSTACK:9696/v2.0/networks  ">>testCurl.txt



# # printf "  -H 'Accept: application/json'  " >>testCurl.txt
# # printf "  -H 'User-Agent: python-novaclient' " >>testCurl.txt
# printf "  -H 'X-Auth-Token: $(echo $token | tr -d '[[:space:]]')' " >>testCurl.txt
# # printf "  -H 'X-OpenStack-Nova-API-Version: 2.1' " >>testCurl.txt
# printf "  | python -mjson.tool " >>testCurl.txt
 
# # da permisos de ejecucion al archivo con el comando a ejecutar
# chmod 775 testCurl.txt
# # ejecuta el archivo con el comando y guarda el resultado en la variable
# flavors=$(./testCurl.txt)
# # Muestra el resultado
# echo $flavors
