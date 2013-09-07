<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	$active = 'delivery';
	$smarty->assign('active', $active);
	$smarty->display('delivery.tpl');
?>