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
	switch ($accion) { 

		case "1": //borrar elemento de la seccion de info
			$name_column=db_fetch_cell("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '".$_POST['table']."' LIMIT 1");
			$del=db_execute("delete from ".$_POST['table']." where ".$name_column."='".$_POST['id']."'");
			echo $del;
			break;
		case "2": //agregar titulo
			// $id_add=$_POST['id']+1;
			// $name_column=db_fetch_cell("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '".$_POST['table']."' LIMIT 1");
			$update=db_execute("UPDATE title_info_page SET id_title = id_title + 1 WHERE id_title > '".$_POST['id']."' ORDER BY id_title DESC");
			$add=db_execute("insert into title_info_page (id_title,main_title) values ('".$_POST['id']."'+1, '".$_POST['main_title']."')");
			if ($add==1) {
				admin_info_page();
			}
				// $add=db_execute("insert into ".$_POST['table']." (id_tite, type, content,".$name_column.",main_title) values ('".$id_add."', '".$_POST['main_title']."')");
			break;
		case "3": //agregar contenido
			$update=db_execute("UPDATE content_info_page SET id_content = id_content + 1 WHERE id_content > '".$_POST['id_content']."' ORDER BY id_content DESC");
			$add=db_execute("insert into content_info_page (id_content, id_title, type, content) values ('".$_POST['id_content']."'+1, '".$_POST['id_title']."', '".$_POST['type']."','".$_POST['content']."')");
			if ($add==1) {
				admin_info_page();
			}else{
				echo $update;
			}
			break;
		case "4": //editar titulo
			$update=db_execute("UPDATE title_info_page SET main_title = '".$_POST['main_title']."' WHERE id_title = '".$_POST['id']."'");
			if ($update==1) {
				admin_info_page();
			}
			break;
		case "5": //editar contenido
			$update=db_execute("UPDATE content_info_page SET type = '".$_POST['type']."', content = '".$_POST['content']."' WHERE id_title = '".$_POST['id_title']."' and id_content='".$_POST['id_content']."'");
			if ($update==1) {
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
				admin_info_page();
			}
			break;
		case "7": //mover contenido en titulos
			// print_r($_POST);
			$id_max=db_fetch_cell("select MAX(id_content) from content_info_page");
			// el id que voy a mover lo ponto de ultimo
			$update=db_execute("UPDATE content_info_page SET id_content = '".$id_max."'+1 WHERE id_content = '".$_POST['id_content']."'");
			if ($_POST['direc']=='up') {
				// el elemento de arriba lo bajo una casilla
				$id_dest=db_fetch_cell("SELECT id_content from content_info_page where id_content=(select max(id_content) from content_info_page where id_content<'".$_POST['id_content']."' AND id_title='".$_POST['id_title']."')");
				
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
				admin_info_page();
			}
			break;
		default:
			echo ("sin funcion");
			break;
	}
}else{
	
echo "No hay datos";
	
}
