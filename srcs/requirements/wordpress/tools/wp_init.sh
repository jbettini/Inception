#!bin/sh
if [ ! -f "/var/www/wp-config.php" ]; then
cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASS}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
define( 'WP_MEMORY_LIMIT', '256M' );
error_reporting(E_ALL); ini_set('display_errors', 1);
#define( 'WP_DEBUG', true );
#define('WP_DEBUG_LOG', true);
#define('WP_DEBUG_DISPLAY', true);
\$table_prefix = 'wp_';
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
EOF
fi
