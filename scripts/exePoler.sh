#!/bin/bash
/usr/bin/php7.2 /var/www/html/telco/solicitud_asignacion.php >> /var/www/html/telco/log/testbedims/log_testbedims.log
echo "otro saludo "  >> /var/www/html/telco/log/testbedims/log_testbedims.log
#php /var/www/html/telco/admin_info.php >> /var/www/html/telco/log/testbedims/log_testbedims.log
#php /var/www/html/telco/poller.php --force >> /var/www/html/telco/log/testbedims/log_testbedims.log
#sudo chown -R www-data rra/ log/ cache/ 
#sudo chmod -R 777 rra/ log/ cache/
