#!/bin/bash

#variable que contiene el token
#echo $OS_AUTH_TOKEN
#echo $OS_TOKEN
# con este comando se obtiene el token
# curl -v -s -X POST $OS_AUTH_URL/auth/tokens?nocatalog   -H "Content-Type: application/json"   -d '{ "auth": { "identity": { "methods": ["password"],"password": {"user": {"domain": {"name": "'"$OS_USER_DOMAIN_NAME"'"},"name": "'"$OS_USERNAME"'", "password": "'"$OS_PASSWORD"'"} } }, "scope": { "project": { "domain": { "name": "'"$OS_PROJECT_DOMAIN_NAME"'" }, "name":  "'"$OS_PROJECT_NAME"'" } } }}' | python -m json.tool


# al ejecutar este script se obtiene el token el cual se almacena en la variable token
token=$(./createToken.sh)

# Quita el return carry de la respuesta obtenida
# echo $token | tr -d '[[:space:]]'

# crea archivo con el comando que se ejecutará
echo "#!/bin/bash ">testCurl.txt
printf "curl -g -i -X GET http://10.55.5.155/compute/v2.1/flavors/detail?is_public=None  ">>testCurl.txt
printf "  -H 'Accept: application/json'  " >>testCurl.txt
printf "  -H 'User-Agent: python-novaclient' " >>testCurl.txt
printf "  -H 'X-Auth-Token: $(echo $token | tr -d '[[:space:]]')' " >>testCurl.txt
printf "  -H 'X-OpenStack-Nova-API-Version: 2.1' " >>testCurl.txt
 
# da permisos de ejecucion al archivo con el comando a ejecutar
chmod 775 testCurl.txt
# ejecuta el archivo con el comando y guarda el resultado en la variable
flavors=$(./testCurl.txt)
Muestra el resultado
echo $flavors





# curl -g -i -X GET http://10.55.5.155/compute/v2.1/flavors/detail?is_public=None -H "Accept: application/json" -H "User-Agent: python-novaclient" -H "X-Auth-Token: $token)" -H "X-OpenStack-Nova-API-Version: 2.1"





