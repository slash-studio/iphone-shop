<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	$active = 'contacts';
	$smarty->assign('active', $active);
	$smarty->display('contacts.tpl');
?>