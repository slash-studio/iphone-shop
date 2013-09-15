<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';

$smarty->assign('active', 'contacts')
       ->display('contacts.tpl');
?>