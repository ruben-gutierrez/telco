#!/bin/bash 
# Crear un numero (PrefixCorreo) de usuarios  con usuario, correo y contraseña en archivo csv
#crea un archivo users.csv en la misma ruta de este archivo
userName=$1
numbreUsers=$2
PrefixCorreo=$3
password=$4
echo "1$userName,1$PrefixCorreo@test.com,$password">users.csv
for i in $(seq 2 $numbreUsers);
do
   echo "$i$userName,$i$PrefixCorreo@test.com,$password">>users.csv
done


while IFS=, read col1 col2 col3
do
    username=${col1}
    useremail=${col2}
    pass=${col3}
    ../cli/new_user.php $username $useremail $pass
done < users.csv
