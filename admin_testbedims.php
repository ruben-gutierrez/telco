<?php
global $config, $current_user;

//autentica la pagina en la cual esta
 include('./include/auth.php');
// include('./include/global.php');
//agregar header y la barra lateral de navegación
 top_header();
 delete_info_openstack();
 ?>


 <!-- contenido admin -->
 	<!-- // arquitecturas -->


 	<div class="admin_ims">
 		<section class="section_admin_arquitecuta">
 	
			<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('section_admin_arquitectura', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b> Arquitecturas en testbed IMS</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>
			
 			<div class="content_section"><p>En esta sección se puede agregar, modificar eliminar y ilberar las arquitecturas disponibles en el testbed</p></div> 
	 		<section id="table_arquitectura" class="section_admin_arquitectura" >
			
				<div class="content_section">
					
		 			<table id="table_estado_arq" class="table table-striped ">
		 				<thead>
		 					<tr>
		 						<th scope="col">Arquitectura</th>
		 						<th scope="col">Dominio</th>
		 						<th scope="col" class='edisplay'>descripcion</th>
		 						<th scope="col" class='edisplay'>Imagen</th>
		 						<th scope="col">Usuario</th>
		 						<th scope="col">Acción</th>
		 					</tr>
		 				</thead>
		 				<tbody id="contenido_arq_state">
		 				<?php 
		 				draw_table_estate_arq(); ?>
		 				</tbody>
		 			</table>
		 			<button class="btn btn-primary text-center" id="display_add" onclick="$('#add_arq').show(500); $('#table_arquitectura').hide(500);$('#btn_notsee_table').hide();$('#btn_see_table').show(); $('section.section_admin_arquitectura').focus();"><i class="fa fa-sitemap"> | Nuevo</i></button>
		 		</div>	
	 		</section>

	 		<section id="add_arq" class="section_admin_arquitectura" tabindex='0' style="display: none;">
	 			<div class="name_section bg-dark">Agregar arquitectura</div>
	 			<div class="content_section container-6 ">
	 				<form method="post" id="form_new_arq" class="form_arq" enctype="multipart/form-data">
	 					<input type="hidden" name="action" value="3">
						 <div class="row">
							<div class="col">
								<label class="col-6" for="name_arq">Nombre de arquitectura</label>
								<input class="col-6" type="text" name="name_arq" placeholder="Nombre" autofocus required>
								<label class="col-6" for="dominio_arq">Dominio de arquitectura</label>
								<input class="col-6" type="text" name="dominio_arq" placeholder="Dirección de red" required>
								<label class="col-6" for="type">Seleccione el tipo de arquitectura</label>
								<select class="col-6" type="select" name="type">
									<option value="aio">Todo en uno</option>
									<option value="dist">Distribuida</option>
									<option value="dist_pstn">Distribuida + PSTN</option>
								</select> 
								<label class="col-6" for="desc_arq">Descripción</label>
								<textarea name="desc_arq" placeholder="Texto menor de 400 caracteres" required></textarea>
							</div>
							<div class="col">

								<div class="col">
									<label class="col-6" for="vm_aditional">Máx VM adicionales</label>
									<input class="col-6" type="number" name="max_vm_aditional" placeholder="Número entero" required>
								</div>
								<div class="col">
									<label class="col-6" for="vm_aditional">Máx RAM por vm</label>
									<input class="col-6" type="number" name="max_ram" placeholder="Mb" required>
								</div>
								
								<div class="col">
									<label class="col-6" for="vm_aditional">Max vcpu por vm</label>
									<input class="col-6" type="number" name="max_vcpu" placeholder="Ej: 1" required>
								</div>
								<div class="col">
									<label class="col-6" for="vm_aditional">Máx disk por vm</label>
									<input class="col-6" type="number" name="max_disk" placeholder="Gb" required>
								</div>
								<label for="image"><h3>Imagen de arquitectura</h3></label>
								<input type="file" name="image" accept=".jpg, .jpeg, .png" required>
							</div>
						</div>
						<div class="row center mt-3">

							<input id="btn_new_arq" name="btn_save" class="btn_form btn btn-primary" type="button" value="Guardar" onclick="add_arquitec()">
							<input  id="btn_cancelar" class="btn_form btn btn-outline-danger" type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#add_arq').hide(600);$('#btn_notsee_table').show();$('#btn_see_table').hide();">
						</div>
					
		 				
		 			</form>
	 			</div>
	 		</section>
	 		<section id="mod_arq" class="section_admin_arquitectura" style="display: none;">
	 			<div class="name_section">Editar arquitectura</div>
	 			<div class="content_section container">

					 <form method="post" id="form_edit_arq" class="form_arq" enctype="multipart/form-data">
					 <div class="row">
					 	<div class="col-8">
							<input type="hidden" name="action" value="5">
							<div class="col mt-3">
								<label class="col-6" for="name_arq">Nombre de arquitectura</label>
								<input class="col" type="text" id="name_arq" name="name_arq" placeholder="Nombre" autofocus>
							</div>
							<div class="col mt-3">
								<label class="col-6" for="dominio_arq">Domino de arquitectura</label>
								<input class="col" type="fixed" id="dominio_arq" name="dominio_arq">
							</div>
							<div class="col mt-3">
								<label class="col-6" for="desc_arq">Descripcion de arquitectura</label>
								<textarea class="col" name="desc_arq" id="desc_arq" placeholder="Max 50 caracteres"></textarea>
							</div>
							<div class="col mt-3">
								<label class="col-6" for="image"> Imagen de arquitectura</label>
								<input class="col" type="file" name="image" accept=".jpg, .jpeg, .png">
							</div>
						 </div>
						 <div class="col-4">
							
							<div class="col mt-3">
								<label class="col-6" for="vm_aditional">Máx VM adicionales</label>
								<input class="col" type="number" name="max_vm_aditional" placeholder="Número entero" id="restriction_mv" value="" required>
							</div>
							<div class="col mt-3">
								<label class="col-6" for="vm_aditional">Máx RAM por vm</label>
								<input class="col" type="number" name="max_ram" placeholder="Mb" value="" id="restriction_ram" required>
							</div>

							<div class="col mt-3">
								<label class="col-6" for="vm_aditional">Max vcpu por vm</label>
								<input class="col" type="number" name="max_vcpu" placeholder="Ej: 1" id="restriction_vcpu" value="" required>
							</div>
							<div class="col mt-3">
								<label class="col-6" for="vm_aditional">Máx disk por vm</label>
								<input class="col" type="number" name="max_disk" placeholder="Gb" id="restriction_disk" value="" required>
							</div>
						</div> 
					</div>
						 <div class="col center">
		 					<!-- <input type="hidden" name="action" value="7"> -->
		 					<input id="btn_edit_arq" class="btn_form btn btn-primary" type="button" value="Guardar" onclick="edit_arq()">
		 					<input  id="btn_cancelar" class="btn_form btn btn-outline-danger" type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#mod_arq').hide(600);">
		 				</div>
		 				
		 				
		 			</form>
	 			</div>
	 		</section>
 		</section>
 		<section class="section_admin_arquitecuta">
			<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('content_restrictions', 'indicate_solicitedArquitecture')">
					<a class="navbar-brand text-white"><b> Restricciones</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>	 
			 
 			<div class="content_section container">
			 	<label>Restricciones del testbed IMS</label>
				<div class="content_restrictions" style="display:none">
					<div class="row">
							

					
						<div id="content_arqByUsuary" class="col content_arqByUsuary">
						<label>Arquitecturas a reservar:<label id="number_actual"><?php echo(db_fetch_cell_prepared("select value_info from data_testbedims where id_data='1'")); ?></label></label>

							<form class="form_arq" method="post" id="form_arq_by_user">
								<input type="hidden" name="action" value="7">
								<input type="number" name="numero" value="1" required>
								<input class="btn btn-outline-warning" type="button" name="btn_set" value="Cambiar" onclick="change_arqs_by_user()">
							</form>
						</div>
				
						
						<div id="content_day_asig" class="col day_asig">
							<label>Dias de asignación:<label id="number_day_actual"><?php echo(db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'")); ?></label></label>
							<form class="form_arq" method="post" id="form_day_asig">
								<input type="hidden" name="action" value="8">
								<input type="number" name="numero" value="1" required>
								<input class="btn btn-outline-warning" type="button" name="btn_set" value="Cambiar" onclick="change_day_asig()">
							</form>
						</div>
						


					</div>
						
					



					
				</div>
 			</div>
 		</section>

























		 

 		<section  id="info_arq" class="section_admin_arquitecuta" tabindex="0">
		 	<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('type_arq', 'indicate_solicitedArquitecture')">
					<a class="navbar-brand text-white"><b> Agregar Tipo de Arquitectura</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>	
 			<div class="content_section">
 					<label>Seleccione el tipo de nucleo</label>
 					<div id="content_infor_arq" style="display: none;" class="type_arq">

					 	<div id="info_select_arq" class="container">
						 	<?php
							 // info_select_arq();
							 type_coreIMS();
						 	?>
	 					
						</div>
	 				</div>
 			</div>
 		</section>

 		<section id="test_dom" class="section_admin_arquitecuta">
		 	<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('add_test', 'indicate_solicitedArquitecture')">
					<a class="navbar-brand text-white"><b> Agregar Prueba</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>
			<div class="content_section">
					<label>Agregar prueba a una arquitectura</label>
					<div id="content_add_test" style="display: none;" class="add_test">
						<div id='form_1'>
							<form method="post" id="form_add_test" class="form_arq" enctype="multipart/form-data">
								<input type="hidden" name="action" value="10">
								<label>Seleccione la arquitectura a la cual se agregara una prueba</label>
								<select name="dominio">
									<option value="">Seleccionar</option>
									<?php
										$dominios=db_fetch_assoc("select dominio from arqs_testbedims");

										foreach ($dominios as $key => $value) {
											print("<option value='".$value['dominio']."'>".$value['dominio']."</option>");
										}
									?>	
				 				</select>
				 				<label>Nombre de la prueba</label>

			 						
		 						<input type="text" name="name_test" placeholder="Nombre de identificación de la prueba" required>
			 						
									
			 						<!-- <input type="text" name="comand_test" placeholder="Comando de prueba"> -->
			 						<!-- <input type="text" name="description_test" placeholder="Descripcion"> -->
			 					<label>Descripción de la prueba</label>
		 						<textarea name="description_test" placeholder="	Descripcion" required></textarea>
								<label>Indique las restricciones de la prueba</label>
		 						<input type="text" name="restriction_test" placeholder="Restricción" required>
		 						<label><h3>Archivo XML </h3></label>
		 						<input type="file" name="file_test" required>
									
		 						<div>
			 						<input type="button" class="btn_form btn btn-primary btn-sm" id="btn_save_info" value="Agregar" onclick="add_test()">
			 						<input type="button" class="btn_form btn btn-outline-danger btn-sm" value="Cancelar" onclick="$('#content_add_test').hide();$('#btn_see_table5').show();$('#btn_notsee_table5').hide();$('#form_add_test')[0].reset();">
		 						</div>
			 				</form>
			 					
						</div>
						<div id='form_2'  style="display: none;">
		 					<form method="post" id="form_info_test" class="form_arq">
		 						<input type="hidden" name="action" value='11' required>
								<input type="hidden" name="id_test" value=''>
		 						<input type="text" name="options" placeholder="Opción de la prueba" required>
		 						<input type="text" name="value" placeholder="Dato que se debe agregar" required>
		 						<textarea name="description_option" placeholder="Descripcion" required></textarea>
		 						
		 						<div>
		 						<input type="button" class="btn_form btn btn-primary" id="btn_save_info" value="Guardar" onclick="add_info_test();">
		 						<input type="button" class="btn_form btn btn-outline-danger" value="Cancelar" onclick="$('#btn_see_table5').show();$('#btn_notsee_table5').hide();$('#form_add_test')[0].reset();$('#form_info_test')[0].reset();$('#form_1').show();$('#form_2').hide();$('#content_add_test').hide();">
		 						</div>
		 					</form>
						</div>
				
 				</div>
			</div>
		</section>

		
	<section class="section_arquitecture">
		<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('networks_openstack', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Arquitecturas de Openstack</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
		</nav>

		<div class="row networks_openstack">
			<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
				<table class="table table-striped table_arq_byUser">
				
				  <thead>
				    <tr>
				      <th scope="col">Id de Red</th>
				      <th scope="col">Nombre de Red</th>
				      <th scope="col">Descripcion</th>
				      <th scope="col">Dominio</th>
				      <th scope="col">Estado</th>
				    </tr>
				  </thead>
				  <tbody>
					<?php 
					draw_table_nets_openstack();
					?>
				  </tbody>
				</table>

			</div>
		</div>

	</section>

	<section class="section_arquitecture">
		<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('flavors_openstack', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Flavors de Openstack</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
		</nav>

		<div class="row flavors_openstack">
			<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
				<table class="table table-striped table_flavors_openstack">
				
				  <thead>
				    <tr>
				      <th scope="col">Id Flavor</th>
				      <th scope="col">Nombre Flavor</th>
				      <th scope="col">RAM</th>
				      <th scope="col">Disco</th>
				      <th scope="col">Virtual CPU</th>
				      <th scope="col">Publico</th>
				    </tr>
				  </thead>
				  <tbody>
					<?php 
					draw_table_flavors_openstack();
					?>
				  </tbody>
				</table>

			</div>
		</div>

	</section>
	<section class="section_arquitecture">
		<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('images_openstack', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Imagenes alojadas en Openstack</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
		</nav>

		<div class="row images_openstack">
			<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
				<table class="table table-striped table_images_openstack">
				
				  <thead>
				    <tr>
				      <th scope="col">Id Imagen</th>
				      <th scope="col">Nombre Imagen</th>
				      <th scope="col">Estado</th>
				    </tr>
				  </thead>
				  <tbody>
					<?php 
					draw_table_images_openstack();
					?>
				  </tbody>
				</table>

			</div>
		</div>

	</section>

	<section class="section_arquitecture">
		<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('servers_openstack', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Instancias de Openstack</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
		</nav>

		<div class="row servers_openstack">
			<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
				<table class="table table-striped table_servers_openstack">
				
				  <thead>
				    <tr>
				      <th scope="col">Id server</th>
				      <th scope="col">Nombre Instancia</th>
				      <th scope="col">Id Imagen</th>
				      <th scope="col">IP Local</th>
				      <th scope="col">IP Public</th>
				      <th scope="col">Id Flavor</th>
				      <th scope="col">Key Name</th>
				      <th scope="col">Estado</th>
					  <th scope="col">Grupo de Seguridad</th>
					  <button onclick=""></button>
				    </tr>
				  </thead>
				  <tbody>
					<?php 
					draw_table_servers_openstack();
					?>
				  </tbody>
				</table>

			</div>
		</div>

	</section>


	<section class="section_arquitecture">
		<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('subnets_openstack', 'indicate_solicitedArquitecture')">
				<a class="navbar-brand text-white"><b>Subredes de Openstack</b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
		</nav>

		<div class="row subnets_openstack">
			<div class="col-md">
					<!-- <button class="btn btn-primary" onclick="">test</button> -->
				<table class="table table-striped table_servers_openstack">
				
				  <thead>
				    <tr>
				      <th scope="col">Id Subred</th>
				      <th scope="col">Nombre Subred</th>
				      <th scope="col">Descripción</th>
				      <th scope="col">Id Red</th>
				      <th scope="col">Ip Subred</th>
				      <th scope="col">Gateway</th>
				    </tr>
				  </thead>
				  <tbody>
					<?php 
					draw_table_subnets_openstack();
					?>
				  </tbody>
				</table>

			</div>
		</div>

	</section>
	<section class="section_admin_arquitecuta">
			<nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('info_page', 'indicate_info_page')">
					<a class="navbar-brand text-white"><b> Contenido Pagina Información</b></a><div class="float-right indicate_info_page"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
			</nav>
 			<div class="content_section">
 					<label>Cambiar informacion de la pagina principal</label>
 					<div id='content_info_page' style="display: none;" class="info_page">
					<?php  
						admin_info_page();
					?>
					
 					
	 				</div>
 					
 			</div>
		 </section>
 	</div>


	 