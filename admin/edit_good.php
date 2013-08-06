<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	$good = new Good();
	if ($_GET['id']) {
		$good->Select_from_id($_GET['id']);
		$smarty->assign('mode', 'edit');
	} else {
		$smarty->assign('mode', 'add');
	}
	$good = $good->Get_array();
	$good['sizes'] = Good::Sizes_hash($good['sizes']);
	$smarty->assign('good', $good);
	$smarty->display('admin.edit_good.tpl');
?>