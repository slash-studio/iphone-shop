<?php
	@session_start();

	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php';
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php';

	if (!isSet($_SESSION['cart_info'])) {
		$_SESSION['cart_info'] = serialize(new Cart());
	}

	$smarty = new TSmarty();

   $smarty->assign('phone_number', PHONE_NUMBER);
	$smarty->force_compile = true;
?>