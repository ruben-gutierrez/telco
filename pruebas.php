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

    ?>
  <div class="container" id="status-loading" ></div>
  <div class="margin_page ancla" id="tests">
        <nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('tests', 'indicate_requestArquitecture')">
          <a class="navbar-brand text-white"><b>Pruebas Disponibles para ejecutar</b></a><div class="float-right indicate_requestArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
        </nav>
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
}else{
  if($_GET['newTest']){
              $dom_user=db_fetch_assoc("SELECT arquitectura, dominio, descripcion  from arqs_testbedims where usuario ='".$user_email."'");
      if (!empty($dom_user)) {
          ?>
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

                      <a class="btn btn-success"  href="http://10.55.5.100/telco/pruebas.php"><i class="fa fa-list-alt fa-2x"> </i> <br>  Regresar</a>
                    </div>

                  </div>
                  
                </div>
                

              </div>
            </div>
          
                      <div class="content_section">
                          <label>Seleccione la arquitectura y agregue la información de la prueba</label>
                          <div id="content_add_test" style="display: block;">
                            <div id='form_1'>
                              <form method="post" id="form_add_test" class="form_arq" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="10">
                                <select name="dominio">
                                  <option value="">Seleccionar</option>
                                  <?php
                                    $dominios=db_fetch_assoc("select dominio from arqs_testbedims where usuario= '".$user_email."'");
                                      foreach ($dominios as $key => $value) {
                                          print("<option value='".$value['dominio']."'>".$value['dominio']."</option>");
                                      } ?> 
                                </select>
                                  <input type="text" name="name_test" placeholder="Nombre de prueba" required>
                                  
                                  
                                  <input type="hidden" name="comand_test" placeholder="Comando de prueba" value="no">
                                  <!-- <input type="text" name="description_test" placeholder="Descripcion"> -->
                                  <textarea name="description_test" placeholder="Descripcion" required></textarea>
                                  <input type="hidden" name="restriction_test" placeholder="Restriccciones" value="no">
                                  <label><h3>Archivo XML</h3></label>
                                  <input type="file" name="file_test" required>
                                  
                                  <div>
                                    <input type="button" class="btn_form btn btn-primary " id="btn_save_info" value="Guardar" onclick="add_test()">
                                    <input type="button" class="btn_form btn btn-outline-secondary" value="Cancelar" onclick="$('#content_add_test').hide();$('#btn_see_table5').show();$('#btn_notsee_table5').hide();$('#form_add_test')[0].reset();">
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

                      <a class="btn btn-success"  href="http://10.55.5.100/telco/pruebas.php?newTest=true"><i class="fa fa-list-alt fa-2x"> </i> <br>  Crear Prueba</a>
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












