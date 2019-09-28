#!/usr/bin/php -q
<?php
/*
 +-------------------------------------------------------------------------+
 | ruben                                                                   |
 +-------------------------------------------------------------------------+
 | Scrip para crear usuarios                                               |
 | datos de entrada usename correo password                                |
 +-------------------------------------------------------------------------+
*/

/* do NOT run this script through a web browser */
if (!isset($_SERVER['argv'][0]) || isset($_SERVER['REQUEST_METHOD'])  || isset($_SERVER['REMOTE_ADDR'])) {
	die('<br><strong>This script is only meant to run at the command line.</strong>');
}

$no_http_headers = true;

include(dirname(__FILE__) . '/../include/global.php');
include_once($config['base_path'] . '/lib/auth.php');

if (empty($_SERVER['argv'][1]) ){
	display_help();
	exit;
} else {
	switch($_SERVER['argv'][1]) {
		case '--help':
		case '-H':
		case '-h':
			display_help();
			exit;
		case '--version':
		case '-V':
		case '-v':
			display_version();
			exit;
	}
}


$new_user           = $_SERVER['argv'][1];
$new_user_email     = $_SERVER['argv'][2];
$pass               = $_SERVER['argv'][3];


print 'New User:      ' . $new_user . "\n";
print 'New User:      ' . $new_user_email . "\n";
print 'New pass:      ' . $pass . "\n";

/* Check that user exists */
$user_auth = db_fetch_row("SELECT * FROM user_auth WHERE username = 'telco' AND realm = 0");
if (! isset($user_auth)) {
	die("Error: Template user does not exist!\n\n");
}

print "\nAdd User...\n";
$pass2 = compat_password_hash($pass, PASSWORD_DEFAULT);
if (user_add( $new_user, $new_user_email, $pass2) === false) {
	die("Error: User not copied!\n\n");
}

$user_auth = db_fetch_row("SELECT * FROM user_auth WHERE username = '" . $new_user . "' AND realm = 0");
if (! isset($user_auth)) {
	die("Error: User not copied!\n\n");
}

print "User Added...\n";

