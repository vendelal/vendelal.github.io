<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'visitdays');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '~~DMa#9OC}%b#f^|)q :twAsE9Ds<6RN4%>{X*!wP@IJUEDPD 37`e)N?tWz/Gz7');
define('SECURE_AUTH_KEY',  '&!-aw|;z)ZJy@j%g3s}`CzZhuvJE~T>@oZCSgR=|Qi[@?*Q*z>!/lQG=q#m$#|]:');
define('LOGGED_IN_KEY',    'D$`QgT+V|faO&_BS#Qq.m7b!<;Imqm.,Ng/5FI|@vU;C4/lp_$FqO>3,ejJ0>NYT');
define('NONCE_KEY',        '8iLEY#,z!ca#z.j5M.AJ4=X?j^bhTB]0*wA^<3,]A84|fxvX;DyG<o;@9N:k5gMc');
define('AUTH_SALT',        '[t.QHx;TJj #r1`L,/okE!X&5f-+l1 y>}kZ3+N^;b[O}*Z!6U2[/2IP_l ioEnk');
define('SECURE_AUTH_SALT', '_~]kn3A0cFqm1Xra]f^(PcKN(.n>}ZDToaq>]2l#i ZW`iYF!A^g*f UmU9[xbc@');
define('LOGGED_IN_SALT',   'O[!Z.PaHNVV]^S:dMHJ13Pw^D<ikzj=lQdX5I2q~.VW$`x(d.{Ww,:<a?JQ8h]!X');
define('NONCE_SALT',       '_+eX9[9=ype/D!kuy|ZL?% X<O(4z_!%Qm*>YzQW`K0bUB9dejjU4(r~)GBJ5Ty+');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
