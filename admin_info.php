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
		default:
			echo ("sin funcion");
			break;
	}
}else{
	
echo "No hay datos";
	
}
