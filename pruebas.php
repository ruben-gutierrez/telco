<?php 

 global $contenido_pruebas, $email_array;
 include('./include/auth.php');
 top_header();
if (isset($_GET['arq'])) {
	$from_email = db_fetch_cell_prepared('SELECT email_address FROM user_auth WHERE id =  ?', array($_SESSION['sess_user_id']));
	send_mail("rubengutierrez@unicauca.edu.co", "rubengutierrez@unicauca.edu.co" , "Solicitud arquitectura IMS" , "Se realiza la solicitud para la asignacion de la arquitectura ". $_GET['arq']. " para realizar, ya que tengo en conocimiento el reglamento ...., Solicitante ".$from_email);
		header("location:pruebas.php");
	
}
?>

<div class="margin_page">
	<h1 class="titulo_arquitectura">Servicios Ambiente de Prueba IMS</h1>
	<div >
		<!-- ponemos la tabla como menu -->
		<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
		<!-- <table class="content_testbed"> -->
		<table id="tabla" class="tabla_contenido">
			<?php 
			draw_table_testbed_pruebas($contenido_pruebas);
			?>
		</table>
	</div>
</div>