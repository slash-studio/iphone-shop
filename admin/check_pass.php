<?php
	@session_start();
   $admin_login = isset($_SESSION['admin_login']) ? $_SESSION['admin_login'] : null;
   $admin_pass = isset($_SESSION['admin_pass']) ? $_SESSION['admin_pass'] : null;
	if (($admin_login != 'admin') || ($admin_pass != 'admin')) {
		die('НЕВЕРНЫЙ ЛОГИН И ПАРОЛЬ!!!!');
	}
?>