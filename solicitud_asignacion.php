<?php 
global $current_user;

include('./include/global.php');
include_once('./lib/api_graph.php');


// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//

if (!empty($_POST)) {
	// include('./include/auth.php'); //se pone aqui poque se se pone arriba da error cuando se ejecuta automaticamente


	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];

	$now = date_create()->format('Y-m-dH:i:s');
	$days=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'");
	// Explain table testbed
	// id  |  arquitectura | dominio | activo | usuario descripcion | imagen
	// en esta tabla arquitectura es el nombre de la arquitectura, domini es la ip o nombre en el dns, activo hace referencia a la verificacion mediante ping de que esta funcionanado de lo contrario no se tomara en cuenta para la asignacion , usuario si este campo es diferente de libre entonces esta ocupado y las arquitecturas que tienen libre en este campo se pueden asignar.
	switch ($accion) { 

		case "1"://guardar solicitud y asignarla si hay arq disponible
			// echo "ingreso a la funcion2";
			// print_r($_POST);
			$idUser= db_fetch_cell_prepared("SELECT id from user_auth  WHERE email_address ='" . $_POST['post_from_email'] . "'");
			$num_arq_to_user=sizeof(arq_asignadas_to_user($_POST['post_from_email']));
			$arq_permit=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='1'");
			
			agregar_solicitud($_POST['post_to_email'],$_POST['post_from_email'],$_POST['post_arquitectura'],$_POST['post_username'],$now);
			// dominio de arquitectura disponible
			//consulta si hay arquitecturas disponibles
			$dominio_libre=arq_disponible($_POST['post_arquitectura']);
			

			if ($dominio_libre['id']=='') {
				echo "Lo sentimos, en este momento no hay arquitecturas disponibles. Se ha almacenado su solicitud pronto nos contataremos via e-mail.\n Gracias";
				//report
				addActionToReport($idUser, "Se agrego una solicitud de espera de la arquitectura ".$_POST['post_arquitectura']."");
			}else{
				// Consulta si hay solicitud pendiente
				// echo "hay arquitectecturas disponibles";
				$id_solicitud_pendiente = solicitud_pendiente($_POST['post_arquitectura']);
				if ($id_solicitud_pendiente['id'] == '') {
					echo "no hay solicitudes pendientes para la arquitectura " . $_POST['post_arquitectura'];
				}else{
					if ($num_arq_to_user < $arq_permit) {
						asignar_arquitectura($id_solicitud_pendiente['id'] , $dominio_libre['dominio'], $_POST['post_from_email']);
						// asignar la arqutiectura al usuario en la plataforma
						echo "Se ha asignado la arquitectura ". $_POST['post_arquitectura'] . "durante ".$days." dias.";
						//report
						addActionToReport($idUser, "Reservó la arquitectura  ".$_POST['post_arquitectura']." durante ".$days." dias");
					}else{
						echo ("Puede reservar maximo ". $arq_permit ."arquitecturas en el testbed IMS");
					}
					
				}
			}
			break;

		case "2"://liberar arquitectura
			$email_user = db_fetch_cell_prepared("SELECT usuario from arqs_testbedims  WHERE id ='" . $id . "'");
			if ($email_user != "libre"){
				$dom_asig = db_fetch_cell_prepared("SELECT dominio from arqs_testbedims  WHERE id ='" . $id . "'");
				$arq_libre=db_execute("UPDATE arqs_testbedims SET  usuario='libre' WHERE id='" . $id . "'");
				$mod_table_solicitud=db_execute("UPDATE solicitud_arq SET fecha_fin_asignacion =NOW() WHERE dominio='" . $dom_asig . "' ORDER BY id DESC LIMIT 1");
				//delete perm to tree
				remove_perms($email_user, $dom_asig);
					echo($arq_libre);

				//report
				addActionToReport($_POST['idUser'], "Liberar la arquitectura ".$dom_asig." del usuario ".$email_user."");
			
			}else{
				echo "1";
			}
			break;
		case "3"://agregar arquitectura
				//variables
				// print_r($_POST);
				$name_net=$_POST['name_arq'];
				$description=$_POST['desc_arq'];
				$domain=$_POST['dominio_arq'];
				if ( $_POST['type'] == "aio") {
					$routeImage="aio.png";
				} elseif ( $_POST['type'] == "dist" ){
					$routeImage="dist.png";
				}else{
					$routeImage="dist_pstn.png";
				}
				//create tree for cacti
				$resp_tree=shell_exec('php -q cli/add_tree.php --type=tree --name="'.$_POST['dominio_arq'].'" --sort-method=manual');
				$array_tree=explode ( ' ' , $resp_tree );
				$id_tree = preg_replace('/\([^)]\)|[()]/', '', $array_tree[4]);
				// inserta la informacion en la base de dataos
				$sql = "INSERT INTO arqs_testbedims (arquitectura, dominio, activo, usuario, descripcion, imagen, id_tree) VALUES ('".$_POST['name_arq']."','".$_POST['dominio_arq']."','V','libre', '".$_POST['desc_arq']."','".$routeImage."','".$id_tree."')";
				$agregar=db_execute($sql);
				if ( $agregar == '1') {
					// agrega las restricciones
					add_restrictions($_POST['dominio_arq'],$_POST['max_vm_aditional'],$_POST['max_ram'],$_POST['max_disk'],$_POST['max_vcpu']);
					// crea la red en openstack
					$result_create_net=create_net($name_net, $description, $domain);
					
					if( $result_create_net['net_openstack'] != '0' && $result_create_net['net_telco'] == '1'){
						// crea el router
						
						$idRouter=createRouter($name_net);
						if( $idRouter == '0'){
							echo("Error al crear Router");
						}else{
							conectRouterNetPublic($idRouter, '08cac388-5c54-4718-8403-57334d5ec8bd');
							conectRouterNetPrivate($idRouter, $result_create_net['subnet_openstack']);
							db_execute("INSERT INTO router_openstack (id_router, name_router, domain) values ( '".$idRouter."','".$name_net."','".$domain."')");
							// echo "Arquitectura Creada con exito";
							//report
							addActionToReport($_POST['idUser'], "Agregó la arquitectura ".$domain."");
							//crear maquinas
							$createDomain=create_vm_to_core($_POST['dominio_arq'], $_POST['type']);
							// print_r($createDomain);
							// retorna la actualizacion de la tabla
							$id_arq=db_fetch_cell_prepared("SELECT id from arqs_testbedims order by id desc limit 1");
							echo(return_file_arq($id_arq, $_POST['name_arq'], $_POST['dominio_arq'], $_POST['desc_arq'], $routeImage));
							
						}
					}else{
						if( $netArrayJson['net_openstack'] != '0' ){
							echo "Fallo la conexion a Openstack al crear la red, Intentelo mas tarde o contacte al administrador";
						}else{
							echo "Fallo la conexion a la base de datos al crear la red, Intentelo mas tarde o contacte al administrador";
						}
					}

					
				}else{
					echo('upload fallo');
				}
			break;
		case "4": //eliminar arquitectura
				$dom= db_fetch_row_prepared("SELECT * from arqs_testbedims  WHERE id ='" . $id . "'");
				$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
				$id_net=db_fetch_cell_prepared("select id_net from arqs_testbedims t JOIN network_openstack o ON t.dominio = o.domain where t.id='".$id."'");
				// if ( $eliminar == '1') {				
					// 	unlink('images/images_testbed/images_ims/'.$file_name);
					// }
					// echo($id_net);
					
				$ips_domain=db_fetch_assoc("SELECT s.id_server from server_openstack s inner join core_domain c on c.id_server = s.id_server inner join  flavor_openstack f on f.id_flavor=s.id_flavor where c.domain='".$dom['dominio']."'");
				foreach( $ips_domain as $serverId){
					deleteVm($serverId['id_server']);
				}
				$ips_aditionals=db_fetch_assoc("SELECT v.id_server from vm_aditional_testbedims v inner join server_openstack s on v.id_server=s.id_server inner join flavor_openstack f on f.id_flavor=s.id_flavor where v.dominio='".$dom['dominio']."'");
				
				foreach( $ips_aditionals as $serverId){
					deleteVm($serverId['id_server']);
				}
				$idRouter= db_fetch_row_prepared("SELECT r.id_router from arqs_testbedims a INNER JOIN router_openstack r ON a.dominio = r.domain WHERE a.id ='" . $id . "'");
				// print_r($idRouter);
				print_r(delete_router($idRouter['id_router']));
				delete_net($id_net);
				$eliminar=db_execute("DELETE FROM arqs_testbedims WHERE id='".$id."'");
				//report
				addActionToReport($_POST['idUser'], "Elimino la arquitectura ".$dom['dominio']."");
				echo($eliminar);
			break;

		case "5": //modificar arqutiectura
			$error=0;
			update_restrictions($_POST['dominio_arq'],$_POST['max_vm_aditional'],$_POST['max_ram'],$_POST['max_disk'],$_POST['max_vcpu']);
			//report
			addActionToReport($_POST['idUser'], "Actualizar las restricciones del dominio ".$_POST['dominio_arq']." por  Maximas maquinas adicionales: ".$_POST['max_vm_aditional']." Ram: ".$_POST['max_ram']." almacenamiento: ".$_POST['max_disk']." Procesadores: ".$_POST['max_vcpu']."");
			$file_name=db_fetch_cell_prepared("select imagen from arqs_testbedims where id='".$id."'");
			if ($_FILES['image']['name'] == '') {
				$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."' WHERE id='" . $id . "'");
			}else{				
				if (file_exists('images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/temp/'.$_FILES['image']['name'])) {
						$new_name = $now . $_FILES['image']['name'];
						rename('images/images_testbed/images_ims/temp/'.$_FILES['image']['name'], 'images/images_testbed/images_ims/'.$new_name );
						$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$new_name."' WHERE id='" . $id . "'");
						//report
						addActionToReport($_POST['idUser'], "Actualizo imagen de la arquitectura ".$_POST['dominio_arq']."");
					}
				
				}else{
					$up=db_execute("UPDATE arqs_testbedims SET arquitectura = '" . $_POST['name_arq'] . "', dominio ='" . $_POST['dominio_arq'] . "', usuario ='libre', descripcion='".$_POST['desc_arq']."', imagen='".$_FILES['image']['name']."' WHERE id='" . $id . "'");
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'images/images_testbed/images_ims/'.$_FILES['image']['name'])) {
							$up2=db_execute("UPDATE arqs_testbedims SET imagen='".$_FILES['image']['name']."' WHERE id='" . $id . "'");
							//report
							addActionToReport($_POST['idUser'], "Actualizo datos de la arquitectura ".$_POST['dominio_arq']."");
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
			 		<td><button class='btn_arq_action btn btn-outline-success btn-sm' id='btn_liberar".$id."' name='liberar' style='background:green;'> <i class='fa fa-unlink'> Liberar</i></button><button class='btn_arq_action btn btn-outline-warning btn-sm' id='btn_editar".$id."'name='editar' style='background:blue;'> <i class='fa fa-edit'>Editar</i></button><button class='btn_arq_action btn btn-outline-danger btn-sm' id='btn_eliminar".$id."' name='eliminar' style='background:red;'> <i class='fa fa-trash'>Eliminar</i></button></td></tr>");
				

			}else{
				echo($error++);
			}
			
		
			break;

		case '6'://subir informacioon de arquitectura
			$nodes_dist_pstn=array('bono'=>'',
				'sprout'=>'',
				'ellis'=>'',
				'homer'=>'',
				'dime'=>'',
				'asterisk'=>'',
				'ibcf'=>'',
				'vellum'=>''
			);
			$nodes_dist=array('bono'=>'',
				'sprout'=>'',
				'ellis'=>'',
				'homer'=>'',
				'dime'=>'',
				'vellum'=>''
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
							// create_vm( "aio", "ffd93b55-858c-4ca2-9f0b-0e7890966392", "2", $id_net);
							// echo $id_subnet;
							
							$vm_create=create_vm( "aio", "ffd93b55-858c-4ca2-9f0b-0e7890966392", "d2", $id_net);
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
									// create_vm( $nameVm, $id_image, "d2", $id_net);
									$vm_create=create_vm( $nameVm, "ffd93b55-858c-4ca2-9f0b-0e7890966392", "d2", $id_net);
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
									// create_vm( $nameVm, $id_image, "d2", $id_subnet);
									$vm_create=create_vm( $nameVm, "ffd93b55-858c-4ca2-9f0b-0e7890966392", "d2", $id_net);
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
				//report
				addActionToReport($_POST['idUser'], "Modificó el número de arquitecturas por usuario a  ".$_POST['numero']."");
			}
			break;

		case '8':// dias de asignacion de cada arquitectura
			$sql=db_execute("UPDATE data_testbedims set value_info='".$_POST['numero']."' where id_data='2'");
			
			if ($sql == '1') {
				//report
				addActionToReport($_POST['idUser'], "Modificó el número de dias de asignacion de las arquitecturas a   ".$_POST['numero']."");
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
			// subir archivo 
			
			if (move_uploaded_file($_FILES['file_test']['tmp_name'], 'files_XML/temp/'.$_FILES['file_test']['name'])) {
				$now = date_create()->format('H-i-s');
				$new_name = trim($now).trim($_FILES['file_test']['name']);
				// echo $new_name;
				rename('files_XML/temp/'.$_FILES['file_test']['name'], 'files_XML/'.$new_name );
			}
			$agregar=db_execute("INSERT INTO test_testbedims (dominio, name_test, comand, description_test, restriction,file_test) VALUES ('".$_POST['dominio']."','".$_POST['name_test']."','".$_POST['comand_test']."','".$_POST['description_test']."','".$_POST['restriction_test']."','".$new_name."')");
			if ( $agregar == 1 ) {
				$idServer=db_fetch_cell_prepared("SELECT s.id_server FROM server_openstack s INNER JOIN core_domain c ON c.id_server=s.id_server WHERE s.name_server='sipp' AND c.domain='".$_POST['dominio']."'");
				// echo $idServer;
				if ( $idServer != '') {
				
					$id_test=db_fetch_cell_prepared("select id_test from test_testbedims ORDER BY id_test DESC");
					echo $id_test;
					//enviar archivo por scp a la maquina virtual sipp del dominio
					$ipfloat=ipFloat($idServer);
					$transFile=shell_exec('sudo chmod 775 ./scripts/terminal_testbed/key.pem');
					//copia la prueba
					shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem /var/www/html/telco/files_XML/"'.$new_name.'" ubuntu@'.$ipfloat.':/usr/share/clearwater/bin/');
					//copia el ejecutador
					shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem /var/www/html/telco/scripts/sipp/ejecute_test.sh ubuntu@'.$ipfloat.':/home/ubuntu');
					//ejecuta el intalador
					$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloat.' "chmod 775 ./ejecute_test.sh');
					$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloat.' "sudo ./ejecute_test.sh');
					//report
					addActionToReport($_POST['idUser'], "Agregó la prueba ".$id_test." a la arqutiectura ".$_POST['dominio']."");
				}else{
					echo "errorIdserver";
				}
			}else{
				echo ("");
			}
			break;
		case '11'://agregar opciones de test

			$agregar=db_execute("INSERT INTO option_test_testbedims ( id_test, options, value, description_option) VALUES ('".$_POST['id_test']."','".$_POST['options']."','".$_POST['value']."','".$_POST['description_option']."')");

			if ($agregar == 1 ) {
				//report
				addActionToReport($_POST['idUser'], "Agregó la opcion ".$_POST['options']." a la prueba ".$_POST['id_test']." ");
				echo("info agregada correctamente");
			}else{
				echo ("no se pudo agregar la informacion intentelo nuevamente");
			}
			break;
			
		case '12'://consultar maquinas virtuales por usuario
			// consult_servers_openstack();
			$domain=db_fetch_cell_prepared("SELECT dominio from arqs_testbedims where id=".$_POST['domain']);
			$ips_domain=db_fetch_assoc("SELECT s.id_server, s.name_server, s.ip_local, s.status, c.ram, c.vcpus, c.disk from server_openstack s inner join core_domain c on c.id_server = s.id_server inner join  flavor_openstack f on f.id_flavor=s.id_flavor where c.domain='".$domain."'");
			$ips_aditionals=db_fetch_assoc("SELECT v.id_server,v.name_server, v.ip_local, s.status, f.ram, f.vcpus, f.disk from vm_aditional_testbedims v inner join server_openstack s on v.id_server=s.id_server inner join flavor_openstack f on f.id_flavor=s.id_flavor where v.dominio='".$domain."'");
			if ($_POST['core']== "true") {
				echo json_encode($ips_domain);
			}else{
				echo json_encode($ips_aditionals);
			}
			break;
		case '13'://agregar vm a dominio user
			// print_r($_POST);
			$disk=$_POST['diskNewVm'];
			$vcpu=$_POST['vcpuNewVm'];
			$ram=$_POST['ramNewVm'];
			$resp=validate_recourses($domain, $ram, $disk, $vcpu);
			
			echo($resp);
			if ( $resp == '111' ) {
				$id_net=db_fetch_cell_prepared("SELECT n.id_net from network_openstack n INNER JOIN arqs_testbedims a ON a.dominio=n.domain where a.id='".$_POST['idDomain']."'");
				$flavor=id_flavor( $_POST['ramNewVm'],$_POST['vcpuNewVm'],$_POST['diskNewVm']);
				
				$vm=create_vm($_POST['nameNewVm'], $_POST['imageNewVm'],$flavor,$id_net);
				consult_servers_openstack();
				$vmJson = json_decode($vm, true);
					// print_r($vmJson);
				$id_dom=$_POST['idDomain'];
				$domain=db_fetch_cell_prepared("select dominio from arqs_testbedims where id='".$id_dom."'");
				$name=$_POST['nameNewVm'];
				
				$image=$_POST['imageNewVm'];
				$id_server=$vmJson['server']['id'];
				sleep(5);
				$server1=show_server($id_server);
				$server = json_decode($server1, true);
				$ipLocal=$server['server']['addresses'][key($server['server']['addresses'])][0]['addr'];
				$agregate=db_execute("INSERT INTO vm_aditional_testbedims(id_server,dominio, name_server,ip_local,RAM,disk,vcpu,id_flavor,image) values ('".$id_server."','".$domain."','".$name."','".$ipLocal."','".$ram."','".$disk."','".$vcpu."','".$flavor."','".$image."')");
				if($agregate == 1){
					//report
					addActionToReport($_POST['idUser'], "Creó una máquina virtual con los siguientes recursos RAM: ".$_POST['ramNewVm']." , Procesadores: ".$_POST['vcpuNewVm'].", Almacenamiento: ".$_POST['diskNewVm']." en la arquitectura ".$domain."");
					$server=db_fetch_row_prepared("SELECT * from vm_aditional_testbedims WHERE id_server='".$id_server."'");
					print_r($server);
				}
			}else{
				echo "0";
			}
			break;
		case '14'://consultar maquinas virtuales por usuario
			// print_r($_POST);
			$idflavor=id_flavor( $_POST['ram'],$_POST['vcpu'],$_POST['disk']);
			echo $idflavor;
			print_r(reziseServer($_POST['id_server'], $idflavor));

			break;
		case '15'://tomar snapshot o punto de control de una vm
		
			
			$idInstant=db_fetch_cell_prepared("SELECT id_instant from instant_images_openstack WHERE id_server='".$_POST['id_server']."'");
			// print_r($idInstant);
			if( empty($idInstant) ){
				echo "No tiene instantanea";
				$answer=createInstantImage( $_POST['name_server'], $_POST['id_server']);
				print_r($answer);
			}else{
				//eliminar la imagen del snapshot
				delete_snapshot($_POST['id_server']);
				//crear nuevamente la imagen
				$answer=createInstantImage( $_POST['name_server'], $_POST['id_server']);
				print_r($answer);
			}
		
			break;
		case '16'://retornar a punto de control
			$idInstant=db_fetch_cell_prepared("SELECT id_instant from instant_images_openstack WHERE id_server='".$_POST['id_server']."'");
			print_r(rebuildServerImage($_POST['id_server'], $idInstant));

			break;
		case '17'://ssh de las maquinas
			
			
			$ipfloatTelco=ipFloatServer($_POST['id_server']);
			// echo $ipfloatTelco;
			if( $ipfloatTelco == ''){
				// echo "no tiene ip publica";
				$ipfloat=asingIpFloatServer($_POST['id_server']);
				
				if( $ipfloat == '0'){
					echo "0";
					// echo "fallo al agregar ip flotante";
				}else{
					

					shell_exec('ssh-keygen -f "/root/.ssh/known_hosts" -R "'.$ipfloat.'"');

					// $transFile=shell_exec('sudo chmod 775 ./scripts/terminal_testbed/Testbed_vIMS.pem');
					$transFile=shell_exec('sudo chmod 775 ./scripts/terminal_testbed/key.pem');
					$transFile=shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ./scripts/terminal_testbed/install_conf_shellinabox.sh ubuntu@'.$ipfloat.':/home/ubuntu');
					$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloat.' "sudo ./install_conf_shellinabox.sh"');
					$exeInstallShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloat.' "sudo service shellinabox restart"');
					echo $ipfloat;
				}
			}else{
				shell_exec('sudo ssh-keygen -f "/root/.ssh/known_hosts" -R "'.$ipfloatTelco.'"');
				// $transFile=shell_exec('sudo chmod 775 ./scripts/terminal_testbed/key.pem');
				$transFile=shell_exec('sudo chmod 775 ./scripts/terminal_testbed/key.pem');
				$transFile=shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ./scripts/terminal_testbed/install_conf_shellinabox.sh ubuntu@'.$ipfloatTelco.':/home/ubuntu');
				$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloatTelco.' "sudo ./install_conf_shellinabox.sh;"');
				$exeInstallShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipfloatTelco.' "sudo service shellinabox start"');
				echo $ipfloatTelco;
				}
			break;
		case '18'://Agregar grafica por usuario
				// print_r($_POST);
				
				$host_id=deviceId($_POST['id_server']);

				addTemplateAndQueryToDevice($host_id);
				$esp='""';
				$id_graph=trim(shell_exec("php -q cli/add_graphs.php --host-id=".$host_id." --graph-type=cg --graph-template-id='".$_POST['templateGraph']."' | awk '{ gsub(/\(|\)/, $esp) ;print$5 }' "));
				
				if ( $id_graph == "-") {
					echo "la grafica ya esta creada";
				}else{
					//busca el tree por medio de la direccion de red
					$dom='"'.$_POST['dominio_test'].'"';
					// echo $dom;
					$id_tree=trim(shell_exec("php -q cli/add_tree.php --list-trees | awk ' $6 == $dom { print $1 }'"));
					echo $id_tree;
					//agrega del host al tree
					shell_exec("php -q cli/add_tree.php --type=node --node-type=host --tree-id='".$id_tree."' --host-id='".$host_id."'");
					//agrega la grafica al arbol
					shell_exec("php -q cli/add_tree.php --type=node --node-type=graph --tree-id='".$id_tree."' --graph-id='".$id_graph."'");
					//report
					addActionToReport($_POST['idUser'], "Agregó la gráfica ".$id_graph." al dominio : ".$dom." ");
				}
				break;
			case '19':
				// db_execute_prepared('DELETE FROM graph_local WHERE id = ?', $_POST['idGraph']);
				api_graph_remove($_POST['idGraph']);
				//report
				addActionToReport($_POST['idUser'], "Borró la gráfica ".$_POST['idGraph']." ");
				break;

			case '20':
				echo "test";
				sleep(10);
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


