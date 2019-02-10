<?php 

 global $contenido_pruebas, $email_array;
 include('./include/auth.php');
 top_header();

 // enviar correo de solicitud de arquitectura
if (isset($_GET['arq'])) {
	$from_email = db_fetch_cell_prepared('SELECT email_address FROM user_auth WHERE id =  ?', array($_SESSION['sess_user_id']));
	send_mail("rubengutierrez@unicauca.edu.co", "rubengutierrez@unicauca.edu.co" , "Solicitud arquitectura IMS" , "Se realiza la solicitud para la asignacion de la arquitectura ". $_GET['arq']. " para realizar, ya que tengo en conocimiento el reglamento ...., Solicitante ".$from_email);
		header("location:pruebas.php");
	
}
?>
<div class="margin_page">
	<h1 class="titulo_arquitectura">Servicios Ambiente de Prueba IMS</h1>
	<div>
		<!-- descripcion de las pruebas-->
		<div class="description_page_testbed">El ambiente de prueba Telco2.0 IMS permite a los usuarios evaluar el rendiemiento del nucleo IMS clearwater con dos tipos de pruebas Una de ellas consiste en emular el nodo Bono (Proxy) para enviar peticiones y solicitudes al nodo Sprout (Nucleo IMS) para verificar el rendieminto de este. Otra de las pruebas consiste en emular los usuarios que se registran para utilizar algun servicio IMS.
		</div>

		<!-- <table class="content_testbed"> -->
		<table id="tabla" class="tabla_contenido">
			<?php 
			draw_table_testbed_pruebas($contenido_pruebas);
			?>
		</table>
	</div>
</div>
<script type="text/javascript">
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




</script>