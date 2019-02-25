<?php
global $config, $current_user;

//autentica la pagina en la cual esta
 include('./include/auth.php');

//agregar header y la barra lateral de navegación
 top_header();?>

 <!-- contenido admin -->
 	<!-- // arquitecturas -->

 	<div class="admin_ims">
 		<section class="section_admin_arquitecuta">
 			<div class="name_section"><h4>Administrar arquitecturas en testbed IMS</h4></div>
 			<div class="content_section"><p>
 		En esta pagina se puede agregar, modificar eliminar y ilberar las arquitecturas disponibles en el testbed</p></div> </section>
 		<section id="table_arquitectura" class="section_admin_arquitectura">
		<div class="name_section">Estado de arquitecturas disponibles</div>
			<div class="content_section">
	 			<table id="table_estado_arq" class="table_estado_arq">
	 				<thead>
	 					<tr>
	 						<th>Arquitectura</th>
	 						<th>Dominio</th>
	 						<th class='edisplay'>descripcion</th>
	 						<th class='edisplay'>Imagen</th>
	 						<th>Usuario</th>
	 						<th>Accion</th>

	 					</tr>
	 					
	 				</thead>
	 				<tbody id="contenido_arq_state">
	 				<?php 
	 				draw_table_estate_arq(); ?>
	 				</tbody>
	 			</table>
	 			<button id="display_add" onclick="$('#add_arq').show(500)">Nuevo</button>
	 		</div>	
 		</section>

 		<section id="add_arq" class="section_admin_arquitectura" style="display: none;">
 			<div class="name_section">Agregar arquitectura</div>
 			<div class="content_section">
 				<form method="post" id="form_new_arq" class="form_arq" enctype="multipart/form-data">
 					<input type="hidden" name="action" value="3">
 					<input type="text" name="name_arq"placeholder="Nombre">
 					<input type="text" name="dominio_arq" placeholder="Dominio">
 					<textarea name="desc_arq" placeholder="Descripcion"></textarea>
	 				<label><h3>Imagen de arquitectura</h3></label>
	 				<input type="file" name="image" accept=".jpg, .jpeg, .png">
	 				<div>

	 					<input id="btn_new_arq" name="btn_save" class="btn_form" type="button" value="Guardar" onclick="add_arquitec()">
	 					<input  id="btn_cancelar" class="btn_form"type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#add_arq').hide(600);">
	 				</div>
	 				
	 				
	 			</form>
 			</div>
 		</section>
 		<section id="mod_arq" class="section_admin_arquitectura" style="display: none;">
 			<div class="name_section">Editar arquitectura</div>
 			<div class="content_section">
	 			<form method="post" id="form_edit_arq" class="form_arq" enctype="multipart/form-data">
	 				<input type="hidden" name="action" value="5">
	 				<input type="text" id="name_arq" name="name_arq"placeholder="Nombre">
 					<input type="text" id="dominio_arq" name="dominio_arq" placeholder="Dominio">
 					<textarea name="desc_arq" id="desc_arq" placeholder="Descripcion"></textarea>
	 				<label><h3>Imagen de arquitectura</h3></label>
	 				<input type="file" name="image" accept=".jpg, .jpeg, .png">
	 				<div>
	 					<input id="btn_edit_arq" class="btn_form" type="button" value="Guardar" onclick="edit_arq()">
	 					<input  id="btn_cancelar" class="btn_form" type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#mod_arq').hide(600);">
	 				</div>
	 				
	 				
	 			</form>
 			</div>
 		</section>
 		
 	</div>
