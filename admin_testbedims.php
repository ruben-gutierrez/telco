<?php
global $config, $current_user;

//autentica la pagina en la cual esta
 include('./include/auth.php');
// include('./include/global.php');
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
 				<button id="btn_see_table" class="btn_see" onclick="$('#table_arquitectura').show();$('#btn_notsee_table').show();$('#btn_see_table').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table" class="btn_see" onclick="$('#table_arquitectura').hide();$('#btn_see_table').show();$('#btn_notsee_table').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section"><p>En esta sección se puede agregar, modificar eliminar y ilberar las arquitecturas disponibles en el testbed</p></div> 
	 		<section id="table_arquitectura" class="section_admin_arquitectura" style="display: none;">
				<div class="name_section">Estado de arquitecturas disponibles</div>
				<div class="content_section">
					
		 			<table id="table_estado_arq" class="table_estado_arq ">
		 				<thead>
		 					<tr>
		 						<th>Arquitectura</th>
		 						<th>Dominio</th>
		 						<th class='edisplay'>descripcion</th>
		 						<th class='edisplay'>Imagen</th>
		 						<th>Usuario</th>
		 						<th>Liberar</th>
		 						<th>Editar</th>
		 						<th>Eliminar</th>
		 					</tr>
		 					
		 				</thead>
		 				<tbody id="contenido_arq_state">
		 				<?php 
		 				draw_table_estate_arq(); ?>
		 				</tbody>
		 			</table>
		 			<button class="btn btn-primary text-center" id="display_add" onclick="$('#add_arq').show(500); $('#table_arquitectura').hide(500);$('#btn_notsee_table').hide();$('#btn_see_table').show(); $('section.section_admin_arquitectura').focus();">Nuevo</button>
		 		</div>	
	 		</section>

	 		<section id="add_arq" class="section_admin_arquitectura" tabindex='0' style="display: none;">
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
		 					<!-- <input type="hidden" name="action" value="7"> -->
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
 				<button id="btn_see_table2" class="btn_see" onclick="$('#content_arqByUsuary').show();$('#btn_notsee_table2').show();$('#btn_see_table2').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table2" class="btn_see" onclick="$('#content_arqByUsuary').hide();$('#btn_see_table2').show();$('#btn_notsee_table2').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
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
 				<button id="btn_see_table3" class="btn_see" onclick="$('#content_day_asig').show();$('#btn_notsee_table3').show();$('#btn_see_table3').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table3" class="btn_see" onclick="$('#content_day_asig').hide();$('#btn_see_table3').show();$('#btn_notsee_table3').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
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

 		<section  id="info_arq" class="section_admin_arquitecuta" tabindex="0">
 			<div class="name_section">
 				
 				<div style="display: inline-block;">
 				<h4>Informacion de la arquitectura</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table4" class="btn_see" onclick="$('#content_infor_arq').show();$('#btn_notsee_table4').show();$('#btn_see_table4').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table4" class="btn_see" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section">
 					<label>Ingrese la información de la arquitectura</label>
 					<div id="content_infor_arq" style="display: none;">

					 	<div id="info_select_arq">
						 	<?php
						 	info_select_arq();
						 	?>
	 					
						</div>
	 				</div>
 			</div>


 		</section>

 		<section id="test_dom" class="section_admin_arquitecuta">
			<div class="name_section">
				
				<div style="display: inline-block;">
				<h4>Agregar pruebas a dominio</h4></div>
				<div class="dips" style="display: inline-block; margin: auto;">
					<button id="btn_see_table5" class="btn_see" onclick="$('#content_add_test').show();$('#btn_notsee_table5').show();$('#btn_see_table5').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
					<button id="btn_notsee_table5" class="btn_see" onclick="$('#content_add_test').hide();$('#btn_see_table5').show();$('#btn_notsee_table5').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
			</div>
			</div>
			<div class="content_section">
					<label>Agregar prueba a una arquitectura</label>
					<div id="content_add_test" style="display: none;">
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
			 						<input type="button" class="btn_form" id="btn_save_info" value="Siguiente" onclick="add_test()">
			 						<input type="button" class="btn_form" value="Cancelar" onclick="$('#content_add_test').hide();$('#btn_see_table5').show();$('#btn_notsee_table5').hide();$('#form_add_test')[0].reset();">
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
		 						<input type="button" class="btn_form" id="btn_save_info" value="Guardar" onclick="add_info_test();">
		 						<input type="button" class="btn_form" value="Cancelar" onclick="$('#btn_see_table5').show();$('#btn_notsee_table5').hide();$('#form_add_test')[0].reset();$('#form_info_test')[0].reset();$('#form_1').show();$('#form_2').hide();$('#content_add_test').hide();">
		 						</div>
		 					</form>
						</div>
				
 				</div>
			</div>
		</section>

		<section class="section_admin_arquitecuta">
 			<div class="name_section">
 				<div style="display: inline-block;">
 				<h4>Contenido pagina general</h4></div>
 				<div class="dips" style="display: inline-block; margin: auto;">
 				<button id="btn_see_table6" class="btn_see" onclick="$('#content_info_page').show();$('#btn_notsee_table6').show();$('#btn_see_table6').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
 				<button id="btn_notsee_table6" class="btn_see" onclick="$('#content_info_page').hide();$('#btn_see_table6').show();$('#btn_notsee_table6').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
 				</div>
 			</div>
 			<div class="content_section">
 					<label>Cambiar informacion de la pagina principal</label>
 					<div id='content_info_page' style="display: none;">
					<?php  
						admin_info_page();
					?>
					
 					
	 				</div>
 					
 			</div>
 		</section>
 	</div>


