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

/* html_start_box - draws the start of an HTML box with an optional title
   @arg $title - the title of this box ("" for no title)
   @arg $width - the width of the box in pixels or percent
   @arg $div - end with a starting div
   @arg $cell_padding - the amount of cell padding to use inside of the box
   @arg $align - the HTML alignment to use for the box (center, left, or right)
   @arg $add_text - the url to use when the user clicks 'Add' in the upper-right
     corner of the box ("" for no 'Add' link)
     This function has two method.  This first is for legacy behavior where you
     you pass in a href to the function, and an optional label as $add_label
     The new format accepts an array of hrefs to add to the start box.  The format
     of the array is as follows:

     $add_text = array(
        array(
          'id' => 'uniqueid',
          'href' => 'value',
          'title' => 'title',
          'callback' => true|false,
          'class' => 'fa fa-icon'
        ),
        ...
     );

     If the callback is true, the Cacti attribute will be added to the href
     to present only the contents and not to include both the headers.  If
     the link must go off page, simply make sure $callback is false.  There
     is a requirement to use fontawesome icon sets for this class, but it
     can include other classes.  In addition, the href can be a hash '#' if
     your page has a ready function that has it's own javascript.
   @arg $add_label - used with legacy behavior to add specific text to the link.
     This parameter is only used in the legacy behavior.
 */
function html_start_box($title, $width, $div, $cell_padding, $align, $add_text, $add_label = false) {
	static $table_suffix = 1;

	if ($add_label === false) {
		$add_label = __('Add');
	}

	$table_prefix = basename(get_current_page(), '.php');;
	if (!isempty_request_var('report')) {
		$table_prefix .= '_' . clean_up_name(get_nfilter_request_var('report'));
	} elseif (!isempty_request_var('tab')) {
		$table_prefix .= '_' . clean_up_name(get_nfilter_request_var('tab'));
	} elseif (!isempty_request_var('action')) {
		$table_prefix .= '_' . clean_up_name(get_nfilter_request_var('action'));
	}
	$table_id = $table_prefix . $table_suffix;

	if ($title != '') {
		print "<div id='$table_id' class='cactiTable' style='width:$width;text-align:$align;'>";
		print "<div>";
		print "<div class='cactiTableTitle'><span>" . ($title != '' ? $title:'') . '</span></div>';
		print "<div class='cactiTableButton'>\n";
		if ($add_text != '' && !is_array($add_text)) {
			print "<span class='cactiFilterAdd' title='$add_label'><a class='linkOverDark' href='" . html_escape($add_text) . "'><i class='fa fa-plus'></i></a></span>";
		} else {
			if (is_array($add_text)) {
				if (sizeof($add_text)) {
					foreach($add_text as $icon) {
						if (isset($icon['callback']) && $icon['callback'] === true) {
							$classo = 'linkOverDark';
						} else {
							$classo = '';
						}

						if (isset($icon['class']) && $icon['class'] !== '') {
							$classi = $icon['class'];
						} else {
							$classi = 'fa fa-plus';
						}

						if (isset($icon['href'])) {
							$href = html_escape($icon['href']);
						} else {
							$href = '#';
						}

						if (isset($icon['title'])) {
							$title = $icon['title'];
						} else {
							$title = $add_label;
						}

						print "<span class='cactiFilterAdd' title='$title'><a" . (isset($icon['id']) ? " id='" . $icon['id'] . "'":"") . " class='$classo' href='$href'><i class='$classi'></i></a></span>";
					}
				}
			} else {
				print "<span> </span>";
			}
		}
		print '</div></div>';

		if ($div === true) {
			print "<div id='$table_id" . "_child' class='cactiTable'>";
		} else {
			print "<table id='$table_id" . "_child' class='cactiTable' style='padding:" . $cell_padding . "px;'>";
		}
	} else {
		print "<div id='$table_id' class='cactiTable' style='width:$width;text-align:$align;'>";

		if ($div === true) {
			print "<div id='$table_id" . "_child' class='cactiTable'>";
		} else {
			print "<table id='$table_id" . "_child' class='cactiTable' style='padding:" . $cell_padding . "px;'>";
		}
	}

	$table_suffix++;
}

/* html_end_box - draws the end of an HTML box
   @arg $trailing_br (bool) - whether to draw a trailing <br> tag after ending
   @arg $div (bool) - div type table
     the box */
function html_end_box($trailing_br = true, $div = false) {
	if ($div) {
		print "</div></div>\n";
	}else {
		print "</table></div>\n";
	}

	if ($trailing_br == true) {
		print "<div class='break'></div>";
	}
}

/* html_graph_area - draws an area the contains full sized graphs
   @arg $graph_array - the array to contains graph information. for each graph in the
     array, the following two keys must exist
     $arr[0]["local_graph_id"] // graph id
     $arr[0]["title_cache"] // graph title
   @arg $no_graphs_message - display this message if no graphs are found in $graph_array
   @arg $extra_url_args - extra arguments to append to the url
   @arg $header - html to use as a header
   @arg $columns - the number of columns to present */
function html_graph_area(&$graph_array, $no_graphs_message = '', $extra_url_args = '', $header = '', $columns = 0) {
	global $config;
	$i = 0; $k = 0; $j = 0;

	$num_graphs = sizeof($graph_array);

	if ($columns == 0) {
		$columns = read_user_setting('num_columns');
	}

	?>
	<script type='text/javascript'>
	var refreshMSeconds=<?php print read_user_setting('page_refresh')*1000;?>;
	var graph_start=<?php print get_current_graph_start();?>;
	var graph_end=<?php print get_current_graph_end();?>;
	</script>
	<?php

	if ($num_graphs > 0) {
		if ($header != '') {
			print $header;
		}

		foreach ($graph_array as $graph) {
			if ($i == 0) {
				print "<tr class='tableRowGraph'>\n";
			}

			?>
			<td style='width:<?php print round(100 / $columns, 2);?>%;'>
				<div>
				<table style='text-align:center;margin:auto;'>
					<tr>
						<td>
							<div class='graphWrapper' style='width:100%;' id='wrapper_<?php print $graph['local_graph_id']?>' graph_width='<?php print $graph['width'];?>' graph_height='<?php print $graph['height'];?>' title_font_size='<?php print ((read_user_setting('custom_fonts') == 'on') ? read_user_setting('title_size') : read_config_option('title_size'));?>'></div>
							<?php print (read_user_setting('show_graph_title') == 'on' ? "<span class='center'>" . html_escape($graph['title_cache']) . '</span>' : '');?>
						</td>
						<td id='dd<?php print $graph['local_graph_id'];?>' class='noprint graphDrillDown'>
							<?php graph_drilldown_icons($graph['local_graph_id']);?>
						</td>
					</tr>
				</table>
				<div>
			</td>
			<?php

			$i++;

			if (($i % $columns) == 0) {
				$i = 0;
				print "</tr>\n";
			}
		}

		while(($i % $columns) != 0) {
			print "<td style='text-align:center;width:" . round(100 / $columns, 2) . "%;'></td>";
			$i++;
		}

		print "</tr>\n";
	} else {
		if ($no_graphs_message != '') {
			print "<td><em>$no_graphs_message</em></td>";
		}
	}
}

/* html_graph_thumbnail_area - draws an area the contains thumbnail sized graphs
   @arg $graph_array - the array to contains graph information. for each graph in the
     array, the following two keys must exist
     $arr[0]["local_graph_id"] // graph id
     $arr[0]["title_cache"] // graph title
   @arg $no_graphs_message - display this message if no graphs are found in $graph_array
   @arg $extra_url_args - extra arguments to append to the url
   @arg $header - html to use as a header
   @arg $columns - the number of columns to present */
function html_graph_thumbnail_area(&$graph_array, $no_graphs_message = '', $extra_url_args = '', $header = '', $columns = 0) {
	global $config;
	$i = 0; $k = 0; $j = 0;

	$num_graphs = sizeof($graph_array);

	if ($columns == 0) {
		$columns = read_user_setting('num_columns');
	}

	?>
	<script type='text/javascript'>
	var refreshMSeconds=<?php print read_user_setting('page_refresh')*1000;?>;
	var graph_start=<?php print get_current_graph_start();?>;
	var graph_end=<?php print get_current_graph_end();?>;
	</script>
	<?php

	if ($num_graphs > 0) {
		if ($header != '') {
			print $header;
		}

		$start = true;
		foreach ($graph_array as $graph) {
			if (isset($graph['graph_template_name'])) {
				if (isset($prev_graph_template_name)) {
					if ($prev_graph_template_name != $graph['graph_template_name']) {
						$prev_graph_template_name = $graph['graph_template_name'];
					}
				} else {
					$prev_graph_template_name = $graph['graph_template_name'];
				}
			} elseif (isset($graph['data_query_name'])) {
				if (isset($prev_data_query_name)) {
					if ($prev_data_query_name != $graph['data_query_name']) {
						$print  = true;
						$prev_data_query_name = $graph['data_query_name'];
					} else {
						$print = false;
					}
				} else {
					$print  = true;
					$prev_data_query_name = $graph['data_query_name'];
				}

				if ($print) {
					if (!$start) {
						while(($i % $columns) != 0) {
							print "<td style='text-align:center;width:" . round(100 / $columns, 3) . "%;'></td>";
							$i++;
						}

						print "</tr>\n";
					}

					print "<tr class='tableHeader'>
							<td class='graphSubHeaderColumn textHeaderDark' colspan='$columns'>" . __('Data Query:') . ' ' . $graph['data_query_name'] . "</td>
						</tr>\n";
					$i = 0;
				}
			}

			if ($i == 0) {
				print "<tr class='tableRowGraph'>\n";
				$start = false;
			}

			?>
			<td style='width:<?php print round(100 / $columns, 2);?>%;'>
				<table style='text-align:center;margin:auto;'>
					<tr>
						<td>
							<div class='graphWrapper' id='wrapper_<?php print $graph['local_graph_id']?>' graph_width='<?php print read_user_setting('default_width');?>' graph_height='<?php print read_user_setting('default_height');?>'></div>
							<?php print (read_user_setting('show_graph_title') == 'on' ? "<span class='center'>" . html_escape($graph['title_cache']) . '</span>' : '');?>
						</td>
						<td id='dd<?php print $graph['local_graph_id'];?>' class='noprint graphDrillDown'>
							<?php print graph_drilldown_icons($graph['local_graph_id'], 'graph_buttons_thumbnails');?>
						</td>
					</tr>
				</table>
			</td>
			<?php

			$i++;
			$k++;

			if (($i % $columns) == 0 && ($k < $num_graphs)) {
				$i=0;
				$j++;
				print "</tr>\n";
				$start = true;
			}
		}

		if (!$start) {
			while(($i % $columns) != 0) {
				print "<td style='text-align:center;width:" . round(100 / $columns, 2) . "%;'></td>";
				$i++;
			}

			print "</tr>\n";
		}
	} else {
		if ($no_graphs_message != '') {
			print "<td><em>$no_graphs_message</em></td>";
		}
	}
}

function graph_drilldown_icons($local_graph_id, $type = 'graph_buttons') {
	global $config;

	$aggregate_url = aggregate_build_children_url($local_graph_id);

	print "<div class='iconWrapper' id='" . $local_graph_id . "'>\n";
	print "<a class='iconLink utils' href='#' role='link' id='graph_" . $local_graph_id . "_util'><img class='drillDown' src='" . $config['url_path'] . "images/cog.png' alt='' title='" . __esc('Graph Details, Zooming and Debugging Utilities') . "'></a><br>\n";
	print "<a class='iconLink csvexport' href='#' role='link' id='graph_" . $local_graph_id . "_csv'><img class='drillDown' src='" . $config['url_path'] . "images/table_go.png' alt='' title='" . __esc('CSV Export of Graph Data'). "'></a><br>\n";
	print "<a class='iconLink mrgt' href='#' role='link' id='graph_" . $local_graph_id . "_mrtg'><img class='drillDown' src='" . $config['url_path'] . "images/timeview.png' alt='' title='" . __esc('Time Graph View'). "'></a><br>\n";
	

	if (read_config_option('realtime_enabled') == 'on' && is_realm_allowed(25)) {
		if (read_user_setting('realtime_mode') == '' || read_user_setting('realtime_mode') == '1') {
			print "<a class='iconLink realtime' href='#' role='link' id='graph_" . $local_graph_id . "_realtime'><img class='drillDown' src='" . $config['url_path'] . "images/chart_curve_go.png' alt='' title='" . __esc('Click to view just this Graph in Real-time'). "'></a><br/>\n";
		} else {
			print "<a class='iconLink' href='#' onclick=\"window.open('" . $config['url_path'] . 'graph_realtime.php?top=0&left=0&local_graph_id=' . $local_graph_id . "', 'popup_" . $local_graph_id . "', 'toolbar=no,menubar=no,resizable=yes,location=no,scrollbars=no,status=no,titlebar=no,width=650,height=300');return false\"><img src='" . $config['url_path'] . "images/chart_curve_go.png' alt='' title='" . __esc('Click to view just this Graph in Real-time') . "'></a><br/>\n";
		}
	}

	if (is_realm_allowed(1043)) {
		print "<span class='iconLink spikekill' data-graph='" . $local_graph_id . "' id='graph_" . $local_graph_id . "_sk'><img id='sk" . $local_graph_id . "' class='drillDown' src='" . $config['url_path'] . "images/spikekill.gif' title='" . __esc('Kill Spikes in Graphs') . "'></span>";
		print '<br/>';
	}
	print "<a class='iconLink mrgt' href='#' role='link' onclick='delete_graph(" . $local_graph_id . ")'><i class='fa fa-trash fa-2x' style='color: red'></i></a><br>\n";
	if ($aggregate_url != '') {
		print $aggregate_url;
	}

	api_plugin_hook($type, array('hook' => 'graph_buttons_thumbnails', 'local_graph_id' => $local_graph_id, 'rra' =>  0, 'view_type' => ''));

	print "</div>\n";
}

/* html_nav_bar - draws a navigation bar which includes previous/next links as well as current
     page information
   @arg $base_url - the base URL will all filter options except page#
   @arg $max_pages - the maximum number of pages to display
   @arg $current_page - the current page in the navigation system
   @arg $rows_per_page - the number of rows that are displayed on a single page
   @arg $total_rows - the total number of rows in the navigation system
   @arg $object - the object types that is being displayed
   @arg $page_var - the object types that is being displayed
   @arg $return_to - paint the resulting page into this dom object */
function html_nav_bar($base_url, $max_pages, $current_page, $rows_per_page, $total_rows, $colspan=30, $object = '', $page_var = 'page', $return_to = '') {
	if ($object == '') $object = __('Rows');

	if ($total_rows > $rows_per_page) {
		if (substr_count($base_url, '?') == 0) {
			$base_url = trim($base_url) . '?';
		} else {
			$base_url = trim($base_url) . '&';
		}

		$url_page_select = get_page_list($current_page, $max_pages, $rows_per_page, $total_rows, $base_url, $page_var, $return_to);

		$nav = "<div class='navBarNavigation'>
			<div class='navBarNavigationPrevious'>
				" . (($current_page > 1) ? "<a href='#' onClick='goto$page_var(" . ($current_page-1) . ");return false;'><i class='fa fa-angle-double-left previous'></i>" . __('Previous'). "</a>":"") . "
			</div>
			<div class='navBarNavigationCenter'>
				" . __('%d to %d of %s [ %s ]', (($rows_per_page*($current_page-1))+1), (($total_rows < $rows_per_page) || ($total_rows < ($rows_per_page*$current_page)) ? $total_rows : $rows_per_page*$current_page), $total_rows, $url_page_select) . "
			</div>
			<div class='navBarNavigationNext'>
				" . (($current_page*$rows_per_page) < $total_rows ? "<a href='#' onClick='goto$page_var(" . ($current_page+1) . ");return false;'>" . __('Next'). "<i class='fa fa-angle-double-right next'></i></a>":"") . "
			</div>
		</div>\n";
	} elseif ($total_rows > 0) {
		$nav = "<div class='navBarNavigation'>
			<div class='navBarNavigationNone'>
				" . __('All %d %s', $total_rows, $object) . "
			</div>
		</div>\n";
	} else {
		$nav = "<div class='navBarNavigation'>
			<div class='navBarNavigationNone'>
				" . __('No %s Found', $object) . "
			</div>
		</div>\n";
	}

	return $nav;
}

/* html_header_sort - draws a header row suitable for display inside of a box element.  When
     a user selects a column header, the collback function "filename" will be called to handle
     the sort the column and display the altered results.
   @arg $header_items - an array containing a list of column items to display.  The
        format is similar to the html_header, with the exception that it has three
        dimensions associated with each element (db_column => display_text, default_sort_order)
		alternatively (db_column => array('display' = 'blah', 'align' = 'blah', 'sort' = 'blah'))
   @arg $sort_column - the value of current sort column.
   @arg $sort_direction - the value the current sort direction.  The actual sort direction
        will be opposite this direction if the user selects the same named column.
   @arg $last_item_colspan - the TD 'colspan' to apply to the last cell in the row
   @arg $url - a base url to redirect sort actions to */
function html_header_sort($header_items, $sort_column, $sort_direction, $last_item_colspan = 1, $url = '') {
	/* reverse the sort direction */
	if ($sort_direction == 'ASC') {
		$new_sort_direction = 'DESC';
	} else {
		$new_sort_direction = 'ASC';
	}

	$page = str_replace('.php', '', basename($_SERVER['SCRIPT_NAME']));
	if (isset_request_var('action')) {
		$page .= '_' . get_request_var('action');
	}

	if (isset_request_var('tab')) {
		$page .= '_' . get_request_var('tab');
	}

	if (isset($_SESSION['sort_data'][$page])) {
		$order_data = $_SESSION['sort_data'][$page];
	} else {
		$order_data = array(get_request_var('sort_column') => get_request_var('sort_direction'));
	}

	foreach($order_data as $key => $direction) {
		$primarySort = $key;
		break;
	}

	print "<tr class='tableHeader'>\n";

	$i = 1;
	foreach ($header_items as $db_column => $display_array) {
		$isSort = '';
		if (isset($display_array['nohide'])) {
			$nohide = 'nohide';
		} else {
			$nohide = '';
		}

		if (array_key_exists('display', $display_array)) {
			$display_text = $display_array['display'];
			if ($sort_column == $db_column) {
				$icon      = $sort_direction;
				$direction = $new_sort_direction;

				if ($db_column == $primarySort) {
					$isSort = 'primarySort';
				} else {
					$isSort = 'secondarySort';
				}
			} else {
				if (isset($order_data[$db_column])) {
					$icon = $order_data[$db_column];
					if ($order_data[$db_column] == 'DESC') {
						$direction = 'ASC';
					} else {
						$direction = 'DESC';
					}

					if ($db_column == $primarySort) {
						$isSort = 'primarySort';
					} else {
						$isSort = 'secondarySort';
					}
				} else {
					$icon = '';
					if (isset($display_array['sort'])) {
						$direction = $display_array['sort'];
					} else {
						$direction = 'ASC';
					}
				}
			}

			if (isset($display_array['align'])) {
				$align = $display_array['align'];
			} else {
				$align = 'left';
			}

			if (isset($display_array['tip'])) {
				$tip = $display_array['tip'];
			} else {
				$tip = '';
			}
		} else {
			/* by default, you will always sort ascending, with the exception of an already sorted column */
			if ($sort_column == $db_column) {
				$icon         = $sort_direction;
				$direction    = $new_sort_direction;
				$display_text = $display_array[0];

				if ($db_column == $primarySort) {
					$isSort = 'primarySort';
				} else {
					$isSort = 'secondarySort';
				}
			} else {
				if (isset($order_data[$db_column])) {
					$icon = $order_data[$db_column];
					if ($order_data[$db_column] == 'DESC') {
						$direction = 'ASC';
					} else {
						$direction = 'DESC';
					}

					if ($db_column == $primarySort) {
						$isSort = 'primarySort';
					} else {
						$isSort = 'secondarySort';
					}
				} else {
					$icon = '';
					$direction = $display_array[1];
				}

				$display_text = $display_array[0];
			}

			$align = 'left';
			$tip   = '';
		}

		if (strtolower($icon) == 'asc') {
			$icon = 'fa fa-sort-asc';
		} elseif (strtolower($icon) == 'desc') {
			$icon = 'fa fa-sort-desc';
		} else {
			$icon = 'fa fa-unsorted';
		}

		if (($db_column == '') || (substr_count($db_column, 'nosort'))) {
			print '<th ' . ($tip != '' ? "title='" . html_escape($tip) . "'":'') . " class='$nohide $align' " . ((($i+1) == count($header_items)) ? "colspan='$last_item_colspan' " : '') . '>' . $display_text . "</th>\n";
		} else {
			print '<th ' . ($tip != '' ? "title='" . html_escape($tip) . "'":'') . " class='sortable $align $nohide $isSort'>";
			print "<div class='sortinfo' sort-page='" . ($url == '' ? html_escape(get_current_page(false)):$url) . "' sort-column='$db_column' sort-direction='$direction'><div class='textSubHeaderDark'>" . $display_text . "<i class='$icon'></i></div></div></th>\n";
		}

		$i++;
	}

	print "</tr>\n";
}

/* html_header_sort_checkbox - draws a header row with a 'select all' checkbox in the last cell
     suitable for display inside of a box element.  When a user selects a column header,
     the collback function "filename" will be called to handle the sort the column and display
     the altered results.
   @arg $header_items - an array containing a list of column items to display.  The
        format is similar to the html_header, with the exception that it has three
        dimensions associated with each element (db_column => display_text, default_sort_order)
		alternatively (db_column => array('display' = 'blah', 'align' = 'blah', 'sort' = 'blah'))
   @arg $sort_column - the value of current sort column.
   @arg $sort_direction - the value the current sort direction.  The actual sort direction
        will be opposite this direction if the user selects the same named column.
   @arg $form_action - the url to post the 'select all' form to */
function html_header_sort_checkbox($header_items, $sort_column, $sort_direction, $include_form = true, $form_action = '') {
	static $page = 0;

	/* reverse the sort direction */
	if ($sort_direction == 'ASC') {
		$new_sort_direction = 'DESC';
	} else {
		$new_sort_direction = 'ASC';
	}

	$page = str_replace('.php', '', basename($_SERVER['SCRIPT_NAME']));
	if (isset_request_var('action')) {
		$page .= '_' . get_request_var('action');
	}

	if (isset_request_var('tab')) {
		$page .= '_' . get_request_var('tab');
	}

	if (isset($_SESSION['sort_data'][$page])) {
		$order_data = $_SESSION['sort_data'][$page];
	} else {
		$order_data = array(get_request_var('sort_column') => get_request_var('sort_direction'));
	}

	foreach($order_data as $key => $direction) {
		$primarySort = $key;
		break;
	}

	/* default to the 'current' file */
	if ($form_action == '') { $form_action = get_current_page(); }

	print "<tr class='tableHeader'>\n";

	foreach($header_items as $db_column => $display_array) {
		$isSort = '';
		if (isset($display_array['nohide'])) {
			$nohide = 'nohide';
		} else {
			$nohide = '';
		}

		$icon   = '';
		if (array_key_exists('display', $display_array)) {
			$display_text = $display_array['display'];
			if ($sort_column == $db_column) {
				$icon      = $sort_direction;
				$direction = $new_sort_direction;

				if ($db_column == $primarySort) {
					$isSort = 'primarySort';
				} else {
					$isSort = 'secondarySort';
				}
			} else {
				if (isset($order_data[$db_column])) {
					$icon = $order_data[$db_column];
					if ($order_data[$db_column] == 'DESC') {
						$direction = 'ASC';
					} else {
						$direction = 'DESC';
					}

					if ($db_column == $primarySort) {
						$isSort = 'primarySort';
					} else {
						$isSort = 'secondarySort';
					}
				} else {
					$icon = '';
					if (isset($display_array['sort'])) {
						$direction = $display_array['sort'];
					} else {
						$direction = 'ASC';
					}
				}
			}

			if (isset($display_array['align'])) {
				$align = $display_array['align'];
			} else {
				$align = 'left';
			}

			if (isset($display_array['tip'])) {
				$tip = $display_array['tip'];
			} else {
				$tip = '';
			}
		} else {
			/* by default, you will always sort ascending, with the exception of an already sorted column */
			if ($sort_column == $db_column) {
				$icon         = $sort_direction;
				$direction    = $new_sort_direction;
				$display_text = $display_array[0];

				if ($db_column == $primarySort) {
					$isSort = 'primarySort';
				} else {
					$isSort = 'secondarySort';
				}
			} else {
				if (isset($order_data[$db_column])) {
					$icon = $order_data[$db_column];
					if ($order_data[$db_column] == 'DESC') {
						$direction = 'ASC';
					} else {
						$direction = 'DESC';
					}

					if ($db_column == $primarySort) {
						$isSort = 'primarySort';
					} else {
						$isSort = 'secondarySort';
					}
				} else {
					$icon = '';
					$direction = $display_array[1];
				}

				$display_text = $display_array[0];
			}

			$align = 'left';
			$tip   = '';
		}

		if (strtolower($icon) == 'asc') {
			$icon = 'fa fa-sort-asc';
		} elseif (strtolower($icon) == 'desc') {
			$icon = 'fa fa-sort-desc';
		} else {
			$icon = 'fa fa-unsorted';
		}

		if (($db_column == '') || (substr_count($db_column, 'nosort'))) {
			print '<th ' . ($tip != '' ? "title='" . html_escape($tip) . "'":'') . " class='$align $nohide'>" . $display_text . "</th>\n";
		} else {
			print '<th ' . ($tip != '' ? "title='" . html_escape($tip) . "'":'') . " class='sortable $align $nohide $isSort'>";
			print "<div class='sortinfo' sort-page='" . html_escape($form_action) . "' sort-column='$db_column' sort-direction='$direction'><div class='textSubHeaderDark'>" . $display_text . "<i class='$icon'></i></div></div></th>\n";
		}
	}

	print "<th class='tableSubHeaderCheckbox'><input id='selectall' class='checkbox' type='checkbox' title='" . __esc('Select All Rows'). "' onClick='SelectAll(\"chk\",this.checked)'><label class='formCheckboxLabel' title='" . __esc('Select All Rows') . "' for='selectall'></label></th>" . ($include_form ? "<th style='display:none;'><form id='chk' name='chk' method='post' action='$form_action'></th>\n":"");
	print "</tr>\n";

	$page++;
}

/* html_header - draws a header row suitable for display inside of a box element
   @arg $header_items - an array containing a list of items to be included in the header
		alternatively and array of header names and alignment array('display' = 'blah', 'align' = 'blah')
   @arg $last_item_colspan - the TD 'colspan' to apply to the last cell in the row */
function html_header($header_items, $last_item_colspan = 1) {
	print "<tr class='tableHeader " . (!$last_item_colspan > 1 ? 'tableFixed':'') . "'>\n";

	$i = 0;
	foreach($header_items as $item) {
		if (is_array($item)) {
			if (isset($item['nohide'])) {
				$nohide = 'nohide';
			} else {
				$nohide = '';
			}

			if (isset($item['align'])) {
				$align = $item['align'];
			} else {
				$align = 'left';
			}

			print "<th class='$nohide $align' " . ((($i+1) == count($header_items)) ? "colspan='$last_item_colspan' " : "") . ">" . $item['display'] . "</th>\n";
		} else {
			print "<th " . ((($i+1) == count($header_items)) ? "colspan='$last_item_colspan' " : "") . ">" . $item . "</th>\n";
		}

		$i++;
	}

	print "</tr>\n";
}

/* html_section_header - draws a header row suitable for display inside of a box element
     but for display as a secton title and not as a series of table header columns
   @arg $header_name - an array of the display name of the header for the section and
     optional alignment.
   @arg $last_item_colspan - the TD 'colspan' to apply to the last cell in the row */
function html_section_header($header_item, $last_item_colspan = 1) {
	print "<tr class='tableHeader " . (!$last_item_colspan > 1 ? 'tableFixed':'') . "'>\n";

	if (is_array($header_item) && isset($header_item['display'])) {
		print "<th " . (isset($header_item['align']) ? "style='text-align:" . $header_item['align'] . ";'":"") . " colspan='$last_item_colspan'>" . $header_item['display'] . "</th>\n";
	} else {
		print "<th colspan='$last_item_colspan'>" . $header_item . "</th>\n";
	}

	print "</tr>\n";
}

/* html_header_checkbox - draws a header row with a 'select all' checkbox in the last cell
     suitable for display inside of a box element
   @arg $header_items - an array containing a list of items to be included in the header
		alternatively and array of header names and alignment array('display' = 'blah', 'align' = 'blah')
   @arg $form_action - the url to post the 'select all' form to */
function html_header_checkbox($header_items, $include_form = true, $form_action = "", $resizable = true) {
	/* default to the 'current' file */
	if ($form_action == "") { $form_action = get_current_page(); }

	print "<tr class='tableHeader " . (!$resizable ? 'tableFixed':'') . "'>\n";

	foreach($header_items as $item) {
		if (is_array($item)) {
			if (isset($item['nohide'])) {
				$nohide = 'nohide';
			} else {
				$nohide = '';
			}

			if (isset($item['align'])) {
				$align = $item['align'];
			} else {
				$align = 'left';
			}

			print "<th class='$align $nohide'>" . $item['display'] . "</th>";
		} else {
			print "<th class='left'>" . $item . "</th>\n";
		}
	}

	print "<th class='tableSubHeaderCheckbox'><input id='selectall' class='checkbox' type='checkbox' title='" . __esc('Select All Rows'). "' onClick='SelectAll(\"chk\",this.checked)'><label class='formCheckboxLabel' title='" . __esc('Select All') . "' for='selectall'></label></th>\n" . ($include_form ? "<th style='display:none;'><form id='chk' name='chk' method='post' action='$form_action'></th>\n":"");
	print "</tr>\n";
}

/* html_create_list - draws the items for an html dropdown given an array of data
   @arg $form_data - an array containing data for this dropdown. it can be formatted
     in one of two ways:
     $array["id"] = "value";
     -- or --
     $array[0]["id"] = 43;
     $array[0]["name"] = "Red";
   @arg $column_display - used to indentify the key to be used for display data. this
     is only applicable if the array is formatted using the second method above
   @arg $column_id - used to indentify the key to be used for id data. this
     is only applicable if the array is formatted using the second method above
   @arg $form_previous_value - the current value of this form element */
function html_create_list($form_data, $column_display, $column_id, $form_previous_value) {
	if (empty($column_display)) {
		if (sizeof($form_data)) {
			foreach (array_keys($form_data) as $id) {
				print '<option value="' . html_escape($id) . '"';

				if ($form_previous_value == $id) {
					print ' selected';
				}

				print '>' . title_trim(null_out_substitutions(html_escape($form_data[$id])), 75) . "</option>\n";
			}
		}
	} else {
		if (sizeof($form_data)) {
			foreach ($form_data as $row) {
				print "<option value='" . html_escape($row[$column_id]) . "'";

				if ($form_previous_value == $row[$column_id]) {
					print ' selected';
				}

				if (isset($row['host_id'])) {
					print '>' . title_trim(html_escape($row[$column_display]), 75) . "</option>\n";
				} else {
					print '>' . title_trim(null_out_substitutions(html_escape($row[$column_display])), 75) . "</option>\n";
				}
			}
		}
	}
}

/* html_escape_request_var - sanitizes a request variable for display
   @arg $string - string the request variable to escape
   @returns $new_string - the escaped request variable to be returned. */
function html_escape_request_var($string) {
	return html_escape(get_request_var($string));
}

/* html_escape - sanitizes a string for display
   @arg $string - string the string to escape
   @returns $new_string - the escaped string to be returned. */
function html_escape($string) {
	static $charset;

	if ($charset == '') {
		$charset = ini_get('default_charset');
	}

	if ($charset == '') {
		$charset = 'UTF-8';
	}

	return htmlspecialchars($string, ENT_QUOTES, $charset, false);
}

/* html_split_string - takes a string and breaks it into a number of <br> separated segments
   @arg $string - string to be modified and returned
   @arg $length - the maximal string length to split to
   @arg $forgiveness - the maximum number of characters to walk back from to determine
         the correct break location.
   @returns $new_string - the modified string to be returned. */
function html_split_string($string, $length = 70, $forgiveness = 10) {
	$new_string = '';
	$j    = 0;
	$done = false;

	while (!$done) {
		if (strlen($string) > $length) {
			for($i = 0; $i < $forgiveness; $i++) {
				if (substr($string, $length-$i, 1) == ' ') {
					$new_string .= substr($string, 0, $length-$i) . '<br>';

					break;
				}
			}

			$string = substr($string, $length-$i);
		} else {
			$new_string .= $string;
			$done        = true;
		}

		$j++;
		if ($j > 4) break;
	}

	return $new_string;
}

/* draw_graph_items_list - draws a nicely formatted list of graph items for display
     on an edit form
   @arg $item_list - an array representing the list of graph items. this array should
     come directly from the output of db_fetch_assoc()
   @arg $filename - the filename to use when referencing any external url
   @arg $url_data - any extra GET url information to pass on when referencing any
     external url
   @arg $disable_controls - whether to hide all edit/delete functionality on this form */
function draw_graph_items_list($item_list, $filename, $url_data, $disable_controls) {
	global $config;

	include($config['include_path'] . '/global_arrays.php');

	print "<tr class='tableHeader'>";
		DrawMatrixHeaderItem(__('Graph Item'),'',1);
		DrawMatrixHeaderItem(__('Data Source'),'',1);
		DrawMatrixHeaderItem(__('Graph Item Type'),'',1);
		DrawMatrixHeaderItem(__('CF Type'),'',1);
		DrawMatrixHeaderItem(__('Alpha %'),'',1);
		DrawMatrixHeaderItem(__('Item Color'),'',4);
	print '</tr>';

	$group_counter = 0; $_graph_type_name = ''; $i = 0;

	if (sizeof($item_list)) {
		foreach ($item_list as $item) {
			/* graph grouping display logic */
			$this_row_style   = '';
			$use_custom_class = false;
			$hard_return      = '';

			if (!preg_match('/(GPRINT|TEXTALIGN|HRULE|VRULE|TICK)/', $graph_item_types[$item['graph_type_id']])) {
				$this_row_style = 'font-weight: bold;';
				$use_custom_class = true;

				if ($group_counter % 2 == 0) {
					$customClass = 'graphItem';
				} else {
					$customClass = 'graphItemAlternate';
				}

				$group_counter++;
			}

			$_graph_type_name = $graph_item_types[$item['graph_type_id']];

			/* alternating row color */
			if ($use_custom_class == false) {
				print "<tr class='tableRowGraph'>\n";
			} else {
				print "<tr class='tableRowGraph $customClass'>";
			}

			print '<td>';
			if ($disable_controls == false) { print "<a class='linkEditMain' href='" . html_escape("$filename?action=item_edit&id=" . $item['id'] . "&$url_data") . "'>"; }
			print __('Item # %d', ($i+1));
			if ($disable_controls == false) { print '</a>'; }
			print '</td>';

			if (empty($item['data_source_name'])) { $item['data_source_name'] = __('No Task'); }

			switch (true) {
			case preg_match('/(TEXTALIGN)/', $_graph_type_name):
				$matrix_title = 'TEXTALIGN: ' . ucfirst($item['textalign']);
				break;
			case preg_match('/(TICK)/', $_graph_type_name):
				$matrix_title = '(' . $item['data_source_name'] . '): ' . $item['text_format'];
				break;
			case preg_match('/(AREA|STACK|GPRINT|LINE[123])/', $_graph_type_name):
				$matrix_title = '(' . $item['data_source_name'] . '): ' . $item['text_format'];
				break;
			case preg_match('/(HRULE)/', $_graph_type_name):
				$matrix_title = 'HRULE: ' . $item['value'];
				break;
			case preg_match('/(VRULE)/', $_graph_type_name):
				$matrix_title = 'VRULE: ' . $item['value'];
				break;
			case preg_match('/(COMMENT)/', $_graph_type_name):
				$matrix_title = 'COMMENT: ' . $item['text_format'];
				break;
			}

			if (preg_match('/(TEXTALIGN)/', $_graph_type_name)) {
				$hard_return = '';
			} elseif ($item['hard_return'] == 'on') {
				$hard_return = "<span style='font-weight:bold;color:#FF0000;'>&lt;HR&gt;</span>";
			}

			/* data source */
			print "<td style='$this_row_style'>" . html_escape($matrix_title) . $hard_return . '</td>';

			/* graph item type */
			print "<td style='$this_row_style'>" . $graph_item_types[$item['graph_type_id']] . '</td>';
			if (!preg_match('/(TICK|TEXTALIGN|HRULE|VRULE)/', $_graph_type_name)) {
				print "<td style='$this_row_style'>" . $consolidation_functions[$item['consolidation_function_id']] . '</td>';
			} else {
				print '<td>' . __('N/A') . '</td>';
			}

			/* alpha type */
			if (preg_match('/(AREA|STACK|TICK|LINE[123])/', $_graph_type_name)) {
				print "<td style='$this_row_style'>" . round((hexdec($item['alpha'])/255)*100) . '%</td>';
			} else {
				print "<td style='$this_row_style'></td>\n";
			}


			/* color name */
			if (!preg_match('/(TEXTALIGN)/', $_graph_type_name)) {
				print "<td style='width:1%;" . ((!empty($item['hex'])) ? 'background-color:#' . $item['hex'] . ";'" : "'") . '></td>';
				print "<td style='$this_row_style'>" . $item['hex'] . '</td>';
			} else {
				print '<td></td><td></td>';
			}

			if ($disable_controls == false) {
				print "<td style='text-align:right;padding-right:10px;'>\n";
				if ($i != sizeof($item_list)-1) {
					print "<a class='moveArrow fa fa-caret-down' title='" . __esc('Move Down'). "' href='" . html_escape("$filename?action=item_movedown&id=" . $item["id"] . "&$url_data") . "'></a>\n";
				} else {
					print "<span class='moveArrowNone'></span>\n";
				}
				if ($i > 0) {
					print "<a class='moveArrow fa fa-caret-up' title='" . __esc('Move Up') . "' href='" . html_escape("$filename?action=item_moveup&id=" . $item["id"] . "&$url_data") . "'></a>\n";
				} else {
					print "<span class='moveArrowNone'></span>\n";
				}
				print "</td>\n";

				print "<td style='text-align:right;'><a class='deleteMarker fa fa-remove' title='" . __esc('Delete') . "' href='" . html_escape("$filename?action=item_remove&id=" . $item["id"] . "&$url_data") . "'></a></td>\n";
			}

			print "</tr>";

			$i++;
		}
	} else {
		print "<tr class='tableRow'><td colspan='7'><em>" . __('No Items') . "</em></td></tr>";
	}
}

function is_menu_pick_active($menu_url) {
	static $url_array, $url_parts;

	$menu_parts = array();

	/* break out the URL and variables */
	if (!is_array($url_array) || (is_array($url_array) && !sizeof($url_array))) {
		$url_array = parse_url($_SERVER['REQUEST_URI']);
		if (isset($url_array['query'])) {
			parse_str($url_array['query'], $url_parts);
		} else {
			$url_parts = array();
		}
	}

	$menu_array = parse_url($menu_url);

	if (basename($url_array['path']) == basename($menu_array['path'])) {
		if (isset($menu_array['query'])) {
			parse_str($menu_array['query'], $menu_parts);
		} else {
			$menu_parts = array();
		}

		if (isset($menu_parts['id'])) {
			if (isset($url_parts['id'])) {
				if ($menu_parts['id'] == $url_parts['id']) {
					return true;
				}
			}
		} elseif (isset($menu_parts['action'])) {
			if (isset($url_parts['action'])) {
				if ($menu_parts['action'] == $url_parts['action']) {
					return true;
				}
			}
		} else {
			return true;
		}
	}

	return false;
}

/* draw_menu - draws the cacti menu for display in the console */
function draw_menu($user_menu = "") {
	global $config, $user_auth_realm_filenames, $menu, $menu_glyphs;

	if (!is_array($user_menu)) {
		$user_menu = $menu;
	}

	//print "<pre>";print_r($_SERVER);print "</pre>";
	//print "<pre>";print_r($user_menu);print "</pre>";exit;

	print "<tr><td><table><tr><td><div id='menu'><ul id='nav' role='menu'>\n";

	/* loop through each header */
	$i = 0;
	$headers = array();
	foreach ($user_menu as $header_name => $header_array) {
		/* pass 1: see if we are allowed to view any children */
		$show_header_items = false;
		foreach ($header_array as $item_url => $item_title) {
			if (preg_match('#link.php\?id=(\d+)#', $item_url, $matches)) {
				if (is_realm_allowed($matches[1]+10000)) {
					$show_header_items = true;
				} else {
					$show_header_items = false;
				}
			} else {
				$current_realm_id = (isset($user_auth_realm_filenames[basename($item_url)]) ? $user_auth_realm_filenames[basename($item_url)] : 0);

				if (is_realm_allowed($current_realm_id)) {
					$show_header_items = true;
				} elseif (api_user_realm_auth(strtok($item_url, '?'))) {
					$show_header_items = true;
				}
			}
		}

		if ($show_header_items == true) {
			// Let's give our menu li's a unique id
			$id = 'menu_' . strtolower(clean_up_name($header_name));
			if (isset($headers[$id])) {
				$id .= '_' . $i;
				$i++;
			}
			$headers[$id] = true;

			if (isset($menu_glyphs[$header_name])) {
				$glyph = '<i class="menu_glyph ' . $menu_glyphs[$header_name] . '"></i>';
			} else {
				$glyph = '<i class="menu_glyph fa fa-folder-o"></i>';
			}

			print "<li class='menuitem' role='menuitem' aria-haspopup='true' id='$id'><a class='menu_parent active' href='#'>$glyph<span>$header_name</span></a>\n";
			print "<ul role='menu' id='${id}_div' style='display:block;'>\n";

			/* pass 2: loop through each top level item and render it */
			foreach ($header_array as $item_url => $item_title) {
				$basename = basename($item_url);
				$current_realm_id = (isset($user_auth_realm_filenames[$basename]) ? $user_auth_realm_filenames[$basename] : 0);

				/* if this item is an array, then it contains sub-items. if not, is just
				the title string and needs to be displayed */
				if (is_array($item_title)) {
					$i = 0;

					if ($current_realm_id == -1 || is_realm_allowed($current_realm_id) || !isset($user_auth_realm_filenames[$basename])) {
						/* if the current page exists in the sub-items array, draw each sub-item */
						if (array_key_exists(get_current_page(), $item_title) == true) {
							$draw_sub_items = true;
						} else {
							$draw_sub_items = false;
						}

						foreach ($item_title as $item_sub_url => $item_sub_title) {
							$item_sub_url = $config['url_path'] . $item_sub_url;

							/* always draw the first item (parent), only draw the children if we are viewing a page
							that is contained in the sub-items array */
							if (($i == 0) || ($draw_sub_items)) {
								if (is_menu_pick_active($item_sub_url)) {
									print "<li><a role='menuitem' class='pic selected' href='" . html_escape($item_sub_url) . "'>$item_sub_title</a></li>\n";
								} else {
									print "<li><a role='menuitem' class='pic' href='" . html_escape($item_sub_url) . "'>$item_sub_title</a></li>\n";
								}
							}

							$i++;
						}
					}
				} else {
					if ($current_realm_id == -1 || is_realm_allowed($current_realm_id) || !isset($user_auth_realm_filenames[$basename])) {
						/* draw normal (non sub-item) menu item */
						$item_url = $config['url_path'] . $item_url;
						if (is_menu_pick_active($item_url)) {
							print "<li><a role='menuitem' class='pic selected' href='" . html_escape($item_url) . "'>$item_title</a></li>\n";
						} else {
							print "<li><a role='menuitem' class='pic' href='" . html_escape($item_url) . "'>$item_title</a></li>\n";
						}
					}
				}
			}

			print "</ul></li>\n";
		}
	}

	print "</ul></div></td></tr></table></td></tr>\n";
}

/* draw_actions_dropdown - draws a table the allows the user to select an action to perform
     on one or more data elements
   @arg $actions_array - an array that contains a list of possible actions. this array should
     be compatible with the form_dropdown() function
   @arg $delete_action - if there is a delete action that should surpress removal of rows
     specify it here.  If you don't want any delete actions, set to 0.*/
function draw_actions_dropdown($actions_array, $delete_action = 1) {
	global $config;

	if (!isset($actions_array[0])) {
		$my_actions[0]  = __('Choose an action');
		$my_actions    += $actions_array;
		$actions_array  = $my_actions;
	}

	?>
	<div class='actionsDropdown'>
		<div>
			<span class='actionsDropdownArrow'><img src='<?php echo $config['url_path']; ?>images/arrow.gif' alt=''></span>
			<?php form_dropdown('drp_action', $actions_array, '', '', '0', '', '');?>
			<span class='actionsDropdownButton'><input id='submit' type='submit' value='<?php print __esc('Go');?>' title='<?php print __esc('Execute Action');?>'></span>
		</div>
	</div>
	<input type='hidden' id='action' name='action' value='actions'>
	<script type='text/javascript'>
	function setDisabled() {
		$('tr[id^="line"]').addClass('selectable').prop('disabled', false).removeClass('disabled_row').find('td').unbind().find(':checkbox.disabled').unbind().prop('disabled', false);

		if ($('#drp_action').val() == <?php print $delete_action;?>) {
			$(':checkbox.disabled').each(function(data) {
				$(this).closest('tr').addClass('disabled_row');
				if ($(this).is(':checked')) {
					$(this).prop('checked', false);
					$(this).closest('tr').removeClass('selected');
				}
				$(this).prop('disabled', true).closest('tr').removeClass('selected');
			});

			$('#submit').each(function() {
				if ($(this).button === 'function') {
					$(this).button('enable');
				} else {
					$(this).prop('disabled', false);
				}
			});
		}else if ($('#drp_action').val() == 0) {
			$(':checkbox.disabled').each(function(data) {
				$(this).prop('disabled', false);
			});

			$('#submit').each(function() {
				if ($(this).button === 'function') {
					$(this).button('disable');
				} else {
					$(this).prop('disabled', true);
				}
			});
		}else if (<?php print $delete_action;?> != 0) {
			$('#submit').each(function() {
				if ($(this).button === 'function') {
					$(this).button('enable');
				} else {
					$(this).prop('disabled', false);
				}
			});
		}

		var lines = $('tr[id^="line"]');
		var checkboxes = lines.find('input.checkbox');

		lines.filter(':not(.disabled_row)').find('td').not('.checkbox').each(function(data) {
			$(this).unbind().click(function(e) {
				if (e.shiftKey) {
					updateCheckboxes(checkboxes, $(this).closest('tr').find(':checkbox'));
				} else {
					var checked = $(this).closest('tr').find(':checkbox').is(':checked');
					$(this).closest('tr').siblings().find(':checkbox').removeAttr('data-prev-check');
					$(this).closest('tr').toggleClass('selected').find(':checkbox').prop('checked', !checked)
						.attr('data-prev-check', !checked);
				}
			});
		});

		lines.find('input.checkbox').each(function(data) {
			$(this).unbind().click(function(e) {
				if (!$(this).closest('tr').hasClass('disabled_row')) {
					if (e.shiftKey) {
						updateCheckboxes(checkboxes, this);
					} else {
						$(this).closest('tr').toggleClass('selected');
						$(this).closest('tr').siblings().find(':checkbox').removeAttr('data-prev-check');
						$(this).attr('data-prev-check', $(this).prop('checked'));
					}
				}
			});
		});
	}

	$(function() {
		setDisabled();
		$('#drp_action').change(function() {
			setDisabled();
		});

		$('.tableSubHeaderCheckbox').find(':checkbox').unbind().click(function(data) {
			if ($(this).is(':checked')) {
				$('input[id^="chk_"]').not(':disabled').prop('checked',true);
				$('tr.selectable').addClass('selected');
			} else {
				$('input[id^="chk_"]').not(':disabled').prop('checked',false);
				$('tr.selectable').removeClass('selected');
			}
		});
	});
	</script>
	<?php
}

/*
 * Deprecated functions
 */

function DrawMatrixHeaderItem($matrix_name, $matrix_text_color, $column_span = 1) {
	?>
	<th style='height:1px;' colspan='<?php print $column_span;?>'>
		<div class='textSubHeaderDark'><?php print $matrix_name;?></div>
	</th>
	<?php
}

function form_area($text) { ?>
	<tr>
		<td class="textArea">
			<?php print $text;?>
		</td>
	</tr>
<?php }

function is_console_page($url) {
	global $menu;

	$basename = basename($url);

	if ($basename == 'index.php') {
		return true;
	}

	if ($basename == 'rrdcleaner.php') {
		return true;
	}

	if (api_plugin_hook_function('is_console_page', $url) != $url) {
		return true;
	}

	if (sizeof($menu)) {
		foreach($menu as $section => $children) {
			if (sizeof($children)) {
				foreach($children as $page => $name) {
					if (basename($page) == $basename) {
						return true;
					}
				}
			}
		}
	}

	return false;
}

function html_show_tabs_left() {
	global $config, $tabs_left;

	$realm_allowed     = array();
	$realm_allowed[7]  = is_realm_allowed(7);
	$realm_allowed[8]  = is_realm_allowed(8);
	$realm_allowed[18] = is_realm_allowed(18);
	$realm_allowed[19] = is_realm_allowed(19);
	$realm_allowed[21] = is_realm_allowed(21);
	$realm_allowed[22] = is_realm_allowed(22);
	$realm_allowed[100] = is_realm_allowed(100);
	$realm_allowed[200] = is_realm_allowed(200);

	if ($realm_allowed[8]) {
		$show_console_tab = true;
	} else {
		$show_console_tab = false;
	}

		?>
		 <a class="navbar-brand" href="#"><img  class='logo_principal' src='images/logo_telco2.gif'></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
		<!-- <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"> -->

	
		<!-- logo principal -->
		<!-- <img  class='logo_principal' src='images/logo_telco_blanco.gif'> -->
		<!-- <a href="#"><img  class='logo_principal' src='images/logo_telco2.gif'></a> -->
		
		<!-- <div  class="nombre_principal" style="display: inline-block; color: #FFFFFF;"></div> -->
		<?php

	if (get_selected_theme() == 'classic') {
		
		// contenido testbed ims 
		// 
		// 
		// admin_testbedims
		if ($realm_allowed[200]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show graphs tab when offline
			} else {
				$file = get_current_page();
				if ($file == "admin_testbedims.php") {
				
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal_selected' href='" . html_escape($config['url_path'] . 'admin_testbedims.php') . "'>Administrar</a>";
					print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'admin_testbedims.php') . "'>Administrar<span class='sr-only'>(current)</span></a></li>";
				} else {
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal' href='" . html_escape($config['url_path'] . 'admin_testbedims.php') . "'>Administrar</a>";
					print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'admin_testbedims.php') . "'>Administrar<span class='sr-only'>(current)</span></a></li>";
				}				
			}
		}
		// info
		if ($realm_allowed[100]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show graphs tab when offline
			} else {
				$file = get_current_page();
				if ($file == "info.php") {
				
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal_selected' href='" . html_escape($config['url_path'] . 'info.php') . "'>Información</a>";
					print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'info.php') . "'>Información<span class='sr-only'>(current)</span></a></li>";
				} else {
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal' href='" . html_escape($config['url_path'] . 'info.php') . "'>Información</a>";
					print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'info.php') . "'>Información<span class='sr-only'>(current)</span></a></li>";
				}				
			}
		}


		// arquitectura
		if ($realm_allowed[100]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show graphs tab when offline
			} else {
				$file = get_current_page();
				if ($file == "arquitectura.php") {
				
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal_selected' href='" . html_escape($config['url_path'] . 'arquitectura.php') . "'>Arquitectura</a>";
					print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'arquitectura.php') . "'>Arquitectura<span class='sr-only'>(current)</span></a></li>";
				} else {
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal' href='" . html_escape($config['url_path'] . 'arquitectura.php') . "'>Arquitectura</a>";
					print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'arquitectura.php') . "'>Arquitectura<span class='sr-only'>(current)</span></a></li>";
				}
			}
		}
		// pruebas
		if ($realm_allowed[100]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show graphs tab when offline
			} else {
				$file = get_current_page();
				if ($file == "pruebas.php") {
				
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal_selected' href='" . html_escape($config['url_path'] . 'pruebas.php') . "'>Pruebas</a>";
					print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'pruebas.php') . "'>Pruebas</a></li>";
				} else {
					// print "<a id='maintab-anchor" . rand() . "' class='menu_principal' href='" . html_escape($config['url_path'] . 'pruebas.php') . "'>Pruebas</a>";
					print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'pruebas.php') . "'>Pruebas</a></li>";
				}
			}
		}

		// // graficas

		if ($realm_allowed[7]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show graphs tab when offline
			} else {
				$file = get_current_page();
				if ($file == "graph_view.php") {
					
					// print "<li class='nav-item active'><a id='maintab-anchor" . rand() . "' class='menu_principal_selected' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas</a></li>";
					// print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas<span class='sr-only'>(current)</span></a></li>";
					print "<li class='nav-item active'><a class='nav-link' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas</a></li>";
				} else {
					// print "<li class='nav-item active'><a id='maintab-anchor" . rand() . "' class='menu_principal' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas</a></li>";
					// print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas<span class='sr-only'>(current)</span></a></li>";
					print "<li class='nav-item'><a class='nav-link' href='" . html_escape($config['url_path'] . 'graph_view.php') . "'>Gráficas</a></li>";
				}
				
			}
		}
		
		
		

		
		
		//consola
		if ($show_console_tab == true) {
			?> <li class='nav-item'><a class='nav-link' href="<?php echo $config['url_path']; ?>index.php") . "'>Consola<span class='sr-only'>(current)</span></a></li>

				<!-- <a <?php print (is_console_page(get_current_page()) ? " id='maintab-anchor" . rand() . "' class='selected'":"");?> href="<?php echo $config['url_path']; ?>index.php"><img src="<?php echo $config['url_path']; ?>images/tab_console<?php print (is_console_page(get_current_page()) ? '_down':'');?>.gif" alt="<?php print __('Console');?>"></a> -->

				<?php
		}
		//se oculta la funcion de nectar y la funcion de clog

		// if ($realm_allowed[21] || $realm_allowed[22]) {
		// 	if ($config['poller_id'] > 1) {
		// 		// Don't show reports tabe if not poller 1
		// 	} else {
		// 		if (substr_count($_SERVER["REQUEST_URI"], "reports_")) {
		// 			print '<a href="' . $config['url_path'] . ($realm_allowed[22] ? 'reports_admin.php':'reports_user.php') . '"><img src="' . $config['url_path'] . 'images/tab_nectar_down.gif" alt="' . __('Reporting') . '"></a>';
		// 		} else {
		// 			print '<a href="' . $config['url_path'] . ($realm_allowed[22] ? 'reports_admin.php':'reports_user.php') . '"><img src="' . $config['url_path'] . 'images/tab_nectar.gif" alt="' . __('Reporting') . '"></a>';
		// 		}
		// 	}
		// }

		// if ($realm_allowed[18] || $realm_allowed[19]) {
		// 	if (substr_count($_SERVER["REQUEST_URI"], "clog")) {
		// 		print '<a href="' . $config['url_path'] . ($realm_allowed[18] ? 'clog.php':'clog_user.php') . '"><img src="' . $config['url_path'] . 'images/tab_clog_down.png" alt="' . __('Logs'). '"></a>';
		// 	} else {
		// 		print '<a href="' . $config['url_path'] . ($realm_allowed[18] ? 'clog.php':'clog_user.php') . '"><img src="' . $config['url_path'] . 'images/tab_clog.png" alt="' . __('Logs') . '"></a>';
		// 	}
		// }

		?>
			</ul>
			
		</div>
		<?php 
		api_plugin_hook('top_graph_header_tabs');

		if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
			// Only show external links when online
		} else {
			$external_links = db_fetch_assoc('SELECT id, title
				FROM external_links
				WHERE style="TAB"
				AND enabled="on"
				ORDER BY sortorder');

			if (sizeof($external_links)) {
				foreach($external_links as $tab) {
					if (is_realm_allowed($tab['id']+10000)) {
						$parsed_url = parse_url($_SERVER['REQUEST_URI']);
						$down = false;

						if (basename($parsed_url['path']) == 'link.php') {
							if (isset($parsed_url['query'])) {
								$queries = explode('&', $parsed_url['query']);
								foreach($queries as $q) {
									list($var, $value) = explode('=', $q);
									if ($var == 'id') {
										if ($value == $tab['id']) {
											$down = true;
											break;
										}
									}
								}
							}
						}

						print '<a href="' . $config['url_path'] . 'link.php?id=' . $tab['id'] . '"><img src="' . get_classic_tabimage($tab['title'], $down) . '" alt="' . $tab['title'] . '"></a>';
					}
				}
			}
		}
	}else{
		if ($show_console_tab) {
			$tabs_left[] =
			array(
				'title' => __('Console'),
				'id'	=> 'maintab-anchor-console',
				'image' => '',
				'url'   => $config['url_path'] . 'index.php',
			);
		}

		if ($realm_allowed[7]) {
			if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
				// Don't show the graphs tab when offline
			} else {
				$tabs_left[] =
					array(
						'title' => __('Graphs'),
						'id'	=> 'maintab-anchor-graphs',
						'image' => '',
						'url'   => $config['url_path'] . 'graph_view.php',
					);
			}
		}

		if ($realm_allowed[21] || $realm_allowed[22]) {
			if ($config['poller_id'] > 1) {
				// Don't show the reports tab on other pollers
			} else {
				$tabs_left[] =
					array(
						'title' => __('Reporting'),
						'id'	=> 'maintab-anchor-reports',
						'image' => '',
						'url'   => $config['url_path'] . ($realm_allowed[22] ? 'reports_admin.php':'reports_user.php'),
					);
			}
		}

		if ($realm_allowed[18] || $realm_allowed[19]) {
			$tabs_left[] =
				array(
					'title' => __('Logs'),
					'id'	=> 'maintab-anchor-logs',
					'image' => '',
					'url'   => $config['url_path'] . ($realm_allowed[18] ? 'clog.php':'clog_user.php'),
				);
		}

		// Get Plugin Text Out of Band
		ob_start();
		api_plugin_hook('top_graph_header_tabs');

		$tab_text = trim(ob_get_clean());
		$tab_text = str_replace('<a', '', $tab_text);
		$tab_text = str_replace('</a>', '|', $tab_text);
		$tab_text = str_replace('<img', '', $tab_text);
		$tab_text = str_replace('<', '', $tab_text);
		$tab_text = str_replace('"', "'", $tab_text);
		$tab_text = str_replace('>', '', $tab_text);
		$elements = explode('|', $tab_text);

		foreach($elements as $p) {
			$p = trim($p);

			if ($p == '') {
				continue;
			}

			$altpos  = strpos($p, 'alt=');
			$hrefpos = strpos($p, 'href=');

			if ($altpos >= 0) {
				$alt = substr($p, $altpos+4);
				$parts = explode("'", $alt);
				if ($parts[0] == '') {
					$alt = $parts[1];
				} else {
					$alt = $parts[0];
				}
			} else {
				$alt = __('Title');
			}

			if ($hrefpos >= 0) {
				$href = substr($p, $hrefpos+5);
				$parts = explode("'", $href);
				if ($parts[0] == '') {
					$href = $parts[1];
				} else {
					$href = $parts[0];
				}
			} else {
				$href = 'unknown';
			}

			$tabs_left[] = array('title' => ucwords($alt), 'url' => $href);
		}

		if ($config['poller_id'] > 1 && $config['connection'] != 'online') {
			// Only show external links when online
		} else {
			$external_links = db_fetch_assoc('SELECT id, title
				FROM external_links
				WHERE style="TAB"
				AND enabled="on"
				ORDER BY sortorder');

			if (sizeof($external_links)) {
				foreach($external_links as $tab) {
					if (is_realm_allowed($tab['id']+10000)) {
						$tabs_left[] =
							array(
								'title' => $tab['title'],
								'id'    => 'maintab-anchor-link' . $tab['id'],
								'image' => '',
								'url'   => $config['url_path'] . 'link.php?id=' . $tab['id']
							);
					}
				}
			}
		}

		$i = 0;
		$me_base = get_current_page();
		foreach($tabs_left as $tab) {
			$tab_base = basename($tab['url']);

			if ($tab_base == 'graph_view.php' && ($me_base == 'graph_view.php' || $me_base == 'graph.php')) {
				$tabs_left[$i]['selected'] = true;
			} elseif (isset_request_var('id') && ($tab_base == 'link.php?id=' . get_nfilter_request_var('id')) && $me_base == 'link.php') {
				$tabs_left[$i]['selected'] = true;
			} elseif ($tab_base == 'index.php' && is_console_page($me_base)) {
				$tabs_left[$i]['selected'] = true;
			} elseif ($tab_base == $me_base) {
				$tabs_left[$i]['selected'] = true;
			}

			$i++;
		}

		$i = 0;

		print "<div class='maintabs'><nav><ul role='tablist'>\n";
		foreach($tabs_left as $tab) {
			print "<li><a id='" . (isset($tab['id']) ? $tab['id'] : 'maintab-anchor-' . $i) . "' class='lefttab" . (isset($tab['selected']) ? ' selected':'') . "' href='" . html_escape($tab['url']) . "'>" . html_escape($tab['title']) . "</a></li>\n";

			$i++;
		}
		print "</ul></nav></div>\n";
	}



}

function html_graph_tabs_right($current_user) {
	global $config, $tabs_right;

	$theme = get_selected_theme();

	if ($theme == 'classic') {
		if (is_view_allowed('show_tree')) {
			?><a class='righttab' id='treeview' href='<?php print html_escape($config['url_path'] . 'graph_view.php?action=tree');?>'><img src='<?php echo $config['url_path']; ?>images/tab_mode_tree<?php
			if (isset_request_var('action') && get_nfilter_request_var('action') == 'tree') {
				print '_down';
			}?>.gif' title='<?php print __esc('Tree View');?>' alt=''></a><?php
		}?><?php

		if (is_view_allowed('show_list')) {
			?><a class='righttab' id='listview' href='<?php print html_escape($config['url_path'] . 'graph_view.php?action=list');?>'><img src='<?php echo $config['url_path']; ?>images/tab_mode_list<?php
			if (isset_request_var('action') && get_nfilter_request_var('action') == 'list') {
				print '_down';
			}?>.gif' title='<?php print __esc('List View');?>' alt=''></a><?php
		}?><?php

		if (is_view_allowed('show_preview')) {
			?><a class='righttab' id='preview' href='<?php print html_escape($config['url_path'] . 'graph_view.php?action=preview');?>'><img src='<?php echo $config['url_path']; ?>images/tab_mode_preview<?php
			if (isset_request_var('action') && get_nfilter_request_var('action') == 'preview') {
				print '_down';
			}?>.gif' title='<?php print __esc('Preview View');?>' alt=''></a><?php
		}?>&nbsp;<br>
		<?php
	} else {
		$tabs_right = array();

		if (is_view_allowed('show_tree')) {
			$tabs_right[] = array(
				'title' => __('Tree View'),
				'image' => 'include/themes/' . $theme . '/images/tab_tree.gif',
				'id'    => 'tree',
				'url'   => 'graph_view.php?action=tree',
			);
		}

		if (is_view_allowed('show_list')) {
			$tabs_right[] = array(
				'title' => __('List View'),
				'image' => 'include/themes/' . $theme . '/images/tab_list.gif',
				'id'    => 'list',
				'url'   => 'graph_view.php?action=list',
			);
		}

		if (is_view_allowed('show_preview')) {
			$tabs_right[] = array(
				'title' => __('Preview'),
				'image' => 'include/themes/' . $theme . '/images/tab_preview.gif',
				'id'    => 'preview',
				'url'   => 'graph_view.php?action=preview',
			);
		}

		$i = 0;
		foreach($tabs_right as $tab) {
			if ($tab['id'] == 'tree') {
				if (isset_request_var('action') && get_nfilter_request_var('action') == 'tree') {
					$tabs_right[$i]['selected'] = true;
				}
			} elseif ($tab['id'] == 'list') {
				if (isset_request_var('action') && get_nfilter_request_var('action') == 'list') {
					$tabs_right[$i]['selected'] = true;
				}
			} elseif ($tab['id'] == 'preview') {
				if (isset_request_var('action') && get_nfilter_request_var('action') == 'preview') {
					$tabs_right[$i]['selected'] = true;
				}
			} elseif (strstr(get_current_page(false), $tab['url'])) {
				$tabs_right[$i]['selected'] = true;
			}

			$i++;
		}

		print "<div class='tabs' style='float:right;'><nav><ul role='tablist'>\n";
		foreach($tabs_right as $tab) {
			switch($tab['id']) {
			case 'tree':
				if (isset($tab['image']) && $tab['image'] != '') {
					print "<li role='tab'><a id='treeview' title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'><img src='" . $config['url_path'] . $tab['image'] . "' alt='' style='vertical-align:bottom;'></a></li>\n";
				} else {
					print "<li role='tab'><a title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'>" . $tab['title'] . "</a></li>\n";
				}
				break;
			case 'list':
				if (isset($tab['image']) && $tab['image'] != '') {
					print "<li role='tab'><a id='listview' title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'><img src='" . $config['url_path'] . $tab['image'] . "' alt='' style='vertical-align:bottom;'></a></li>\n";
				} else {
					print "<li role='tab'><a title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'>" . $tab['title'] . "</a></li>\n";
				}

				break;
			case 'preview':
				if (isset($tab['image']) && $tab['image'] != '') {
					print "<li role='tab'><a id='preview' title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'><img src='" . $config['url_path'] . $tab['image'] . "' alt='' style='vertical-align:bottom;'></a></li>\n";
				} else {
					print "<li role='tab'><a title='" . html_escape($tab['title']) . "' class='righttab " . (isset($tab['selected']) ? 'selected':'') . "' href='" . $tab['url'] . "'>" . $tab['title'] . "</a></li>\n";
				}

				break;
			}
		}
		print "</ul></nav></div>\n";
	}
}

function html_host_filter($host_id = '-1', $call_back = 'applyFilter', $sql_where = '', $noany = false, $nonone = false) {
	$theme = get_selected_theme();

	if (strpos($call_back, '()') === false) {
		$call_back .= '()';
	}

	if ($theme == 'classic' || !read_config_option('autocomplete_enabled')) {
		?>
		<td>
			<?php print __('Device');?>
		</td>
		<td>
			<select id='host_id' name='host_id' onChange='<?php print $call_back;?>'>
				<?php if (!$noany) {?><option value='-1'<?php if (get_request_var('host_id') == '-1') {?> selected<?php }?>><?php print __('Any');?></option><?php }?>
				<?php if (!$nonone) {?><option value='0'<?php if (get_request_var('host_id') == '0') {?> selected<?php }?>><?php print __('None');?></option><?php }?>
				<?php

				$devices = get_allowed_devices($sql_where);

				if (sizeof($devices)) {
					foreach ($devices as $device) {
						print "<option value='" . $device['id'] . "'"; if (get_request_var('host_id') == $device['id']) { print ' selected'; } print '>' . title_trim(html_escape($device['description'] . ' (' . $device['hostname'] . ')'), 40) . "</option>\n";
					}
				}
				?>
			</select>
		</td>
		<?php
	} else {
		if ($host_id > 0) {
			$hostname = db_fetch_cell_prepared("SELECT description FROM host WHERE id = ?", array($host_id));
		} elseif ($host_id == 0) {
			$hostname = __('None');
		} else {
			$hostname = __('Any');
		}

		?>
		<td>
			<?php print __('Device');?>
		</td>
		<td>
			<span id='host_wrapper' style='width:200px;' class='ui-selectmenu-button ui-widget ui-state-default ui-corner-all'>
				<span id='host_click' class='ui-icon ui-icon-triangle-1-s'></span>
				<input size='28' id='host' value='<?php print html_escape($hostname);?>'>
			</span>
			<input type='hidden' id='host_id' name='host_id' value='<?php print $host_id;?>'>
			<input type='hidden' id='call_back' value='<?php print $call_back;?>'>
		</td>
	<?php
	}
}

function html_spikekill_actions() {
	switch(get_nfilter_request_var('action')) {
		case 'spikemenu':
			html_spikekill_menu(get_filter_request_var('local_graph_id'));

			break;
		case 'spikesave':
			switch(get_nfilter_request_var('setting')) {
				case 'ravgnan':
					$id = get_nfilter_request_var('id');
					switch($id) {
						case 'avg':
						case 'last':
						case 'nan':
							set_user_setting('spikekill_avgnan', $id);
							break;
					}

					break;
				case 'rstddev':
					set_user_setting('spikekill_deviations', get_filter_request_var('id'));
					break;
				case 'rvarout':
					set_user_setting('spikekill_outliers', get_filter_request_var('id'));
					break;
				case 'rvarpct':
					set_user_setting('spikekill_percent', get_filter_request_var('id'));
					break;
				case 'rkills':
					set_user_setting('spikekill_number', get_filter_request_var('id'));
					break;
			}

			break;
	}
}

function html_spikekill_setting($name) {
	return read_user_setting($name, read_config_option($name), true);
}

function html_spikekill_menu($local_graph_id) {
	$ravgnan  = '<li>' . __('Replacement Method') . '<ul>';
	$ravgnan .= '<li class="skmethod" id="method_avg"><i ' . (html_spikekill_setting('spikekill_avgnan') == 'avg' ? 'class="fa fa-check"':'') . '></i><span></span>' . __('Average') . '</li>';
	$ravgnan .= '<li class="skmethod" id="method_nan"><i ' . (html_spikekill_setting('spikekill_avgnan') == 'nan' ? 'class="fa fa-check"':'') . '></i><span></span>' . __('NaN\'s') . '</li>';
	$ravgnan .= '<li class="skmethod" id="method_last"><i ' . (html_spikekill_setting('spikekill_avgnan') == 'last' ? 'class="fa fa-check"':'') . '></i><span></span>' . __('Last Known Good') . '</li>';
	$ravgnan .= '</ul></li>';

	$rstddev  = '<li>' . __('Standard Deviations') . '<ul>';
	for($i = 1; $i <= 10; $i++) {
		$rstddev .= '<li class="skstddev" id="stddev_' . $i . '"><i ' . (html_spikekill_setting('spikekill_deviations') == $i ? 'class="fa fa-check"':'') . '></i><span></span>' . __('%s Standard Deviations', $i) . '</li>';
	}
	$rstddev .= '</ul></li>';

	$rvarpct  = '<li>' . __('Variance Percentage') . '<ul>';
	for($i = 1; $i <= 10; $i++) {
		$rvarpct .= '<li class="skvarpct" id="varpct_' . ($i * 100) . '"><i ' . (html_spikekill_setting('spikekill_percent') == ($i * 100) ? 'class="fa fa-check"':'') . '></i><span></span>' . round($i * 100,0) . ' %</li>';
	}
	$rvarpct .= '</ul></li>';

	$rvarout  = '<li>' . __('Variance Outliers') . '<ul>';
	for($i = 3; $i <= 10; $i++) {
		$rvarout .= '<li class="skvarout" id="varout_' . $i . '"><i ' . (html_spikekill_setting('spikekill_outliers') == $i ? 'class="fa fa-check"':'') . '></i><span></span>' . __('%d Outliers', $i) . '</li>';
	}
	$rvarout .= '</ul></li>';

	$rkills  = '<li>' . __('Kills Per RRA') . '<ul>';
	for($i = 1; $i <= 10; $i++) {
		$rkills .= '<li class="skkills" id="kills_' . $i . '"><i ' . (html_spikekill_setting('spikekill_number') == $i ? 'class="fa fa-check"':'') . '></i><span></span>' . __('%d Spikes', $i) . '</li>';
	}
	$rkills .= '</ul></li>';

	?>
	<div class='spikekillParent' style='display:none;z-index:20;position:absolute;text-align:left;white-space:nowrap;padding-right:2px;'>
	<ul class='spikekillMenu' style='font-size:1em;'>
		<li data-graph='<?php print $local_graph_id;?>' class='rstddev'><i class='deviceUp fa fa-support'></i><span></span><?php print __('Remove StdDev');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='rvariance'><i class='deviceRecovering fa fa-support'></i><span></span><?php print __('Remove Variance');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='routlier'><i class='deviceUnknown fa fa-support'></i><span></span><?php print __('Gap Fill Range');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='rrangefill'><i class='deviceDown fa fa-support'></i><span></span><?php print __('Float Range');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='dstddev'><i class='deviceUp fa fa-check'></i><span></span><?php print __('Dry Run StdDev');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='dvariance'><i class='deviceRecovering fa fa-check'></i><span></span><?php print __('Dry Run Variance');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='doutlier'><i class='deviceUnknown fa fa-check'></i><span></span><?php print __('Dry Run Gap Fill Range');?></li>
		<li data-graph='<?php print $local_graph_id;?>' class='drangefill'><i class='deviceDown fa fa-check'></i><span></span><?php print __('Dry Run Float Range');?></li>
		<li><i class='fa fa-cog'></i><span></span>Settings
			<ul>
				<?php print $ravgnan;?>
				<?php print $rstddev;?>
				<?php print $rvarpct;?>
				<?php print $rvarout;?>
				<?php print $rkills;?>
			</ul>
		</li>
	</ul>
	</div>
	<?php
}

function html_spikekill_js() {
	?>
	<script type='text/javascript'>
	spikeKillOpen = false;
	$(function() {
		$(document).click(function() {
			if (spikeKillOpen) {
				$(this).find('.spikekillMenu').menu('destroy').parent().remove();
				spikeKillOpen = false;
			}
		});

		$('span.spikekill').children().contextmenu(function() {
			return false;
		});

		$('span.spikekill').unbind().click(function() {
			if (spikeKillOpen == false) {
				local_graph_id = $(this).attr('data-graph');

				$.get('?action=spikemenu&local_graph_id='+local_graph_id)
					.done(function(data) {
						$('#sk'+local_graph_id).after(data);

						$('.spikekillMenu').menu({
							select: function(event, ui) {
								$(this).menu('focus', event, ui.item);
							},
							delay: 1000
						});

						$('.spikekillParent').show();

						spikeKillActions();

						spikeKillOpen = true;
					})
					.fail(function(data) {
						getPresentHTTPError(data);
					});

			} else {
				spikeKillOpen = false;
				$(this).find('.spikekillMenu').menu('destroy').parent().remove();
			}
		});
	});

	function spikeKillActions() {
		$('.rstddev').unbind().click(function() {
			removeSpikesStdDev($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.dstddev').unbind().click(function() {
			dryRunStdDev($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.rvariance').unbind().click(function() {
			removeSpikesVariance($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.dvariance').unbind().click(function() {
			dryRunVariance($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.routlier').unbind().click(function() {
			removeSpikesInRange($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.doutlier').unbind().click(function() {
			dryRunSpikesInRange($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.rrangefill').unbind().click(function() {
			removeRangeFill($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.drangefill').unbind().click(function() {
			dryRunRangeFill($(this).attr('data-graph'));
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();
		});

		$('.skmethod').unbind().click(function() {
			$('.skmethod').find('i').removeClass('fa fa-check');
			$(this).find('i:first').addClass('fa fa-check');
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();

			strURL = '?action=spikesave&setting=ravgnan&id='+$(this).attr('id').replace('method_','');
			$.get(strURL)
				.fail(function(data) {
					getPresentHTTPError(data);
				});
		});

		$('.skkills').unbind().click(function() {
			$('.skkills').find('i').removeClass('fa fa-check');
			$(this).find('i:first').addClass('fa fa-check');
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();

			strURL = '?action=spikesave&setting=rkills&id='+$(this).attr('id').replace('kills_','');
			$.get(strURL)
				.fail(function(data) {
					getPresentHTTPError(data);
				});
		});

		$('.skstddev').unbind().click(function() {
			$('.skstddev').find('i').removeClass('fa fa-check');
			$(this).find('i:first').addClass('fa fa-check');
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();

			strURL = '?action=spikesave&setting=rstddev&id='+$(this).attr('id').replace('stddev_','');
			$.get(strURL)
				.fail(function(data) {
					getPresentHTTPError(data);
				});
		});

		$('.skvarpct').unbind().click(function() {
			$('.skvarpct').find('i').removeClass('fa fa-check');
			$(this).find('i:first').addClass('fa fa-check');
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();

			strURL = '?action=spikesave&setting=rvarpct&id='+$(this).attr('id').replace('varpct_','');
			$.get(strURL)
				.fail(function(data) {
					getPresentHTTPError(data);
				});
		});

		$('.skvarout').unbind().click(function() {
			$('.skvarout').find('i').removeClass('fa fa-check');
			$(this).find('i:first').addClass('fa fa-check');
			$(this).find('.spikekillMenu').menu('destroy').parent().remove();

			strURL = '?action=spikesave&setting=rvarout&id='+$(this).attr('id').replace('varout_','');
			$.get(strURL)
				.fail(function(data) {
					getPresentHTTPError(data);
				});
		});
	}
	</script>
	<?php
}

function html_common_header($title, $selectedTheme = '') {
	global $config;

	if ($selectedTheme == '') {
		$selectedTheme = get_selected_theme();
	}

	?>
	<meta http-equiv='X-UA-Compatible' content='IE=Edge,chrome=1'>
	<meta content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0' name='viewport'>
	<meta name='apple-mobile-web-app-capable' content='yes'>
	<meta name='mobile-web-app-capable' content='yes'>
	<meta name='robots' content='noindex,nofollow'>
	<title><?php echo $title; ?></title>
	<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>
	<script type='text/javascript'>var theme='<?php print $selectedTheme;?>';</script>
	<script src='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/alertifyJS/alertify.min.js'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	
	<link href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/images/telco_icon.ico' rel='shortcut icon'>
	<link href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/images/telco_logo2.png' rel='icon' sizes='96x96'>
	<link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/alertifyJS/css/alertify.min.css'/>
	<link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/alertifyJS/css/themes/semantic.min.css'/>
	<link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/bootstrap/dist/css/bootstrap.min.css'/>
	<!-- <link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/bootstrap/dist/js/bootstrap.min.js'/> -->
	
	<link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/bootstrap/dist/js/bootstrap.js'/>
	<link rel="stylesheet" href='<?php echo $config['url_path']; ?>include/themes/<?php print $selectedTheme;?>/bootstrap/dist/css/bootstrap.css'/>


	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<?php
	print get_md5_include_css('include/themes/' . $selectedTheme .'/jquery.zoom.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/jquery-ui.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/default/style.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/jquery.multiselect.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/jquery.timepicker.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/jquery.colorpicker.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/c3.css');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/pace.css');
	print get_md5_include_css('include/fa/css/font-awesome.css');
	print get_md5_include_css('include/fa5/css/all.css');
	print get_md5_include_css('include/fa5/js/all.js');
	print get_md5_include_css('include/themes/' . $selectedTheme .'/main.css');
	// print get_md5_include_css('include/themes/' . $selectedTheme .'/bootstrap.css');
	print get_md5_include_js('include/themes/' . $selectedTheme . '/bootstrap.js');
	print get_md5_include_js('include/themes/' . $selectedTheme . '/jquery-2.1.1.min.js');
	print get_md5_include_js('include/js/screenfull.js');
	print get_md5_include_js('include/js/jquery.js');
	print get_md5_include_js('include/js/jquery-migrate.js');
	print get_md5_include_js('include/js/jquery-ui.js');
	print get_md5_include_js('include/js/jquery.ui.touch.punch.js');
	print get_md5_include_js('include/js/jquery.cookie.js');
	print get_md5_include_js('include/js/js.storage.js');
	print get_md5_include_js('include/js/jstree.js');
	print get_md5_include_js('include/js/jquery.hotkeys.js');
	print get_md5_include_js('include/js/jquery.tablednd.js');
	print get_md5_include_js('include/js/jquery.zoom.js');
	print get_md5_include_js('include/js/jquery.multiselect.js');
	print get_md5_include_js('include/js/jquery.multiselect.filter.js');
	print get_md5_include_js('include/js/jquery.timepicker.js');
	print get_md5_include_js('include/js/jquery.colorpicker.js');
	print get_md5_include_js('include/js/jquery.tablesorter.js');
	print get_md5_include_js('include/js/jquery.tablesorter.widgets.js');
	print get_md5_include_js('include/js/jquery.tablesorter.pager.js');
	print get_md5_include_js('include/js/jquery.metadata.js');
	print get_md5_include_js('include/js/jquery.sparkline.js');
	print get_md5_include_js('include/js/Chart.js');
	print get_md5_include_js('include/js/dygraph-combined.js');
	print get_md5_include_js('include/js/d3.js');
	print get_md5_include_js('include/js/c3.js');
	print get_md5_include_js('include/js/pace.js');
	print get_md5_include_js('include/realtime.js');
	print get_md5_include_js('include/layout.js');
	print get_md5_include_js('include/themes/' . $selectedTheme .'/main.js');
	api_plugin_hook('page_head');
}

// contenido testbed ims
// 
function graficar_menu_vertical_testbed($pagina, $content_vertical){
	
	switch ($pagina) {
    case "info.php":
        $array_graficar = $content_vertical['info'];
        break;
    case "arquitectura.php":
        $array_graficar = $content_vertical['arquitectura'];
        break;
    case "pruebas.php":
        $array_graficar = $content_vertical['pruebas'];
        break;
    case 'admin_testbedims.php':
    	$array_graficar = $content_vertical['admin_testbedims'];
    	break;
	}
	
	?>

	<nav class="nav flex-column" style="position: fixed">
	<?php
		foreach ($array_graficar as $link) {
			?>	<li>
					<a class="nav-link mt-1 " href="#<?php echo $link['id'];?>"><i class="<?php echo $link['icon'];?>"></i>    <?php print_r($link['content']);?></a>
				</li>
			<?php
		}
	?>
    </nav>
    <?php 
}
function displayCardsArq( $userEmail, $userName ){
	$arq_testbed=db_arq_testbed();
	// print_r($arq_testbed);
	// print_r($user);
	?>
	<div class="card-columns">
	<?php 
	foreach ($arq_testbed as $item => $elements) {
		$restrictions=consult_restrictions($elements['dominio']);
		
		if( arquitectureUsed($elements['dominio']) == 1){
			//ocupada
			$days=db_fetch_cell_prepared("select value_info from data_testbedims where id_data='2'");
			$final_asign=db_fetch_cell_prepared("select fecha_fin_asignacion from solicitud_arq where dominio='".$elements['dominio']."' AND fecha_asignacion is not null ORDER BY id DESC LIMIT 1");
			$numberQueries=db_fetch_cell_prepared("select count(id) from solicitud_arq where dominio='".$elements['dominio']."' AND fecha_asignacion IS NULL ");
			
			$queryPendUser=db_fetch_cell("select id from solicitud_arq where dominio='".$elements['dominio']."' AND fecha_asignacion IS NULL AND email='".$userEmail."'");
			
			?>
			<div class="card center container">
					<div class="card-header bg-secondary text-white">
						<h5 class="card-title">Arquitectura <br><?php echo($elements['arquitectura']); ?> (<?php echo($elements['dominio']); ?>)</h5>
						<div class="row bg-light text-dark">
							<div class="col text-dark">
								<?php
												
								if( $queryPendUser == ''){
									$final_datetime=date('Y-m-d H:i:s',strtotime( $final_asign ." + " . $days * $numberQueries . " days"));
									print("Reservada hasta".$final_datetime);				
								}else{
									$numberQueries=db_fetch_cell_prepared("select count(id) from solicitud_arq where dominio='".$elements['dominio']."' AND fecha_asignacion IS NULL AND id<'".$queryPendUser."'");
									// $numberQueries=db_fetch_cell_prepared("select count(id) from solicitud_arq where dominio='".$elements['dominio']."' AND fecha_asignacion IS NULL AND email='".$userEmail."' AND id<'".$queryPendUser."'");
									// print_r($queryPendUser);
									$final_datetime=date('Y-m-d H:i:s',strtotime( $final_asign ." + " . $days * $numberQueries . " days"));
									print('Te será asignada el '.$final_datetime .' <a class="iconLink mrgt" href="#" role="link" title="Cancelar solicitud de reserva" onclick="cancel_query(`'.$queryPendUser.'`,`'.$userName.'`,`'.$userEmail.'`)"><i class="fa fa-trash " style="color: red"></i></a>');			
								}
								?>
			
				
							
								
							</div>
						</div>
					</div>
					<!-- <div class="row center"> -->
						<img src="images/images_testbed/images_ims/<?php echo($elements['imagen']) ?>" class="col-sm-6 mt-5" alt="Imagen arquitectura IMS">
					<!-- </div> -->
					
					<div class="card-body">
					
					<p class="card-text"><?php echo($elements['descripcion']); ?></p>
					</div>
					<div class="row text-left m-3" style="font-size: small">
					<?php 
						if($restrictions['vm'] == 1){
							echo "Se puede agregar una máquina virtual con";
						}else{
							echo "Se pueden agregar ".$restrictions['vm']." máquinas virtuales, cada una con máximo: ";
						}
						?>
						
						<?php echo($restrictions['ram']); ?> Mb de RAM, <?php echo($restrictions['disk']); ?> Gb de Almacenamiento y 
						<?php 
						if($restrictions['vcpu'] == 1){
							echo $restrictions['vcpu']." Núcleo de Procesamiento.<br>";
						}else{
							echo $restrictions['vcpu']." Núcleos de Procesamiento.<br>";
						}
						?>
						
					</div>
					<div class="card-footer">
						<div class="center">
						<?php 
						print('<button class="btn btn-success" onclick="queryArq(`'.$elements['dominio'].'`,`'.$userEmail.'`,`'.$userName.'`, `'.$elements["type_arq"].'`)"> <i class="fa fa-link text-white p-2 rounded"> | Agregar solicitud</i> </button>'); 
						// print('<button class="btn btn-success" onclick=solicituar_arquitectura("rubengutierrez@unicauca.edu.co","'.$user["email_address"].'","'.$user["username"].'","'.$elements["arquitectura"].'")> <i class="fa fa-link text-white p-2 rounded"> | Agregar solicitud</i> </button>'); 
						?>
						<!-- <input class="btn btn-success" type="button" value="Reservar" onclick=""> -->
						</div>
					</div>
				</div>
				

				<?php 
		}else{
				//libre
				?>
		
				<div class="card center container">
					<div class="card-header">
					<h5 class="card-title">Arquitectura <br><?php echo($elements['arquitectura']); ?>(<?php echo($elements['dominio']); ?>)</h5>
					</div>
					<!-- <div class="row center"> -->
						<img src="images/images_testbed/images_ims/<?php echo($elements['imagen']) ?>" class="col-sm-6 mt-5" alt="Imagen arquitectura IMS">
					<!-- </div> -->
					<div class="card-body">
					
					<p class="card-text"><?php echo($elements['descripcion']); ?></p>
					</div>
					<div class="row text-left m-3" style="font-size: small">
					<?php 
						if($restrictions['vm'] == 1){
							echo "Se puede agregar una máquina virtual con";
						}else{
							echo "Se pueden agregar ".$restrictions['vm']." máquinas virtuales, cada una con máximo: ";
						}
						?>
						
						<?php echo($restrictions['ram']); ?> Mb de RAM, <?php echo($restrictions['disk']); ?> Gb de Almacenamiento y 
						<?php 
						if($restrictions['vcpu'] == 1){
							echo $restrictions['vcpu']." Núcleo de Procesamiento.<br>";
						}else{
							echo $restrictions['vcpu']." Núcleos de Procesamiento.<br>";
						}
						?>
						
					</div>
					<div class="card-footer">
						<div class="center">
						<?php 
						print('<button class="btn btn-success" onclick="queryArq(`'.$elements['dominio'].'`,`'.$userEmail.'`,`'.$userName.'`, `'.$elements["type_arq"].'`)"> <i class="fa fa-link text-white p-2 rounded"> | Reservar </i> </button>'); 
						?>
						<!-- <input class="btn btn-success" type="button" value="Reservar" onclick=""> -->
						</div>
					</div>
				</div>
				

				<?php 
		}
	}
	?>
	</div>
	<?php
}

function draw_table_testbed_arquitectura($array_content){
	$menu_options = $array_content;
	$cont =0;
	$arq_testbed=db_arq_testbed();
	foreach ($arq_testbed as $item => $elements) {
		$cont = $cont +1;
		print "<tr class='display' name='".$elements['arquitectura']."' id='".$cont."' onclick='seleccionar(this);'>";		
			print "<td id='subtitle'>".$elements['arquitectura']."</td>";
			print "<td>".$elements['Max(descripcion)']."</td>";
			print "<td><img style='width: 500px; height: 300px;' src='images/images_testbed/images_ims/". $elements['Max(imagen)']."'</td>";
					
		print "</tr>"; 
	}	
	
}

function draw_table_domainsOfUser($emailUser){
	$cont =0;
	$arq_testbed=db_arq_byUser($emailUser);
	// print_r($emailUser);
	$images=images_openstack();
	if ( count($arq_testbed) > 0){
		print('<table class="table table-striped table_arq_byUser">
		<thead>
			<tr>
			<th scope="col">#</th>
			<th scope="col">Arquitectura</th>
			<th scope="col">Dominio</th>
			<th scope="col">Opciones</th>
			</tr>
		</thead>
		<tbody id="'.$emailUser.'">');
		foreach ($arq_testbed as $item => $elements) {
			$cont = $cont +1;
			print("
				<tr>
					<th scope='row'>".$cont."</th>
					<td>".$elements['arquitectura']."</td>
					<td>".$elements['dominio']."</td>
					<td> 
							<button class='btn' id='".$elements['dominio']."' onclick='showInfoDomain(".$elements['id'].", `true`)' > <i class='fas fa-project-diagram bg-primary text-white p-2 rounded'> | Core IMS</i> </button>
							<button class='btn' id='".$elements['dominio']."' onclick='showInfoDomain(".$elements['id'].", `false`)' > <i class='fa fa-laptop-medical bg-primary text-white p-2 rounded'> | VM Adicionales</i> </button>
							<button class='btn' id='".$elements['dominio']."' onclick='freeDomain(`".$elements['id']."`,`".$emailUser."`)' ><i class='fa fa-unlink bg-danger text-white p-2 rounded'> | Liberar</i> </button>
							<button class='btn test' id='".$elements['dominio']."' onclick=''><i class='fa fa-plus bg-warning text-white p-2 rounded'> Pruebas</i></button>
					</td>
				</tr>"
			);
			
		}	
		print("</tbody></table>");
	}else{
		print("<div class='row m-4'>No tiene arquitecturas reservadas</div>");
	}
}

function draw_table_domainsOfUser2($emailUser){
	$cont =0;
	$arq_testbed=db_arq_byUser($emailUser);
	// print_r($emailUser);
	$images=images_openstack();
	print('<div class="card-group">');
	if ( count($arq_testbed) > 0){
		foreach ($arq_testbed as $item => $elements) {
			$cont = $cont +1;
			print('
			
				<div class="card-group" >
					<div class="card text-white bg-dark m-3" style="max-width: 18rem;">
						<a href="arquitectura.php?arq='.$elements['id'].'" class="text-white">
							<div class="card-header"><h4>'.$elements['arquitectura'].'</h4></div>
							<div class="card-body">
								<h5 class="card-title">'.$elements['dominio'].'</h5>
								<p class="card-text">'.$elements['descripcion'].'</p>
								
							</div>
						</a>
						<div class="card card-footer">
							<button class="btn btn-warning" onclick="freeDomain(`'.$elements['id'].'`, `'.$emailUser.'`)">Liberar</button>
						</div>
					</div>
				</div>
			
			');
		}
	print('</div>');
	}else{
		header('Location: /telco/arquitectura.php?reserve=true');
		// print("<div class='row m-4'>No tiene arquitecturas reservadas</div>");
	}
	
}

function draw_table_nets_openstack(){
	$nets_openstack=db_fetch_assoc("SELECT * from network_openstack");
	// print_r($nets_openstack);
	foreach ($nets_openstack as $key => $line) {
		print"<tr id='".$line['id_net']."'>
		<td>".$line['id_net']."</td>
		<td>".$line['name_net']."</td>
		<td>".$line['description_net']."</td>
		<td>".$line['domain']."</td>
		<td>".$line['status']."</td></tr>";
		
	}
	
}
function draw_table_reports($countPage){
	echo '<div class="col-md">
	<!-- <button class="btn btn-primary" onclick="">test</button> -->
<table class="table table-striped table_arq_byUser">

<thead>
	<tr>
	<th scope="col">Usuario</th>
	<th scope="col">Acción</th>
	<th scope="col">Fecha</th>
	</tr>
</thead>
<tbody>';
	if ($countPage <= 1) {
		
		$actions=db_fetch_assoc("SELECT * from user_action limit 19");
		// print_r($actions);
		foreach ($actions as $key => $line) {
			$user=db_fetch_cell_prepared("SELECT email_address FROM user_auth WHERE id='".$line['id_user']."'");
			echo "<tr><td>".$user."</td><td>".$line['action']."</td><td>".$line['date']."</td></tr>";
	
		}
		$net=2;
		echo '	</tbody>
				</table>
			<div class="row" id="btnActionsPage">
				<button class="btn btn-primary" disabled>Anterior</button>
				<button class="btn btn-primary" onclick="pageActions(`'.$net.'`)">Siguiente</button>
			</div>';
	}else{
		$numActions=db_fetch_cell("SELECT count(id_action) from user_action");
		$pageMax=ceil($numActions/20);
		$idFirst=db_fetch_cell("SELECT id_action from user_action limit 1");
		if ($pageMax>=$countPage) {
			$limInf=$idFirst+(10*$countPage);
			$limSup=$idFirst+(10*$countPage)+(19);
			$actions=db_fetch_assoc("SELECT * from user_action where id_action between ".$limInf." AND ".$limSup."");
			// print_r($actions);
			foreach ($actions as $key => $line) {
				$user=db_fetch_cell_prepared("SELECT email_address FROM user_auth WHERE id='".$line['id_user']."'");
				echo "<tr><td>".$user."</td><td>".$line['action']."</td><td>".$line['date']."</td></tr>";
			}
			$proxPage=$countPage+1;
			$prevpage=$countPage-1;
			echo '	</tbody>
				</table>
			<div class="row" id="btnActionsPage">
				<button class="btn btn-primary" onclick="pageActions(`'.$prevpage.'`)">Anterior</button>
				<button class="btn btn-primary" onclick="pageActions(`'.$proxPage.'`)">Siguiente</button>
			</div>';
		}else{
			$limInf=$idFirst+(10 * $pageMax);
			$limSup=$idFirst+(10 * $pageMax)+(19);
			$actions=db_fetch_assoc("SELECT * from user_action where id_action between ".$limInf." AND ".$limSup."");
			// print_r($actions);
			foreach ($actions as $key => $line) {
				$user=db_fetch_cell_prepared("SELECT email_address FROM user_auth WHERE id='".$line['id_user']."'");
				echo "<tr><td>".$user."</td><td>".$line['action']."</td><td>".$line['date']."</td></tr>";
			}
			
			echo '	</tbody>
				</table>
			<div class="row" id="btnActionsPage">
				<button class="btn btn-primary" onclick="pageActions(`'.$pageMax.'`)">Anterior</button>
				<button class="btn btn-primary"  disabled>Siguiente</button>
			</div>';
		}
		
		
		
	}
	
}
function draw_table_flavors_openstack(){
	// consult_flavors_openstack();
	$flavors_openstack=db_fetch_assoc("SELECT * from flavor_openstack");
	// print_r($flavors_openstack);
	foreach ($flavors_openstack as $key => $line) {
		print"<tr id='".$line['id_flavor']."'>
		<td>".$line['id_flavor']."</td>
		<td>".$line['name_flavor']."</td>
		<td>".$line['ram']."</td>
		<td>".$line['disk']."</td>
		<td>".$line['vcpus']."</td>
		<td>".$line['public']."</td></tr>";
	}
}

function consult_flavors_openstack(){
	$flavors=shell_exec("./scripts/request_openstack.sh consult flavor");
	$flavorsJson = json_decode($flavors, true);
	db_execute("delete from flavor_openstack");
	foreach( $flavorsJson['flavors'] as $index=>$data){
		$id_flavor=$data['id'];
		$name_flavor=$data['name'];
		$ram_flavor=$data['ram'];
		$disk_flavor=$data['disk'];
		$vcpus_flavor=$data['vcpus'];
		$public_flavor=$data['os-flavor-access:is_public'];
		
		db_execute("INSERT INTO flavor_openstack(id_flavor, name_flavor, ram, disk, vcpus, public, id_instance) values ('$id_flavor','$name_flavor', '$ram_flavor', '$disk_flavor','$vcpus_flavor', '$public_flavor', '33')");
	}
}

function draw_table_images_openstack(){
	// consult_images_openstack();
	$images_openstack=db_fetch_assoc("SELECT * from image_openstack");
	// print_r($flavors_openstack);
	foreach ($images_openstack as $key => $line) {
		print"<tr id='".$line['id_flavor']."'>
		<td>".$line['id_image']."</td>
		<td>".$line['name_image']."</td>
		<td>".$line['status']."</td></tr>";
	}
}
function consult_images_openstack(){
	$images=shell_exec("./scripts/request_openstack.sh consult images");
	$imagesJson = json_decode($images, true);
	// print_r($imagesJson);
	db_execute("delete from image_openstack");
	foreach( $imagesJson['images'] as $index=>$data){
		$id_image=$data['id'];
		$name_image=$data['name'];
		$status=$data['status'];
		db_execute("INSERT INTO image_openstack(id_image, name_image, status) values ('$id_image','$name_image', '$status')");
	}
}

function draw_table_servers_openstack(){
	// consult_servers_openstack();
	$servers_openstack=db_fetch_assoc("SELECT * from server_openstack");
	// print_r($servers_openstack);
	foreach ($servers_openstack as $key => $line) {
		print"<tr id='".$line['id_server']."'>
		<td>".$line['id_server']."</td>
		<td>".$line['name_server']."</td>
		<td>".$line['id_image']."</td>
		<td>".$line['ip_local']."</td>
		<td>".$line['ip_public']."</td>
		<td>".$line['id_flavor']."</td>
		<td>".$line['key_name']."</td>
		<td>".$line['status']."</td>
		<td>".$line['name_security_group']."</td></tr>";
	}
}

function consult_servers_openstack(){
	$servers=shell_exec("./scripts/request_openstack.sh consult servers");
	$serversJson = json_decode($servers, true);
	// print_r($serversJson['servers']['0']);
	db_execute("delete from server_openstack");
	foreach( $serversJson['servers'] as $index=>$data){
		$id_server=$data['id'];
		$name_server=$data['name'];
	  $id_image=$data['image']['id'];
		
		$ip_local=$data['addresses'][key($data['addresses'])][0]['addr'];
		$ip_public=$data['addresses'][key($data['addresses'])][1]['addr'];
		$id_flavor=$data['flavor']['id'];
		$key_name=$data['key_name'];
		$status=$data['status'];
		$name_security_group=$data['security_groups']['0']['name'];
		db_execute("INSERT INTO server_openstack(id_server, name_server, id_image, ip_local, ip_public,id_flavor,key_name,status,name_security_group) values ('$id_server','$name_server', '$id_image', '$ip_local','$ip_public','$id_flavor', '$key_name', '$status','$name_security_group' )");
	}
}

function draw_table_subnets_openstack(){
	// consult_subnets_openstack();
	$subnets_openstack=db_fetch_assoc("SELECT * from subnet_openstack");
	//print_r($subnets_openstack['0']);
	foreach ($subnets_openstack as $line) {
		print"<tr id='".$line['id_sunbet']."'>
		<td>".$line['id_subnet']."</td>
		<td>".$line['name_subnet']."</td>
		<td>".$line['description_subnet']."</td>
		<td>".$line['id_net']."</td>
		<td>".$line['cidr']."</td>
		<td>".$line['gateway_ip_subnet']."</td></tr>";
	}
	// "description","network_id","gateway_ip","cidr","id","name"
	// [{"service_types":[],"description":"","enable_dhcp":true,"tags":[],"network_id":"02795444-2d61-407e-bb78-6b6a7aea61b8","tenant_id":"0cd526329d2544eeb839299287e5620c","created_at":"2019-06-27T22:38:03Z","dns_nameservers":[],"updated_at":"2019-06-27T22:38:03Z","ipv6_ra_mode":null,"allocation_pools":[{"start":"10.10.10.2","end":"10.10.10.254"}],"gateway_ip":"10.10.10.1","revision_number":0,"ipv6_address_mode":null,"ip_version":4,"host_routes":[],"cidr":"10.10.10.0/24","project_id":"0cd526329d2544eeb839299287e5620c","id":"45b19847-4889-46ba-ab8b-0b6665273c1f","subnetpool_id":null,"name":"test1"},{"service_types":[],"description":"shared-subnet","enable_dhcp":true,"tags":[],"network_id":"4c07b58e-d7c1-4dda-a6af-b797321b0244","tenant_id":"b7bccd2331a84914ac2a746fcd6c01c7","created_at":"2019-06-12T00:26:28Z","dns_nameservers":[],"updated_at":"2019-06-12T00:26:28Z","ipv6_ra_mode":null,"allocation_pools":[{"start":"192.168.233.2","end":"192.168.233.254"}],"gateway_ip":"192.168.233.1","revision_number":0,"ipv6_address_mode":null,"ip_version":4,"host_routes":[],"cidr":"192.168.233.0/24","project_id":"b7bccd2331a84914ac2a746fcd6c01c7","id":"4f4edde8-008a-4736-83d6-b74ec807fc5b","subnetpool_id":null,"name":"shared-subnet"}
}
function consult_subnets_openstack(){
	$subnets=shell_exec("./scripts/request_openstack.sh consult subnets");
	$subnetsJson = json_decode($subnets, true);
	//print_r($subnetsJson);
	db_execute("delete from subnet_openstack");
	foreach( $subnetsJson['subnets'] as $index=>$data){
		$id_subnet=$data['id'];
		$name_subnet=$data['name'];
	  $id_net=$data['network_id'];
		
		$description_subnet=$data['description'];
		$cidr_subnet=$data['cidr'];
		$gateway_ip_subnet=$data['gateway_ip'];
		db_execute("INSERT INTO subnet_openstack (id_subnet, name_subnet, description_subnet, id_net, cidr, gateway_ip_subnet) values ('$id_subnet','$name_subnet', '$description_subnet', '$id_net','$cidr_subnet','$gateway_ip_subnet')");
	}
}

function draw_table_ports_openstack(){
	// consult_ports_openstack();
	$ports_openstack=db_fetch_assoc("SELECT * from ports_openstack");
	//print_r($subnets_openstack['0']);
	foreach ($ports_openstack as $line) {
		print"<tr id='".$line['id_port']."'>
		<td>".$line['id_port']."</td>
		<td>".$line['fixed_ip']."</td>
		<td>".$line['id_subnet']."</td>
		<td>".$line['status_port']."</td></tr>";
	}
}
function consult_ports_openstack(){
	
	$ports=shell_exec("./scripts/request_openstack.sh consult ports");
	$portsJson = json_decode($ports, true);
	//print_r($portsJson);
	db_execute("delete from ports_openstack");
	foreach( $portsJson['ports'] as $index=>$data){
		$id_port=$data['id'];
		$id_subnet=$data['fixed_ips'][0]['subnet_id'];
		$ips=$data['fixed_ips'][0]['ip_address'];

		  $status_port=$data['status'];
		  
			db_execute("INSERT INTO ports_openstack (id_port, id_subnet, fixed_ip, status_port) values ('$id_port','$id_subnet','$ips', '$status_port')");
	}
}
function draw_table_flotantIp_openstack(){
	// consult_flotantIp_openstack();
	$flotantIp_openstack=db_fetch_assoc("SELECT * from flotantIp_openstack");
	//print_r($subnets_openstack['0']);
	foreach ($flotantIp_openstack as $line) {
		print"<tr id='".$line['id_floatingip']."'>
		<td>".$line['id_floatingip']."</td>
		<td>".$line['ip_float']."</td>
		<td>".$line['float_net']."</td>
		<td>".$line['ip_local']."</td>
		<td>".$line['id_port']."</td>
		<td>".$line['float_status']."</td></tr>";
	}
}
function consult_flotantIp_openstack(){
	
	$ports=shell_exec("./scripts/request_openstack.sh consult flotantIp");
	$flotantIpJson = json_decode($ports, true);
	//print_r($portsJson);
	db_execute("delete from flotantIp_openstack");
	foreach( $flotantIpJson['floatingips'] as $index=>$data){
		$id_floatingip=$data['id'];
		$float_net=$data['floating_network_id'];
		$ip_local=$data['fixed_ip_address'];
		$ip_float=$data['floating_ip_address'];
		$id_port=$data['port_id'];
		$float_status=$data['status'];
		db_execute("INSERT INTO flotantIp_openstack (id_floatingip, ip_float, float_net, ip_local, id_port, float_status) values ('$id_floatingip', '$ip_float', '$float_net', '$ip_local', '$id_port', '$float_status')");
	}
}



function draw_table_estate_arq(){
	$inf_arq=info_arquitecturas();
	// print_r($inf_arq);
	foreach ($inf_arq as $key => $line) {
		print"<tr id='line".$line['id']."'>
		<td>".$line['arquitectura']."</td>
		<td>".$line['dominio']."</td>
		<td class='edisplay'>".$line['descripcion']."</td>
		<td class='edisplay'>".$line['imagen']."</td>
		<td>".$line['usuario']."</td>
		<td><button class='btn_arq_action btn btn-outline-success btn-sm' id='btn_liberar".$line['id']."' name='liberar'> <i class='fa fa-unlink'> Liberar</i></button>
		<button class='btn_arq_action btn btn-outline-warning btn-sm' id='btn_editar".$line['id']."'name='editar' > <i class='fa fa-edit'>Editar</i></button>
		<button class='btn_arq_action btn btn-outline-danger btn-sm' id='btn_eliminar".$line['id']."' name='eliminar'> <i class='fa fa-trash'>Eliminar</i></button></td></tr>";
	}
}


function draw_table_testbed_pruebas($user,$idArq=0){
	if($idArq == 0){

		$dom_user=db_fetch_assoc("SELECT arquitectura, dominio, descripcion  from arqs_testbedims where usuario ='".$user."'");
	}else{
		$dom_user=db_fetch_assoc("SELECT arquitectura, dominio, descripcion  from arqs_testbedims where usuario ='".$user."' AND id='".$idArq."'");

	}
	// print_r($dom_user);
	if( empty($dom_user)){
		
		?>
							<div class="card m-2">
								<div class="card-header">
									Lo sentimos no tienes reservada una arquitectura.<br>
									<a href = "arquitectura.php">Solicitar arquitectura!</a>
								</div>
							
							</div>
							
						<?php
	}else{
	?>
				<div id="cardsTest"> <?php
		foreach ($dom_user as $key => $value) {
			?>
			<div class="row m-2">
				<!-- <div class="col"> -->
					<?php 
					$test_info=db_fetch_assoc("SELECT id_test, name_test, description_test, restriction , executing from test_testbedims where dominio ='".$value['dominio']."'");
					// print_r($test_info);
					if ( empty($test_info) ) {
						?>
							<div class="card m-2">
							<div class="card-header">
							Arquitectura: <?php echo $value['arquitectura']?>
							</div>
								<div class="card-body">
								<p class="card-text">No hay pruebas en esta arquitectura <br>
								con el dominio " <?php echo $value['dominio']?>"</p>
									
									

									
									
								</div>
								<div class="card-footer">
									<a href = "#form_1">Agregar pruebas por favor !</a>
								</div>
							</div>
							
						<?php
					}else{
						foreach ($test_info as $key2 => $value2) {
							if ( $value2['executing'] == '1') {
								?>
								<div class="card m-2">
									<div class="card-header bg-danger">
										<h5> <?php echo (ucwords ($value2['name_test']))?></h5> Ejecutando
									</div>
								<?php
							}else{
								?>
								<div class="card m-2">
									<div class="card-header">
										<h5> <?php echo (ucwords ($value2['name_test']))?></h5>
									</div>
								<?php
							}
							?>
							
								<div class="card-body">
									Arquitectura: <?php echo $value['arquitectura']?> <br>
									" <?php echo $value['dominio']?>"
									
									<p class="card-text"><?php echo $value2['description_test']?></p>
									
								</div>

							<?php
								if ( $value2['executing'] == '1') {
									?>
								<div class="card-footer">
									<button class="btn btn-outline-warning" id="<?php echo $value2['id_test']?>" onClick="stop_test(this.id)">Detener</button>
									<button class="btn btn-outline-danger" id="<?php echo $value2['id_test']?>" onClick="delete_test(this.id)">Eliminar</button>
									<!-- <button class="btn btn-primary m-2" id="<?php echo $value2['id_test']?>" onClick="$('#cardsTest').hide();display_table_test(this.id)">Opciones</button> -->
								</div>
							</div>
								<?php
								}else{
								?>
								<div class="card-footer">
									<button class="btn btn-outline-danger" id="<?php echo $value2['id_test']?>" onClick="">Eliminar</button>
									<button class="btn btn-primary m-2" id="<?php echo $value2['id_test']?>" onClick="$('#cardsTest').hide();display_table_test(this.id)">Opciones</button>
								</div>
							</div>
								<?php

								}
							}
						
					}
						?>
				<!-- </div> -->
				
			</div>
		<?php
		}
		?>
		</div>

		<div id="tableTest" style="display:none">
		<table class="table_estado_arq animated fadeIn fast">
		<tr>
			<th>Arquitectura</th>
			<th>Prueba</th>
			<th>Descripcion</th>
			<th>Ver Más...</th>
		</tr>  
		<?php 
		foreach ($dom_user as $key => $value) {
			$test_info=db_fetch_assoc("SELECT id_test, name_test, description_test, restriction from test_testbedims where dominio ='".$value['dominio']."'");
			// print_r($test_info);

			
			foreach ($test_info as $key2 => $value2) {
				print("<tr>
				<td> Arquitectura: ".$value['arquitectura']."<br> dominio:".$value['dominio']."</td>
				<td>".$value2['name_test']."</td>
				<td>".$value2['description_test']."\n Restricciones;\n".$value2['restriction']."</td>
				<td><button class='btn btn-outline-secondary' id='".$value2['id_test']."' onClick='display_table_test(this.id)'> <i class='fa fa-list-alt'> Opciones</i></button>
				<buton class='btn btn-outline-danger'><i class='fa fa-trash'> Eliminar</i></buton>
				</td>
				</tr>");
			}
			
		}
		?>
		</table>
	</div>
	<?php

	}
}


function guide_test($explain_test_bono, $index){
	// print_r($explain_test_bono[$index]);
	if( $index < 0 || $index > count($explain_test_bono)-1){
		return ;// cuando se retorna 1 el boton no realiza ninguna accion
	}
	?>
			<div class="header text-center">
				<button class="btn btn-outline-info" onclick="slidetest(<?php echo $index-1;?>,'test_bono')">Anterior</button>
				<button class="btn btn-outline-success" onclick="slidetest(<?php echo $index+1;?>,'test_bono')">Siguiente</button>
            </div>
			<div class="container p-1" id="page1">
				<div class="container animated fadeIn">
					<div class="row">
						<div class="col codexml bg-secondary p-2 m-2 ">
							<pre class="text-light" style="height:300px">
								<?php 
								foreach ($explain_test_bono[$index] as $code => $options){
									echo $code;?>
							</pre>
						</div>
						<div class="col explain p-2 m-2">
							<?php 
							
							foreach ($options as $key => $explain){
								if( $key == 'general'){
									echo "<div class='text-center'><b>".$explain."</b></div><br>";
								}else{
									echo $key.": "; echo $explain; echo "<br>";
								}
							}}
							?>
						</div>
					</div>
				</div>
			</div>
			<div class="footer text-center">
				<button class="btn btn-outline-info" onclick="slidetest(<?php echo $index-1;?>,'test_bono')">Anterior</button>	
				<button class="btn btn-outline-success" onclick="slidetest(<?php echo $index+1;?>,'test_bono')">Siguiente</button>
					
            </div>
	<?php
}

function guide_test_bono_all($explain_test_bono){

	foreach( $explain_test_bono as $element){
		foreach( $element as $code => $options){
	?>
	
			<div class="container p-1" id="page1">
				<div class="container">
					<div class="row">
						<div class="col codexml bg-secondary p-2 m-2">
							<pre class="text-light">
								<?php echo $code;?>
							</pre>
						</div>
						<div class="col explain p-2 m-2">
							<?php foreach ($options as $key => $explain){
								if( $key == 'general'){
									echo "<div class='text-center'><b>".$explain."</b></div><br>";
								}else{
									echo $key.": "; echo $explain; echo "<br>";
								}
							}?>
						</div>
					</div>
				</div>
			</div>
<?php
		}				
	}

}




function draw_table_testbed2($array_content){
	$menu_options = $array_content;	
	foreach ($menu_options as $item => $element) {
			print "<tr><td>".$item."</td></tr>";
			print "<tr><td>".$element."</td></tr>";

	}
	
}

function show_info_page(){

	//$title=db_fetch_assoc("select * from title_info_page t join content_info_page c ON t.id_title=c.id_title order by t.position, c.position");
	$title=db_fetch_assoc("select * from title_info_page order by id_title");
	//print_r($title);
	foreach ($title as $key => $value) {
		
		print"<div id='title_info_page'>";

			print"<div class='main_title' id='".$value['id_title']."'>";
			print "<h1>".$value['main_title']."</h1>";
				$content=db_fetch_assoc("select * from content_info_page where id_title='".$value['id_title']."' order by id_content");
				// print_r($content);
				foreach ($content as $key2 => $value2) {
					print("<div class='content' id='".$value2['id_content']."'>");
					if ($value2['type'] =='img') {
							print "<div class='center'><img width='30%' src='images/images_testbed/images_ims/images_info_page/".$value2['content']."'></div>";
						}elseif ($value2['type'] =='sub') {
							print "<h3>".$value2['content']."</h3>";
						}else{
							print $value2['content'];
						}
						
					print"</div>";
				}

				
			print"</div>";
		print"</div>";

	}

}

function admin_info_page(){
	 						
	$title=db_fetch_assoc("select * from title_info_page order by id_title");
	foreach ($title as $key => $value) {
		// print_r($title);
		print"<div class='margin_title_info_page' >";

			print"<div class='title_info_page bg-secondary text-white' id='".$value['id_title']."' >";
				print "<h1 id='".$value['id_title']."'>".$value['main_title']."</h1>";
				$content=db_fetch_assoc("select * from content_info_page where id_title='".$value['id_title']."' order by id_content");
				// print_r($content);
				if ( count($content)=='0') {
					$add_first=db_execute("insert into content_info_page (id_title, type, content) values ('".$value['id_title']."', 'text','Agregar contenido al titulo')");
					$id_first=db_fetch_cell("select id_content from content_info_page where id_title='".$value['id_title']."' order by id_content");
					print("<div class='content_info_page' id='".$id_first."'>");
					print "Agregar contenido al titulo";
					print"<div class='panel_btn_content' style='display: none;' >";
							print"<button class='btn_action_info btn btn-info ml-1' type='button' id='".$id_first."' name='add'>Agregar contenido</button>";
							print"<button class='btn_action_info btn btn-danger ml-1' type='button' id='".$id_first."' name='del'>Eliminar</button>";
							print"<button class='btn_action_info btn btn-warning ml-1' type='button' id='".$id_first."' name='edit'>Editar</button>";
							print"<button class='btn_action_info btn btn-success ml-1' type='button' id='".$id_first."' name='up'>Subir</button>";
							print"<button class='btn_action_info btn btn-success ml-1' type='button' id='".$id_first."' name='down'>Bajar</button>";
						print"</div>";
					print"</div>";
				}else{
					foreach ($content as $key2 => $value2) {
					print("<div class='content_info_page bg-light text-dark' id='".$value2['id_content']."'>");
					// print("<div class='content_info_page' id='".$value2['id_content']."'>");
						if ($value2['type'] =='img') {
							print "<img width='30%' src='images/images_testbed/images_ims/images_info_page/".$value2['content']."'>";
						}elseif ($value2['type'] =='sub') {
							print "<h3>".$value2['content']."</h3>";
						}else{
							print $value2['content'];
						}
						print"<div class='panel_btn_content' style='display: none;' >";
							print"<button class='btn_action_info btn btn-info ml-1 animated' type='button' id='".$value2['id_content']."' name='add'>Agregar contenido</button>";
							print"<button class='btn_action_info btn btn-danger ml-1 animated' type='button' id='".$value2['id_content']."' name='del'>Eliminar</button>";
							print"<button class='btn_action_info btn btn-warning ml-1 animated' type='button' id='".$value2['id_content']."' name='edit'>Editar</button>";
							print"<button class='btn_action_info btn btn-success ml-1 animated' type='button' id='".$value2['id_content']."' name='up'><i class='fa fa-angle-up'></i></button>";
							print"<button class='btn_action_info btn btn-success ml-1 animated' type='button' id='".$value2['id_content']."' name='down'><i class='fa fa-angle-down'></i></button>";
						print"</div>";
					print"</div>";				 							
				}
				}
				?> 

				<?php
				print"<div class='panel_btn_title' style='display: none;'>";
				print"<button class='btn_action_info btn btn-primary ml-2 animated' type='button' id='".$value['id_title']."' name='add'>Agregar titulo</button>";
				print"<button class='btn_action_info btn btn-danger ml-2 animated' type='button' id='".$value['id_title']."' name='del'>Eliminar</button>";
				print"<button class='btn_action_info btn btn-warning ml-2 animated' type='button' id='".$value['id_title']."' name='edit'>Editar</button>";
				print"<button class='btn_action_info btn btn-success ml-2 animated' type='button' id='".$value['id_title']."' name='up'><i class='fa fa-angle-up'></i></button>";
				print"<button class='btn_action_info btn btn-success ml-2 animated' type='button' id='".$value['id_title']."' name='down'><i class='fa fa-angle-down'></i></button>";
				print"</div>";
			print"</div>";
			
		print"</div>";
	
	}
	 						
	 						
}





function info_select_arq(){
	?>
	<form method="post" id="form_dom_info" class="form_arq">
						 <input type="hidden" value="9" name="action">
						 <label> Seleccione el dominio al cual se llenara la información</label>
						 <select name="dominio"  onchange="desplegar_info_arq(this.value)">
						 	<option value="">Seleccionar</option>
							<?php
									$dominios=db_fetch_assoc("select dominio from arqs_testbedims");

									foreach ($dominios as $key => $value) {
										print("<option value='".$value['dominio']."'>".$value['dominio']."</option>");
									}
							?>

						</select>
						</form>
						
						<form method="post" id="form_info_new_arq" class="form_arq">
	 						
	 						<input type="hidden" name="action" value='6' required>
							
	 						
							 <input type="hidden" name="dominio" value="" required>
							<label>Seleccione el tipo de arquitectura</label>
	 						<select type="select" name="type" placeholder='Tipo de arquitectura'>
	 						  <option value="aio">Todo en uno</option>
	 						  <option value="dist">Distribuida</option>
	 						  <option value="dist_pstn">Distribuida + PSTN</option>
	 						</select> 
	 						
	 						<label>Ingrese el número de la primer extención disponible en la arquitectura IMS</label>
	 						<input type="text" name="fist_number_ims" placeholder="Número entero" required>
	 						<label>Cantidad de extensiones disponibles en la arquitectura IMS </label>
	 						<input type="number" name="amount_extensions_ims" placeholder="Cantidad de extensiones IMS" required>
							
							<label>Direccón IP del nodo bono</label>
	 						<input type="text" name="host_bono" placeholder="xx.xx.xx.xx">

	 						<label>Direccón IP del nodo sprout</label>
	 						<input type="text" name="host_sprout" placeholder="xx.xx.xx.xx">
	 						<label>Direccón IP del nodo homer</label>
	 						<input type="text" name="host_homer" placeholder="xx.xx.xx.xx" required>
	 						<label>Direccón IP del nodo ellis</label>
	 						<input type="text" name="host_ellis" placeholder="xx.xx.xx.xx" >
	 						<label>Direccón IP del nodo vellum</label>
	 						<input type="text" name="host_vellum" placeholder="xx.xx.xx.xx" >
	 						<label>Direccón IP del nodo dime</label>
	 						<input type="text" name="host_dime" placeholder="xx.xx.xx.xx">
	 						<label>Direccón IP del nodo IBCF</label>
	 						<input type="text" name="host_ibcf" placeholder="xx.xx.xx.xx">
	 						<label>Direccón IP de la PSTN (Asterisk)</label>
	 						<input type="text" name="host_pstn" placeholder="xx.xx.xx.xx">
	 						<label>Primer extension en la PSTN(Asterisk)</label>
	 						<input type="text" name="fist_number_pstn" placeholder="Primer Numero de extension PSTN">
	 						<label>Número de extensiones en la PSTN(Asterisk)</label>
	 						<input type="number" name="amount_extensions_pstn" placeholder="Número entero">
	 						<div id="buttons_add">
	 						<input type="button" class="btn_form" id="btn_save_info" value="Guardar" onclick="inf_new_arq();">
	 						<input type="button" class="btn_form" value="Cancelar" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();$('.ajs-button.ajs-ok').trigger('click');">
	 						</div>
	 					</form>
	<?php 
}


function type_coreIMS(){
	?>

						
						<form method="post" id="form_info_new_arq" class="form_arq">
	 						
	 						<input type="hidden" name="action" value='6' required>
							
	 						<span for="dominio">Seleccione arquitectura</span>
							 <select name="dominio" class="mb-2">
								<option value="">Seleccionar</option>
								<?php
										$dominios=db_fetch_assoc("select dominio from arqs_testbedims");

										foreach ($dominios as $key => $value) {
											print("<option value='".$value['dominio']."'>".$value['dominio']."</option>");
										}
								?>

							</select>
							<span for="type">Asignar tipo de arquitectura</span>
	 						<select type="select" name="type" placeholder='Tipo de arquitectura' class="mb-2">
	 						  <option value="aio">Todo en uno</option>
	 						  <option value="dist">Distribuida</option>
	 						  <option value="dist_pstn">Distribuida + PSTN</option>
	 						</select> 
	 						<div id="buttons_add center">
								<input type="button" class="btn_form btn btn-outline-danger mb-3" value="Cancelar" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();$('.ajs-button.ajs-ok').trigger('click');">
	 							<input type="button" class="btn_form btn btn-primary mb-3 " id="btn_save_info" value="Guardar" onclick="create_core();">
	 						</div>
						 </form>
						 
	<?php 
}


function content_graph($user){
	
	?>

	<div class="container" id="status-loading"></div>
	<section class="section_add_monitoring">
	 <nav class="navbar navbar-light bg-dark row" onclick="show_hide_content_byClass('section_monitoring_vm', 'indicate_solicitedArquitecture')">
		 <a class="navbar-brand text-white"><b> Crear Gráfica </b></a><div class="float-right indicate_solicitedArquitecture"><i class="fa fa-eye-slash fa-2x bg-light rounded-circle"></i></div>
	 </nav>
	 
	  <div class="content_section"><p>En esta sección puedes agregar una gráfica de una VM</p></div> 

		<section id="table_arquitectura" class="section_monitoring_vm" >
			<div class="container">
				<form class="form-inline" id="new_graph">
					<div class="container text-center">
						<div class="row center" >
							<label class="my-1 mr-2" for="arq_new_graph">Seleccione la arquitectura que contiene la VM</label>
								
							<select name="dominio_test" id="domain_test" onchange="update_vm_arq(this.value)"> 
							<option value="">Seleccionar</option>
							<?php
								$dominios=db_fetch_assoc("select dominio from arqs_testbedims where usuario= '".$user['email_address']."'");
								foreach ($dominios as $key => $value) {
								print("<option value='".$value['dominio']."'>".$value['dominio']."</option>");
								}
							?>  
							</select> 
						</div>
						<div class="row center" >
							<label class="my-1 mr-2" for="id_Server">Seleccione la VM</label>
							<select class="custom-select my-1 mr-sm-2" name="id_server" id="vm_new_graph" onchange="listOptionsNewGraph(this.value)">
								<option value="">Elegir ...</option>
								
							</select>
						</div>


						<div class="row center" >
							<label class="my-1 mr-2" for="kindElement">Gráfica</label>
							<select class="custom-select my-1 mr-sm-2" name="templateGraph" id="templateGraph" >
								<option value="">Elegir Opcion</option>
							</select>
						</div>

						
						<div id="buttons_add center">
							<input type="button" class="btn_form btn btn-outline-danger mb-3" value="Cancelar" onclick="$('#content_infor_arq').hide();$('#btn_see_table4').show();$('#btn_notsee_table4').hide();$('.ajs-button.ajs-ok').trigger('click');"> 
							<input type="button" class="btn_form btn btn-primary mb-3 " id="btn_save_info" value="Crear" onclick="create_grafic()">
						</div>
					</div>
				</form>
			
			</div> 
		</section>


  </section>

	<?php
}