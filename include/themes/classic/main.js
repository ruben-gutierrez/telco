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
					alert("se agrego la arquitectura satisfactoriamente");
					// log-reporting
  				}
  				
  			}
  		
  		});

  	}
}
//funcion agregar una nueva arquitectura
function add_arquitec(){
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
	
}