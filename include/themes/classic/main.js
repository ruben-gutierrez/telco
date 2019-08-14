// Host Autocomplete Magic
var pageName = basename($(location).attr('pathname'));
var idUser=0;
function identifiUser(userId){
    idUser = userId;
    // console.log(userId);
}
function themeReady() {
    height = get_height();
    $('#navigation, .cactiConsoleNavigationArea').css('height', height);
    $('#navigation, #navigation_right').show();

    keepWindowSize();

    $(window).unbind().resize(function(event) {
        if (pageName == 'graph_view.php') {
            treeWidth = $('#navigation').width();
            totalWidth = $('body').width();
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
    nsh = parseInt($('#navigation').prop('scrollHeight'));
    nrsh = parseInt($('#navigation_right').prop('scrollHeight'));
    nh = parseInt($('#navigation').height());
    nrh = parseInt($('#navigation_right').height());
    wht = $(window).height();
    return Math.max(nsh, nrsh, nh, nrh, wht);
}


// testbed ims
function guardar_arq() {
    // validacion

    //extraemos los datos a enviar
    var enviar = $("#form_data").serialize();
    enviar += "&file_name=" + $('#uploadImage')[0].files[0].name;
    enviar += "&file_path=" + $('#uploadImage')[0].value;
    //post para enviar la informacion
    $.post("solicitud_asignacion.php", enviar, function(res) {
        var respuesta = JSON.parse(res);
        mensaje(titulo, respuesta);
    }), "json";
}

// ---------------------------------------------------------
//admin_testbedims.php
//-----------------------------------------------------------
//eventos a los botones de la tabla y llenar informacion en el formulario
//de editar
$(document).on("click", ".btn_arq_action", function()﻿ {
    console.log(idUser);
    console.log("fffffffffff");
    var btn = $(this)[0].name;
    var fila = $(this).parents('tr')[0];
    // console.log("mensaje fila");
    // console.log($(this));

    // console.log(fila);
    var id = $(this)[0].id.substr(-1, 1);
    // console.log(id);
    var id_dec = $(this)[0].id.substr(-2, 1);
    var id_cen = $(this)[0].id.substr(-3, 1);
    var id_mil = $(this)[0].id.substr(-4, 1);
    // extraer el id la tabla de mysql
    if ($.isNumeric(id_dec)) {
        id = id_dec + id;
        // console.log(id);
        if ($.isNumeric(id_cen)) {
            id = id_cen + id;
            // console.log(id);
            if ($.isNumeric(id_mil)) {
                id = id_mil + id;
                console.log(id);
            }
        }
    }
    //informacion de la fila que se selecciono
    $('#btn_edit_arq').attr('name', id);
    var info_arq = new Array();
    for (var i = 0; i <= 2; i++) {

        info_arq.push(fila.cells[i].textContent);
    }

    //boton editar, llena el formulario con los valores actuales
    switch (btn) {
        case 'editar':
            // if ( btn === 'editar') {
            //desplegar formulario y ocultar tabla
            $('#table_arquitectura').hide(500);
            $('#mod_arq').show(600);
            // llenar informacion en el formulario
            info_arq.forEach(function(value, index) {
                $('#form_edit_arq')[0][index + 2].value = value;
            });

            // console.log(fila.cells[3].textContent);
            // $('#form_edit_arq')[0][4].files[0].name = fila.cells[3].textContent;
            var domainform = $('#form_edit_arq')[0][3].value;
            consult_restrictions(domainform);


            // }

            break;

        case 'liberar':
            var elec = confirm("¿Desea liberar la arquitectura?");
            if (elec) {
                var formData = new FormData();
                formData.append('id', id);
                formData.append('idUser', idUser);
                formData.append('action', '2');
                $.ajax({
                    url: 'solicitud_asignacion.php',
                    type: 'POST',
                    contentType: false,
                    processData: false,
                    data: formData,
                    beforesend: function() {

                    },
                    success: function(data) {
                        // console.log(data);
                        if (data == '1') {
                            fila.cells[4].textContent = 'libre';
                            // log-reporting
                        } else {
                            alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
                            // log-reporting
                        }

                    }

                });

            }

            break;

        case 'eliminar':
            console.log(id);
            var elec2 = confirm("¿Desea eliminar la arquitectura?");
            if (elec2) {
                var formData = new FormData();
                formData.append('id', id);
                formData.append('idUser', idUser);
                formData.append('action', '4');
                $.ajax({
                    url: 'solicitud_asignacion.php',
                    type: 'POST',
                    contentType: false,
                    processData: false,
                    data: formData,
                    beforesend: function() {

                    },
                    success: function(data) {
                        console.log(data);
                        if (data == '1') {
                            $('#line' + id).remove();
                            // log-reporting
                        } else {
                            alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
                            // log-reporting
                        }

                    }

                });

            }
            break;

    }


});

//funcion editar arquitectura 
function edit_arq() {
    var id = $('#btn_edit_arq')[0].name;
    var fila = $('#line' + id)[0];
    //extrae informacion de la tabla con el id
    var info_arq = new Array();
    for (var i = 0; i <= 2; i++) {
        info_arq.push(fila.cells[i].textContent);
    }
    // console.log(info_arq);
    // comparacion
    // var f = 0;
    // info_arq.forEach(function(value, index) {
    //     if ($('#form_edit_arq')[0][index + 2].value != value) {
    //         f++;
    //     }

    // });
    // if (f == 0) {
    //     alert("no se han cambiado los valores");
    // } else {
    var parametros = new FormData($('#form_edit_arq')[0]);
    // action=5
    parametros.append('id', id);
    parametros.append('idUser', idUser);
    $.ajax({
        url: 'solicitud_asignacion.php', //action 5
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            if ($.isNumeric(data)) {
                $('#mod_arq').hide(300);
                $('#table_arquitectura').show(500);
                alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
                //log-reporting
            } else {
                $('#line' + id).remove();
                $('#table_estado_arq').append(data);
                $('#mod_arq').hide(300);
                $('#table_arquitectura').show(500);
                $('#form_edit_arq')[0].reset();
                alert("se agrego la arquitectura satisfactoriamente");
                // log-reporting
            }

        }

    });

    // }
}
//funcion agregar una nueva arquitectura
function add_arquitec() {
    //verificar si los campos estan vacio

    var l = 0;
    for (var i = 0; i < $('#form_new_arq')[0].length; i++) {
        if ($('#form_new_arq')[0][i].value == '') {
            l++;
        }

    }
    if (l == 0) {
        if (ValidateIPaddress($('#form_new_arq')[0][3].value)) {
            // console.log("entro e la funcion");
            var parametros = new FormData($('#form_new_arq')[0]);
            parametros.append('idUser', idUser);
            $.ajax({
                url: 'solicitud_asignacion.php',//action 3
                type: 'POST',
                contentType: false,
                processData: false,
                data: parametros,
                beforesend: function() {

                },
                success: function(data) {
                    console.log(data);
                    if (data == 'upload fallo' || data == '') {
                        mensaje('Error', 'Recuerde que el dominio es único.\nVerifique los datos e intentelo nuevamente');
                    } else {
                        $('#table_estado_arq').append(data);

                        mensaje('Arquitectura', 'Creada con exito');
                        $('.ajs-footer').hide();
                        $('#form_new_arq')[0].reset();

                        // log-reporting se agrego una nueva arquitectura
                    }

                }

            });

        } else {
            mensaje('Alerta', 'La direccion IP esta mal escrita');
        }


    } else {
        alert("Los campos son obligatorios");
    }

}

function create_core() {
    var parametros = new FormData($('#form_info_new_arq')[0]);
    $.ajax({
        // action=6
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {
            console.log("Procesando");
        },
        success: function(data) {
            console.log(data);

        }
    });

}

function change_arqs_by_user() {
    console.log("Punto de Control");
    var parametros = new FormData($('#form_arq_by_user')[0]);
    parametros.append('idUser', idUser);
    console.log(parametros);
    $.ajax({
        url: 'solicitud_asignacion.php', //action 7
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {
            console.log("antes de entrar");
        },
        success: function(data) {
            console.log(data);
            if (data != '') {
                $('#number_actual')[0].innerHTML = data;
            }
            // $('#content_arqByUsuary').hide();
            // $('#btn_see_table2').show();
            // $('#btn_notsee_table2').hide();
        }
    });
}


function change_day_asig() {
    var parametros = new FormData($('#form_day_asig')[0]);
    parametros.append('idUser', idUser);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            console.log(data);
            if (data != '') {
                $('#number_day_actual')[0].innerHTML = data;
            }
            // $('#content_day_asig').hide();
            // $('#btn_see_table3').show();
            // $('#btn_notsee_table3').hide();
        }
    });

}


function desplegar_info_arq(dato) {
    //solicitud_asignacion.php action 6
    // console.log("desplega funcion");
    var parametros = new FormData($('#form_dom_info')[0]);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        dataType: 'json',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            console.log(data);
            // if ($('#form_dom_info')[0][1].name == 'action') {
            //     var dom = $('#form_dom_info')[0][2].value;
            // } else {
            //     var dom = $('#form_dom_info')[0][1].value;
            // }
            // if ($.isEmptyObject(data)) {
            //     // console.log("el array esta vacio");
            //     $('#form_info_new_arq')[0].reset();
            //     if ($('#form_info_new_arq')[0][1].name == 'action') {
            //         $('#form_info_new_arq')[0][2].value = dom;
            //     } else {
            //         $('#form_info_new_arq')[0][1].value = dom;
            //     }
            // } else {
            //     if ($('#form_info_new_arq')[0][1].name == 'action') {
            //         console.log("con info add");
            //         $('#form_info_new_arq')[0].reset();
            //         $('#form_info_new_arq')[0][2].value = dom;
            //         // $('#form_info_new_arq')[0][1].value=data['dominio'];
            //         $('#form_info_new_arq')[0][3].value = data['type'];
            //         $('#form_info_new_arq')[0][4].value = data['fist_number_ims'];
            //         $('#form_info_new_arq')[0][5].value = data['amount_extensions_ims'];
            //         $('#form_info_new_arq')[0][6].value = data['ip_bono'];
            //         $('#form_info_new_arq')[0][7].value = data['ip_sprout'];
            //         $('#form_info_new_arq')[0][8].value = data['ip_homer'];
            //         $('#form_info_new_arq')[0][9].value = data['ip_ellis'];
            //         $('#form_info_new_arq')[0][10].value = data['ip_vellum'];
            //         $('#form_info_new_arq')[0][11].value = data['ip_dime'];
            //         $('#form_info_new_arq')[0][12].value = data['ip_ibcf'];
            //         $('#form_info_new_arq')[0][13].value = data['ip_pstn'];
            //         $('#form_info_new_arq')[0][14].value = data['fist_number_pstn'];
            //         $('#form_info_new_arq')[0][15].value = data['amount_extensions_pstn'];
            //     } else {
            //         console.log("sin info add");
            //         $('#form_info_new_arq')[0].reset();
            //         $('#form_info_new_arq')[0][1].value = $('#form_dom_info')[0][1].value;
            //         // $('#form_info_new_arq')[0][1].value=data['dominio'];
            //         $('#form_info_new_arq')[0][2].value = data['type'];
            //         $('#form_info_new_arq')[0][3].value = data['fist_number_ims'];
            //         $('#form_info_new_arq')[0][4].value = data['amount_extensions_ims'];
            //         $('#form_info_new_arq')[0][5].value = data['ip_bono'];
            //         $('#form_info_new_arq')[0][6].value = data['ip_sprout'];
            //         $('#form_info_new_arq')[0][7].value = data['ip_homer'];
            //         $('#form_info_new_arq')[0][8].value = data['ip_ellis'];
            //         $('#form_info_new_arq')[0][9].value = data['ip_vellum'];
            //         $('#form_info_new_arq')[0][10].value = data['ip_dime'];
            //         $('#form_info_new_arq')[0][11].value = data['ip_ibcf'];
            //         $('#form_info_new_arq')[0][12].value = data['ip_pstn'];
            //         $('#form_info_new_arq')[0][13].value = data['fist_number_pstn'];
            //         $('#form_info_new_arq')[0][14].value = data['amount_extensions_pstn'];
            //     }

            // }
        }
    });
}

function add_test() {
    // console.log("funcion js");
    var cont = 0;
    var elements = $('#form_add_test')[0];
    for (var i = elements.length - 1; i >= 0; i--) {
        console.log($('#form_add_test')[0][i].value);
        if ($('#form_add_test')[0][i].value == '') {
            cont += 1;

        }
    }
    // console.log(cont);
    if (cont == 0) {
        var parametro = new FormData($('#form_add_test')[0]);
        parametro.append('idUser', idUser);
        $.ajax({
            url: 'solicitud_asignacion.php', //action 10
            type: 'POST',
            contentType: false,
            processData: false,
            data: parametro,
            beforesend: function() {},
            success: function(date) {
                // console.log(date);
                if (date != '') {
                    alert("se agrego la prueba correctamente, ahora ingrese las opciones de l aprueba");
                }
                // console.log(date);
                $('#form_info_test')[0][2].value = date;
                $('#form_add_test')[0].reset();
                $('#form_1').hide();
                $('#form_2').show();
            }
        });
    } else {
        mensaje('Alerta', 'Los campos deben estar llenos, intentelo nuevamente.');
    }
}

function add_info_test() {
    
    var parametros = new FormData($('#form_info_test')[0]);
    parametros.append('idUser', idUser);
// accion
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            alert(data);

        }
    });
}
//ejecucion de pruebas archivo ejecucion_pruebas.php
function display_table_test(id_test) {
    // console.log(id_test);
    $.ajax({
            method: "POST",
            url: "ejecucion_pruebas.php",
            data: { action: "1", id_test2: id_test }
        })
        .done(function(msg) {
            // console.log(msg);  
            $('#table_options_test').empty();
            $('#table_options_test').append(msg);

        });

}


function exe_test() {
    // console.log($('#form_execute_test').serialize());
    var parametros = new FormData($('#form_execute_test')[0]);
    $.ajax({
        url: 'ejecucion_pruebas.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            alert("Comando a ejecutar en servidor SIPP \n" + data);
            console.log(data);
        }
    });
}


function fun1() {
    $('#add_content')[0][1].remove();
    $('#add_content').append('<input type="text" name="content"  placeholder="Contentido">');
}

function fun2() {
    $('#add_content')[0][1].remove();
    $('#add_content').append('<input type="file" name="content"  placeholder="Contentido">');
}

function fun3() {
    $('#add_content')[0][1].remove();
    $('#add_content').append('<textarea type="text" name="content"></textarea>');
}

// Funciones de los botones para modificar informacion del testbed
$(document).on('click', '.btn_action_info', function(element) {
    var btn_name = element.currentTarget.name;
    var parent_element_btn = element.currentTarget.parentElement.className;
    var title_of_element = element.currentTarget.parentElement.parentElement.parentElement.id;
    var element_current = element.currentTarget.id;

    switch (btn_name) {
        case 'add':
            // console.log("funcion agregar");
            if (parent_element_btn == 'panel_btn_title') {
                var formulario = '<form class="form_info_page" id="add_title"><input type="text" name="main_title" value="" placeholder="Titulo de la seccion"></form>';
                form_add_title(element_current, 'Formulario agregar titulo', formulario);
            } else {

                // var formulario='<form class="form_info_page" id="add_content"><input type="text" name="type" value="" placeholder="Tipo de contenido"><input type="text" name="content" value="" placeholder="Agregue el contenido"></form>';
                var formulario = "<form class='form_info_page' id='add_content'><select name='type' ><option value='sub' onclick='fun1()'>Subtitulo</option><option value='img' onclick='fun2()'>Imagen</option><option value='text' onclick='fun3()'>Texto</option></select> <input type='text' name='content' value='' placeholder='Agregue el contenido'></form>";
                form_add_content(element_current, title_of_element, 'Formulario agregar elemento', formulario);




            }
            break;
        case 'del':
            // console.log("funcion borrar");
            if (parent_element_btn == 'panel_btn_title') {
                del_info('title_info_page', element.currentTarget.id);
            } else {
                del_info('content_info_page', element.currentTarget.id);
            }
            break;
        case 'edit':
            console.log("funcion editar");
            if (parent_element_btn == 'panel_btn_title') {
                var formulario = '<form class="form_edit_title" id="edit_title"><input type="text" name="main_title" value="" placeholder="Titulo de la seccion"></form>';
                form_edit_title(element_current, 'Formulario editar titulo', formulario);
            } else {
                var formulario = '<form class="form_edit_content" id="edit_content"><input type="text" name="type" value="" placeholder="Tipo de contenido"><input type="text" name="content" value="" placeholder="Agregue el contenido"></form>';
                form_edit_content(element_current, title_of_element, 'Formulario editar elemento', formulario);
            }
            break;
        case 'up':
        case 'down':
            // console.log(btn_name);
            if (parent_element_btn == 'panel_btn_title') {
                // console.log("titulo");
                move_title(element_current, btn_name);
            } else {
                // console.log("contenido");
                move_content(title_of_element, element_current, btn_name);
            }
            break;

    }
    // console.log(element.currentTarget.id);
    // console.log();
});

// ocultar y mostrar los botones de accion para modificar el contenido del testbed

$(document).on('mouseenter', '.title_info_page , .content_info_page', function(element) {
    $(element.currentTarget.lastChild).show();
});
$(document).on('mouseleave', '.title_info_page , .content_info_page', function(element) {
    $(element.currentTarget.lastChild).hide();
});
//funciones de los botones
function del_info(table, id) {
    $.ajax({
            method: "POST",
            url: "admin_info.php",
            data: { action: "1", table: table, id: id, idUser: idUser }
        })
        .done(function(msg) {
            // console.log(msg);
            if (msg == 1) {
                if (table == 'title_info_page') {
                    $('#' + id + '.title_info_page').empty();
                } else {
                    $('#' + id + '.content_info_page').empty()
                }
            } else {
                alert("Error al borrar contenido, intentelo mas tarde");
            }
        });
}


function add_title(id) {
    var parametros = new FormData($('#add_title')[0]);
    parametros.append('id', id);
    parametros.append('idUser', idUser);
    parametros.append('action', '2');
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            $('#content_info_page').html(data);
            // mensaje('Mensaje','Titulo agregado correctamente');
        }
    });
}

function add_content(id_content, id_title) {
    var parametros = new FormData($('#add_content')[0]);
    parametros.append('id_content', id_content);
    parametros.append('idUser', idUser);
    parametros.append('id_title', id_title);
    parametros.append('action', '3');
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {
            console.log(parametros);
        },
        success: function(data) {
            // console.log(data);
            $('#content_info_page').html(data);
            // mensaje('Mensaje','Titulo agregado correctamente');
        }
    });
}

function edit_title(id) {
    var parametros = new FormData($('#edit_title')[0]);
    parametros.append('id', id);
    parametros.append('idUser', idUser);
    parametros.append('action', '4');
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            if (data != '') {
                $('#content_info_page').html(data);
            }

            // mensaje('Mensaje','Titulo agregado correctamente');
        }
    });
}

function edit_content(id_content, id_title) {
    var parametros = new FormData($('#edit_content')[0]);
    parametros.append('id_content', id_content);
    parametros.append('id_title', id_title);
    parametros.append('idUser', idUser);
    parametros.append('action', '5');
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            if (data != '') {
                $('#content_info_page').html(data);
            }
            // mensaje('Mensaje','Titulo agregado correctamente');
        }
    });
}

function move_title(id_title, direc) {
    $.ajax({
            method: "POST",
            url: "admin_info.php",
            data: { action: "6", id_title: id_title, direc: direc, idUser: idUser}
        })
        .done(function(data) {
            // console.log(data);  
            if (data != '') {
                $('#content_info_page').html(data);
            }
        });
}

function move_content(id_title, id_content, direc) {
    $.ajax({
            method: "POST",
            url: "admin_info.php",
            data: { action: "7", id_title: id_title, direc: direc, id_content: id_content,idUser: idUser }
        })
        .done(function(data) {
            // console.log(data);  
            if (data != '') {
                $('#content_info_page').html(data);
            }
        });
}
/////funciones para mensajes y ventanas de notificacion
function form_add_title(id, title, content) {
    var confirm = alertify.confirm(title, content, null, null).set('labels', { ok: 'Agregar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        add_title(id);

        alertify.success('Titulo agregado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Acción cancelada');
    })

}

function form_edit_title(id, title, content) {
    var confirm = alertify.confirm(title, content, null, null).set('labels', { ok: 'Editar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        edit_title(id);
        alertify.success('Titulo agregado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Acción cancelada');
    })

}

function form_add_content(id_content, id_title, title_form, formulario) {
    var confirm = alertify.confirm(title_form, formulario, null, null).set('labels', { ok: 'Agregar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        add_content(id_content, id_title);
        alertify.success('Titulo agregado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Acción cancelada');
    })

}

function form_edit_content(id_content, id_title, title_form, formulario) {
    var confirm = alertify.confirm(title_form, formulario, null, null).set('labels', { ok: 'Agregar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        edit_content(id_content, id_title);
        alertify.success('Titulo agregado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Acción cancelada');
    })

}



function goToId(idName) {
    if ($('#' + idName).length) {
        document.getElementById(idName).focus();

        // var target_offset = $("#"+idName).offset();
        // var target_top = target_offset.top;
        // $('html,body').animate({scrollTop:target_top},{duration:"slow"});
    }
}

function see_table() {
    $('#table_arquitectura').show();
    $('#btn_notsee_table').show();
    $('#btn_see_table').hide();
    $('#add_arq').hide();
}

function refresh_selector(div_form) {
    console.log(div_form);
    $.ajax({
            method: "POST",
            url: "admin_info.php",
            data: { action: "8", func: div_form }
        })
        .done(function(data) {
            // console.log(data);
            $('#' + div_form).empty();
            $('#' + div_form).html(data);
        });
}


function ValidateIPaddress(ipaddress) {
    if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ipaddress)) {
        return (true);
    } else {
        return (false);
    }
}




function searcWord(searcWord, element) {
    var re = new RegExp(searcWord);
    if (re.test(element)) {
        return true;
    } else {
        return false;
    }
}

function show_hide_content_byClass(content, incator) {
    // console.log($('.'+incator)[0].children);
    if (incator == 'none') {
        $('.' + content)[0].classList.toggle('oculto');
        $('.' + content)[0].classList.toggle('muestra');
    } else {
        $('.' + incator)[0].children[0].classList.toggle('fa-eye');
        $('.' + incator)[0].children[0].classList.toggle('fa-eye-slash');
        if ($('.' + content)[0].style.display == 'none') {
            // console.log("oculto");
            $('.' + content)[0].style.display = 'block';
        } else {
            // console.log("visible");
            $('.' + content)[0].style.display = 'none';
        }
    }

}

function showInfoDomain(IdDomain, core) {



    $.ajax({
            method: "POST",
            url: "solicitud_asignacion.php",
            data: { action: "12", domain: IdDomain, core: core }
        })
        .done(function(data) {
            // console.log(data);
            if (data.length > 0) {
                var answer = JSON.parse(data);
                // console.log(answer);
                //    console.log(core);
                data = "<div class='container' id='status-loading'></div>";
                data += "<div class='container'>";

                data += "<div class='row'>";

                data += '<table class="table" id="table_vms_domain">';
                data += '<thead class="thead-dark">';
                data += '<tr><th scope="col">Nombre</th><th scope="col">Direccioón IP</th><th scope="col">Caracteristicas</th><th scope="col">Terminal</th></tr></thead><tbody>';
                // var num=1;
                // var ips={ip_bono:answer[0].ip_bono,ip_sprout:answer[0].ip_sprout,ip_ellis:answer[0].ip_ellis,ip_homer:answer[0].ip_homer,ip_vellum:answer[0].ip_vellum,ip_dime:answer[0].ip_dime,ip_ibcf:answer[0].ip_ibcf};
                for (var x in answer) {
                    // console.log(answer[x]['name_server']);
                    status = answer[x]['status'];
                    if (status == "SHUTOFF") {
                        status = "Apagada";
                    } else {
                        status = "Encendida";
                    }
                    data += '<tr id="' + answer[x]['id_server'] + '"> <th scope="row">' + answer[x]['name_server'] + '<br> ' + status + '<div id="prop_vm">ram:' + answer[x]['ram'] + '<br>Disk: ' + answer[x]['disk'] + '<br> Vcpu: ' + answer[x]['vcpus'] + '</div></th><td>' + answer[x]['ip_local'] + '</td>';
                    data += '<td><form class="form" id="vertical_scalability">';
                    data += '<div class="row"><input class="col-md-3" type="number" name="ram" placeholder="RAM">';
                    data += '<input class="col-md-3" type="number" name="vcpu" placeholder="CPU">';
                    data += '<input class="col-md-3" type="number" name="disk" placeholder="Disk">';
                    data += '<input class="btn btn-outline-info btn-sm m-1" type="button" id="' + answer[x]['id_server'] + '" value="Editar" onclick="reziseVM(`' + answer[x]['id_server'] + '`)">  <div class="logo ml-2"><i class="fa fa-spinner fa-3x" id="' + answer[x]['id_server'] + '" style="display:none"></i></div></form>';
                    data += '<div class="row">';
                    if (status == "Apagada") {
                        data += '<button class="btn " id="' + answer[x]['id_server'] + '" type="button" title="Encender" onclick="onVM(`' + answer[x]['id_server'] + '`)"><i class="fa fa-power-off text-danger fa-2x"></i></button>';
                    } else {
                        data += '<button class="btn "  id="' + answer[x]['id_server'] + '" type="button" title="Apagar. Tarda 1 min" onclick="offVM(`' + answer[x]['id_server'] + '`)"><i class="fa fa-power-off text-success fa-2x"></i></button>';
                    }
                    data += '<input class="btn btn-outline-secondary btn-sm m-1 " type="button" id="takesnap' + answer[x]['id_server'] + '" value="Punto de control" onclick="takeSnaptVM(`' + answer[x]['id_server'] + '`,`' + answer[x]['name_server'] + '`)">';
                    data += '<input class="btn btn-outline-secondary btn-sm m-1" type="button" id="' + answer[x]['id_server'] + '" value="Reestablecer" onclick="returnSnaptVM(`' + answer[x]['id_server'] + '`)">';
                    data += '<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="eliminarVM(`' + answer[x]['id_server'] + '`)">Eliminar</button></div>';
                    data += '</td>';
                    data += '<td><button class="btn btn-outline-success" onclick="terminal(`' + answer[x]['id_server'] + '`)">Terminal</button></td></tr>';
                    // num +=1;
                }
                data += '</div></div>';

                mensaje("Maquinas VM de la Arquitectura", data);
                // mensaje("Maquinas VM de la Arquitectura", answer);
            } else {

                mensaje("Maquinas VM de la Arquitectura", "Esta arquitectura no tiene Maquinas virtuales registradas.");
            }
        });
}

function terminal(idServer) {

    var parametros = new FormData();
    parametros.append('action', '17');
    parametros.append('id_server', idServer);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        timeout: 10000,
        beforeSend: function() {
            notifications("terminal", "Creando interfaz para terminal");
        },
        success: function(data) {
            // console.log(data);
            if (data == '0') {
                console.log("error al desplegar Terminal");
            } else {
                window.open('http://' + data + ':7676', '_blank');
            }
        },
        complete: function() {
            deleteNotification("terminal");
        },
        error: function(){
            alert("Intelo Nuevamente");
        }
    });
}


function eliminarVM(idServer) {
    // console.log(idServer);
    $.ajax({
            method: "POST",
            url: "requestOpenstack.php",
            data: { action: "1", idServer: idServer }
        })
        .done(function(data) {
            // console.log(data);
            if (data == "1") {

                alertify.success('VM Eliminada');
                $('.alertify').remove();

            } else {
                alertify.error('Error al borrar VM, intentelo más tarde o contacta al administrador');
            }


        });
}

function onVM(idServer) {
    $('.alertify').remove();
    var answer = openstackSendIdServer("2", idServer);
    return answer;
}

function offVM(idServer) {
    $('.alertify').remove();
    var answer = openstackSendIdServer("3", idServer);
    return answer;
}

function takeSnaptVM(idServer, nameServer) {
    var action = '15';
    var parametros = new FormData();
    parametros.append('action', action);
    parametros.append('id_server', idServer);
    parametros.append('name_server', nameServer);

    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,

        beforeSend: function() {
            notifications("Instantanea", "Estableciendo Punto de control");
        },
        success: function(data) {
            console.log(data);

        },
        complete: function() {
            deleteNotification("Instantanea");
        },

        dataType: 'html'

    });
}

function returnSnaptVM(idServer) {
    var action = '16';
    var parametros = new FormData();
    parametros.append('action', action);
    parametros.append('id_server', idServer);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforeSend: function() {
            notifications("returnPointControl", "Retornando a punto de control");
        },
        success: function(data) {
            console.log(data);
        },
        complete: function() {
            deleteNotification("returnPointControl");
        },
        dataType: 'html'
    });
}

function openstackSendIdServer(action, idServer) {
    $.ajax({
            method: "POST",
            url: "requestOpenstack.php",
            data: { action: action, idServer: idServer }
        })
        .done(function(data) {
            return data;
        });
}

function reziseVM(idServer) {

    var parametros = new FormData($('#vertical_scalability')[0]);
    parametros.append('action', '14');
    parametros.append('id_server', idServer);

    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforeSend: function() {
            $('i#' + idServer + '.fa').show();
        },
        success: function(data) {
            // $('i#' + idServer + '.fa').hide();
            // $('.alertify').remove();
            console.log(data);
            alertify.success('VM Modificada');
        },
        complete: function() {
            $('i#' + idServer + '.fa').hide();
        }

    });

}

function sendIdServerToServer(action, id_server) {
    var parametros = new FormData();
    parametros.append('action', action);
    parametros.append('id_server', id_server);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            return data;
        }

    });

}

function addVmtoDomain(idDomain) {
    // var content='<form>  <div class="form-row">    <div class="form-group col-md-6">     <div class="form-group col-md-6">      <label>Nombre</label>      <input type="text" class="form-control" name="nameNewVm" placeholder="Nombre">    </div>  </div>  <div class="form-group"> <input type="hidden" class="form-control" id="networkNewMv" value="">  </div>  <div class="form-group">    <label>Flavor</label>    <input type="text" class="form-control col-md-2" id="flavorNewVm" placeholder="RAM "> <input type="text" class="form-control col-md-2" id="flavorNewVm" placeholder="VCPU "> <input type="text" class="form-control col-md-2" id="flavorNewVm" placeholder="DISK "></div>    <div class="form-group col-md-4">      <label>Sistema Operativo</label>      <select id="imageNewVm" class="form-control">        <option selected>Choose...</option>        <option>Ubuntu14</option><option>Ubuntu16</option> <option>centos19</option><option>Lubuntu</option>     </select>    </div>    </div>  <div class="form-group">    <div class="form-check">      <input class="form-check-input" type="checkbox" id="gridCheck">      <label class="form-check-label" for="gridCheck">        Check me out      </label>    </div>  </div>  <button type="submit" class="btn btn-primary">Sign in</button></form>';
    var parametros = new FormData();
    parametros.append('action', '10');
    parametros.append('id_domain', idDomain);
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforeSend: function() {

        },
        success: function(data) {
            // console.log(data)
            data = JSON.parse(data);
            console.log(data);
            if (data.options == '0') {
                alert("No puede agregar máquinas virtuales");
            } else {
                var content = '<form id="add_vm_domain"> <input type="hidden" class="form-control" id="idDomain" name="idDomain" placeholder="action" value="' + idDomain + '"> <div class="form-row">    <div class="form-group col-md-6">     <div class="form-group col">      <label>Nombre</label>      <input type="text" class="form-control " name="nameNewVm" id="nameNewVm" placeholder="Nombre" title="Nombre de la maquina virtual" required autofocus> </div> <div class="form-group col">      <label>Sistema Operativo</label>      <select name="imageNewVm" id="imageNewVm" class="form-control" title="Imagen del sistema operativo que tendra la Máquina virtual" placeholder="Sistema Operativo" required>        ' + data.options + ' </select>    </div>  </div>    <div class="form-group ">    <label for="ramNewVm">Memoria RAM</label>   <input type="number" class="form-control col-md-6" id="ramNewVm" name="ramNewVm" min="1" max="'+data.ram+'"placeholder="MB"  title="Memoria Ram de la nueva máquina virtual" required>  <label for="vcpuNewVm">Número de procesadores</lavel><input type="number" class="form-control col-md-6" id="vcpuNewVm" name="vcpuNewVm" min="1" max="'+data.vcpu+'" placeholder="Número" title="Número de procesadores de la Nueva máquina virtual" required> <label for="diskNewVm">Espacio de almacenamiento</label> <input type="number" class="form-control col-md-6" id="diskNewVm" name="diskNewVm" min="1" max="'+data.disk+'" placeholder="GB" title="Tamaño de disco duro en GB" required></div>       </div>   </div></form>';
                var btns = '<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button><button type="button" class="btn btn-primary" onclick="addVM()">Crear</button>';
                $('.modal-body').html(content);
                $('.modal-footer').html(btns);
               
            }
        }
    });
}

function addVM() {
        if(verifiyFieldsBlank('add_vm_domain') == 0){
            var parametros = new FormData($('#add_vm_domain')[0]);
            parametros.append('action', '13');
            parametros.append('idUser', idUser);
            $.ajax({
                url: 'solicitud_asignacion.php',
                type: 'POST',
                contentType: false,
                processData: false,
                data: parametros,
                beforeSend: function() {
                    notifications("addvm", "Agregando maquina virtual");
                },
                success: function(data) {
                    console.log(data);
                    if (data == '0') {
                        alertify.error('Error, Verifique los recursos máximos');
                    } else {
                        // console.log(data);
                        alertify.success('VM agregada');
                    }
                },
                complete: function() {
                    deleteNotification("addvm");
                }
            });

        }
}

function verifiyFieldsBlank(idForm){
    var form=$('#'+idForm)[0];
    var cont=0;
   for (let index = 0; index <  form.length; index++) {
        console.log(form[index].validity.valid);
        if(form[index].validity.valid == false){
            document.getElementById(form[index].id).classList.toggle("is-invalid");
            cont = 1;
        }else{
            document.getElementById(form[index].id).classList.remove("is-invalid");
        }
      
     }
    return cont;
}


function freeDomain(id) {
    var elec = confirm("¿Desea liberar la arquitectura?");




    if (elec) {
        var formData = new FormData();
        formData.append('id', id);
        formData.append('idUser', idUser);
        //formData.append('emailUser', 'usuario');

        formData.append('action', '2');
        $.ajax({
            url: 'solicitud_asignacion.php',
            type: 'POST',
            contentType: false,
            processData: false,
            data: formData,
            beforesend: function() {

            },
            success: function(data) {
                // console.log(data);
                if (data == '1') {
                    refreshTableArqByUser();
                } else {
                    alert("Ha ocurrido un problema, intentelo mas tarde o contacte al administrador");
                    //log-reporting
                }

            }

        });

    }




}

function refreshTableArqByUser() {
    var formData = new FormData();
    emailUser = $('.arqAsingUser')[0].id;
    formData.append('emailUser', emailUser);
    formData.append('action', '9');
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforesend: function() {

        },
        success: function(data) {
            // console.log(data);
            $('.arqAsingUser').empty();
            $('.arqAsingUser').html(data);
        }

    });
}

function test() {
    return 1;
}







function confirmar(title, content, namefunction) {
    var confirm = alertify.confirm(title, content, null, null).set('labels', { ok: 'Confirmar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        alertify.success('Has confirmado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Has Cancelado el dialogo');
    })

}





function mensaje(title, msg, footer) {
    if (footer == false) {

        alertify.alert(title, msg);
        $('.ajs-footer').hide();
    } else {
        alertify.alert(title, msg).set('label', 'Aceptar');
    }

}



function queryOpenstack(name_net) {
    var formData = new FormData();
    formData.append('action', '1');
    formData.append('name_net', name_net);
    $.ajax({
        url: 'scripts/query_openstack.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforesend: function() {},
        success: function(data) {
            // var answerOpenstack=JSON.parse(data);
            // console.log (answerOpenstack);
            console.log(data);
        }



    });
}

function consult_restrictions(domainform) {
    var formData = new FormData();
    formData.append('action', '11');
    formData.append('domain', domainform);
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforesend: function() {},
        success: function(data) {

            var answer = JSON.parse(data);
            console.log(answer);
            $('#form_edit_arq')[0][6].value = answer[3]['limit_restriction'];
            $('#form_edit_arq')[0][7].value = answer[0]['limit_restriction'];
            $('#form_edit_arq')[0][8].value = answer[2]['limit_restriction'];
            $('#form_edit_arq')[0][9].value = answer[1]['limit_restriction'];

        }
    });
}


function slidetest(index, test) {
    var formData = new FormData();
    formData.append('action', '12');
    formData.append('index', index);
    formData.append('test', test);
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforesend: function() {},
        success: function(data) {
            console.log(data);
            if (data == '') {

            } else {
                $('.slide-test-bono').empty();
                $('.slide-test-bono').html(data);
            }
        }
    });
}


function ssh_execute(ip) {
    var formData = new FormData($('#form_ssh')[0]);
    formData.append('action', '17');
    formData.append('ip', ip);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforesend: function() {},
        success: function(data) {
            console.log(data);
            $('.ssh_answer').empty();
            $('.ssh_answer').html(data);
        }
    });
}


function notifications(idNotification, content) {
    var element = '<div class="alert text-white  row bg-danger loader center mr-1 ' + idNotification + '" id="' + idNotification + '"><span class="spinner-border spinner-border-sm fa-2x" role="status" aria-hidden="true"></span>' + content + '</div>';
    $('.ajs-modal').append(element);
    $("#status-loading").append(element);
}

function deleteNotification(idElement) {
    // document.getElementById("status-loading").removeChild(document.getElementById(idElement));
    $('#' + idElement).remove();
    $('.' + idElement).remove();
}

function update_vm_arq(domain){
    var formData = new FormData();
    formData.append('action', '13');
    formData.append('domain', domain);
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforeSend: function() {
            notifications("searchVm", "Buscando Maquinas virtuales");
        },
        success: function(data) {
            console.log(data);
            $('#vm_new_graph').empty();
            $('#vm_new_graph').html(data);
        },
        complete: function(){
            deleteNotification("searchVm");
        }
    });
 }

 function create_grafic(){
    //  console.log("ok");
    var formData = new FormData($('#new_graph')[0]);
    formData.append('action', '18');
    formData.append('idUser', idUser);
    
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforeSend: function() {
            notifications("CreateGrafic", "Creando Grafica");
        },
        success: function(data) {
            console.log(data);
            // $('#vm_new_graph').empty();
            // $('#vm_new_graph').html(data);
        },
        complete: function(){
            deleteNotification("CreateGrafic");
        }
    });
 }

 function listOptionsNewGraph(idVn){
    var formData = new FormData();
    formData.append('action', '14');
    formData.append('idVm', idVn);
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforeSend: function() {
            notifications("graphOfDevice", "Buscando Gráficas del dispositivo");
        },
        success: function(data) {
            // console.log(data);
            var options = JSON.parse(data);
            $('#templateGraph').empty();
            for (var i = 0; i < options.dataTemplate.length; i++) {
                $('#templateGraph').append(options.dataTemplate[i]);
              } 
           
        },
        complete: function(){
            deleteNotification("graphOfDevice");
        }
    }), "json";
 }


 function delete_graph(idGraph){
    console.log(idGraph);
    
    var formData = new FormData();
    formData.append('action', '19');
    formData.append('idUser', idUser);
    formData.append('idGraph', idGraph);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: formData,
        beforeSend: function() {
            notifications("deleteGraph", "Eliminando gráfica");
        },
        success: function(data) {
            // console.log(data);
            $('#dd'+idGraph).hide();
            $('#wrapper_'+idGraph).hide()
           
        },
        complete: function(){
            deleteNotification("deleteGraph");
        }
    }), "json";
 }



 var arraySearch=[];
 function callArraySearch(){
    var formData = new FormData();
    formData.append('action', '15');
    
    $.ajax({
        url: 'admin_info.php',
        type: 'POST',
        contentType: false,
        processData: false,
        timeout: 10000,
        data: formData,

        success: function(data) {
            var options = JSON.parse(data);
            arraySearch=options;
        }
    }), "json";
 }

function search(wordSearch){
    $('#listAllowed').empty();
    if( wordSearch != '' ){
        let flat=0;
        wordSearch=wordSearch.toLowerCase();
        for (let element in arraySearch) {
            for (let text of arraySearch[element]){
                let textLower = text.equals.toLowerCase()
                if(textLower.includes(wordSearch)){
                    $('#listAllowed').append('<li class="nav-item d-block"><a class="nav-link" href="'+element+'.php#'+text.id+'">'+text.content+'</a></li>');
                }
            }
        }
    }
}

function test(){
    // var formData = new FormData();
    // formData.append('action', '20');
    
    // $.ajax({
    //     url: 'solicitud_asignacion.php',
    //     type: 'POST',
    //     contentType: false,
    //     processData: false,
    //     timeout: 10000,
    //     data: formData,
    //     beforeSend: function() {
    //         console.log("enviado")
    //     },
    //     success: function(data) {
    //         console.log(data);
           
    //     },
    //     complete: function(){
    //         console.log("terminado")
    //     },
    //     error: function(){
    //         console.log("error");
    //     }
    // }), "json";
}