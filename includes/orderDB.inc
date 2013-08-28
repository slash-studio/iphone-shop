<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';

   class orderDB
   {
      public $id;

      public $name;
      public $phone;
      public $email;
      public $address;
      public $delivery;

      public $isExist = false;

      public static function find_by_email($email)
      {
         global $db;
         $data = $db->query('SELECT id FROM cart_order WHERE email = ?', array($email));
         return new orderDB(!empty($data) ? $email : null);
      }

      public static function find_by_id($id)
      {
         global $db;
         $data = $db->query('SELECT email FROM cart_order WHERE id = ?', array($id));
         return new orderDB(!empty($data) ? $data[0]['email'] : null);
      }

      function __construct($email = false)
      {
         if (!$email) return;
         global $db;
         $query = 'SELECT id, name, phone, email, delivery, address FROM cart_order WHERE email = ?';
         $data = $db->query($query, array($email));
         $this->email = $email;
         $this->isExist = !empty($data);
         if (!$this->isExist) return;
         foreach ($data[0] as $attr => $value) {
            $this->$attr = $value;
         }
      }

      public function update()
      {
         global $db;
         $query = 'UPDATE cart_order SET name=?, phone=?, email=?, delivery=?, address=? WHERE id = ?';
         $new_values = array($this->name, $this->phone, $this->email, $this->delivery, $this->address, $this->id);
         $db->query($query, $new_values, false);
      }

      public function insert()
      {
         global $db;
         $query = 'INSERT INTO cart_order(name, phone, email, delivery, address) VALUES(?, ?, ?, ?, ?)';
         $values = Array($this->name, $this->phone, $this->email, $this->delivery, $this->address);
         $db->query($query, $values, false);
      }

      public function insert_with_last_id()
      {
         global $db;
         $last_id = -1;
         try {
            $db->link->beginTransaction();
            $st = $db->link->prepare('INSERT INTO cart_order(name, phone, email, delivery, address) VALUES(?, ?, ?, ?, ?)');
            $st->execute(Array($this->name, $this->phone, $this->email, $this->delivery, $this->address));
            $last_id = $db->link->lastInsertId();
            $db->link->commit();
         } catch (Exception $e) {
            $db->link->rollBack();
         }
         return $last_id;
      }

      public function delete()
      {
         global $db;
         $query = 'DELETE FROM cart_order WHERE id = ?';
         $data = $db->query($query, array($this->id));
      }

   }

?>