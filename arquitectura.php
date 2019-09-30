<?php
global $contenido_arquitectura, $config, $current_user;

//autentica la pagina en la cual esta
// include('./include/global.php');
include('./include/auth.php');

//agregar header y la barra lateral de navegación

 top_header();

$username=$current_user['username'];
$from_email=$current_user['email_address'];
if($_GET['arq']){
	// pagina arqutiectura
	$arq=db_fetch_row("SELECT arquitectura, dominio, type_arq, descripcion from arqs_testbedims where id='".$_GET['arq']."'");
	$vmsAditional=db_fetch_assoc("SELECT v.id_server,v.name_server, v.ip_local, s.status, f.ram, f.vcpus, f.disk,i.date from vm_aditional_testbedims v inner join server_openstack s on v.id_server=s.id_server inner join flavor_openstack f on f.id_flavor=s.id_flavor left join instant_images_openstack i ON s.id_server=i.id_server where v.dominio='".$arq['dominio']."'");
	$vmsCore=db_fetch_assoc("SELECT s.id_server, s.name_server, s.ip_local, s.status, f.ram, f.vcpus, f.disk, i.date from server_openstack s inner join core_domain c on c.id_server = s.id_server inner join  flavor_openstack f on f.id_flavor=s.id_flavor left join instant_images_openstack i ON s.id_server=i.id_server where c.domain='".$arq['dominio']."'");
	if($_GET['tablevm']){
		$vms=$vmsAditional;
	}else{
		$vms=$vmsCore;
	}
	?>
		<div class="container" id="status-loading"></div>
		<!-- Modal  addVmFrom-->
		<div class="modal fade" id="addVmFrom"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" >
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Máquina virtual</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modalContent">
						<form id="add_vm_domain"> 
							<input type="hidden" class="form-control" id="idDomain" name="idDomain" placeholder="action" value="' + idDomain + '"> 
							<div class="form-row">    
								<div class="form-group col-md-6">    
									<div class="form-group col">      
										 <label>Nombre</label>
										 <input type="text" class="form-control " name="nameNewVm" id="nameNewVm" placeholder="Nombre" title="Nombre de la maquina virtual" required autofocus> 
									</div> 
									<div class="form-group col">      
										<label>Sistema Operativo</label>
										<select name="imageNewVm" id="imageNewVm" class="form-control" title="Imagen del sistema operativo que tendra la Máquina virtual" placeholder="Sistema Operativo" required>' + data.options + ' </select>
									</div>  
								</div>    
								<div class="form-group ">  
									<label for="ramNewVm">Memoria RAM</label>   
									<input 
										type="number" 
										class="form-control col-sm-7" 
										id="ramNewVm" 
										name="ramNewVm" 
										min="1" 
										max="'+data.ram+'" 
										placeholder="Max '+data.ram+' Mb"  
										title="Memoria Ram de la nueva máquina virtual, Máximo '+data.ram+' Mb" 
										required>  
									<label for="vcpuNewVm">Numero de procesadores</label>
									<input 
										type="number" 
										class="form-control col-sm-7" 
										id="vcpuNewVm" 
										name="vcpuNewVm" 
										min="1" 
										max="'+data.vcpu+'" 
										placeholder="Max '+data.vcpu+'" 
										title="Número de procesadores de la Nueva máquina virtual, Màximo '+data.vcpu+' unidades" 
										required> 
									<label for="diskNewVm">Espacio de almacenamiento</label> 
									<input 
										type="number" 
										class="form-control col-sm-7" 
										id="diskNewVm" 
										name="diskNewVm" 
										min="1" 
										max="'+data.disk+'" 
										placeholder="Max '+data.disk+' GB" 
										title="Tamaño de disco duro en Gb, màximo '+data.disk+' Gb" 
										required>
								</div> 
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button> 
						<button type="button" id="createMaquine" class="btn btn-primary" onclick="addVM()">Crear</button>      
					</div>
				</div>
			</div>
		</div>
		<!-- Fin modal -->
		<!-- Modal  recise-->
		<div class="modal fade " id="reciseVm"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" >
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modificando Maquina virtual</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Fin modal -->
		<section class="section_arquitecture ancla">
						<div>
								<div class="d-flex justify-content-center mb-3">

									<h2>Arquitectura <?php echo($arq['arquitectura'])?></h2><br>
								</div>
								<div class="row">
									<div class="col p-3" >
										<h4>Descripcion</h4>
										<p>La arquitectura tiene el dominio <?php echo($arq['dominio'])?> el cual concuerda con la direccion de red por ende todas sus maquinas virtuales estan en el mismo rando de direccionamiento</p>
										<p><?php echo($arq['descripcion'])?></p>
									</div>
									<div class="col ">
										<h4>Ir...</h4>
										<div class="row ">
										
											<div class="col">
	
												<a class="btn btn-success" href="http://10.55.5.100/telco/arquitectura.php"><i class="fa fa-arrow-left fa-2x"> </i> <br>  Regresar</a>
											</div>
											<div class="col">
												<button class="btn btn-success" id="btnAddVm" data-toggle='modal' data-target='#addVmFrom' onclick="addVmtoDomain(<?php echo $_GET['arq']?>)"><i class="fa fa-laptop-medical fa-2x"> </i><br> Agregar VM</button>
											</div>
											<div class="col">
	
												<a class="btn btn-success" href="pruebas.php?idarq=<?php echo $_GET['arq']?>"><i class="fa fa-list-alt fa-2x"></i><br>Pruebas</a>
											</div>
											<div class="col">
	
												<a class="btn btn-success" href="http://10.55.5.100/telco/graph_view.php?action=tree&node=tree_anchor-52&hyper=true"><i class="fa fa-chart-bar fa-2x"> </i> <br> Gráficas</a>
											</div>
										</div>
										
									</div>
								</div>
								<div class="row d-flex justify-content-center mt-3">
									
									<div class="col-6 d-flex justify-content-center">
	
										<ul class="nav nav-pills nav-fill text-dark">
											
											<?php
											if ($_GET['tablevm']) {
											?>
												
												<?php
												if(count($vmsAditional)>0){
												?>
													<li class="nav-item mr-3">
														<a class="nav-link" href="arquitectura.php?arq=<?php echo $_GET['arq']?>">Núcleo IMS</a>
													</li>
													<li class="nav-item">
														<a class="nav-link active" href="arquitectura.php?arq=<?php echo $_GET['arq']?>&tablevm=True">Máquinas agregadas</a>
													</li>
												<?php
												}else{
													$vms=$vmsCore;
													?>
													<li class="nav-item mr-3">
														<a class="nav-link active" href="arquitectura.php?arq=<?php echo $_GET['arq']?>">Núcleo IMS</a>
													</li>
												<?php
												}
												?>
												
											<?php
											}else{
											?>
												<li class="nav-item mr-3">
													<a class="nav-link active" href="arquitectura.php?arq=<?php echo $_GET['arq']?>">Núcleo IMS</a>
												</li>
												<?php
												if(count($vmsAditional)>0){
												?>
													<li class="nav-item">
														<a class="nav-link" href="arquitectura.php?arq=<?php echo $_GET['arq']?>&tablevm=True">Máquinas agregadas</a>
													</li>
												<?php
												}
												?>
											<?php
											}
											?>
											
											
										</ul>
									</div>
								</div>

								<?php
								if (count($vms)>0) {
									?>
									<table class="table m-5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">Nombre</th>
												<th scope="col">Direccion IP</th>
												<th scope="col">Acciones</th>
												<th scope="col">Terminal</th>
											</tr>
										</thead>
										<tbody>
											<?php
											foreach($vms as $vm){
												?>
												<tr>
													<th scope="row">
														<h4><?php echo(ucfirst($vm['name_server']))?></h4><br>
														
														<div class="custom-control custom-switch">
														<?php
														if($vm['status']=='SHUTOFF'){
														?>
															<input type="checkbox" class="custom-control-input" id="customSwitches" onclick="onVM('<?php echo($vm['id_server'])?>')">
															<label class="custom-control-label" title="Apagar. Tarda 1 minuto" for="customSwitches">Apagada</label>
															<?php
														}else{
															?>
															<input type="checkbox" class="custom-control-input" id="customSwitches" onclick="offVM('<?php echo($vm['id_server'])?>')" checked>
															<label class="custom-control-label" title="Encender máquina virtual" for="customSwitches">Encendida</label>
															<?php
														}
														?>
														</div>
													</th>
													<td>
														<div>
															<?php echo($vm['ip_local'])?><br>
															
														</div>
													</td>
													<td>
														<div class="row">
															<div class="row" id="btnEdit<?php echo($vm['id_server'])?>">
																<button class="btn btn-primary m-2" onclick="$('#editMachine<?php echo($vm['id_server'])?>').show();$('#btnEdit<?php echo($vm['id_server'])?>').hide();">Recostruir</button>
																<?php
																
																if($vm['date'] === null){
																?>
																	<button class="btn btn-info m-2" onclick="takeSnaptVM('<?php echo($vm['id_server'])?>','<?php echo($vm['name_server'])?>')">Intantanea</button>
																<?php	
																}else{
																?>
																	<button class="btn btn-info m-2" onclick="takeSnaptVM('<?php echo($vm['id_server'])?>','<?php echo($vm['name_server'])?>')">Intantanea</button>
																	<button class="btn btn-warning m-2" onclick="returnSnaptVM('<?php echo($vm['id_server'])?>')">Restablecer</button>
																<?php
																}
																?>
																
																<button class="btn btn-danger m-2" onclick="eliminarVM('<?php echo($vm['id_server'])?>')">Eliminar</button>
															</div>
															<div class="row" id="editMachine<?php echo($vm['id_server'])?>" style="display:none;">
																<form class="form" id="<?php echo($vm['id_server'])?>">
																	<div class="container">
																		<div class="row">
																			<div class="col">
																				<label for="ram">RAM (Mb)</label><br>
																				<input type="number" name="ram" value="<?php echo($vm['ram'])?>">
																			</div>
																			<div class="col">
																				<label for="disk">Almacenamiento (Gb)</label><br>
																				<input type="number" name="disk" value="<?php echo($vm['disk'])?>">
																			</div>
																			<div class="col">
																				<label for="vcpus">Procesadores</label><br>
																				<input type="number" name="vcpus" value="<?php echo($vm['vcpus'])?>">
																			</div>
																			<div class="col">
																				
																						<input class="btn btn-outline-info btn-sm m-1" data-toggle="modal" data-target="#reciseVm" type="button" id="btnEdit<?php echo($vm['id_server'])?>" value="Cambiar" onclick="reziseVM('<?php echo($vm['id_server'])?>')">  
																						<input class="btn btn-outline-danger btn-sm m-1" type="button" id="" value="Cancelar" onclick="$('#editMachine<?php echo($vm['id_server'])?>').hide();$('#btnEdit<?php echo($vm['id_server'])?>').show();">
																						<div class="spinner-border text-primary" role="status" id="indicatorEdit<?php echo($vm['id_server'])?>" style="display:none;">
																							<span class="sr-only">Loading...</span>
																						</div>
																				
																			</div>
																		</div>
																	</div>
																	
																</form>
															</div>
														</div>
													</td>
													<td><button class="btn btn-success m-2" onclick="terminal('<?php echo($vm['id_server'])?>')">Consola</button></td>
													
												</tr>
											<?php
											}
											?>
											
											
											
										</tbody>
									</table>
									<?php
								}else{
									?>
									<div class="container  mt-4">
										<div class="col">

											<div class="row d-flex justify-content-center">
	
												<i name="iconSad" class="fas fa-sad-cry fa-2x"></i>
											</div>
											<div class="row d-flex justify-content-center" >
												
												<label>No hay máquinas virtuales</label>
												
											</div>
											<div class="row d-flex justify-content-center" >
												<button  class="btn btn-outline-success" id="btnAddVm" data-toggle='modal' data-target='#addVmFrom' onclick="addVmtoDomain(<?php echo $_GET['arq']?>)"><i class="fa fa-plus">Agregar Máquina virtual</i></button>
											</div>
												
										</div>
											
										
									
									</div>
									<?php
								}
								?>

								
						</div>
		</section>


	<?php
	
}else{
	if($_GET['reserve']){
	?>
		<!-- pagina arquitecturas -->
		
		<div>
			<div class="container" id="status-loading"></div>
			<!-- Modal -->
			<div class="modal fade " id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" >
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Agregar Máquina virtual</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" id="modalContent">
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
				<div class="content "></div>
					
					<section class="section_arquitecture ancla mt-4" id="request_arquitecture">
						<div class="col">
							<div class="row">
								<h3><b>Reservar Arquitectura</b></h3>

							</div>
							<div class="row">
								<div class="col">
									

									<div class="description_page_testbed">
										El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.
									</div>
								</div>
								<div class="col ">
									<h4>Ir...</h4>
									<div class="row ">
									
										
										<div class="col">

											<a class="btn btn-success"  href="arquitectura.php"><i class="fa fa-sitemap fa-2x"> </i> <br>  <b>Arquitecturas Reservadas</b></a>
										</div>

									</div>
									
								</div>
								

							</div>
						</div>	
					
					
					<!-- <nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('request_arquitecture', 'indicate_requestArquitecture')"> -->
						
						<!-- </nav> -->
						<div class="row request_arquitecture">
							<!-- <h1 class="titulo_arquitectura">Lista de Arquitecturas</h1> -->
							
							<!-- //tabla y boton de solicitud  -->
							<div class="col-md" id="content_arq_cards">
								<!-- ponemos la tabla como menu -->
								<?php

									displayCardsArq( $from_email, $username );

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
				
			</div>
		</div>
	<?php
	}else{
		?>
		<div>
			<div class="container" id="status-loading"></div>
			<!-- Modal -->
			<div class="modal fade " id="exampleModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content" >
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Agregar Máquina virtual</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="modalContent">
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
				<section class="section_arquitecture ancla mt-4" id="solicited_arquitecture">
					<div class="col">
						<div class="row">
							<h3><b>Arquitecturas Reservadas</b></h3>

						</div>
						<div class="row">
							<div class="col">
								

								<div class="description_page_testbed">
									Arquitectuas asignadas, en esta sección puedes verificar las arquitecturas asignadas a tu cuenta de usuario para luego modificar la escalabilidad vertical de ellas teniendo la capacidad de moficicar la capacidad de la memoria RAM, disco duro y capacidad e procesador.
								</div>
							</div>
							<div class="col ">
								<h4>Ir...</h4>
								<div class="row ">
								
									
									<div class="col">

										<a class="btn btn-success"  href="arquitectura.php?reserve=true"><i class="fa fa-sitemap fa-2x"> </i> <br>  <b>Reservar Arquitectura</b></a>
									</div>

								</div>
								
							</div>
							

						</div>
					</div>
					
					

					<div class="row solicited_arquitecture" >
						<!-- <h1 class="titulo_arquitectura">Lista de Arquitecturas</h1> -->
						
						<!-- //tabla y boton de solicitud  -->
						<div class="col-md arqAsingUser mt-4">
							<!-- <button class="btn btn-primary" onclick="">test</button> -->
								<?php draw_table_domainsOfUser2($from_email); ?>
						</div>
					</div>
				</section>
			</div>
		</div>
		<?php
	}
}
?>
</div>
</div>
</div>

<?php
include('./include/footer.php');
?>


