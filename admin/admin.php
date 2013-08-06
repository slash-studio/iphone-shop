<?php
	session_start();
	if (($_SESSION['admin_login'] != 'wais') || ($_SESSION['admin_pass'] != 'wais_pass107')) {
		if (($_POST['login'] != 'wais') || ($_POST['pass'] != 'wais_pass107')) {
			die('НЕВЕРНЫЙ ЛОГИН И ПАРОЛЬ!!!!');
		} else {
			$_SESSION['admin_login'] = 'wais';
			$_SESSION['admin_pass'] = 'wais_pass107';
		    header("Location: /admin/admin.php");
		}
	}
	
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	
	$goods = Good::get_all();
   
	$smarty->assign('goods', $goods);
	$smarty->display('admin.tpl');
?>