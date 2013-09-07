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
      public $delivery_type_id;

      public $isExist = false;

      public static function find_by_id($id)
      {
         global $db;
         $data = $db->query('SELECT email FROM cart_order WHERE id = ?', array($id));
         return new orderDB(!empty($data) ? $id : null);
      }

      function __construct($id = false)
      {
         if (!$id) return;
         global $db;
         $query = 'SELECT id, name, phone, email, delivery, delivery_type_id, address FROM cart_order WHERE id = ?';
         $data = $db->query($query, array($id));
         $this->id = $id;
         $this->isExist = !empty($data);
         if (!$this->isExist) return;
         foreach ($data[0] as $attr => $value) {
            $this->$attr = $value;
         }
      }

      public function update()
      {
         global $db;
         $query = 'UPDATE cart_order SET name=?, phone=?, email=?, delivery=?, delivery_type_id=?, address=? WHERE id = ?';
         $new_values = array($this->name, $this->phone, $this->email, $this->delivery, $this->delivery_type_id, $this->address, $this->id);
         $db->query($query, $new_values, false);
      }

      public function insert()
      {
         global $db;
         $query = 'INSERT INTO cart_order(name, phone, email, delivery, delivery_type_id, address) VALUES(?, ?, ?, ?, ?, ?)';
         $values = Array($this->name, $this->phone, $this->email, $this->delivery, $this->delivery_type_id, $this->address);
         $db->query($query, $values, false);
      }

      public function insert_with_last_id($goods)
      {
         global $db;
         $last_id = -1;
         if (empty($goods)) return $last_id;
         try {
            $db->link->beginTransaction();
            $st = $db->link->prepare('INSERT INTO cart_order(name, phone, email, delivery, delivery_type_id, address) VALUES(?, ?, ?, ?, ?, ?)');
            $st->execute(Array($this->name, $this->phone, $this->email, $this->delivery, $this->delivery_type_id, $this->address));
            $last_id = $db->link->lastInsertId();
            $st = $db->link->prepare('INSERT INTO cart_order_goods(order_id, good_id, amount) VALUES(?, ?, ?)');
            foreach ($goods as $good) {
               $st->execute(Array($last_id, $good['id'], $good['count']));
            }
            $db->link->commit();
         } catch (Exception $e) {
            $db->link->rollBack();
         }
         return $last_id;
      }

      public function get_order_goods()
      {
         if (!$this->isExist) return Array();
         global $db;
         try {
            $query = 'SELECT g.name, g.price, og.amount FROM goods g INNER JOIN cart_order_goods og ' . 
                     'ON og.good_id = g.id AND og.order_id = ?';
            $result = $db->query($query, Array($this->id));  
         } catch (Exception $e) {
            $result = Array();
         }
         return $result;
      }

      public function delete()
      {
         global $db;
         $query = 'DELETE FROM cart_order WHERE id = ?';
         $data = $db->query($query, array($this->id));
      }

   }

?>