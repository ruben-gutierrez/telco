<?php
global $contenido_arquitectura, $config, $current_user;

//autentica la pagina en la cual esta
 include('./include/auth.php');

//agregar header y la barra lateral de navegación
 top_header();

$username=$current_user['username'];
$from_email=$current_user['email_address'];
?>

<div class="margin_page">

	    

	<h1 class="titulo_arquitectura">Lista de Arquitecturas</h1>
	<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
	<!-- //tabla y boton de solicitud  -->
	<div >
		<!-- ponemos la tabla como menu -->
		<table id="tabla" class="tabla_contenido">
			<tr class='display' id="fila0">
				<td id='subtitle'>Arquitectura</td> 
				<td>Descripcion</td> 
				<td>Imagen</td>
			</tr>
			<?php draw_table_testbed_arquitectura($contenido_arquitectura); ?>
		</table>
	
		<form action="" class="formulario_solicitud">
			<input type="hidden" id="to_email" value="rubengutierrez@unicauca.edu.co">
			<input type="hidden" id="username" value="<?php echo($username);?>">
			<input type="hidden" id="from_email" value="<?php echo($from_email);?>">
			<input type="hidden" id="cuerpo" value="Se realiza la solicitud de habilitar la arquitectura">
			<input type="button" value="Solicitar arquitectura" onclick="solicituar_arquitectura()">

		</form>
	</div>
	
	<!-- estado arquitecturas y boton de agrega, eliminar y editar arquitectura -->
	<div>
		<form>
			<table id="tabla_estado_arq" class="estado_arq">
				<?php draw_table_estate_arq(); ?>
			</table>
			<input type="button" value="Liberar arquitectura" onclick="liberar_arquitectura()"> 
			<input type="button" name="" id	value="Eliminar arquitectura" onclick="eliminar_arquitectura()">
			<input type="button" name="" id	value="Editar arquitectura" onclick="editar_arquitectura()">
		</form>
		<form class="form_agregar_arq">
			<input type="text" name="" id="add_nom_arq" placeholder='Nombre' onclick="">
			<input type="text" name="" id="add_dom_arq" placeholder='Dominio'>
			<input type="button" name="" value="Agregar arquitectura" onclick="agregar_arq()">	
		</form>
	</div>

	<script type="text/javascript">
		

    function solicituar_arquitectura(){ 
        // Estas son variables a pasar por post
       
        var to_email=$("#to_email").val();
        var from_email=$("#from_email").val();
        var cuerpo=$("#cuerpo").val();
        var username=$("#username").val();
        var arquitectura_selec=arquitectura;
        var accion='1';
        
        // confirmar solicitud de arquitectura
        var consulta1 = confirm("A seleccionado arquitectura " + arquitectura_selec + " para realizar la solicitud de recursos,\n marque aceptar");
        // Eventos testbed, agregar notificacion, evento solicitud de arquitectura---------------------------------

        // agregar solicitud de arquitectura a sql
          $.post('solicitud_asignacion.php',{post_to_email:to_email,post_from_email:from_email,post_arquitectura:arquitectura_selec,post_username:username,post_accion:accion},function(respuesta){
              alert(respuesta);
              <?php
              // send_mail($from_email, "rubengutierrez@unicauca.edu.co",, "prueba correo3");?>
          });
        //    window.location = "pruebas.php?arq="+arquitectura;
    }
				
			
	</script>

</div>