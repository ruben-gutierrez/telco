<?php 
global $current_user, $explain_test_bono, $content_menu_vertical;

include('./include/global.php');
// include('./include/auth.php');


// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//
// print_r($_POST);
if (!empty($_POST)) {
	
$now = date_create()->format('Y-m-d H:i:s');
// echo $now;
	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];
	switch ($accion) { 
		case "1": //borrar elemento de la seccion de info
			$name_column=db_fetch_cell("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '".$_POST['table']."' LIMIT 1");
			$number_content=db_fetch_cell("select count(".$name_column.") from ".$_POST['table']);
			$name_image=db_fetch_cell("select content from content_info_page where id_content = '".$_POST['id']."' AND type='img'");
			if (!empty($name_image)) {
				unlink('images/images_testbed/images_ims/images_info_page/'.$name_image);
			}

			if ($number_content>1) {
				$del=db_execute("delete from ".$_POST['table']." where ".$name_column."='".$_POST['id']."'");
				echo $del;
				//report
				addActionToReport($_POST['idUser'], "Elimino Contenido de la seccion de información");
			}else{
				echo 0;
			}
			break;
		case "2": //agregar titulo
			// $id_add=$_POST['id']+1;
			// $name_column=db_fetch_cell("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '".$_POST['table']."' LIMIT 1");
			$update=db_execute("UPDATE title_info_page SET id_title = id_title + 1 WHERE id_title > '".$_POST['id']."' ORDER BY id_title DESC");
			$add=db_execute("insert into title_info_page (id_title,main_title) values ('".$_POST['id']."'+1, '".$_POST['main_title']."')");
			if ($add==1) {
				admin_info_page();
				//report
				addActionToReport($_POST['idUser'], "Agrego título a la seccion de información");
			}
				// $add=db_execute("insert into ".$_POST['table']." (id_tite, type, content,".$name_column.",main_title) values ('".$id_add."', '".$_POST['main_title']."')");
			break;
		case "3": //agregar contenido
			// print_r($_POST);
			// print_r($_FILES);


			$update=db_execute("UPDATE content_info_page SET id_content = id_content + 1 WHERE id_content > '".$_POST['id_content']."' ORDER BY id_content DESC");
			if (empty($_FILES)) {
				// echo "no hay archivo";
				$content = str_replace("'", "`", $_POST['content']);
				$add=db_execute("insert into content_info_page (id_content, id_title, type, content) values ('".$_POST['id_content']."'+1, '".$_POST['id_title']."', '".$_POST['type']."','".$content."')");
			}else{
				// echo "si hay archivo";	

					// if (move_uploaded_file($_FILES['content']['tmp_name'], 'images/images_testbed/images_ims/images_info_page/'.$_FILES['content']['name'])) {

						// echo "archivo en temp";
						$now = date_create()->format('Y-m-d H:i:s');
						$new_name = $now . $_FILES['content']['name'];
						move_uploaded_file($_FILES['content']['tmp_name'], 'images/images_testbed/images_ims/images_info_page/'.$new_name);
						// rename('images/images_testbed/images_ims/images_info_page/temp/'.$_FILES['content']['name'], 'images/images_testbed/images_ims/images_info_page/'.$new_name );
						// echo "archivo en images";
					// }else{
						// echo "no se pudo mover el archivo";
					// }


					// echo $now;
					// echo $_FILES['content']['name'];
					// echo $new_name;
				$add=db_execute("insert into content_info_page (id_content, id_title, type, content) values ('".$_POST['id_content']."'+1, '".$_POST['id_title']."', '".$_POST['type']."','".$new_name."')");

			}
			if ($add==1) {
				//report
				addActionToReport($_POST['idUser'], "Agregó Contenido de la seccion de información");
				admin_info_page();
			}else{
				echo $update;
			}
			
			break;
		case "4": //editar titulo
			$update=db_execute("UPDATE title_info_page SET main_title = '".$_POST['main_title']."' WHERE id_title = '".$_POST['id']."'");
			if ($update==1) {
				//report
				addActionToReport($_POST['idUser'], "Edito un Titulo de la seccion de información");
				admin_info_page();
			}
			break;
		case "5": //editar contenido
			$content = str_replace("'", "`", $_POST['content']);
			$update=db_execute("UPDATE content_info_page SET type = '".$_POST['type']."', content = '".$content."' WHERE id_title = '".$_POST['id_title']."' and id_content='".$_POST['id_content']."'");
			if ($update==1) {
				//report
				addActionToReport($_POST['idUser'], "Editó Contenido de la seccion de información");
				admin_info_page();
			}
			break;
		case "6": //mover titulos
			// print_r($_POST);
			$id_max=db_fetch_cell("select MAX(id_title) from title_info_page");
			// el id que voy a mover lo ponto de ultimo
			$update=db_execute("UPDATE title_info_page SET id_title = '".$id_max."'+1 WHERE id_title = '".$_POST['id_title']."'");
			if ($_POST['direc']=='up') {
				// el elemento de arriba lo bajo una casilla
				$id_dest=db_fetch_cell("SELECT id_title from title_info_page where id_title=(select max(id_title) from title_info_page where id_title<".$_POST['id_title'].")");
				// $update=db_execute("UPDATE title_info_page SET id_title = '".$_POST['id_title']."' WHERE id_title = '".$id_dest."'");
				// el titulo a cambiar ocupa la posicion de arriba de la que estaba
				// $update=db_execute("UPDATE title_info_page SET id_title = '".$id_dest."' WHERE id_title = '".$id_max."'+1");
			}else{
				// el elemento de arriba lo subo una casilla
				$id_dest=db_fetch_cell("SELECT id_title from title_info_page where id_title=(select min(id_title) from title_info_page where id_title>".$_POST['id_title'].")");
				
			}
			$update=db_execute("UPDATE title_info_page SET id_title = '".$_POST['id_title']."' WHERE id_title = '".$id_dest."'");
				// el titulo a cambiar ocupa la posicion de abajo de la que estaba
				$update=db_execute("UPDATE title_info_page SET id_title = '".$id_dest."' WHERE id_title = '".$id_max."'+1");
			// $update2=db_execute("UPDATE title_info_page SET id_title = '".$_POST['id_title']."'+1 WHERE id_title = '".$_POST['id_title']."' and id_content='".$_POST['id_content']."'");
			if ($update==1) {
				//report
				addActionToReport($_POST['idUser'], "Alteró el orden en el Contenido de la seccion de información");
				admin_info_page();
			}
			break;
		case "7": //mover contenido en titulos
			// print_r($_POST);
			$id_max=db_fetch_cell("select MAX(id_content) from content_info_page");
			// el id que voy a mover lo ponto de ultimo
			$update=db_execute("UPDATE content_info_page SET id_content = '".$id_max."'+1 WHERE id_content = '".$_POST['id_content']."'");
			if ($_POST['direc']=='up') {
				// el elemento de arriba lo bajo una casilladomain
				$id_dest=db_fetch_cell("SELECT id_content frdomainfo_page where id_content=(select max(id_content) from content_info_page where id_content<'".$_POST['id_content']."' AND id_title='".$_POST['id_title']."')");
				
			}else{
			// 	// el elemento de arriba lo subo una casilla
				$id_dest=db_fetch_cell("SELECT id_content from content_info_page where id_content=(select min(id_content) from content_info_page where id_content>'".$_POST['id_content']."' AND id_title='".$_POST['id_title']."')");
				// $update=db_execute("UPDATE content_info_page SET id_content = '".$_POST['id_content']."' WHERE id_content = '".$id_dest."'");
			// 	// el titulo a cambiar ocupa la posicion de abajo de la que estaba
				// $update=db_execute("UPDATE content_info_page SET id_content = '".$id_dest."' WHERE id_content = '".$id_max."'+1");
			}
			$update=db_execute("UPDATE content_info_page SET id_content = '".$_POST['id_content']."' WHERE id_content = '".$id_dest."'");
			// 	// el titulo a cambiar ocupa la posicion de arriba de la que estaba
			$update=db_execute("UPDATE content_info_page SET id_content = '".$id_dest."' WHERE id_content = '".$id_max."'+1");
			
			if ($update==1) {
				//report
				addActionToReport($_POST['idUser'], "Alteró el orden en los títulos de la seccion de información");
				admin_info_page();
			}
			break;

		case '8':
			// echo $_POST['func'];
			$func=$_POST['func'];
			echo($func());
			break;
		case '9':
			echo (draw_table_domainsOfUser($_POST['emailUser']));
			break;
		case '10':
			$domain=domainOfid($_POST['id_domain']);
			$vms=db_fetch_assoc("select * from vm_aditional_testbedims where dominio='".$domain."'");
			$limits=consult_restrictions($domain);
			// print_r($limits['vm']);
			
			if ( $limits['vm'] > count($vms) ) {
				$images=images_openstack();
				$options='<option value="">Elegir...</option>';
				//echo('<option value="">Elegir...</option>');
				foreach($images as $image ){
					//echo ('<option value="'.$image['id_image'].'">'.$image['name_image'].'</option>');
					$options .= '<option value="'.$image['id_image'].'">'.$image['name_image'].'</option>';
				}
				$op=array("options" => $options);
				$limits += $op;
			}else{
				//echo "0";
				$op=array("options" => "0");
				$limits += $op;				
			}
			print_r(json_encode($limits));
			break;
		case '11':
			echo json_encode(db_fetch_assoc("select name_restriction, limit_restriction from restriction_domain where domain='".$_POST['domain']."'"));
			break;
		case '12':
			return guide_test($explain_test_bono,$_POST['index']);
			
			break;
		case '13'://buscar las maquinas virtuales de un dominio
			// echo "ok";
			echo '<option value="">Elegir...</option>';
			$vms=vmOfDomain($_POST['domain']);
			foreach( $vms as $key=>$arrayKey){
				foreach( $arrayKey as $element){
					echo '<option value="'.$element['id_server'].'">'.$element['name_server'].'</option>';
				}
			}
			
			
			break;
		case '14'://Crea el host y agrega los dataQueries y templates disponibles. luego regresa la informacion requerida para crear la grafica
			//crea el host
			$host_id=deviceId($_POST['idVm']);	
			$separador2='"|"';
			$separador1='":"';
			$optionsNewGraph=array(
				"dataTemplate"=>array()
			);
			$listTemplate=shell_exec("php -q cli/add_graphs.php --list-graph-templates | awk '{ print $1$separador1$2 $3 $4 $5 $6 $7 $8 $9$separador2}' | tail -n +2");
			$listTemplate= explode('|', $listTemplate);
			array_push($optionsNewGraph['dataTemplate'], '<option value="">Elegir...</option>');	
			for ($i=0; $i < count($listTemplate) - 2; $i++) { 
				$template= explode(':', $listTemplate[$i]);
				array_push($optionsNewGraph['dataTemplate'],'<option value="'.ltrim($template['0']).'">'.$template['1'].'</option>');	
			}
			print_r(json_encode($optionsNewGraph));
			
			break;
		case '15'://consulta el array de busqueda
			
			print_r(json_encode($content_menu_vertical));
			
			break;
		case '16':
			consult_flavors_openstack();
			print_r(draw_table_flavors_openstack());
			break;
		case '17':
			consult_images_openstack();
			print_r(draw_table_images_openstack());
			break;
		case '18':
			consult_servers_openstack();
			print_r(draw_table_servers_openstack());
			break;
		case '19':
			consult_subnets_openstack();
			print_r(draw_table_subnets_openstack());
			break;
		case '20':
			consult_ports_openstack();
			print_r(draw_table_ports_openstack());
			break;
		case '21':
			consult_flotantIp_openstack();
			print_r(draw_table_flotantIp_openstack());
			break;
		case '22':
			
			print_r(draw_table_testbed_pruebas($_POST['user']));
			break;
		case '23':
			
			print_r(db_execute("delete from solicitud_arq where id='".$_POST['idQuery']."'"));
			displayCardsArq( $_POST['userEmail'], $_POST['userName'] );
			break;


		default:
			echo ("sin funcion");
			break;
	}
}else{
	
	consult_flavors_openstack();
	consult_servers_openstack();
	consult_subnets_openstack();
	consult_images_openstack();
	consult_ports_openstack();
	consult_flotantIp_openstack();
	echo "actualizado";

}

