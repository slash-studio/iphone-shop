<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/handlers/handler.Cart.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';

$isError = true;

if (isset($_GET['h']) && isset($_GET['m']) && isset($_GET['cn'])) {
   // echo 'is exist!';
   try {
      $data = $db->query('SELECT id FROM cart_order WHERE email = ?', Array($_GET['m']));  
   } catch (Exception $e) {
      $data = Array();
   }
   foreach ($data as $id) {
      if ($cart_Handler->get_hash($id['id'], $_GET['m']) == $_GET['h']) {
         // echo 'all good';
         $isError = false;
         break;
      }
   }
   if (!$isError) {
      $isError = $cart_Handler->Confirm($_GET['cn']);
      // $order_db
      //здесь нужно что-то сделать с заказом(отправить его или сохранить в базе для дальнейшего просмотра)
   }
} else {
   //если не существую переменных для потдтверждения, редиректим? куда?
   // header("Location:");
}

// $smarty->assign('active', 'cart')
//        ->assign('isError', $isError)
//        ->display('cart_confirm.tpl');
$smarty->display('cart_admin_email.tpl');
?>