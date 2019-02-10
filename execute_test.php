<?php 
//recojer los datos del post enviados desde pruebas.php
$opciones_prueba=$_POST["opciones_test"];
print($opciones_prueba);	

// // se crea el archivo con el comando para enviar a otro pc
// $nombre_archivo = "content_test.sh"; 

// $mensaje = "sipp -s 600 -sn uac -d 1000 -m 3000 -timeout 60 -r 10 -i 192.168.0.20 192.168.0.20 -trace_screen";
// // abrir archivo y modificarlo
// $archivo = fopen($nombre_archivo, "a");
// fwrite($archivo, $mensaje. "\n");
// fclose($archivo);
// // enviar archivo
// echo shell_exec('# connect via scp
// spawn scp -o StrictHostKeyChecking=no "content_test.sh" pruebas@192.168.0.20:/home/pruebas
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

// // enviar el archivo al servidor sipp
// echo shell_exec("\nsudo sshpass -p 'pruebas' scp /var/www/html/telco/content_test.sh pruebas@192.168.0.20:/home/pruebas/");


//ejecutar el scrip que se encuentra en sipp desde el servidor actual
?>