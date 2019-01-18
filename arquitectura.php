<?php
global $contenido_arquitectura;

//autentica la pagina en la cual esta
 include('./include/auth.php');

//agregar header y la barra lateral de navegación
 top_header();
?>

<div class="margin_page">
	<h1 class="titulo_arquitectura">Lista de Arquitecturas</h1>
	<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
	
	<div >
		<!-- ponemos la tabla como menu -->
		<table id="tabla" class="tabla_contenido">
			<?php draw_table_testbed_arquitectura($contenido_arquitectura); ?>
		</table>
	</div>
	

	<!-- boton enviar email -->
	<!-- ---------------------------------------------------------------------------------- -->
	<!-- send_mail($to, $from, $subject, $body, $attachments = '', $headers = '', $html = false) -->
	<script type="text/javascript">
		function configurar_pruebas(){
			// guardar informacion de la configuracion de la arquitectura.
			// enviar correo con la informacion de la arquitectura(tipo de arquitectura , quien solicita la arquitectura)
			// var result="<?php 
			// send_mail("rubengutierrez@unicauca.edu.co", "rubengutierrez2991@gmail.com", "ruben4", "prueba correo3");?>"
			location.href="pruebas.php";
			
		}
	</script>
	<form>
		<input type="button" name="solicitar" value="Solicitar arquitectura y configurar pruebas" onclick="configurar_pruebas()">
		
	</form>

	<?php 


	// email_test();
	// send_mail("rubengutierrez@unicauca.edu.co", "rubengutierrez2991@gmail.com", "ruben 3", "prueba correo3");
	
	?>
	<!-- fin enviar email------------------------------------------- -->





</div>