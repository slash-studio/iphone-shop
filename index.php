<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
	
	$goods = Good::get_all_displayed();
	
	$smarty->assign('goods', $goods);
	$smarty->assign('goods_count', count($goods));
	
	$active = 'shop';
	$smarty->assign('active', $active);
	
	$smarty->display('index.tpl');
?>