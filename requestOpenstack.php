<?php 
global $current_user;

include('./include/global.php');



// saber si post tiene valor
//si $_POST tiene valor entonces se asigna solicitud, se revisa si hay arq disponibles y luego se asigna.
//de lo contrario el archivo se ejecuta desde el crontab y se debe verificar si se termino el tiempo de una asignacion
//

if (!empty($_POST)) {
    $action=$_POST['action'];
    switch ($action) {
        case '1':
            $ans=deleteVm($_POST['idServer']);
            if ($ans == "1") {
                // borrar id de mysql y tabla
            }
            return $ans;
            break;
        case '1':
            # code...
            break;
        case '1':
            # code...
            break;
        
        default:
            # code...
            break;
    }
}else {
    echo("Sin informacion");
}