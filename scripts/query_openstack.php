<?php 
global $current_user;

include('./include/global.php');
// include('./include/auth.php');


// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//
// print_r($_POST);
if (!empty($_POST)) {
	
// echo $now;
	// obtener vablabes a usar
	$accion= $_POST['action'];	
	$id= $_POST['id'];
	switch ($accion) { 

        case "1":
            echo shell_exec("./createToken.sh");
            break;
        default:
            echo ("sin funcion");
            break;
    }
}else{
	
echo "No hay datos";
	
}
?>

