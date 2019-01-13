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
		<table class="content_testbed">
			<?php draw_table_testbed($contenido_arquitectura); ?>
		</table>
	</div>
	<div class="config_test_execute">
		<h1 class="titulo_arquitectura">Arquitectura seleccionada</h1>
		<img src="href.img">
		
	</div>
</div>