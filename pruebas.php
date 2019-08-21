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

?>

<div class="container" id="status-loading"></div>
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
            draw_table_testbed_pruebas($user_email);
            ?>
            
          </div>
          <div id="table_options_test" class="animated fadeIn">
          </div>
  </div>
  
  <div id="test_bono" class="ancla">
    <nav class="navbar navbar-light bg-dark row"  onclick="show_hide_content_byClass('test_bono', 'indicate_requestArquitecture')">
      <a class="navbar-brand text-white"><b>Guia Prueba Bono</b></a><div class="float-right indicate_requestArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
    </nav>
    <div class="test_bono">
      	 <!-- <h1 class="titulo_arquitectura">Servicios Ambiente de Prueba IMS</h1> -->
      	
      		<!-- descripcion de las pruebas-->
      		<div class="container description_page_testbed">
            Esta guia contiene el paso a paso para contruir el escenario de prueba BONO el cual se encarga de emular usuarios conectados a la arquitectura Clearwater.<br>
            El archivo se debe guardar con extension .xml y se debera subir a la plataforma mediante el formulario de la siguiente seccion.<br>
            se debe tener en cuenta que el orden de las variables se debe guardar de a cuerdo a la seccion de la definicion de las variables.
          </div>
          
            <div class="container p-2 bg-dark slide-test-bono text-white">
            
              <?php
              
              guide_test($explain_test_bono,'0');
              ?>
              
            </div>
            <button id="btnShow_bono_all" class="btn btn-outline-info" onclick="$('#test_bono_all').show(); $('#btnHide_bono_all').show(); $('#btnShow_bono_all').hide();"> Ver Archivo completo</button>
            <button id="btnHide_bono_all" class="btn btn-outline-warning" onclick="$('#test_bono_all').hide(); $('#btnHide_bono_all').hide();$('#btnShow_bono_all').show();" style="display:none"> Ocultar Archivo completo</button>
            <div id="test_bono_all" class="container  animated fadeIn" style="display:none">
            <?php 
            guide_test_bono_all($explain_test_bono);
            ?>
            
          </div>
  </div>
  
  <div>

  <?php
  $dom_user=db_fetch_assoc("SELECT arquitectura, dominio, descripcion  from arqs_testbedims where usuario ='".$user_email."'");
      if( !empty($dom_user)){
                ?>
      <section id="test_dom ancla" class="section_admin_arquitecuta" style="margin-top: 20px;">
   <!--    <div class="name_section"> -->
        <nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('content_section', 'indicate_requestArquitecture')">
            <a class="navbar-brand text-white"><b>Crear Prueba</b></a><div class="float-right indicate_requestArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
          </nav>
        <!-- <div style="display: inline-block;"> -->
        <!-- <h4>Agregar pruebas a dominio</h4></div> -->
       <!--  <div class="dips" style="display: inline-block; margin: auto;">
          <button id="btn_see_table5" class="btn_see" onclick="$('#content_add_test').show();$('#btn_notsee_table5').show();$('#btn_see_table5').hide();"><i class="fa fa-angle-double-down fa-2x"></i></button>
          <button id="btn_notsee_table5" class="btn_see" onclick="$('#content_add_test').hide();$('#btn_see_table5').show();$('#btn_notsee_table5').hide();" style="display: none;"><i class="fa fa-angle-double-up fa-2x"></i></button>
      </div> -->
      <!-- </div> -->
      
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
                    }
                  ?> 
                </select>
                  <input type="text" name="name_test" placeholder="Nombre de prueba" required>
                  
                  
                  <input type="hidden" name="comand_test" placeholder="Comando de prueba" value="no">
                  <!-- <input type="text" name="description_test" placeholder="Descripcion"> -->
                  <textarea name="description_test" placeholder="Descripcion" required></textarea>
                  <input type="hidden" name="restriction_test" placeholder="Restriccciones" value="no">
                  <label><h3>Archivo XML</h3></label>
                  <input type="file" name="file_test" required>
                  
                  <div>
                    <input type="button" class="btn_form" id="btn_save_info" value="Definir Opciones" onclick="add_test()">
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

  <?php      
}
?>

    
  </div>
</div>

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


<!-- </script> -->