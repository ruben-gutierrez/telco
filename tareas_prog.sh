#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#este archivo se ejecuta todos los dias a las 0 horas
php /var/www/html/telco/solicitud_asignacion.php
# este archivo debe ejecutarse cada 30s
php /var/www/html/telco/admin_info.php
