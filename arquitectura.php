<?php
global $contenido_arquitectura, $config, $current_user;

//autentica la pagina en la cual esta
// include('./include/global.php');
include('./include/auth.php');

//agregar header y la barra lateral de navegación

 top_header();

$username=$current_user['username'];
$from_email=$current_user['email_address'];


?>


<div class="container" id="status-loading"></div>
<!-- Modal -->
<div class="modal fade " id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Máquina virtual</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
<!-- Fin modal -->


	<div class="container" id="status-loading" style="position: fixed"></div>




<div class="margin_page">
	<div class="content"></div>
		<section class="section_arquitecture ancla" id="request_arquitecture">
			<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('request_arquitecture', 'indicate_requestArquitecture')">
				<a class="navbar-brand text-white"><b>Solicitar Arquitectura</b></a><div class="float-right indicate_requestArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>
			<div class="row request_arquitecture">
				<!-- <h1 class="titulo_arquitectura">Lista de Arquitecturas</h1> -->
				<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.</div>
				<!-- //tabla y boton de solicitud  -->
				<div class="col-md">
					<!-- ponemos la tabla como menu -->
					<?php

						displayCardsArq($contenido_arquitectura, $current_user);

					?>


					<!-- <table id="tabla" class="tabla_contenido">
						<tr class='display' id="fila0">
							<td id='subtitle'>Arquitectura</td> 
							<td>Descripcion</td> 
							<td>Imagen</td>
						</tr> -->

						<?php 
						// draw_table_testbed_arquitectura($contenido_arquitectura); 
						?>
					<!-- </table> -->
				
					<!-- <form action="" class="formulario_solicitud">
						<input type="hidden" id="to_email" value="rubengutierrez@unicauca.edu.co">
						<input type="hidden" id="username" value="<?php echo($username);?>">
						<input type="hidden" id="from_email" value="<?php echo($from_email);?>">
						<input type="hidden" id="cuerpo" value="Se realiza la solicitud de habilitar la arquitectura">
						<input class="btn btn-primary btn-lg float-right" type="button" value="Solicitar arquitectura" onclick="solicituar_arquitectura('','','','old')">
					</form> -->
			</div>
		</section>
		
		<section class="section_arquitecture ancla" id="solicited_arquitecture">
			<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('solicited_arquitecture', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Arquitecturas Reservadas</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>

			<div class="row solicited_arquitecture" >
			
				<!-- <h1 class="titulo_arquitectura">Lista de Arquitecturas</h1> -->
				<div class="description_page_testbed">Arquitectuas asignadas, en esta sección puedes verificar las arquitecturas asignadas a tu cuenta de usuario para luego modificar la escalabilidad vertical de ellas teniendo la capacidad de moficicar la capacidad de la memoria RAM, disco duro y capacidad e procesador.</div>
				<!-- //tabla y boton de solicitud  -->
				<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
					<table class="table table-striped table_arq_byUser">
					
					<thead>
						<tr>
						<th scope="col">#</th>
						<th scope="col">Arquitectura</th>
						<th scope="col">Dominio</th>
						<th scope="col">Opciones</th>
						</tr>
					</thead>
					<?php 
					echo'<tbody class="arqAsingUser" id="'.$current_user['email_address'].'">';
						?>
						<?php draw_table_domainsOfUser($from_email); ?>
						
					</tbody>
					</table>

				</div>
			</div>

		</section>



		<script type="text/javascript">
		function solicituar_arquitectura(to_email,from_email, username, arquitectura_selec){ 
			// Estas son variables a pasar por post
			// console.log(arquitectura_selec);
		if (arquitectura_selec =='old') {
			var to_email=$("#to_email").val();
			var from_email=$("#from_email").val();
			// var cuerpo=$("#cuerpo").val();
			var username=$("#username").val();
			var arquitectura_selec=arquitectura;
		}

			var accion='1';
			
			// confirmar solicitud de arquitectura
			var consulta1 = confirm("A seleccionado arquitectura " + arquitectura_selec + " para realizar la solicitud de recursos,\n marque aceptar");
			// Eventos testbed, agregar notificacion, evento solicitud de arquitectura---------------------------------

			// agregar solicitud de arquitectura a sql
			$.post('solicitud_asignacion.php',{post_to_email:to_email,post_from_email:from_email,post_arquitectura:arquitectura_selec,post_username:username,action:accion},function(respuesta){
				alert(respuesta);
				refreshTableArqByUser();
				<?php
				// send_mail($from_email, "rubengutierrez@unicauca.edu.co",, "prueba correo3");?>
			});
			//    window.location = "pruebas.php?arq="+arquitectura;
		}


		
		

		</script>

	</div>





 
