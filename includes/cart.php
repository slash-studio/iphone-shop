<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
	
	$cart = unserialize($_SESSION['cart_info']);
	
	$active = 'cart';
	$smarty->assign('active', $active)
			 ->assign('total', $cart->goods_total)
			 ->assign('cart', $cart->Get_array())
			 ->display('cart.tpl');
?>