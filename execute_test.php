<?php 
//recojer los datos del post enviados desde pruebas.php
// $opciones_prueba=$_POST["opciones_test"];
// print($opciones_prueba);	
// se crea el archivo con el comando para enviar a otro pc
$nombre_archivo = "content_test.sh"; 

// $mensaje = "sipp -s 600 -sn uac -d 1000 -m 3000 -timeout 60 -r 10 -i 192.168.0.20 192.168.0.20 -trace_screen";
$mensaje = "import os";
// $mensaje = "\nname ='test'";
// $mensaje .= "\nos.system('mkdir %s')";
$mensaje .= "\nprint ('perrita')";

// $mensaje = "#!/bin/bash";
// $mensaje .= "\nrm -r chavis";
// $mensaje .= "\ncd /home/openstack/Descargas/";
// $mensaje .= "\nchmod 775 admin-openrc.sh";
// $mensaje .= "\nsshpass -p 'demo' source demo-openrc.sh";
// $mensaje .= "\n$MS=$(openstack server list |  awk '{for($i=0;i<=NF;i++){if($i=='192.168.50.237')print$(i-7)}}') && echo $MS";



// // abrir archivo y modificarlo

// $archivo = fopen($nombre_archivo, "a");//linea de codigo para agregar contenido al archivo
$archivo = fopen($nombre_archivo, "w+");//lina de codigo para reemplazar contenido
// fseek($nombre_archivo, 0);
fwrite($archivo, $mensaje. "\n");
fclose($archivo);
// enviar archivo
// echo shell_exec('scp -o StrictHostKeyChecking=no "content_test.sh" openstack@10.55.5.155:/home/oepnstack
// #######################
// expect {
//   -re ".*es.*o.*" {
//     exp_send "yes\r"
//     exp_continue
//   }
//   -re ".*sword.*" {
//     exp_send "pruebas\r"
//   }
// }');


// echo shell_exec("ssh openstack@10.55.5.155 rm content_test.sh");
// enviar el archivo al servidor sipp
// echo shell_exec("scp /var/www/html/telco/content_test.sh openstack@10.55.5.155:/home/openstack");
echo shell_exec("scp /var/www/html/telco/content_test.sh openstack@10.55.5.155:/home/openstack");
//Dar permisos de ejecucion
// echo shell_exec("ssh openstack@10.55.5.155 rm contenttest.sh");
// Ejecutar el archivo en el servidor de openstack
echo shell_exec("ssh openstack@10.55.5.155 cp content_test.sh content_test.py");
echo shell_exec("ssh openstack@10.55.5.155 python3 content_test.py");

//ejecutar el scrip que se encuentra en sipp desde el servidor actual
?>

