<?php 
include('./include/global.php');

// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
if (!empty($_POST))
{
	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];


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
			$arq_libre=db_execute("UPDATE arqs_testbedims SET activo='F', usuario='libre' WHERE id='" . $id . "'");
			echo($arq_libre);
			break;
		case '3'://agregar arquitectura
			// verificar si existe el archivo
			if (file_exists('images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
				if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
					$new_name = $now . $_FILES['image']['name'];
					rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );

					$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','F','libre', '".$_POST['desc_arq']."','".$new_name."')";
					$agregar=db_execute($sql);
					if ( $agregar == '1') {
						$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
						echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $new_name));
						//verificar si la arquitectura esta en funcionamiento
					}

				}else{
					echo('upload fallo');
				}
					
			}else{
				if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
						$up2=db_execute("UPDATE arqs_testbedims SET imagen='".$_FILES['image']['name']."' WHERE id='" . $id_arq . "'");
					}else{
						echo('upload fallo');
					}
					$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','F','libre', '".$_POST['desc_arq']."','".$_FILES['image']['name']."')";
					$agregar=db_execute($sql);
					if ( $agregar == '1') {
						$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
						echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $_FILES['image']['name']));
						//verificar si la arquitectura esta en funcionamiento
					}
			}
			

			
			break;
		case '4'://eliminar arquitectura
			$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
			$eliminar=db_execute("DELETE FROM arqs_testbedims WHERE id='".$id."'");
			if ( $eliminar == '1') {				
				unlink('images/images_testbed/images_ims/'.$file_name);
			}
			echo($eliminar);
			break;
		
		case '5': //modificar arqutiectura
			$error=0;

			$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
			if ($_FILES['image']['name'] == '') {
				$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', activo='F', usuario ='libre', descripcion='".$_POST['desc_arq']."' WHERE id='" . $id . "'");
			}else{
				
				
				if (file_exists('images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
						$new_name = $now . $_FILES['image']['name'];
						rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );
						$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', activo='F', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$new_name."' WHERE id='" . $id . "'");
					}
				
				}else{
					$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', activo='F', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$_FILES['image']['name']."' WHERE id='" . $id . "'");
				if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
						$up2=db_execute("UPDATE arqs_testbedims SET imagen='".$_FILES['image']['name']."' WHERE id='" . $id . "'");
					}else{
						echo($error++);
					}
				}
			}
			if ( $up == '1') {

				echo("<tr id='line".$id."'>
			 		<td>".$_POST['name_arq']."</td>
			 		<td>".$_POST['dominio_arq']."</td>
			 		<td class='edisplay'>".$_POST['desc_arq']."</td>
			 		<td class='edisplay'>".$file_name."</td>
			 		<td>libre</td>
			 		<td><button class='btn_arq_action' id='btn_liberar".$id."' name='liberar' style='background:green;'> <i class='fa fa-unlock fa-lg'></i></button><button class='btn_arq_action' id='btn_editar".$id."'name='editar' style='background:blue;'> <i class='fa fa-edit fa-lg'></i></button><button class='btn_arq_action' id='btn_eliminar".$id."' name='eliminar' style='background:red;'> <i class='fa fa-trash fa-lg'></i></button></td></tr>");
				

			}else{
				echo($error++);
			}
			
		
			break;
		case '6':


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

function return_file_arq($id,$nombre,$dominio,$descipcion, $imagen){
	$line="<tr id='line".$id."'><td>".$nombre."</td>
				<td>".$dominio."</td>
				<td class='edisplay'>".$descipcion."</td>
				<td class='edisplay'>".$imagen."</td>
				<td>libre</td>
				<td><button class='btn_arq_action' id='btn_liberar".$id."' name='liberar' style='background:green;'> <i class='fa fa-unlock fa-lg'></i></button><button class='btn_arq_action' id='btn_editar".$id."'name='editar' style='background:blue;'> <i class='fa fa-edit fa-lg'></i></button><button class='btn_arq_action' id='btn_eliminar".$id."' name='eliminar' style='background:red;'> <i class='fa fa-trash fa-lg'></i></button></td></tr>";
	return $line;
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


