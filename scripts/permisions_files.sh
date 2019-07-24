#Dar permisos a la clave ssh para las vm
chown www-data Testbed_vIMS.pem
#permiso para editar archivos del testbed
chown ruben -R /var/www/html/telco
#Permiso para que se srvidor pueda subir archivos
chown www-data -R /var/www/html/telco/rra
chown www-data -R /var/www/html/telco/log
chown www-data -R /var/www/html/telco/images
chown www-data -R /var/www/html/telco/files_XML