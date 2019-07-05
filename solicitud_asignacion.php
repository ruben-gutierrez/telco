<?php 
global $current_user;

include('./include/global.php');



// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//

if (!empty($_POST)) {
	// include('./include/auth.php'); //se pone aqui poque se se pone arriba da error cuando se ejecuta automaticamente


	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];

	$now = date_create()->format('Y-m-d H:i:s');
	$days=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'");
	// Explain table testbed
	// id  |  arquitectura | dominio | activo | usuario descripcion | imagen
	// en esta tabla arquitectura es el nombre de la arquitectura, domini es la ip o nombre en el dns, activo hace referencia a la verificacion mediante ping de que esta funcionanado de lo contrario no se tomara en cuenta para la asignacion , usuario si este campo es diferente de libre entonces esta ocupado y las arquitecturas que tienen libre en este campo se pueden asignar.
	switch ($accion) { 

		case "1"://guardar solicitud y asignarla si hay arq disponible
			// echo "ingreso a la funcion2";
			// print_r($_POST);
			$num_arq_to_user=sizeof(arq_asignadas_to_user($_POST['post_from_email']));
			$arq_permit=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='1'");
			
			agregar_solicitud($_POST['post_to_email'],$_POST['post_from_email'],$_POST['post_arquitectura'],$_POST['post_username'],$now);
			// dominio de arquitectura disponible
			//consulta si hay arquitecturas disponibles
			$dominio_libre=arq_disponible($_POST['post_arquitectura']);
			

			if ($dominio_libre['id']=='') {
				echo "Lo sentimos, en este momento no hay arquitecturas disponibles. Se ha almacenado su solicitud pronto nos contataremos via e-mail.\n Gracias";
			}else{
				// Consulta si hay solicitud pendiente
				// echo "hay arquitectecturas disponibles";
				$id_solicitud_pendiente = solicitud_pendiente($_POST['post_arquitectura']);
				if ($id_solicitud_pendiente['id'] == '') {
					echo "no hay solicitudes pendientes para la arquitectura " . $_POST['post_arquitectura'];
				}else{
					// echo "hay solicitudes pendientes";
					// echo $num_arq_to_user;
					// echo $arq_permit;
					if ($num_arq_to_user < $arq_permit) {
						asignar_arquitectura($id_solicitud_pendiente['id'] , $dominio_libre['dominio'], $_POST['post_from_email']);
						// asignar la arqutiectura al usuario en la plataforma
						echo "Se ha asignado la arquitectura ". $_POST['post_arquitectura'] . "durante ".$days." dias.";
					}else{
						echo ("Puede reservar maximo ". $arq_permit ."arquitecturas en el testbed IMS");
					}
					
				}
			}
			break;

		case "2"://liberar arquitectura
			$email_user = db_fetch_cell_prepared("SELECT usuario from arqs_testbedims  WHERE id ='" . $id . "'");
			$dom_asig = db_fetch_cell_prepared("SELECT dominio from arqs_testbedims  WHERE id ='" . $id . "'");
			$arq_libre=db_execute("UPDATE arqs_testbedims SET  usuario='libre' WHERE id='" . $id . "'");
			$mod_table_solicitud=db_execute("UPDATE solicitud_arq SET fecha_fin_asignacion =NOW() WHERE dominio='" . $dom_asig . "' ORDER BY id DESC LIMIT 1");
				echo($arq_libre);
			
			break;
		case "3"://agregar arquitectura
				//crear la red en openstack
				$name_net=$_POST['name_arq'];
				$description=$_POST['desc_arq'];
				$domain=$_POST['dominio_arq'];
				if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
					$new_name = $now . $_FILES['image']['name'];
					rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );
				}
				// inserta la informacion en la base de dataos
				$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','V','libre', '".$_POST['desc_arq']."','".$new_name."')";
				$agregar=db_execute($sql);
				if ( $agregar == '1') {
					// crea la red en openstack
					$result_create_net=create_net($name_net, $description, $domain);
					//crear maquina dependiento de el tipo de core
					create_vm_to_core($_POST['dominio_arq'],$_POST['type']);
					// retorna la actualizacion de la tabla
					$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
					echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $new_name));
				}else{
					echo('upload fallo');
				}
			break;

		case "4": //eliminar arquitectura
				$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
				$id_net=db_fetch_cell_prepared("select id_net from arqs_testbedims t JOIN network_openstack o ON t.dominio = o.domain where t.id='".$id."'");
				$eliminar=db_execute("DELETE FROM arqs_testbedims WHERE id='".$id."'");
				if ( $eliminar == '1') {				
					unlink('images/images_testbed/images_ims/'.$file_name);
				}
				// echo($id_net);
				delete_net($id_net);
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
			$nodes_dist_pstn=array('bono'=>'',
				'sprout'=>'',
				'ellis'=>'',
				'homer'=>'',
				'vellum'=>'',
				'dime'=>'',
				'asterisk'=>'',
				'ibcf'=>''
			);
			$nodes_dist=array('bono'=>'',
				'sprout'=>'',
				'ellis'=>'',
				'homer'=>'',
				'vellum'=>'',
				'dime'=>''
			);
				$idmod=db_fetch_cell_prepared("SELECT id_server FROM core_domain WHERE domain='".$_POST['dominio']."'");
				//$idmod=db_fetch_cell_prepared("SELECT s.id_subnet FROM arqs_testbedims a inner JOIN network_openstack n ON a.dominio = n.domain  inner JOIN subnet_openstack s ON n.id_net = s.id_net where a.dominio='10.10.10.0'");
				//$idmod=db_fetch_cell_prepared("SELECT id_info from info_arq_testbedims where dominio='".$_POST['dominio']."'");
				if ($idmod == '') {
					//$id_subnet=id_subnet_ofDomain($_POST['dominio']);
					$id_net=id_net_ofDomain($_POST['dominio']);
					// #como no hay informacion entonces crear maquinas
					// #vefirigar que tipo de nucleo selecciono
					switch ($_POST['type']) {
						case 'aio':
							// #crear solo 1 ubuntu 14
							// #guardar solo bono
							// create_vm( "aio", "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "2", $id_net);
							echo $id_subnet;
							//$vm_create=create_vm( "aio", "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "2", $id_subnet);
							$vm_create=create_vm( "aio", "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "42", $id_net);
							$vmJson = json_decode($vm_create, true);
							print_r($vmJson);
							$agregar=db_execute("INSERT INTO core_domain (id_server, domain, type_domain) values ( '".$vmJson['server']['id']."','".$_POST['dominio']."','".$_POST['type']."')");
							if( $agregar== 1){
								echo "maquina agregada";
							}else{
								echo "error agregando maquina";
							}
							break;
						case 'dist':
							// crear 5 nodos mas dns
							foreach ($nodes_dist as $nameVm=>$ipVm){
									// create_vm( $nameVm, $id_image, "42", $id_net);
									$vm_create=create_vm( $nameVm, "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "42", $id_net);
									$vmJson = json_decode($vm_create, true);
									$agregar=db_execute("INSERT INTO core_domain (id_server, domain, type_domain) values ( '".$vmJson['server']['id']."','".$_POST['dominio']."','".$_POST['type']."')");
									if( $agregar== 1){
										echo "maquina agregada";
									}else{
										echo "error agregando maquina";
									}
							}
							break;
						case 'dist_pstn':
							// crear 7 nodos mas dns
							foreach ($nodes_dist_pstn as $nameVm=>$ipVm){
									// create_vm( $nameVm, $id_image, "42", $id_subnet);
									$vm_create=create_vm( $nameVm, "a25c56b1-eb49-4cf6-bf09-eed2a417e703", "42", $id_net);
									$vmJson = json_decode($vm_create, true);
									$agregar=db_execute("INSERT INTO core_domain (id_server, domain, type_domain) values ( '".$vmJson['server']['id']."','".$_POST['dominio']."','".$_POST['type']."')");
									if( $agregar== 1){
										echo "maquina agregada";
									}else{
										echo "error agregando maquina";
									}
							}
							break;
						
						default:
							// # code...
							break;
					}
				}else{
					echo "el dominio ya tiene el nucleo";
				}


			break;
		case '7'://numero de arquitecturas por usuario
			// echo "entro a la funcion";
			$sql=db_execute("UPDATE data_testbedims set value_info='".$_POST['numero']."' where id_data='1'");
			if ($sql == '1') {
				echo ($_POST['numero']);
			}
			break;

		case '8':// dias de asignacion de cada arquitectura
			$sql=db_execute("UPDATE data_testbedims set value_info='".$_POST['numero']."' where id_data='2'");
			
			if ($sql == '1') {
				echo ($_POST['numero']);
			}
			break;
		case '9':
			$info_dom=db_fetch_row_prepared("SELECT * from info_arq_testbedims where dominio='".$_POST['dominio']."'");
			
			if ($info_dom != '') {
				echo json_encode($info_dom);
				// print_r($info_dom);
			}
			break;
		case '10'://agregar test
			$agregar=db_execute("INSERT INTO test_testbedims (dominio, name_test, comand, description_test, restriction) VALUES ('".$_POST['dominio']."','".$_POST['name_test']."','".$_POST['comand_test']."','".$_POST['description_test']."','".$_POST['restriction_test']."')");
			// subir archivo 
			if ( file_exists('files_XML/'.$_FILES['file_test']['name']) ) {
				if (move_uploaded_file($_FILES['file_test']['tmp_name'], 'files_XML/temp/'.$_FILES['file_test']['name'])) {
					$new_name = $now . $_FILES['file_test']['name'];
					rename('files_XML/temp/'.$_FILES['file_test']['name'], 'files_XML/'.$new_name );
				}
			}else{
				move_uploaded_file($_FILES['file_test']['tmp_name'], 'files_XML/'.$_FILES['file_test']['name']);
				// print_r($_FILES);
			}
			if ($agregar == 1 ) {
				$id_test=db_fetch_cell_prepared("select id_test from test_testbedims ORDER BY id_test DESC");
				echo $id_test;
			}else{
				echo ("");
			}
			break;
		case '11'://agregar opciones de test
			$agregar=db_execute("INSERT INTO option_test_testbedims ( id_test, options, value, description_option) VALUES ('".$_POST['id_test']."','".$_POST['options']."','".$_POST['value']."','".$_POST['description_option']."')");

			if ($agregar == 1 ) {
				echo("info agregada correctamente");
			}else{
				echo ("no se pudo agregar la informacion intentelo nuevamente");
			}
			break;
			
		case '12'://consultar maquinas virtuales por usuario
			// print($_POST['domain']);
			$domain=db_fetch_cell_prepared("SELECT dominio from arqs_testbedims where id=".$_POST['domain']);
			// print($domain);
			$ips_domain=db_fetch_assoc("select s.name_server, s.ip_local from server_openstack s inner join core_domain c on c.id_server=s.id_server where c.domain='".$domain."'");

			// $ips_domain=db_fetch_assoc("select s.id_server, s.name_server, s.ip_local from server_openstack s inner join core_domain c on c.id_server=s.id_server");
			// print_r($ips_domain);
			$ips_aditionals=db_fetch_assoc("SELECT id_server,name_server, ip_local from vm_aditional_testbedims where dominio='".$domain."'");

			echo json_encode($ips_domain+$ips_aditionals);

			break;
		case '13'://agregar vm a dominio user
			// print_r($_POST);
			$id_net=db_fetch_cell_prepared("SELECT n.id_net from network_openstack n INNER JOIN arqs_testbedims a ON a.dominio=n.domain where a.id='".$_POST['idDomain']."'");
			$flavor=id_flavor( $_POST['ramNewVm'],$_POST['vcpuNewVm'],$_POST['diskNewVm']);
			$vm=create_vm($_POST['nameNewVm'], $_POST['imageNewVm'],$flavor,$id_net);
			$vmJson = json_decode($vm, true);
				// print_r($vmJson);
			$id_dom=$_POST['idDomain'];
			$domain=db_fetch_cell_prepared("select dominio from arqs_testbedims where id='".$id_dom."'");
			$name=$_POST['nameNewVm'];
			$disk=$_POST['diskNewVm'];
			$vcpu=$_POST['vcpuNewVm'];
			$ram=$_POST['ramNewVm'];
			$image=$_POST['imageNewVm'];
			$id_server=$vmJson['server']['id'];


			// echo $domain;
			// echo $name;
			// echo $disk;
			// echo $vcpu;
			// echo $ram;
			// echo $image;
			// echo $id_server;
			
			$agregate=db_execute("INSERT INTO vm_aditional_testbedims(id_server,dominio, name_server,RAM,disk,vcpu,id_flavor,image) values ('".$id_server."','".$domain."','".$name."','".$ram."','".$disk."','".$vcpu."','".$flavor."','".$image."')");
			if($agregate == 1){
				$server=db_fetch_row_prepared("SELECT * from vm_aditional_testbedims WHERE id_server='".$id_server."'");
				print_r($server);
			}
			break;
		case '14'://consultar maquinas virtuales por usuario
			$flavor=id_flavor( $_POST['ram'],$_POST['cpu'],$_POST['hardDisk']);
			update_vm($id_server, $flavor);

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
				<td><button class='btn_arq_action btn btn-outline-success btn-sm' id='btn_liberar".$id."' name='liberar' style='background:green;'> <i class='fa fa-unlink'></i></button>
				<button class='btn_arq_action btn btn-outline-warning btn-sm' id='btn_editar".$id."'name='editar' style='background:blue;'> <i class='fa fa-edit'></i></button>
				<button class='btn_arq_action btn btn-outline-danger btn-sm' id='btn_eliminar".$id."' name='eliminar' style='background:red;'> <i class='fa fa-trash'></i></button></td></tr>";
	return $line;
}


function arq_asignadas_to_user($user){
	$ids_od_user=db_fetch_assoc("SELECT id from arqs_testbedims where usuario ='".$user."'");
	return $ids_od_user;
}

