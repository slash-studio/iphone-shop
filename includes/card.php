<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
	
	$good = Good::Get_from_id($_GET['id']);
	$good['sizes'] = Good::Sizes_array($good['sizes']);
	$smarty->assign('good', $good);
	$images = Images::Select($_GET['id']);
	array_shift($images);
	$smarty->assign('images', $images);
	$smarty->display('card.tpl');
?>