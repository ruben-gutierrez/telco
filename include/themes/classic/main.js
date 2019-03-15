// Host Autocomplete Magic
var pageName = basename($(location).attr('pathname'));

function themeReady() {
	height = get_height();
	$('#navigation, .cactiConsoleNavigationArea').css('height', height);
	$('#navigation, #navigation_right').show();

	keepWindowSize();

	$(window).unbind().resize(function(event) {
		if (pageName == 'graph_view.php') {
			treeWidth    = $('#navigation').width();
			totalWidth   = $('body').width();
			contentWidth = totalWidth - treeWidth - 25;
			$('#navigation').css('width', treeWidth);
			$('#navigation_right').css('width', contentWidth);
		}

		if (!$(event.target).hasClass('ui-resizable')) {
			height = get_height();
			$('#navigation, .cactiConsoleNavigationArea').css('height', height);
		}
	});
}

function get_height() {
	nsh  = parseInt($('#navigation').prop('scrollHeight'));
	nrsh = parseInt($('#navigation_right').prop('scrollHeight'));
	nh   = parseInt($('#navigation').height());
	nrh  = parseInt($('#navigation_right').height());
	wht  = $(window).height();
	return Math.max(nsh, nrsh, nh, nrh, wht);
}


// testbed ims


function guardar_arq(){
  // validacion
  
  //extraemos los datos a enviar
  var enviar=$("#form_data").serialize();
  enviar+="&file_name="+$('#uploadImage')[0].files[0].name;
  enviar+="&file_path="+$('#uploadImage')[0].value;
  //post para enviar la informacion
  $.post("solicitud_asignacion.php",enviar,function(res){
      var respuesta = JSON.parse(res);
      alert(respuesta);
  }),"json";
}

// ---------------------------------------------------------
//admin_testbedims.php
//-----------------------------------------------------------
//eventos a los botones de la tabla y llenar informacion en el formulario
//de editar
  $(document).on("click" , ".btn_arq_action", function()﻿ {
  	var btn=$(this)[0].name;
  	var fila=$(this).parents('tr')[0];
    // console.log("mensaje fila");
    // console.log($(this));

    // console.log(fila);
  	var id=$(this)[0].id.substr(-1,1);
  	var id_dec=$(this)[0].id.substr(-2,1);
  	var id_cen=$(this)[0].id.substr(-3,1);
  	var id_mil=$(this)[0].id.substr(-4,1);
  	// extraer el id la tabla de mysql
  	if ($.isNumeric( id_dec )) {
  		id=id_dec + id;
  		// console.log(id);
  		if ($.isNumeric( id_cen )) {
  			id=id_cen + id;
  			// console.log(id);
  			if ($.isNumeric( id_mil )) {
  				id=id_mil + id;
  				console.log(id);
  			}
  		}
  	}
  	//informacion de la fila que se selecciono
  	$('#btn_edit_arq').attr('name',id);
  	var info_arq = new Array();
  	for(var i = 0; i <= 2; i++){
  		
      info_arq.push(fila.cells[i].textContent);
  	}
  	
  	//boton editar, llena el formulario con los valores actuales
  	switch (btn){
  		case 'editar':
  			  	// if ( btn === 'editar') {
  			  		//desplegar formulario y ocultar tabla
  			  		$('#table_arquitectura').hide(500);
  			  		$('#mod_arq').show(600);
  			  		// llenar informacion en el formulario
  			  		info_arq.forEach(function(value, index) {
  						$('#form_edit_arq')[0][index+2].value=value;
  					});
  					// console.log(fila.cells[3].textContent);
  					$('#form_edit_arq')[0][4].files[0].name=fila.cells[3].textContent;
  				
  				// }

  		break;

  		case 'liberar':
  			var elec=confirm("¿Desea liberar la arquitectura?");
  			if (elec) {
  				var formData = new FormData();
  				formData.append('id', id);
  				formData.append('action', '2');
  				$.ajax({
		  			url: 'solicitud_asignacion.php',
		  			type: 'POST',
		  			contentType: false,
		  			processData: false,
		  			data: formData,
		  			beforesend: function(){

		  			},
		  			success: function(data){
		  				// console.log(data);
		  				if (data == '1') {
		  					fila.cells[4].textContent='libre';
		  					// log-reporting
		  				}else{
		  					alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
		  					// log-reporting
		  				}
		  				
		  			}
	  		
	  			});	
  				
  			}

  		break;

  		case 'eliminar':
  			var elec2=confirm("¿Desea eliminar la arquitectura?");
  			if (elec2) {
  				var formData = new FormData();
  				formData.append('id', id);
  				formData.append('action', '4');
  				$.ajax({
		  			url: 'solicitud_asignacion.php',
		  			type: 'POST',
		  			contentType: false,
		  			processData: false,
		  			data: formData,
		  			beforesend: function(){

		  			},
		  			success: function(data){
		  				console.log(data);
		  				if (data == '1') {
		  					$('#line'+id).remove();
		  					// log-reporting
		  				}else{
		  					alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
		  					// log-reporting
		  				}
		  				
		  			}
	  		
	  			});	
  				
  			}
  		break;

  	}

  	
  });

//funcion guardar de formulario editar
function edit_arq(){
	var id=$('#btn_edit_arq')[0].name;
	var fila=$('#line'+id)[0];	
	//extrae informacion de la tabla con el id
	var info_arq = new Array();
  	for(var i = 0; i <= 2; i++){
  		info_arq.push(fila.cells[i].textContent);
  	}
  	console.log(info_arq);
  	// comparacion
  	var f=0;
  	info_arq.forEach(function(value, index) {
	  		if ($('#form_edit_arq')[0][index+2].value != value) {
	  			f++;
	  		}
			
		});
  	if ( f == 0) {
  		alert("no se han cambiado los valores");
  	}else{
  		var parametros = new FormData($('#form_edit_arq')[0]);
  		parametros.append('id',id);
  		$.ajax({
  			url: 'solicitud_asignacion.php',
  			type: 'POST',
  			contentType: false,
  			processData: false,
  			data: parametros,
  			beforesend: function(){

  			},
  			success: function(data){
  				// console.log(data);
  				if ($.isNumeric(data)) {
  					$('#mod_arq').hide(300);
					$('#table_arquitectura').show(500);
  					alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
  					//log-reporting
  				}else{
  					$('#line'+id).remove();
					$('#table_estado_arq').append(data);
					$('#mod_arq').hide(300);
					$('#table_arquitectura').show(500);
					$('#form_edit_arq')[0].reset();
					alert("se agrego la arquitectura satisfactoriamente");
					// log-reporting
  				}
  				
  			}
  		
  		});

  	}
}
//funcion agregar una nueva arquitectura
function add_arquitec(){
  //verificar si los campos estan vacio
   
    var l=0;
    for (var i = 0; i < $('#form_new_arq')[0].length; i++) {
      if ($('#form_new_arq')[0][i].value == '') {
        l++;
      }
      
    }
    if (l == 0) {

	// console.log("entro e la funcion");
	var parametros = new FormData($('#form_new_arq')[0]);
	$.ajax({
		url: 'solicitud_asignacion.php',
		type: 'POST',
		contentType: false,
		processData: false,
		data: parametros,
		beforesend: function(){

		},
		success: function(data){
			// console.log(data);
			$('#table_estado_arq').append(data);
			$('#form_new_arq')[0].reset();
			alert("Se agrego la arquitectura correctamente");
			// log-reporting se agrego una nueva arquitectura
		}
	
	});
  }else{
    alert("Los campos son obligatorios");
  } 
	
}

function inf_new_arq(){


  // console.log("entro e la funcion");
  var parametros = new FormData($('#form_info_new_arq')[0]);
  $.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){

    },
    success: function(data){
      // console.log(data);
      alert(data);
			$('#form_info_new_arq')[0].reset();
			$('#form_dom_info')[0].reset();
      // log-reporting se agrego una nueva arquitectura
    }
  });
}

function change_arqs_by_user(){
  console.log("Punto de Control");
  var parametros = new FormData($('#form_arq_by_user')[0]);
  console.log(parametros);
  $.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){
      console.log("antes de entrar");
    },
    success: function(data){
      // console.log(data);
      if ( data !='' ) {
        $('#number_actual')[0].innerHTML=data;
      }
      $('#content_arqByUsuary').hide();
      $('#btn_see_table2').show();
      $('#btn_notsee_table2').hide();
    }
  });
}


function change_day_asig(){
  var parametros = new FormData($('#form_day_asig')[0]);
  $.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){

    },
    success: function(data){
      if (data !='' ) {
        $('#number_day_actual')[0].innerHTML=data;
      }
      $('#content_day_asig').hide();
      $('#btn_see_table3').show();
      $('#btn_notsee_table3').hide();
    }
  });

}

function desplegar_info_arq( dato ){
	var parametros = new FormData($('#form_dom_info')[0]);
	$.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    dataType: 'json',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){

    },
    success: function(data){
      console.log(data);
      if ($.isEmptyObject(data)) {
        $('#form_info_new_arq')[0][2].type='text';
      }else{
        $('#form_info_new_arq')[0][2].value=data['dominio'];
        $('#form_info_new_arq')[0][3].value=data['type'];
        $('#form_info_new_arq')[0][4].value=data['fist_number_ims'];
        $('#form_info_new_arq')[0][5].value=data['amount_extensions_ims'];
        $('#form_info_new_arq')[0][6].value=data['ip_bono'];
        $('#form_info_new_arq')[0][7].value=data['ip_sprout'];
        $('#form_info_new_arq')[0][8].value=data['ip_homer'];
        $('#form_info_new_arq')[0][9].value=data['ip_ellis'];
        $('#form_info_new_arq')[0][10].value=data['ip_vellum'];
        $('#form_info_new_arq')[0][11].value=data['ip_dime'];
        $('#form_info_new_arq')[0][12].value=data['ip_ibcf'];
        $('#form_info_new_arq')[0][13].value=data['ip_pstn'];
        $('#form_info_new_arq')[0][14].value=data['fist_number_pstn'];
        $('#form_info_new_arq')[0][15].value=data['amount_extensions_pstn'];
      }
    }
  });
}

function add_test(){
  console.log("funcion js");
  var parametro = new FormData($('#form_add_test')[0]);
  $.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametro,
    beforesend: function(){
    },
    success: function(date){
      // console.log(date);
      if (date != '') {
        alert("se agrego la prueba correctamente, ahora ingrese las opciones de l aprueba");
      }
      console.log(date);
      $('#form_info_test')[0][2].value=date;
      $('#form_add_test')[0].reset();
      $('#form_1').hide();
      $('#form_2').show();
    }
  });
}
function add_info_test(){
  var parametros = new FormData($('#form_info_test')[0]);
  $.ajax({
    url: 'solicitud_asignacion.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){

    },
    success: function(data){
      // console.log(data);
      alert(data);
    }
  });
}
//ejecucion de pruebas archivo ejecucion_pruebas.php
function display_table_test(id_test){
  // console.log(id_test);
  $.ajax({
    method: "POST",
    url: "ejecucion_pruebas.php",
    data: { action: "1", id_test2: id_test }
  })
  .done(function( msg ) {
    // console.log(msg);  
    $('#table_options_test').empty();
    $('#table_options_test').append(msg);
  });

}


function exe_test(){
  // console.log($('#form_execute_test').serialize());
  var parametros = new FormData($('#form_execute_test')[0]);
  $.ajax({
    url: 'ejecucion_pruebas.php',
    type: 'POST',
    contentType: false,
    processData: false,
    data: parametros,
    beforesend: function(){

    },
    success: function(data){
      alert("Comando a ejecutar en servidor SIPP \n"+data);
      console.log(data);
    }
  });
}




// Funciones de los botones para modificar el testbed
$(document).on('click', '.btn_action_info', function (element) {
  var btn_name=element.currentTarget.name;
  var parent_element_btn=element.currentTarget.parentElement.className;

 switch (btn_name){
   case 'add':
     console.log("funcion agregar");
     if (parent_element_btn == 'panel_btn_title') {
      console.log("titulo");
     }else{
       console.log("contenido");
     }
     break;
   case 'del':
     // console.log("funcion borrar");
     if (parent_element_btn == 'panel_btn_title') {
      del_info('title_info_page', element.currentTarget.id);
     }else{
       del_info('content_info_page', element.currentTarget.id);
     }
     break;
   case 'edit':
     console.log("funcion editar");
     if (parent_element_btn == 'panel_btn_title') {
      console.log("titulo");
     }else{
       console.log("contenido");
     }
     break;
   case 'up':
     console.log("funcion subir");
     if (parent_element_btn == 'panel_btn_title') {
      console.log("titulo");
     }else{
       console.log("contenido");
     }
     break;
   case 'down':
     console.log("funcion bajar");
     if (parent_element_btn == 'panel_btn_title') {
      console.log("titulo");
     }else{
       console.log("contenido");
     }
     break;
 }
    
    // console.log(element.currentTarget.id);
    // console.log();
});

// ocultar y mostrar los botones de accion para modificar el contenido del testbed
$(document).ready(function() {
  $('.title_info_page').hover(function(element) {
    /* Stuff to do when the mouse enters the element */
    $(element.currentTarget.lastChild).show();
    // console.log(element.currentTarget);
  }, function(element) {
    /* Stuff to do when the mouse leaves the element */
    $(element.currentTarget.lastChild).hide();
  });
  $('.content_info_page').hover(function(element) {
    /* Stuff to do when the mouse enters the element */
    $(element.currentTarget.lastChild).show();
    // console.log(element.currentTarget);
  }, function(element) {
    /* Stuff to do when the mouse leaves the element */
    $(element.currentTarget.lastChild).hide();
  });

});



//evento a cada elemento que se le de click en el DOM
// document.onclick = captura_click;
// function captura_click(e) {
//   // Funcion para capturar el click del raton
//   var HaHechoClick;
//   if (e == null) {
//     // Si hac click un elemento, lo leemos
//     HaHechoClick = event.srcElement;
//   } else {
//     // Si ha hecho click sobre un destino, lo leemos
//     HaHechoClick = e.target;
//   }

//   // Una prueba con salida en consola
//   console.log("Contenido sobre lo que ha hecho click: "+HaHechoClick.id);  
// }
// 
// 
// 
function del_info(table, id){
  $.ajax({
    method: "POST",
    url: "admin_info.php",
    data: { action: "1", table: table, id:id }
  })
  .done(function( msg ) {
    // console.log(msg);
    if (msg==1) {
      if (table=='title_info_page') {
         $('#'+id+'.title_info_page').empty();
      }else{
        $('#'+id+'.content_info_page').empty()
      }
    }else{
      alert("Error al borrar contenido, intentelo mas tarde");
    }
  });
}

