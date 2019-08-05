<?php
$resp_tree=shell_exec('php -q cli/add_tree.php --type=tree --name="tree_fail9" --sort-method=manual');
$array_tree=explode ( ' ' , $resp_tree );
$array_tree = preg_replace('/\([^)]\)|[()]/', '', $array_tree[4]);
echo($arra_tree);
?>

