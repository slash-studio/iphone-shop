<?php 
   @session_start();

   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/orderDB.inc';
   
   class Cart_Handler
   {
      public $cart;
      
      public function __construct()
      {
         $this->cart = unserialize($_SESSION['cart_info']);
      }

      public function get_hash($id, $email)
      {
         return md5(md5($id).$email);
      }
      
      public function Clear()
      {
         $this->cart->Clear();
      }
      
      public function Add()
      {
         $this->cart->Add($_POST['g_id']);
         $this->cart->Update();
         echo 'Item was added to cart';
      }

      public function Checkout()
      {
         // $_POST['name'] = 'Chuck Noris';
         // $_POST['phone'] = '2123321';
         // $_POST['email'] = 'some@exmaple.com';
         // $_POST['address'] = 'Vladivostok, Russia';
         // $_POST['delivery'] = true;

         $mail = new Mail();
         $order_db = new OrderDB();
         $order_db->name          = $_POST['name'];
         $order_db->phone         = $_POST['phone'];
         $order_db->email         = $_POST['email'];
         $order_db->address       = $_POST['address'];
         $order_db->delivery      = $_POST['delivery'];
         $order_db->delivery_type = $_POST['delivery_type'];
         $last_id = $order_db->insert_with_last_id();

         global $smarty;
         $smarty->assign('host', $mail->site)
                ->assign('hash', $this->get_hash($last_id, $_POST['email']))
                ->assign('email', $_POST['email'])
                ->assign('total', $this->cart->goods_total)
                ->assign('cart', $this->cart->Get_array());
         $mail->send_mail($_POST['email'], 
                          'Подтверждение заказа на iGleb!!!!',
                          $smarty->fetch('cart_email.tpl'),
                          'director@igleb.com',
                          'от Глебаса');
         $this->Clear();
         echo 'Заказ принят!';
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
   if (!empty($_POST['mode'])) {
      $cart_Handler->$_POST['mode']();
      $_SESSION['cart_info'] = serialize($cart_Handler->cart);
   }
?>