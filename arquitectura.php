<?php
global $contenido_arquitectura, $config;

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
	
	    

	
		<form>
			<input type="hidden" id="to_email" value="rubengutierrez@unicauca.edu.co">
			<input type="hidden" id="from_email" value="<?php echo"$from_email";?>">
			<input type="hidden" id="cuerpo" value="Se realiza la solicitud de habilitar la arquitectura">
			<input type="button" value="Solicitar arquitectura" onclick="enviar()">

		</form>
	<script type="text/javascript">
		function enviar()

			{	



				
				// confirm("aceptar");
				// Esta es la variable que vamos a pasar

				// var to_email=$("#to_email").val();
				// var from_email=$("#from_email").val();
				// var cuerpo=$("#cuerpo").val();
				
				var consulta1 = confirm("A seleccionado arquitectura " + arquitectura + " para realizar la solicitud de recursos,\n marque aceptar");
				if (consulta1) {
					var consulta2 = confirm("acepta los terminos y condiciones .... " +arquitectura);
					if (consulta2) {
						window.location = "pruebas.php?arq="+arquitectura;
					}
				}
				// 	$.post('enviar_mail.php',{post_to_email:to_email,post_from_email:from_email,post_sujeto:arquitectura},function(respuesta){
				// 			// alert(respuesta);
				// 			document.write(respuesta);

				// 			<?php
				// 			// send_mail($from_email, "rubengutierrez@unicauca.edu.co",, "prueba correo3");?>

				// 	});
					
				}
				
			
	</script>
	<?php 

	
	?>





</div>