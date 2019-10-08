<?php 

 global $contenido_pruebas, $email_array,$current_user, $explain_test_bono;
 include('./include/auth.php');
 top_header();
 $user_email=$current_user['email_address'];
 // enviar correo de solicitud de arquitectura
if (isset($_GET['arq'])) {
	$from_email = db_fetch_cell_prepared('SELECT email_address FROM user_auth WHERE id =  ?', array($_SESSION['sess_user_id']));
	send_mail("rubengutierrez@unicauca.edu.co", "rubengutierrez@unicauca.edu.co" , "Solicitud arquitectura IMS" , "Se realiza la solicitud para la asignacion de la arquitectura ". $_GET['arq']. " para realizar, ya que tengo en conocimiento el reglamento ...., Solicitante ".$from_email);
	header("location:pruebas.php");
}




if($_GET['idarq']){
  if($_GET['idtest']){
          $arq=db_fetch_row("SELECT arquitectura, dominio, type_arq, descripcion from arqs_testbedims where id='".$_GET['idarq']."'");
          $test=db_fetch_row("SELECT id_test, dominio, name_test, comand, description_test,file_test,executing from test_testbedims where id_test='".$_GET['idtest']."'");
          ?>
        <div class="container" id="status-loading" ></div>
        <div class="margin_page ancla" id="tests">
            <div class="col">
                      <div class="row">
                        <h3><b>Prueba <?php echo $test['name_test']?> de arquitectura <?php echo $arq['arquitectura']?></b> </h3>

                      </div>
                      <div class="row">
                        <div class="col">
                          

                          <div class="description_page_testbed">
                              <?php echo $test['description_test']?>
                          </div>
                        </div>
                        <div class="col">
                          <h4>Ir...</h4>
                          <div class="row ">
                            <div class="col">
                              <a class="btn btn-success"  href="pruebas.php?idarq=<?php echo $_GET['idarq']?>"><i class="fa fa-arrow-left fa-2x"> </i> <br>  Atras</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="pruebas.php?newTest=true&idarquitecture=<?php echo $_GET['idarq'] ?>"><i class="fa fa-list-alt fa-2x"> </i> <br>  Crear Prueba</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="arquitectura.php?arq=<?php echo $_GET['idarq']?>"><i class="fa fa-sitemap fa-2x"> </i> <br>  Arquitectura</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="graph_view.php"><i class="fa fa-chart-bar fa-2x"> </i> <br>  Gráficas</a>
                            </div>
                          </div>
                        </div>
                      </div>
            </div>
            <div class="tests">
                  <div class="description_page_testbed">
                    <span>Al ejecutar esta prueba se ejecutaria el siguiente flujo de mensajes en el núcleo IMS de la arquitectura <?php echo $arq['arquitectura']?>.</span>
                  </div>
                  <div id="container table_desciption_test" class="animated fadeIn">
                    <div class="row">
                      <div class="col-8">
                        <div class="form-group">
                          <form id="edit_content_test">
                            <input type="hidden" name="fileName" id="fileName" value="<?php echo $test['file_test']?>">
                            <label for="exampleFormControlTextarea1">Flujo de mensajes</label>
                            <textarea class="form-control" name="text_testFile" id="text_testFile" cols="20" rows="20" disabled>
                                <?php
                                  // echo $test['file_test'];
                                  include("files_XML/".$test['file_test']);
                                ?>
                              </textarea>
                          </form>
                        </div>
                          
                      </div>
                      <div class="col">
                        <div class="container">

                          <div class="row">
                            <div class=" mx-auto">
                              <h3>Realizar</h3>
                            </div>
                          </div>
                          <div class="row mx-auto">
                            <div style="display:none;" class="col" id="save_test_edit" >
                              <button class="btn btn-primary m-2" onclick="editTest();$('div#functions_test').show();$('#save_test_edit').hide();">Guardar</button>
                            </div>
                            <div class="mx-auto" id="functions_test" >
                                <?php
                              if ($test['executing']=='1') {
                                ?>
                                  <button class="btn btn-info m-2">Detener</button>
                                <?php
                              }else{
                                ?>
                                  <button class="btn btn-primary m-2">Ejecutar</button>
                                <?php
                              }
                                ?>
                              
                              <button class="btn btn-warning m-2" onclick="$('#text_testFile').prop('disabled',false);$('div#functions_test').hide();$('#save_test_edit').show();">Editar</button>
                              
                              <button class="btn btn-danger m-2" onclick="deleteTest('<?php echo $test['file_test']?>','<?php echo $test['id_test']?>')">Eliminar</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                  <div id="table_options_test" class="animated fadeIn">
                  </div>
            </div>
        </div>
        <?php
    }else{
          $arq=db_fetch_row("SELECT arquitectura, dominio, type_arq, descripcion from arqs_testbedims where id='".$_GET['idarq']."'");
          ?>
        <div class="container" id="status-loading" ></div>
        <div class="margin_page ancla" id="tests">
            <div class="col">
                      <div class="row">
                        <h3><b>Pruebas de arquitectura <?php echo $arq['arquitectura']?></b> </h3>

                      </div>
                      <div class="row">
                        <div class="col">
                          <div class="description_page_testbed">
                            El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.
                          </div>
                        </div>
                        <div class="col">
                          <h4>Ir...</h4>
                          <div class="row ">
                            <div class="col">
                              <a class="btn btn-success"  href="arquitectura.php?arq=<?php echo $_GET['idarq']?>"><i class="fa fa-arrow-left fa-2x"> </i> <br>  Atras</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="pruebas.php?newTest=true&idarquitecture=<?php echo $_GET['idarq'] ?>"><i class="fa fa-list-alt fa-2x"> </i> <br>  Crear Prueba</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="arquitectura.php?arq=<?php echo $_GET['idarq']?>"><i class="fa fa-sitemap fa-2x"> </i> <br>  Arquitectura</a>
                            </div>
                            <div class="col">
                              <a class="btn btn-success"  href="graph_view.php"><i class="fa fa-chart-bar fa-2x"> </i> <br>  Gráficas</a>
                            </div>
                          </div>
                        </div>
                      </div>
            </div>
              <div class="tests">
                  <!-- <h1 class="titulo_arquitectura">Servicios Ambiente de Prueba IMS</h1> -->
                  
                    <!-- descripcion de las pruebas-->
                    <div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.
                    </div>
                    <div id="container table_desciption_test" class="animated fadeIn">
                      <?php
                        draw_table_testbed_pruebas($user_email,$_GET['idarq']); ?>
                    </div>
                    <div id="table_options_test" class="animated fadeIn">
                    </div>
              </div>
        </div>
        <?php

    }

}else{
  if($_GET['newTest']){
    
    
      $dom_user=db_fetch_assoc("SELECT arquitectura, dominio, descripcion  from arqs_testbedims where usuario ='".$user_email."'");
      if (!empty($dom_user)) {
          ?>
                <div class="container" id="status-loading" ></div>
                <section id="test_dom ancla" class="section_admin_arquitecuta" style="margin-top: 20px;">
                  <div class="col">
                    <div class="row">
                      <h3><b>Crear Prueba</b></h3>
                    </div>
                    <div class="row">
                      <div class="col">
                        
                        <div class="description_page_testbed">
                          En esta seccion puede agregar una prueba personalizada al ambiente de prueba mediante un archivo XML el cual describe el flujo de mensajes que realizará cada usuario simulado durante la prueba. <br>
                          El contenido agregado a continuación contiene el flujo de mensajes que realiza un usuario para registrarse iniciar una llamada, emular flujo de datos durante la llamada y finalizarla donde como usuario podra modificar el contenido y adaptarlo a una prueba especifica.
                        </div>
                      </div>
                      <div class="col ">
                        <h4>Ir...</h4>
                        <div class="row ">
                        
                          
                          <div class="col">
                                 <?php
                            if($_GET['idarquitecture']){
                                ?>
                                  <a class="btn btn-success"  href="pruebas.php?idarq=<?php echo get_nfilter_request_var('idarquitecture')?>"><i class="fa fa-arrow-left fa-2x"> </i> <br>  Atras</a>
                                <?php
                            }else{
                              ?>
                                <a class="btn btn-success"  href="pruebas.php"><i class="fa fa-arrow-left fa-2x"> </i> <br>  Atras</a>
                              <?php
                            }
                              ?>
                            
                          </div>

                        </div>
                        
                      </div>
                      

                    </div>
                  </div>
                        
                  <div class="container">
                      <label><b>Seleccione la arquitectura y agregue la información de la prueba</b></label>
                      <div id="content_add_test">
                        <div>
                        <form id="form_add_test" >
                          <input type="hidden" name="action" value="10">
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label for="name_test" >Nombre</label>
                                <input type="text" class="form-control" name="name_test" placeholder="Nombre de prueba" required>
                              </div>
                              
                              </div>
                              <div class="col">
                                  <div class="form-group">
                                    <?php
                                     if(get_nfilter_request_var('idarquitecture')){
                                        ?>
                                          <label for="dominio">Arquitectura</label>
                                          <select name="dominio" class="form-control">
                                            
                                            <?php
                                              $dominios=db_fetch_assoc("select arquitectura, dominio from arqs_testbedims where usuario= '".$user_email."' AND id='".get_nfilter_request_var('idarquitecture')."'");
                                                foreach ($dominios as $key => $value) {
                                                    print("<option value='".$value['dominio']."'>".$value['arquitectura']." ".$value['dominio']."</option>");
                                                } 
                                            ?> 
                                          </select>
                                       <?php
                                     }else{
                                       ?>
                                        <label for="dominio">Arquitectura</label>
                                        <select name="dominio" class="form-control">
                                          <option value="">Seleccionar Arquitectura</option>
                                          <?php
                                            $dominios=db_fetch_assoc("select arquitectura, dominio from arqs_testbedims where usuario= '".$user_email."'");
                                              foreach ($dominios as $key => $value) {
                                                  print("<option value='".$value['dominio']."'>".$value['arquitectura']." ".$value['dominio']."</option>");
                                              }
                                          ?> 
                                        </select>
                                       <?php
                                     }
                                    ?>
                                      
                                      
                                  </div>

                            </div>
                          </div>
                          <div class="form-group">
                          <label for="description_test">Descripción</label>
                              <textarea class="form-control" id="description_test" name="description_test"rows="3"></textarea>
                              
                          </div>
                          
                            <div class="form-group">
                              <label for="fileXML">Escenario SIP</label>
                              <textarea class="form-control" id="fileXML" name="fileXML" rows="20">
                                <?php
                                  include("scripts/TestEmulateUsers.txt");
                                ?>
                              </textarea>
                            </div>
                            <div class="row d-flex justify-content-center">
                                <input type="button" class="btn_form btn btn-primary mr-2" id="btn_save_info" value="Crear" onclick="add_test()">
                                <!-- <input type="button" class="btn_form btn btn-outline-secondary" value="Cancelar" onclick=""> -->
                                <a class="btn btn-outline-secondary" href="pruebas.php">Cancelar</a>
                              
                              </div>
                          </form>


                            
                        </div>
                       
                    
                    </div>
                  </div>
                </section>

                <?php
      } ?>
              </div>
      </div>
  </div>
    <?php
  }else{
      ?>
    <div class="container" id="status-loading" ></div>
    <div class="margin_page ancla" id="tests">


      <div class="col">
                <div class="row">
                  <h3><b>Pruebas</b> </h3>

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
                        <a class="btn btn-success"  href="pruebas.php?newTest=true"><i class="fa fa-list-alt fa-2x"> </i> <br>  Crear Prueba</a>
                      </div>
                      <div class="col">
                        <a class="btn btn-success"  href="arquitectura.php"><i class="fa fa-sitemap fa-2x"> </i> <br>  Arquitectura</a>
                      </div>
                      <div class="col">
                        <a class="btn btn-success"  href="graph_view.php"><i class="fa fa-chart-bar fa-2x"> </i> <br>  Gráficas</a>
                      </div>
                    </div>
                  </div>
                </div>
      </div>

      <div class="tests">
          
            <div id="container table_desciption_test" class="animated fadeIn">
              <?php
                draw_table_testbed_pruebas($user_email); ?>
            </div>
            <div id="table_options_test" class="animated fadeIn">
            </div>
      </div>
  </div>


    <?php
  }
}
  ?>



<script type="text/javascript" >
  //enviar las pruebas seleccionada a ejecucion
	function ejecutar_prueba(){
    //obtener prueba
    
    //obtener variables
    var opciones_test = document.querySelectorAll('.display .options_test');
    // var opciones_test_emviar={};
    // for (i = 0; i < cars.length; i++) {
    //   fruits.splice(fruits.length,0, "aaa", "bb");
    // } 
    var array_to_send=[];
    var opcion_n=[];
    for (var i = opciones_test.length - 1; i >= 0; i--) {
    	opcion_n = [opciones_test[i].value,opciones_test[i].id]
    	array_to_send.splice(array_to_send.length , 0, opcion_n);
    }
    // alert(array_to_send[1]);

    var enviar = "se envio";
    var parametros = {
      "opciones_test": opciones_test[1].value
    };
    $.ajax({
      data:  parametros, //datos que se envian a traves de ajax
      url:   'execute_test.php', //archivo que recibe la peticion
      type:  'post', //método de envio
      beforeSend: function () {
              alert("enviando");
      },
      success:  function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve
              alert(response);
      }
    });
    //crear contenido del archivo
    //verificar o crear carpeta de usuario
    //enviar el archivo con nombre del usuario, fecha, hora
    //ejecutar el archivo remotamente
    

      // var elementos_enviar = document.getElementsByClassName("options_test");
      // $.post('execute_test.php',{elementos_enviar.forEach(datos())},function(respuesta){
        // alert(respuesta);
        // alert(variable[0].value);
      // }); 
    }



  // <script>$(function () {
  //   $('[data-toggle="popover"]').popover()
  // })
</script>









</div>
</div>
</div>


<?php
include('./include/footer.php');
?>


