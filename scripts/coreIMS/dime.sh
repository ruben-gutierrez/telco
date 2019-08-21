# #!/bin/bash

#EDITAR ARCHIVOS_RESOLV.CONF 

#VARIABLES IP

DNS_IP=$1
bono=$2
sprout=$3
ellis=$4
homer=$5
vellum=$6
dime=$7
ibcf=$8

echo "Configurar DNS"
cd /etc/
echo -e "nameserver $DNS_IP \nnameserver 8.8.8.8 \nnameserver 8.8.4.4" >> resolv.conf
cd ..
cd /etc/resolvconf/resolv.conf.d/
echo -e "nameserver $DNS_IP \nnameserver 8.8.8.8 \nnameserver 8.8.4.4" >> head
DNS_clearwater=/etc/resolv.conf
DNS_clearwater1=/etc/resolvconf/resolv.conf.d/head

#echo "Configurar DNS para nodos Clearwater con la siguiente configuración del DNS"
# cat DNS
# cat DNS >> $DNS_clearwater
# cat DNS >> $DNS_clearwater1
echo "Archivo resolv.conf (RUTA:/etc/resolv.conf)"
cat $DNS_clearwater
echo "Archivo head (RUTA:/etc/resolvconf/resolv.conf.d/head)"
cat $DNS_clearwater1
cd ..

#CREAR ARCHIVO clearwater.list
echo "Crear archivo clearwater.list"
cd /etc/apt/sources.list.d/
prueba_archivo='clearwater.list'
touch $prueba_archivo 
echo "deb http://repo.cw-ngv.com/stable binary/" > $prueba_archivo
echo "Archivo Clearwater list"
Ruta_clearwater_list=/etc/apt/sources.list.d/clearwater.list
cat $Ruta_clearwater_list
cd ..
cd /etc/

#COCATENAR ARCHIVO clearwater_list CON EL ARCHIVO clearwater.list
# #EN EL ARCHIVO clearwater_list esta la configuracion de APT software sources
# cat clearwater_list >> $prueba_archivo 
# echo "Mover archivo clearwater.list a la carpeta /etc/apt/sources.list.d/"
# clearwater_list=/etc/apt/sources.list.d/
# mv clearwater.list $clearwater_list


#Variable url, llave key
echo "Crear llaves clearwater"
url=http://repo.cw-ngv.com/repo_key
#OPCIONAL SI NO TIENE CURL
# #sudo apt-get install curl
curl -L ${url} | sudo apt-key add -
echo "Revisar llaves"
sudo apt-key finger


echo "Actualizar linux"
sudo apt-get update

#DESHABILITAT FIREWALL
echo "Deshabilitar firewall"
ufw disable
echo "Mirar estado firewall"
ufw status 

echo "Crear carpeta clearwater e ingresar a la carpeta creada /etc/clearwater"
mkdir clearwater
cd clearwater
echo "Crear archivo local_config"
touch local_config
echo -e 'local_ip='$dime '\npublic_ip='$dime '\npublic_hostname=dime \netcd_cluster="'$bono,$sprout,$ellis,$homer,$vellum,$dime'"'> local_config
cat /etc/clearwater/local_config

echo "Instalar paquetes nodo Dime"
sudo DEBIAN_FRONTEND=noninteractive apt-get install dime clearwater-prov-tools --yes
echo "Primer paquete instalado"
echo "Instalar segundo paquete"
sudo DEBIAN_FRONTEND=noninteractive apt-get install clearwater-management --yes
echo "Segundo paquete instalado"
cd ..
echo "Crear archivos de recuperación del núcleo Clearwater"
echo "Archivo Parar Procesos Clearwater"
parar_proc=/etc/parar_proc.sh
echo "Creando script para parar los servicios del núcleo IMS de clearwater. Ruta:/etc/parar_proc.sh"
echo "#!/bin/bash 
\n# -*- ENCODING: UTF-8 -*- 
\n\nsudo monit stop -g etcd 
\nsudo monit stop -g clearwater_cluster_manager 
\nsudo monit stop -g clearwater_config_manager
\nsudo monit stop -g clearwater_queue_manager
\nsudo touch /etc/clearwater/no_cluster_manager
\nsudo rm -rf  /var/lib/clearwater-etcd/*
\nsleep 3s
\necho 'Los servicios se pararon correctamente'" > $parar_proc
# cat parar_proc_IMS >> $parar_proc 
chmod 775 $parar_proc
chmod 777 $parar_proc

activar_proc=/etc/activar_nucleo.sh
echo "Creando script para activar los servicios del núcleo IMS de clearwater en /etc/activar_nucleo.sh"
# cat activar_nucleo_IMS >> $activar_proc 
echo "#!/bin/bash
\n# -*- ENCODING: UTF-8 -*-
\n#Nodo Vellum
\n#sudo /usr/share/clearwater/bin/run-in-signaling-namespace nodetool status

\n#Nodo Sprout
\n#sudo cw-validate_{shared|fallback}_ifcs_xml
\necho 'Restableciendo núcleo'
\nsleep 1s
\nsudo clearwater-etcdctl cluster-health
\nsleep 2s
\nsudo clearwater-etcdctl member list
\nsleep 2s
\nsudo /usr/share/clearwater/clearwater-config-manager/scripts/check_config_sync
\nsleep 2s
\nsudo monit monitor -g etcd
\nsudo monit monitor -g clearwater_config_manager
\nsudo monit monitor -g clearwater_queue_manager
\nsleep 2s
\nsudo monit summary
\n#sudo /usr/share/clearwater/clearwater-cluster-manager/scripts/load_from_chronos_cluster vellum
\n#sudo /usr/share/clearwater/clearwater-cluster-manager/scripts/load_from_memcached_cluster vellum
\n#sudo /usr/share/clearwater/clearwater-cluster-manager/scripts/load_from_cassandra_cluster vellum
\nsleep 2s
\nsudo /usr/share/clearwater/clearwater-cluster-manager/scripts/check_cluster_state
\nsleep 2s
\nsudo rm /etc/clearwater/no_cluster_manager
\nsudo monit monitor -g clearwater_cluster_manager
\nsleep 2s
\nsudo monit summary" > $activar_proc
chmod 775 $activar_proc
chmod 777 $parar_proc

echo "                                                       "
echo "************************************************************************************************************"
echo "************************************************************************************************************"
echo "                                  * * * * * * * * * * * * * * *                                             "
echo "                       Para ejecutar script de recuperación del núcleo IMS se debe:                         "
echo "************************************************************************************************************"
echo "************************************************************************************************************"
echo "1. Ingresar a la carpeta /etc/ y parar los servicios con el siguiente comando:"
echo "                                                       "
echo "    ./parar_proc.sh                  "
echo "                                                       "
echo "2. En la carpeta /etc/ activar los servicios con el siguiente comando:"
echo "                                                       "
echo "    ./activar_nucleo.sh               "
echo "                                                       "
echo "************************************************************************************************************"
echo "************************************************************************************************************"
echo "Una vez instalado el núcleo IMS de Clearwater, observar los servicios si estan OK con el siguiente comando:"
echo "                                                                                                             "
echo "                                   monit summary                                                             "
echo "                                                                                                             "
echo "************************************************************************************************************"
echo "************************************************************************************************************"   
