<?php
/*
 +-------------------------------------------------------------------------+
 | Copyright (C) 2004-2018 The Cacti Group                                 |
 |                                                                         |
 | This program is free software; you can redistribute it and/or           |
 | modify it under the terms of the GNU General Public License             |
 | as published by the Free Software Foundation; either version 2          |
 | of the License, or (at your option) any later version.                  |
 |                                                                         |
 | This program is distributed in the hope that it will be useful,         |
 | but WITHOUT ANY WARRANTY; without even the implied warranty of          |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           |
 | GNU General Public License for more details.                            |
 +-------------------------------------------------------------------------+
 | Cacti: The Complete RRDtool-based Graphing Solution                     |
 +-------------------------------------------------------------------------+
 | This code is designed, written, and maintained by the Cacti Group. See  |
 | about.php and/or the AUTHORS file for specific developer information.   |
 +-------------------------------------------------------------------------+
 | http://www.cacti.net/                                                   |
 +-------------------------------------------------------------------------+
*/

global $config, $menu, $paginas_testbed, $content_menu_vertical , $menu_vertical_arquitectura, $menu_vertical_pruebas, $current_user;

$oper_mode = api_plugin_hook_function('top_header', OPER_MODE_NATIVE);
if ($oper_mode == OPER_MODE_RESKIN) {
	return;
}

$page_title = api_plugin_hook_function('page_title', draw_navigation_text('title'));
$using_guest_account = false;

?>
<!DOCTYPE html>
<html>
<head>
	<?php html_common_header($page_title);?>
</head>
<body onload="identifiUser(<?php echo $current_user['id']?>);loadInfoOpenstack()">
	<?php
	// print_r($current_user);
	?>
<div id='cactiPageHead' class='cactiPageHead' role='banner' style="position: fixed">
	<?php if ($oper_mode == OPER_MODE_NATIVE) { ;?>
	<!-- <nav id='tabs' class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"  >
		
		<!-- pestañas de navegacióonn -->
		<?php html_show_tabs_left();?>

		<!-- barra de busqueda -->
		<div class="search oculto" style="position: relative">
			<form class="form-inline">
				<input class="form-control mr-sm-2" id="wordSearch" type="search" placeholder="Buscar ..." aria-label="Search" onfocus="callArraySearch()" onkeyup="search(this.value)" >
				<!-- <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="search($('#wordSearch')[0].value)">Buscar</button> -->
			</form>
			<div class="container bg-light mt-2" style="position: absolute">
				<ul class="nav flex-column-lg container" id="listAllowed">
					
				</ul>
			</div>
		</div>
		<div class="mr-2 ml-3"><i class="fa fa-search fa-2x rounded-circle text-white" id="iconSearch" onclick="show_hide_content_byClass('search','none');document.getElementById('iconSearch').classList.toggle('fa-search');document.getElementById('iconSearch').classList.toggle('fa-times');"></i></div>
		<!-- menu de login -->
		<div><?php echo draw_login_status($using_guest_account);?> </div>
		
		
		

	</nav>
	<div class='cactiConsolePageHeadBackdrop'></div>
	<div class='scrollBar'></div>
	<?php if (read_config_option('auth_method') != 0) {?><div class='infoBar' style="display: none;"> <?php echo draw_login_status($using_guest_account);?></div><?php }?>
</div>
<div id='breadCrumbBar' class='breadCrumbBar' style="display: none;">
	<div id='navBar' class='navBar'><?php echo draw_navigation_text();?></div>
	<div class='scrollBar'></div>
	<?php if (read_config_option('auth_method') != 0) {?><div class='infoBar'><?php echo draw_login_status($using_guest_account);?></div><?php }?>
</div>
<div class='cactiShadow'></div>
<div id='cactiContent' class='cactiContent'>
	<div class='cactiConsoleNavigationArea' style='overflow:hidden'>
		<div style='display:none;' id='navigation'>
			<div id='navigation' class='navigation'>

				<?php
								
	            $pagina = pregunta_pagina_testbed($paginas_testbed);
	            if ( $pagina == "cacti" ) { ?>
	                <!-- contenido del servidor cacti -->
	                <table style='width:100%;'>
        				<?php draw_menu();?>
        				<tr>
    						<td style='text-align:center;'>
							<div class='cactiLogo' onclick='loadPage("<?php print $config['url_path'];?>about.php")'></div>
        					</td>
        				</tr>
	                </table>	
				            <?php 
		        }else{
                	//se grafica contenido del testbed
	                graficar_menu_vertical_testbed( $pagina, $content_menu_vertical);                
	            } ?>
			</div>
			
		</div>
	</div>
	<div id='navigation_right' class='cactiConsoleContentArea'>
		<div style='position:relative;display:none;' id='main' role='main'>
<?php } else { ?>
	<div id='navigation_right' class='cactiConsoleContentArea'>
		<div style='position:relative;display:none;' id='main' role='main'>
<?php } ?>
