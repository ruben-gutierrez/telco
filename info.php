<?php


 include('./include/auth.php');
 global $contenido_info,$contenido_info2, $contenido_info3 ;
 top_header();
?>
 
<div class="margin_page">
	<h1 class="titulo_arquitectura">Informacion del testbed</h1>
	<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
	<div >
		<?php  
						show_info_page();
					?>
		<!-- ponemos la tabla como menu -->
		 <table class="content_testbed_info">
			<?php
			 draw_table_testbed2($contenido_info); 
			draw_table_testbed2($contenido_info2);
			draw_table_testbed2($contenido_info3);?>
		</table> 
	</div>
</div>