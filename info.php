<?php


 include('./include/auth.php');
 global $contenido_info;
 top_header();
?>
 
<div class="margin_page">
	<h1 class="titulo_arquitectura">Informacion del testbed</h1>
	<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
	<div >
		<!-- ponemos la tabla como menu -->
		<table class="content_testbed">
			<?php draw_table_testbed($contenido_info); ?>
		</table>
	</div>
</div>