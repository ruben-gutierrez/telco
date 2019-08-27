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
			$domain=db_fetch_cell("select dominio from test_testbedims where id_test='".$_POST['id_test2']."'");
			$user_email=db_fetch_cell("SELECT usuario FROM arqs_testbedims WHERE dominio = '".$domain."'");
			$options_test=db_fetch_assoc("SELECT options, value, description_option, argument from option_test_testbedims where id_test='".$_POST['id_test2']."'");
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
								<div class="row">
									<p> Esta Prueba no tiene opciones disponilbes, al ejecutarla se generar el tráfico definido en el Archivo XML.</p>
								</div>
								<div class="colmd-4">
									<input type="button" class="btn btn-primary pull-right m-2" id="btn_exe_test" value="Ejecutar" onclick="exe_test('<?php echo $idServer?>','<?php echo $test['file_test']?>')">
									<input type="button" class="btn btn-outline-secondary pull-right m-2" id="btn_exe_test" value="Atras" onclick="update_tests('<?php echo $user_email?>');$('#cardsTest').show();$('#table_options_test').empty()">
								</div>
							</form>
						</div>
					</div>
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
								<div class="form-group text-left" >
									<?php
									foreach ($options_test as $key => $value) {
										?>
											<div class="row mb-3" title="<?php echo $value['description_option']?>">
												<label for="<?php echo $value['options']?>" ><?php echo $value['options']?> <i class="fa fa-question-circle" ></i></label>
												<input type="text" class="form-control " id="<?php echo $value['options']?>" name="<?php echo $value['argument']?>" placeholder="<?php echo $value['value']?>">
											</div>
											
											<?php
									}
							
									?>
								</div>
								<div class="colmd-4">
									<input type="button" class="btn btn-primary pull-right m-2" id="btn_exe_test" value="Ejecutar" onclick="exe_test('<?php echo $idServer?>','<?php echo $test['file_test']?>')">
									<input type="button" class="btn btn-outline-secondary pull-right m-2" id="btn_exe_test" value="Atras" onclick="update_tests('<?php echo $user_email?>');$('#cardsTest').show();$('#table_options_test').empty()">
								</div>
							</form>
						</div>


					</div>
					<div class="col" id="resutl_test"></div>
				</div>

					<!-- <div id="optionsTestTable" style="display:none">
						<form method="post" id="form_execute_test" enctype="multipart/form-data">
							<input type="hidden" name="action" value="2">
						<table class="table_estado_arq">
						<tr>
							<th>Opcion</th>
							<th>Valor</th>
							<th>Descripción</th>
							
						</tr> 
						
							
						<?php 
						// foreach ($options_test as $key => $value) {

						// 		print("<tr>
						// 		<td>  ".$value['options']."</td>
						// 		<td><input type='text' name='".$value['options']."' placeholder=".$value['value']." autofocus required></td>
						// 		<td id='".$value['options']."'>".$value['description_option']."</td>
								
						// 		</tr>");
						
						// }
						
						?>
					</div> -->
				
					<!-- </div>
					</form> 
					</table>
				</div> -->
				
				<?php
			}
			break;
		case '2': //crear archivo, eviarlo por scp y ejecutarlo
			//print_r($_POST);
			// opciones de la pruebas
			
			$ipFloat=ipFloat($_POST['idServer']);
			$domain=db_fetch_cell_prepared("SELECT domain FROM core_domain WHERE id_server='".$_POST['idServer']."'");
			$user_email=db_fetch_cell("SELECT usuario FROM arqs_testbedims WHERE dominio = '".$domain."'");
			//permiso del archivo
			shell_exec('chmod 700 ./scripts/terminal_testbed/key.pem');
			$transFile=shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ./scripts/test.sh ubuntu@'.$ipFloat.':/home/ubuntu');
			$ls=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "ls"');
			shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "rm test.sh"');
			if( strpos($ls,'test') == false){
				shell_exec('chmod 775 ./scripts/terminal_testbed/key.pem');
				
			}

			if ( $_POST['nameScript'] == '' ) {
				# codigo para prueba simulacion de nodo bono
				foreach ( $_POST as $key => $value ) {
					if ($key != 'action' && $key != 'idServer' && $key != 'nameScript') {
						if ( $key == '--domain' || $key == '--numberExt' || $key == '--timer') {
							if( $value != '' ){
								$options .= " ".$value;
							}
						}else{
							if( $value != '' ){
								$options .= " ".$key." ".$value;
							}
						}
					}
				}
				
				$comandTest = "sudo /usr/share/clearwater/bin/run_stress ".$options."";
				$executeTest=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "'.$comandTest.' > ans.txt"');
				print_r(shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "cat ans.txt"'));
			}else{
				$onTest=db_execute("UPDATE test_testbedims SET executing ='0' WHERE dominio='" . $domain . "'");
				$onTest=db_execute("UPDATE test_testbedims SET executing ='1' WHERE file_test='" . $_POST['nameScript'] . "' AND dominio='" . $domain . "'");
				$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "sudo /etc/clearwater/test/execute.sh '.$_POST['nameScript'].'"');
			}
			break;
		case '3':
			//permiso del archivo
			$domain=db_fetch_cell("select dominio from test_testbedims where id_test='".$_POST['idTest']."'");
			$idServer=db_fetch_cell("SELECT s.id_server FROM server_openstack s INNER JOIN core_domain c ON s.id_server = c.id_server WHERE c.domain = '".$domain."' AND s.name_server='sipp'");
			$user_email=db_fetch_cell("SELECT usuario FROM arqs_testbedims WHERE dominio = '".$domain."'");
			$ipFloat=ipFloat($idServer);
			shell_exec('chmod 700 ./scripts/terminal_testbed/key.pem');
			$transFile=shell_exec('scp -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ./scripts/test.sh ubuntu@'.$ipFloat.':/home/ubuntu');
			$ls=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "ls"');
			shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "rm test.sh"');
            if (strpos($ls, 'test') == false) {
				shell_exec('chmod 775 ./scripts/terminal_testbed/key.pem');
			}
			$installShell=shell_exec('ssh -o "StrictHostKeyChecking no" -i ./scripts/terminal_testbed/key.pem ubuntu@'.$ipFloat.' "sudo /etc/clearwater/test/stop_execute.sh"');
			$offTest=db_execute("UPDATE test_testbedims SET executing ='0' WHERE id_test='".$_POST['idTest']."'");
			print_r(draw_table_testbed_pruebas( $user_email ));
			break;
		default:
			echo ("sin funcion");
			break;
	}
}

