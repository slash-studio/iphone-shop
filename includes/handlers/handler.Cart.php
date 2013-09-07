<?php 
   @session_start();

   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Cart.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Mail.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/orderDB.inc';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Validate.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php';
   
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
         // $_POST['delivery_type_id'] = null;

         $result = Array('result' => true, 'message' => 'Заказ принят!');

         try {
            if (!Validate::is_Email($_POST['email'])) {
               throw new Exception("Указан неверный email!");
            }
            if (!Validate::is_Phone($_POST['phone'])) {
               throw new Exception("Указан неверный номер телефона!");
            }
            $_POST['delivery_type_id'] = !empty($_POST['delivery_type_id']) ? $_POST['delivery_type_id'] : null;
            $mail = new Mail();
            $order_db = new OrderDB();
            $order_db->name             = $_POST['name'];
            $order_db->phone            = $_POST['phone'];
            $order_db->email            = $_POST['email'];
            $order_db->address          = $_POST['address'];
            $order_db->delivery         = $_POST['delivery'];
            $order_db->delivery_type_id = $_POST['delivery_type_id'];
            $last_id = $order_db->insert_with_last_id($this->cart->Get_array());

            global $smarty;
            $smarty->assign('host', $mail->site)
                   ->assign('hash', $this->get_hash($last_id, $_POST['email']))
                   ->assign('email', $_POST['email'])
                   ->assign('cart_num', $last_id)
                   ->assign('total', $this->cart->goods_total)
                   ->assign('cart', $this->cart->Get_array());
            $mail->send_mail($_POST['email'], 
                             SUBJECT_CART_CONFIRM,
                             $smarty->fetch('cart_confirm_email.tpl'),
                             FROM_EMAIL_CART_CONFIRM,
                             FROM_NAME_CART_CONFIRM);
            $this->Clear();
         } catch (Exception $e) {
            $result['result'] = false;
            $result['message'] = $e->getMessage();
            echo $e->getMessage();
         }

         echo json_encode($result);
      }

      public function Confirm($cart_num)
      {
         $mail = new Mail();
         $order_db = OrderDB::find_by_id($cart_num);
         if (!$order_db->isExist) return false;
         global $db;
         global $smarty;
         $delivery_name = null;
         if ($order_db->delivery) {
            $data = $db->query('SELECT name FROM delivery_type WHERE id = ?', Array($order_db->delivery_type_id));
            $delivery_name = !empty($data) ? $data[0]['name'] : 'Не указано';
         }
         $smarty->assign('host', $mail->site)
                ->assign('goods', $order_db->get_order_goods())
                ->assign('delivery_name', $delivery_name)
                ->assign('user_name', $order_db->name)
                ->assign('user_phone', $order_db->phone)
                ->assign('user_email', $order_db->email)
                ->assign('user_address', $order_db->address)
                ->assign('user_delivery', $order_db->delivery);
         
         $mail->send_mail(TO_EMAIL_ORDER_ADMIN, 
                          SUBJECT_ORDER_ADMIN,
                          $smarty->fetch('cart_admin_email.tpl'),
                          FROM_EMAIL_ORDER_ADMIN,
                          FROM_NAME_ORDER_ADMIN);
         $order_db->delete();
         return true;
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