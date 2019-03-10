<?php 
global $current_user;

include('./include/global.php');
// include('./include/auth.php');


// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//

if (!empty($_POST)) {
	


	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];

	$now = date_create()->format('Y-m-d H:i:s');
	$days=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'");
	// Explain table testbed
	// id  |  arquitectura | dominio | activo | usuario descripcion | imagen
	// en esta tabla arquitectura es el nombre de la arquitectura, domini es la ip o nombre en el dns, activo hace referencia a la verificacion mediante ping de que esta funcionanado de lo contrario no se tomara en cuenta para la asignacion , usuario si este campo es diferente de libre entonces esta ocupado y las arquitecturas que tienen libre en este campo se pueden asignar
	switch ($accion) { 

		case "1"://guardar solicitud y asignarla si hay arq disponible
			$num_arq_to_user=sizeof(arq_asignadas_to_user($current_user['email_address']));
			$arq_permit=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='1'");
			agregar_solicitud($_POST['post_to_email'],$_POST['post_from_email'],$_POST['post_arquitectura'],$_POST['post_username'],$now);
			// dominio de arquitectura disponible
			//consulta si hay arquitecturas disponibles
			$dominio_libre=arq_disponible($_POST['post_arquitectura']);
			

			if ($dominio_libre['id']=='') {
				echo "Lo sentimos, en este momento no hay arquitecturas disponibles. Se ha almacenado su solicitud pronto nos contataremos via e-mail.\n Gracias";
			}else{
				// Consulta si hay solicitud pendiente
				$id_solicitud_pendiente = solicitud_pendiente($_POST['post_arquitectura']);
				if ($id_solicitud_pendiente['id'] == '') {
					echo "no hay solicitudes pendientes para la arquitectura " . $_POST['post_arquitectura'];
				}else{
					if ($num_arq_to_user < $arq_permit) {
						asignar_arquitectura($id_solicitud_pendiente['id'] , $dominio_libre['dominio'], $_POST['post_from_email']);
						//asignar la arqutiectura al usuario en la plataforma
						echo "Se ha asignado la arquitectura ". $_POST['post_arquitectura'] . "durante ".$days." dias.";
					}else{
						echo ("Puede reservar maximo ". $arq_permit ."arquitecturas en el testbed IMS");
					}
					
				}
			}
			break;

		case "2"://liberar arquitectura
			$arq_libre=db_execute("UPDATE arqs_testbedims SET  usuario='libre' WHERE id='" . $id . "'");
			$dom_asig = db_fetch_cell_prepared("SELECT dominio from arqs_testbedims  WHERE id ='" . $id . "'");
			$mod_table_solicitud=db_execute("UPDATE solicitud_arq SET fecha_fin_asignacion =NOW() WHERE dominio='" . $dom_asig . "' ORDER BY id DESC LIMIT 1");
			echo($arq_libre);
			break;
		case "3"://agregar arquitectura
			//verificar si la arquitectura esta en funcionamiento
 			//			if (verifi_arq_ping($_POST['dominio_arq'])) {
				// verificar si existe el archivo
				
				if ( file_exists('images/images_testbed/images_ims/'.$_FILES['image']['name']) ) {
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
						$new_name = $now . $_FILES['image']['name'];
						rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );
					}

						$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','V','libre', '".$_POST['desc_arq']."','".$new_name."')";
						$agregar=db_execute($sql);
						if ( $agregar == '1') {
							$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
							echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $new_name));
							}else{
								echo('upload fallo');
							}
						
				}else{
						if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
							$up2=db_execute("UPDATE arqs_testbedims SET imagen='".$_FILES['image']['name']."' WHERE id='" . $id_arq . "'");
						}else{
							echo('upload fallo');
						}
						$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','V','libre', '".$_POST['desc_arq']."','".$_FILES['image']['name']."')";
						$agregar=db_execute($sql);
						if ( $agregar == '1') {
							$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
							echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $_FILES['image']['name']));
						}
				}
			 //			}else{
			 //				echo ("La arquitectura no responde el ping");
			 //			}

			
			break;

		case "4": //eliminar arquitectura
				$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
				$eliminar=db_execute("DELETE FROM arqs_testbedims WHERE id='".$id."'");
				if ( $eliminar == '1') {				
					unlink('images/images_testbed/images_ims/'.$file_name);
				}
				echo($eliminar);
			break;

		case "5": //modificar arqutiectura
			$error=0;

			$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
			if ($_FILES['image']['name'] == '') {
				$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."' WHERE id='" . $id . "'");
			}else{
				
				
				if (file_exists('images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
						$new_name = $now . $_FILES['image']['name'];
						rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );
						$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$new_name."' WHERE id='" . $id . "'");
					}
				
				}else{
					$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$_FILES['image']['name']."' WHERE id='" . $id . "'");
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

		case '6'://subir informacioon de arquitectura
				$idmod=db_fetch_cell_prepared("SELECT id from info_arq_testbedims where dominio='".$_POST['dominio']."'");
				if ($idmod == '') {
					$agregar=db_execute("INSERT INTO info_arq_testbedims (dominio, type, ip_bono, ip_sprout, ip_ellis, ip_homer, ip_vellum, ip_dime, ip_ibcf, ip_pstn, fist_number_pstn, amount_extensions_pstn, fist_number_ims, amount_extensions_ims) VALUES ('".$_POST['dominio']."','".$_POST['type']."','".$_POST['host_bono']."','".$_POST['host_sprout']."','".$_POST['host_ellis']."','".$_POST['host_homer']."','".$_POST['host_vellum']."','".$_POST['host_dime']."','".$_POST['host_ibcf']."','".$_POST['host_pstn']."','".$_POST['fist_number_pstn']."','".$_POST['amount_extensions_pstn']."','".$_POST['fist_number_ims']."','".$_POST['amount_extensions_ims']."')");
				}else{
					$agregar=db_execute("UPDATE info_arq_testbedims SET dominio='".$_POST['dominio']."', type='".$_POST['type']."', ip_bono='".$_POST['host_bono']."', ip_sprout='".$_POST['host_sprout']."', ip_ellis='".$_POST['host_ellis']."',ip_homer='".$_POST['host_homer']."', ip_vellum='".$_POST['host_vellum']."',ip_dime='".$_POST['host_dime']."',ip_ibcf='".$_POST['host_ibcf']."', ip_pstn='".$_POST['host_pstn']."', fist_number_pstn='".$_POST['fist_number_pstn']."', amount_extensions_pstn='".$_POST['amount_extensions_pstn']."', fist_number_ims='".$_POST['fist_number_ims']."', amount_extensions_ims='".$_POST['amount_extensions_ims']."' where id='".$idmod."'");
				}
					
				if ($agregar == 1) {
					echo "Se agrego la informacion del dominio".$_POST['dominio']." correctamente";	
				}else{
					echo "No existe el dominio ".$_POST['dominio'];
				}

			break;
		case '7':
			// echo "entro a la funcion";
			$sql=db_execute("UPDATE data_testbedims set value_info='".$_POST['numero']."' where id_data='1'");
			if ($sql == '1') {
				echo ($_POST['numero']);
			}
			break;

		case '8':
			$sql=db_execute("UPDATE data_testbedims set value_info='".$_POST['numero']."' where id_data='2'");
			
			if ($sql == '1') {
				echo ($_POST['numero']);
			}
			break;
		default:
			echo ("sin funcion");
			break;
	}
}else{
	$dominios_asignados= dominios_asignados();
	// print_r($dominios_asignados);
	if (!empty($dominios_asignados)) {
		foreach ($dominios_asignados as $key => $array) {
			validar_asignacion($array['dominio'],$array['usuario']);
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


function arq_asignadas_to_user($user){
	$ids_od_user=db_fetch_assoc("SELECT id from arqs_testbedims where usuario ='".$user."'");
	return $ids_od_user;
}

