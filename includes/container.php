<?php
	@session_start();

	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php';
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/smarty/libs/Smarty.class.php';
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';

	if (!isSet($_SESSION['cart_info'])) {
		$_SESSION['cart_info'] = serialize(new Cart());
	}

	$smarty = new TSmarty();

	$smarty->force_compile = true;
?>