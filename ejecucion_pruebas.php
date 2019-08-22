<?php 
global $current_user;

include('./include/global.php');
// include('./include/auth.php');


// saber si post tiene valor
if (!empty($_POST)) {
	$accion= $_POST['action'];	
	$now = date_create()->format('Y-m-d H:i:s');
	
	switch ( $accion ) { 
		case '1'://desplegar tabla de las pruebas de un dominio
			$test=db_fetch_row_prepared("select * from test_testbedims where id_test='".$_POST['id_test2']."'");
			$options_test=db_fetch_assoc("SELECT options, value, description_option from option_test_testbedims where id_test='".$_POST['id_test2']."'");
			$idServer=db_fetch_cell("SELECT s.id_server FROM server_openstack s INNER JOIN core_domain c ON s.id_server = c.id_server WHERE c.domain = '".$test['dominio']."' AND s.name_server='sipp'");
			if ( count($options_test) == 0) {
				?>
				<div class="row animated fadeIn">
				<div class="col center">
				<div>
					<h4>Prueba: <?php echo $name_test['name_test'] ;?>  </h4>
				</div>

				<div id="optionsTestFrom" class="row" >
					<form method="post" id="form_execute_test" class="center" enctype="multipart/form-data">
						<input type="hidden" name="action" value="2">
						<div class="row">
							<p> Esta Prueba no tiene opciones disponilbes, al ejecutarla se generar el tráfico definido en el Archivo XML.</p>
						</div>
						<div class="colmd-4">
							<input type="button" class="btn btn-primary pull-right m-2" id="btn_exe_test" value="Ejecutar" onclick="exe_test('<?php echo $idServer?>','<?php echo $test['file_test']?>')">
							<input type="button" class="btn btn-outline-secondary pull-right m-2" id="btn_exe_test" value="Atras" onclick="$('#cardsTest').show();$('#table_options_test').empty()">
						</div>
					</form>
				</div>

				<?php
			}else{
				?>
				<div class="row animated fadeIn">
				<div class="col center">
				<div>
					<h4>Prueba: <?php echo $name_test['name_test'] ;?>  </h4>
				</div>

				<div id="optionsTestFrom" class="row" >
					<form method="post" id="form_execute_test" class="center" enctype="multipart/form-data">
						<input type="hidden" name="action" value="2">
						<?php
						foreach ($options_test as $key => $value) {
							?>
							<div class="form-group text-left" title="<?php echo $value['description_option']?>">
								<label for="<?php echo $value['options']?>" ><?php echo $value['options']?> <i class="fa fa-question-circle" ></i></label>
								<input type="text" class="form-control" id="<?php echo $value['options']?>" name="<?php echo $value['options']?>" placeholder="<?php echo $value['value']?>">
							</div>
							
						<?php
						}
						
						?>
						<div class="colmd-4">
							<input type="button" class="btn btn-primary pull-right m-2" id="btn_exe_test" value="Ejecutar" onclick="exe_test('<?php echo $idServer?>','<?php echo $test['file_test']?>')">
							<input type="button" class="btn btn-outline-secondary pull-right m-2" id="btn_exe_test" value="Atras" onclick="$('#cardsTest').show();$('#table_options_test').empty()">
						</div>
					</form>
				</div>


				<div id="optionsTestTable" style="display:none">
				<form method="post" id="form_execute_test" enctype="multipart/form-data">
			      	<input type="hidden" name="action" value="2">
				<table class="table_estado_arq">
			      <tr>
			        <th>Opcion</th>
			        <th>Valor</th>
			        <th>Descripción</th>
			        
			      </tr> 
			      
			        
			      <?php 
			      foreach ($options_test as $key => $value) {

			      		print("<tr>
						<td>  ".$value['options']."</td>
						<td><input type='text' name='".$value['options']."' placeholder=".$value['value']." autofocus required></td>
						 <td id='".$value['options']."'>".$value['description_option']."</td>
						
						</tr>");
				
			      }
				
				?>
				</div>
				
				</div>
				</form> 
				</table>
				</div>
				
				<?php
			}
			break;
		case '2': //crear archivo, eviarlo por scp y ejecutarlo
			// print_r($_POST);
			// opciones de la pruebas

			foreach ($_POST as $key => $value) {
				if ($key != 'action' && $key != 'idServer' && $key != 'nameScript') {
					$options .= " ".$value;
				}
			}

			// print_r($options);
			// se crea el archivo con el comando para enviar a otro pc
			$nombre_archivo = "content_test.sh";
			$comandTest = "sudo /usr/share/clearwater/infrastructure/scripts/sip-stress ".$options."";
			echo $comandTest;
			// $ipVmSipp=ipFloat($_POST['idServer']);
			$executeTest=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipVmSipp.' "'.$comandTest.'"');
			$executeTest=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipVmSipp.' "sudo service clearwater-sip-stress restart"');
			break;
		default:
			echo ("sin funcion");
			break;
	}
}

