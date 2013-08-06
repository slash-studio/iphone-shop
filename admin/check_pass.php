<?php
	session_start();
	if (($_SESSION['admin_login'] != 'wais') || ($_SESSION['admin_pass'] != 'wais_pass107')) {
		die('НЕВЕРНЫЙ ЛОГИН И ПАРОЛЬ!!!!');
	}
?>