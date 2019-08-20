#Dar permisos a la clave ssh para las vm
chown www-data Testbed_vIMS.pem
#permiso para editar archivos del testbed
chown ruben -R /var/www/html/telco
#Permiso para que se srvidor pueda subir archivos

chown -R www-data rra/ log/ files_XML/ images/
chmod 777 -R rra/ log/ files_XML/ images/

#permiso para que el servidor pueda remover las claves ssh
# sudo chown www-data /home/ruben/.ssh/known_hosts

#permiso para script que remueva las claves ssh
chmod 775 /var/www/html/telco/scripts/terminal_testbed/remove_key_ssh.sh