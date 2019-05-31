// Host Autocomplete Magic
var pageName = basename($(location).attr('pathname'));

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
    var btn = $(this)[0].name;
    var fila = $(this).parents('tr')[0];
    // console.log("mensaje fila");
    // console.log($(this));

    // console.log(fila);
    var id = $(this)[0].id.substr(-1, 1);
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
            $('#form_edit_arq')[0][4].files[0].name = fila.cells[3].textContent;

            // }

            break;

        case 'liberar':
            var elec = confirm("¿Desea liberar la arquitectura?");
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
            var elec2 = confirm("¿Desea eliminar la arquitectura?");
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

//funcion guardar de formulario editar
function edit_arq() {
    var id = $('#btn_edit_arq')[0].name;
    var fila = $('#line' + id)[0];
    //extrae informacion de la tabla con el id
    var info_arq = new Array();
    for (var i = 0; i <= 2; i++) {
        info_arq.push(fila.cells[i].textContent);
    }
    console.log(info_arq);
    // comparacion
    var f = 0;
    info_arq.forEach(function(value, index) {
        if ($('#form_edit_arq')[0][index + 2].value != value) {
            f++;
        }

    });
    if (f == 0) {
        alert("no se han cambiado los valores");
    } else {
        var parametros = new FormData($('#form_edit_arq')[0]);
        parametros.append('id', id);
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

    }
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


                    if (data == 'upload fallo' || data == '') {
                        mensaje('Error', 'Recuerde que el dominio es único.\nVerifique los datos e intentelo nuevamente');
                    } else {
                        $('#table_estado_arq').append(data);
                        var formulario_info_arq = $('#form_info_new_arq')[0];
                        // var decision=confirmar('Agregar información de la arquitectura', formulario_info_arq);
                        mensaje('Agregar información de la arquitectura', formulario_info_arq);
                        $('.ajs-footer').hide();
                        var dominio = $('#form_new_arq')[0][3].value;
                        $('#form_info_new_arq')[0][2].value = dominio;
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

function inf_new_arq() {
    var l = 0;
    for (var i = 0; i < $('#form_info_new_arq')[0].length; i++) {
        if (searcWord('host', $('#form_info_new_arq')[0][i].name)) {
            // alert('campo de direccion ip');
            if (!ValidateIPaddress($('#form_info_new_arq')[0][i].value) && $('#form_info_new_arq')[0][i].value != '') {
                // alert($('#form_info_new_arq')[0][i].value + 'campo con la informacion incorrecta');
                l++;
            }

        }

    }
    if (l == 0) {
        // alert('agregar info');
        // console.log("entro e la funcion");
        var parametros = new FormData($('#form_info_new_arq')[0]);
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
                $('#form_info_new_arq')[0].reset();
                $('#form_dom_info')[0].reset();
                $('.ajs-button.ajs-ok').trigger('click');
                see_table();

                // refrestar el selector de informacion
                refresh_selector('info_select_arq');
                // log-reporting se agrego una nueva arquitectura
            }
        });
    } else {
        mensaje('Alerta', 'Verifique las direcciones IP agregadas, formato incorrecto');
    }

}

function change_arqs_by_user() {
    console.log("Punto de Control");
    var parametros = new FormData($('#form_arq_by_user')[0]);
    console.log(parametros);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {
            console.log("antes de entrar");
        },
        success: function(data) {
            // console.log(data);
            if (data != '') {
                $('#number_actual')[0].innerHTML = data;
            }
            $('#content_arqByUsuary').hide();
            $('#btn_see_table2').show();
            $('#btn_notsee_table2').hide();
        }
    });
}


function change_day_asig() {
    var parametros = new FormData($('#form_day_asig')[0]);
    $.ajax({
        url: 'solicitud_asignacion.php',
        type: 'POST',
        contentType: false,
        processData: false,
        data: parametros,
        beforesend: function() {

        },
        success: function(data) {
            if (data != '') {
                $('#number_day_actual')[0].innerHTML = data;
            }
            $('#content_day_asig').hide();
            $('#btn_see_table3').show();
            $('#btn_notsee_table3').hide();
        }
    });

}

function desplegar_info_arq(dato) {
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
            // console.log(data);
            if ($('#form_dom_info')[0][1].name == 'action') {
                var dom = $('#form_dom_info')[0][2].value;
            } else {
                var dom = $('#form_dom_info')[0][1].value;
            }
            if ($.isEmptyObject(data)) {
                // console.log("el array esta vacio");
                $('#form_info_new_arq')[0].reset();
                if ($('#form_info_new_arq')[0][1].name == 'action') {
                    $('#form_info_new_arq')[0][2].value = dom;
                } else {
                    $('#form_info_new_arq')[0][1].value = dom;
                }
            } else {
                if ($('#form_info_new_arq')[0][1].name == 'action') {
                    console.log("con info add");
                    $('#form_info_new_arq')[0].reset();
                    $('#form_info_new_arq')[0][2].value = dom;
                    // $('#form_info_new_arq')[0][1].value=data['dominio'];
                    $('#form_info_new_arq')[0][3].value = data['type'];
                    $('#form_info_new_arq')[0][4].value = data['fist_number_ims'];
                    $('#form_info_new_arq')[0][5].value = data['amount_extensions_ims'];
                    $('#form_info_new_arq')[0][6].value = data['ip_bono'];
                    $('#form_info_new_arq')[0][7].value = data['ip_sprout'];
                    $('#form_info_new_arq')[0][8].value = data['ip_homer'];
                    $('#form_info_new_arq')[0][9].value = data['ip_ellis'];
                    $('#form_info_new_arq')[0][10].value = data['ip_vellum'];
                    $('#form_info_new_arq')[0][11].value = data['ip_dime'];
                    $('#form_info_new_arq')[0][12].value = data['ip_ibcf'];
                    $('#form_info_new_arq')[0][13].value = data['ip_pstn'];
                    $('#form_info_new_arq')[0][14].value = data['fist_number_pstn'];
                    $('#form_info_new_arq')[0][15].value = data['amount_extensions_pstn'];
                } else {
                    console.log("sin info add");
                    $('#form_info_new_arq')[0].reset();
                    $('#form_info_new_arq')[0][1].value = $('#form_dom_info')[0][1].value;
                    // $('#form_info_new_arq')[0][1].value=data['dominio'];
                    $('#form_info_new_arq')[0][2].value = data['type'];
                    $('#form_info_new_arq')[0][3].value = data['fist_number_ims'];
                    $('#form_info_new_arq')[0][4].value = data['amount_extensions_ims'];
                    $('#form_info_new_arq')[0][5].value = data['ip_bono'];
                    $('#form_info_new_arq')[0][6].value = data['ip_sprout'];
                    $('#form_info_new_arq')[0][7].value = data['ip_homer'];
                    $('#form_info_new_arq')[0][8].value = data['ip_ellis'];
                    $('#form_info_new_arq')[0][9].value = data['ip_vellum'];
                    $('#form_info_new_arq')[0][10].value = data['ip_dime'];
                    $('#form_info_new_arq')[0][11].value = data['ip_ibcf'];
                    $('#form_info_new_arq')[0][12].value = data['ip_pstn'];
                    $('#form_info_new_arq')[0][13].value = data['fist_number_pstn'];
                    $('#form_info_new_arq')[0][14].value = data['amount_extensions_pstn'];
                }

            }
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
    console.log(cont);
    if (cont == 0) {
        var parametro = new FormData($('#form_add_test')[0]);
        $.ajax({
            url: 'solicitud_asignacion.php',
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
            data: { action: "1", table: table, id: id }
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
            data: { action: "6", id_title: id_title, direc: direc }
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
            data: { action: "7", id_title: id_title, direc: direc, id_content: id_content }
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

function confirmar(title, content) {
    var confirm = alertify.confirm(title, content, null, null).set('labels', { ok: 'Confirmar', cancel: 'Cancelar' });

    //callbak al pulsar botón positivo
    confirm.set('onok', function() {
        add_title(element.currentTarget.id);
        alertify.success('Has confirmado');
    });
    //callbak al pulsar botón negativo
    confirm.set('oncancel', function() {
        alertify.error('Has Cancelado el dialog');
    })
}

function mensaje(title, msg) {
    alertify.alert(title, msg).set('label', 'Aceptar');
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