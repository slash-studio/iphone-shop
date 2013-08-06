<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	$active = 'collections';
	$smarty->assign('active', $active);
	$smarty->display('collections.tpl');
?>