<?php
global $config, $current_user;

//autentica la pagina en la cual esta
 include('./include/auth.php');

//agregar header y la barra lateral de navegación
 top_header();

 ?>

 <!-- contenido admin -->
 	<!-- // arquitecturas -->

 	<div class="admin_ims">
 		<section class="section_admin_arquitecuta">
 			<div class="name_section">
 				<div style="display: inline-block;">
 				<h4>Administrar arquitecturas en testbed IMS</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table" class="btn_arq_action" onclick="$('#table_arquitectura').show();$('#btn_notsee_table').show();$('#btn_see_table').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table" class="btn_arq_action" onclick="$('#table_arquitectura').hide();$('#btn_see_table').show();$('#btn_notsee_table').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>

 			</div>
 			<div class="content_section"><p>En esta sección se puede agregar, modificar eliminar y ilberar las arquitecturas disponibles en el testbed</p></div> 
	 		<section id="table_arquitectura" class="section_admin_arquitectura" style="display: none;">
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
		 			<button id="display_add" onclick="$('#add_arq').show(500); $('#table_arquitectura').hide(500);$('#btn_notsee_table').hide();$('#btn_see_table').show();">Nuevo</button>
		 		</div>	
	 		</section>

	 		<section id="add_arq" class="section_admin_arquitectura" style="display: none;">
	 			<div class="name_section">Agregar arquitectura</div>
	 			<div class="content_section">
	 				<form method="post" id="form_new_arq" class="form_arq" enctype="multipart/form-data">
	 					<input type="hidden" name="action" value="3">
	 					<input type="text" name="name_arq" placeholder="Nombre" autofocus required>
	 					<input type="text" name="dominio_arq" placeholder="Dominio" required>
	 					<textarea name="desc_arq" placeholder="Descripcion" required></textarea>
		 				<label><h3>Imagen de arquitectura</h3></label>
		 				<input type="file" name="image" accept=".jpg, .jpeg, .png" required>
		 				<div>

		 					<input id="btn_new_arq" name="btn_save" class="btn_form" type="button" value="Guardar" onclick="add_arquitec()">
		 					<input  id="btn_cancelar" class="btn_form"type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#add_arq').hide(600);$('#btn_notsee_table').show();$('#btn_see_table').hide();">
		 				</div>
		 				
		 				
		 			</form>
	 			</div>
	 		</section>
	 		<section id="mod_arq" class="section_admin_arquitectura" style="display: none;">
	 			<div class="name_section">Editar arquitectura</div>
	 			<div class="content_section">
		 			<form method="post" id="form_edit_arq" class="form_arq" enctype="multipart/form-data">
		 				<input type="hidden" name="action" value="5">
		 				<input type="text" id="name_arq" name="name_arq"placeholder="Nombre" autofocus>
	 					<input type="text" id="dominio_arq" name="dominio_arq" placeholder="Dominio">
	 					<textarea name="desc_arq" id="desc_arq" placeholder="Descripcion"></textarea>
		 				<label><h3>Imagen de arquitectura</h3></label>
		 				<input type="file" name="image" accept=".jpg, .jpeg, .png">
		 				<div>
		 					<input type="hidden" name="action" value="7">
		 					<input id="btn_edit_arq" class="btn_form" type="button" value="Guardar" onclick="edit_arq()">
		 					<input  id="btn_cancelar" class="btn_form" type="button" value="Cancelar" onclick="$('#table_arquitectura').show(500);$('#mod_arq').hide(600);">
		 				</div>
		 				
		 				
		 			</form>
	 			</div>
	 		</section>
 		</section>
 		<section class="section_admin_arquitecuta">
 			<div class="name_section">
 				<div style="display: inline-block;">
 				<h4>Arquitecturas por usuario</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table2" class="btn_arq_action" onclick="$('#content_arqByUsuary').show();$('#btn_notsee_table2').show();$('#btn_see_table2').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table2" class="btn_arq_action" onclick="$('#content_arqByUsuary').hide();$('#btn_see_table2').show();$('#btn_notsee_table2').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section">
 					<label>Numero de arquitectura que puede reservar cada usuario:<label id="number_actual"><?php echo(db_fetch_cell_prepared("select value_info from data_testbedims where id_data='1'")); ?></label></label>
 					<div id="content_arqByUsuary" style="display: none;">
	 					Cambiar a
	 					<form class="form_arq" method="post" id="form_arq_by_user">
	 						<input type="hidden" name="action" value="7">
	 						<input type="number" name="numero" value="1" required>
	 						<input type="button" name="btn_set" value="Cambiar" onclick="change_arqs_by_user()">
	 					</form>
 					</div>
 			</div>
 		</section>
 		<section class="section_admin_arquitecuta">
 			<div class="name_section">
 				<div style="display: inline-block;">
 				<h4>Dias de asignacion de arquitectura</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table3" class="btn_arq_action" onclick="$('#content_day_asig').show();$('#btn_notsee_table3').show();$('#btn_see_table3').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table3" class="btn_arq_action" onclick="$('#content_day_asig').hide();$('#btn_see_table3').show();$('#btn_notsee_table3').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section">
 					<label>Numero de dias que se asigna la arquitectura:<label id="number_day_actual"><?php echo(db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'")); ?></label></label>
 					<div id="content_day_asig" style="display: none;">
	 					Cambiar a
	 					<form class="form_arq" method="post" id="form_day_asig">
	 						<input type="hidden" name="action" value="8">
	 						<input type="number" name="numero" value="1" required>
	 						<input type="button" name="btn_set" value="Cambiar" onclick="change_day_asig()">
	 					</form>
 					</div>
 			</div>
 		</section>

 		<section class="section_admin_arquitecuta">
 			<div class="name_section">
 				
 				<div style="display: inline-block;">
 				<h4>Informacion de la arquitectura</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table4" class="btn_arq_action" onclick="$('#content_infor_arq').show();$('#btn_notsee_table4').show();$('#btn_see_table4').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table4" class="btn_arq_action" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section">
 					<label>Ingrese la información de la arquitectura</label>

 					<div id="content_infor_arq" style="display: none;">
	 					<form method="post" id="form_info_new_arq" class="form_arq">
	 						<label> Ingrese el dominio al cual se llenara la información</label>
	 						<input type="text" name="dominio" placeholder="dominio" required>
	 						<select name="type" placeholder='Tipo de arquitectura'>
	 						  <option value="aio">Todo en uno</option>
	 						  <option value="dist">Distribuida</option>
	 						  <option value="dist_pstn">Distribuida + PSTN</option>
	 						</select> 
	 						<input type="hidden" name="action" value='6' required>
	 						
	 						<input type="text" name="fist_number_ims" placeholder="Primer Numero de extension" required>
	 						<input type="number" name="amount_extensions_ims" placeholder="Cantidad de extensiones" required>
							
	 						<input type="text" name="host_bono" placeholder="Host_Bono">
	 						<input type="text" name="host_sprout" placeholder="Host_Sprout">
	 						<input type="text" name="host_homer" placeholder="Host_Home" required>
	 						<input type="text" name="host_ellis" placeholder="Host_Ellis" >
	 						<input type="text" name="host_vellum" placeholder="Host_vellum" >
	 						<input type="text" name="host_dime" placeholder="Host_Dime">
	 						<input type="text" name="host_ibcf" placeholder="Host_Ibcf">
	 						<input type="text" name="host_pstn" placeholder="Host_PSTN">
	 						<input type="text" name="fist_number_pstn" placeholder="Primer Numero de extension">
	 						<input type="number" name="amount_extensions_pstn" placeholder="Cantidad de extensiones">
	 						<div>
	 						<input type="button" class="btn_form" id="btn_save_info" value="Guardar" onclick="inf_new_arq()">
	 						<input type="button" class="btn_form" value="Cancelar" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();">
	 						</div>
	 					</form>
	 				</div>
 			</div>


 		</section>
 	</div>
