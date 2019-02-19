<?php 
include('./include/global.php');

// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
if (!empty($_POST))
{
	// obtener vablabes a usar
	$accion= $_POST['post_accion'];	
	$to_email= $_POST['post_to_email'];
	$from_email= $_POST['post_from_email'];
	$arquitectura= $_POST['post_arquitectura'];
	$username= $_POST['post_username'];
	$ids= $_POST['post_ids'];
	$new_nom=$_POST['post_new_nom'];
	$new_dom=$_POST['post_new_dom'];

	$now = date_create()->format('Y-m-d H:i:s');

	switch ($accion) {
		case '1':
			agregar_solicitud($to_email,$from_email,$arquitectura,$username,$now);
			// dominio de arquitectura disponible
			//consulta si hay arquitecturas disponibles
			$dominio_libre=arq_disponible($arquitectura);

			if ($dominio_libre['id']=='') {
				echo "Lo sentimos, en este momento no hay arquitecturas disponibles. Se ha almacenado su solicitud pronto nos contataremos via e-mail.\n Gracias";
			}else{
				// Consulta si hay solicitud pendiente
				$id_solicitud_pendiente = solicitud_pendiente($arquitectura);
				if ($id_solicitud_pendiente == '') {
					echo "no hay solicitudes pendientes para la arquitectura " . $arquitectura;
				}else{
					asignar_arquitectura($id_solicitud_pendiente, $dominio_libre['dominio'], $from_email);
					//asignar la arqutiectura al usuario en la plataforma
					echo "Se ha asignado la arquitectura ". $arquitectura. "durante 7 dias.";
				}
			}
			break;

		case '2':
			liberar_arquitecturas($ids);
			break;
		case '3':
			agregar_arquitectura($new_nom, $new_dom);
			break;
		case '4':
			eliminar_arquitecturas($ids);
			break;
		
		default:
			# code...
			break;
	}
    
}else{
	$dominios_asignados= dominios_asignados();
	if (!empty($dominios_asignados)) {
		foreach ($dominios_asignados as $key => $dominio) {
			validar_asignacion($dominio,$to_email);
		}
	}
}






// 
// // Conectar manualmente y agregar el una solicitud a sql
//     $servername = "localhost";
//     $database = "cacti";
//     $username = "cacti";
//     $password = "mysqlcacti";

// // Create connection
// $conn = mysqli_connect($servername, $username, $password, $database);
// // Check connection
// if (!$conn) {
//       die("Connection failed: " . mysqli_connect_error());
// }
 
// echo "Connected successfully";
 
// $sql = "INSERT INTO solicitud_arq (fecha_solicitud, usuario, email, arquitectura) VALUES ('2019-01-19 20-50-20','Ruben','ruben@hotmail.com','aio')";
// if (mysqli_query($conn, $sql)) {
//       echo "New record created successfully";
// } else {
//       echo "Error: " . $sql . "<br>" . mysqli_error($conn);
// }
// mysqli_close($conn);



// conculta por celda, trae una celda en especifico
//$current_user = db_fetch_cell_prepared('SELECT username FROM user_auth WHERE id = ?', array($_SESSION['sess_user_id']));
// consulta por linea, trae una fila en especifico
//$current_user = db_fetch_row_prepared('SELECT username FROM user_auth WHERE id = ?', array($_SESSION['sess_user_id']));


