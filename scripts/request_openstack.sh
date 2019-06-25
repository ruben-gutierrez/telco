#!/bin/bash
#DIRECCION IP DE OPENSTACK
OS_IP_OPENSTACK=10.55.5.155

# al ejecutar este script se obtiene el token el cual se almacena en la variable token
token=$(./scripts/createToken.sh)
# echo $token
# 
# request destination

# especificRecuest=:9696/v2.0/networks
# especificRecuest=/compute/v2.1/flavors/detail
# especificRecuest=/compute/v2.1/servers/detail

# curl -s -H GET http://$OS_IP_OPENSTACK$especificRecuest -H  "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" | python -mjson.tool 


# name_net=test1

#crear red
#openstack network create test5 --enable
# en cURL
curl -s -H POST http://10.55.5.155:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "'$1'", "description":"'$2'","admin_state_up": true}}' | python -m json.tool
# curl -s -H POST http://10.55.5.155:9696/v2.0/networks -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"network": {"name": "chavis gay", "description":"chavis bien marica","admin_state_up": true}}' | python -m json.tool

#crear subred
#openstack subnet create test_subnet --network test5 --gateway 192.168.3.1 --subnet-range 192.168.3.0/24
# curl -s -X POST http://10.55.5.155:9696/v2.0/subnets -H "Content-Type: application/json" -H "User-Agent: openstacksdk/0.31.0 keystoneauth1/3.14.0 python-requests/2.22.0 CPython/2.7.15+" -H "X-Auth-Token: $(echo $token | tr -d '[[:space:]]')" -d '{"subnet": {"ip_version": 4, "network_name": "test1", "cidr": "192.168.3.0/24", "gateway_ip": "192.168.3.1", "name": "test_subnet"}}'








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
