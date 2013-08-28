<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php');
	
	if (($_SESSION['admin_login'] != 'admin') || ($_SESSION['admin_pass'] != 'admin')) {
		if (($_POST['login'] != 'admin') || ($_POST['pass'] != 'admin')) {
			die('НЕВЕРНЫЙ ЛОГИН И ПАРОЛЬ!!!!');
		} else {
			$_SESSION['admin_login'] = 'admin';
			$_SESSION['admin_pass'] = 'admin';
		   header("Location: /admin/admin.php");
		}
	}
	
	$goods = Good::get_all();
    $smarty->assign('categories', Category::Get_all());
	$smarty->assign('goods', $goods);
	$smarty->display('admin.tpl');
?>