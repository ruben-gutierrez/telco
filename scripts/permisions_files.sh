#Dar permisos a la clave ssh para las vm
chown www-data Testbed_vIMS.pem
#permiso para editar archivos del testbed
chown ruben -R /var/www/html/telco
#Permiso para que se srvidor pueda subir archivos
chown www-data -R /var/www/html/telco/rra
chown www-data -R /var/www/html/telco/log
chown www-data -R /var/www/html/telco/images
chown www-data -R /var/www/html/telco/files_XML

#permiso para que el servidor pueda remover las claves ssh
# sudo chown www-data /home/ruben/.ssh/known_hosts

#permiso para script que remueva las claves ssh
chmod 775 /var/www/html/telco/scripts/terminal_testbed/remove_key_ssh.sh