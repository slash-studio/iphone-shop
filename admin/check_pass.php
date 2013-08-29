<?php
	@session_start();
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php';
   
   $admin_login = isset($_SESSION['admin_login']) ? $_SESSION['admin_login'] : null;
   $admin_pass = isset($_SESSION['admin_pass']) ? $_SESSION['admin_pass'] : null;
	if (($admin_login != ADMIN_LOGIN) || ($admin_pass != ADMIN_PASS)) {
		header("Location: /admin");
	}
?>