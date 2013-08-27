<?php
   require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	$images = Images::Select($_GET['id']);
	$smarty->assign('images', $images);
	$smarty->assign('good_id', $_GET['id']);
	$smarty->display('admin.edit_images.tpl');
?>