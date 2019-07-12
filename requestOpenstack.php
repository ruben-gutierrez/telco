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
            // echo $_POST['idServer'];
            $ans=deleteVm($_POST['idServer']);
            // if ($ans == "1") {

                db_execute_prepared("DELETE FROM server_openstack WHERE id_server = '".$_POST['idServer']."'");
                db_execute_prepared("DELETE FROM vm_aditional_testbedims WHERE id_server = '".$_POST['idServer']."'");
                db_execute_prepared("DELETE FROM core_domain WHERE id_server = '".$_POST['idServer']."'");
            // }
            print_r($ans);
            break;
        case '2':
            // echo $_POST['idServer'];
            print_r(onVm($_POST['idServer']));
           break;
        case '3':
            print_r(offServer($_POST['idServer']));
            break;
        case '4':
            // print_r(startServer($_POST['idServer']));
            break;
        case '5':
            print_r(pauseServer($_POST['idServer']));
            break;
        case '6':
            print_r(unpauseServer($_POST['idServer']));
            break;
        case '7':
            print_r(createRouter($_POST['nameRouter']));
            break;
        case '8':
            $idFlavor=id_flavor($_POST['ram'],$_POST['vcpu'], $_POST['disk']);
            print_r( reziseServer($_POST['idServer'], $idFlavor) );
            break;
        case '1':
            # code...
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