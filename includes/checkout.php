<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
   
   $cart = unserialize($_SESSION['cart_info']);
   if (!$cart->goods_total) header("Location: /cart");

   $delivery_types = $db->query('SELECT id, name FROM delivery_type');
   $smarty->assign('delivery_types', $delivery_types)
          ->display('checkout.tpl');
?>