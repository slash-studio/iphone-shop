<?php 
	session_start();
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
	
	class Cart_Handler
	{
		public $cart;
		
		public function __construct()
		{
			$this->cart = unserialize($_SESSION['cart_info']);
		}
		
		public function Clear()
		{
			$this->cart->Clear();
		}
		
		public function Add()
		{
			$this->cart->Add($_POST['g_id'], $_POST['g_params']);
			$this->cart->Update();
			echo 'Item was added to cart';
		}
		
		public function Remove_good()
		{
			
			$this->cart->Remove_good($_POST['c_id']);
			$this->cart->Update();
		}
		
		public function Update_count()
		{
			$this->cart->Update_count($_POST['c_id'], $_POST['g_count']);
			$this->cart->Update();
		}
	}
	
	$cart_Handler = new Cart_Handler();
	$cart_Handler->$_POST['mode']();
	$_SESSION['cart_info'] = serialize($cart_Handler->cart);
?>