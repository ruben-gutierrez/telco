<?php 
global $current_user;

include('./include/global.php');
include('./lib/functions.php');
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
    $name_net=$_POST['name_net'];	
    $id= $_POST['id'];
	switch ($accion) { 

        case "1": //agregar una red
            // echo (shell_exec("../test.sh"));
            create_net('1','2','1');
            
            // $respuesta=shell_exec("./request_openstack.sh $name_net");
            // $arrayJson = json_decode($respuesta, true);
            // if(key($arrayJson) == "error" || $arrayJson == ''){
            //     echo "Fallo";
            // }else{
            //     echo "Exito agregando la red";
            // }
            // INSERT INTO network_openstack(id_net, name_net, description_net,domain) values ('3e15e4e1-5317-49c8-b043-f1ca4ed51767','212', 'description fail', '10.55.5.12');
            // foreach($arrayJson as $key => $valor){
                // print_r($valor);
                // echo("---------------");
                // print_r($key);
            // }
            // print_r(key($arrayJson)) ;
                
            break;
        default:
            echo ("sin funcion");
            break;
    }
}else{
	
echo "No hay datos";
	
}
?>

