<?php 
include('./include/global.php');


// obtener vablabes a usar
$accion=$_POST['post_accion'];
$to_email= $_POST['post_to_email'];
$from_email= $_POST['post_from_email'];
$arquitectura= $_POST['post_arquitectura'];
$username= $_POST['post_username'];
$now = date_create()->format('Y-m-d H:i:s');

//si $accion tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//si accion no tiene valor (es decir el arcivo se ejecuto desde el crontab )se revisa si se termino una asignacion, se revisa si hay arq dispobinible y se asigna solicitud.


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
				asignar_arquitectura($id_solicitud_pendiente, $dominio_libre['dominio'], $dominio_libre['id']);
				echo "Se ha asignado la arquitectura ". $arquitectura. "durante 7 dias.";
			}
		}
		break;
	case '2':
	// asignar arquitectura
		// asignar_arquitectura($id_solicitud_libre, $arquitectura);
		break;
	case '3':
	//busca un registro donde el tiempo de asignacion se ha terminado, luego desahibilita o reasigna la arquitectura.
		//consulta de registro donde la fecha_fin_asignacion se haya terminado.
		//busca consulta por solicitud pendiente
		//llama asignar arquitectura()
	//busca un registro donde falte un dia para terminar la asignacion y manda un correo avisando.
	break;
	
	default:
		# code...
		break;
}
//consultar si hay arquitectura disponible
//parametro: $arq-> nombre de la arquitectura a consultar
//RETURN-> dominio
function arq_disponible($arq){
	$dominio_id = db_fetch_row_prepared("SELECT id, dominio from arqs_testbedims WHERE activo = 'F' AND arquitectura = '" . $arq . "' limit 1");
	return $dominio_id;
}
// agregar solicitud a la tabla solicitud_arq
function agregar_solicitud($to_email,$from_email,$arquitectura,$username,$now){
		$sql = "INSERT INTO solicitud_arq (fecha_solicitud, usuario, email, arquitectura) VALUES ('".$now."','".$username."','".$from_email."','".$arquitectura."')";
		$agregar=db_execute($sql);
		//db_execute retorna 1 si es exitosa la peticion y cero si falla
}


//busca una arquitectura que termine su asignacion 
function fin_asignacion(){

}

//asigna la arquitectura 
function asignar_arquitectura($id_solicitud, $dominio_arq, $id_arq){	
	$actual_datetime=date_create()->format('Y-m-d H:i:s');
	$final_datetime=date('Y-m-d H:i:s',strtotime($actual_datetime."+ 7 days")); 
	$sql2 = "UPDATE solicitud_arq SET fecha_asignacion='" . $actual_datetime . "', dominio='" .$dominio_arq . "', fecha_fin_asignacion='" . $final_datetime . "' WHERE id='" . $id_solicitud . "'";
	$asignar_arq=db_execute($sql2);
	// marcar la arqutiectura como inactiva
	echo $id;
	$sql3 = "UPDATE arqs_testbedims SET activo='V' WHERE id='" . $id_arq . "'";
	$update_arqs=db_execute($sql3);
	echo $update_arqs;
	// return $asignar_arq;
}

function solicitud_pendiente($arq){
	$id_solicitud_libre = db_fetch_cell_prepared("SELECT id from solicitud_arq WHERE fecha_asignacion IS NULL AND arquitectura = '" . $arq . "' limit 1");
	return $id_solicitud_libre;
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


