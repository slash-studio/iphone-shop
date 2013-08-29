<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Field.php';

define('ERROR_QUERY', 'В данный момент невозможно подключение к базе данных.');

class DBConnect
{
   public $link;
   public $isConnected = true;
   
   public function DBConnect($db_dsn, $db_user, $db_pass)
   {
      try {
         $this->link = new PDO($db_dsn, $db_user, $db_pass);
         $this->link->exec("SET CHARACTER SET utf8");
      } catch (PDOException $e) {
         $this->isConnected = false;
         // die('Подключение не удалось: ' . $e->getMessage());
      }
   }

   public function exec($query, $params = array())
   {
      if (!$this->isConnected) return;
      $f = $this->query($query, $params);
   }

   public function query($query, $params = array())
   {
      if (!$this->isConnected) return Array();
      $st = $this->link->prepare($query);
      if (!$st->execute($params)) {
         throw new Exception(ERROR_QUERY);
      }
      return $st->fetchAll(PDO::FETCH_ASSOC);
   }

   public function Insert($table_name, $arr) //первый параметр название таблицы
   {
      if (!$this->isConnected) return -1;
      $values = array_values($arr);
      $query = "INSERT INTO " . $table_name . " (" . join(',', array_keys($arr)) . ") VALUES (" . str_repeat('?,', count($values) - 1) . "?)";
      $this->exec($query, $values);
      return $this->link->lastInsertId();
   }

   public function Insert_from_fields($table_name, $fields)
   {
      if (!$this->isConnected) return -1;
      $res = array();
      foreach ($fields as $field) {
         $field->validate();
         $res[$field->table_name] = $field->val;
      }
      return $this->Insert($table_name, $res);
   }

   public function Select_from_ID($table_name, $id)
   {
      if (!$this->isConnected) return Array();
      $query = "SELECT * FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
      $arr = $this->query($query, array($id));
      return $arr[0];
   }

   public function Update($table_name, $id, $arr)
   {
      if (!$this->isConnected) return;
      $set = array();
      foreach ($arr as $key => $val) {
         $set[] = $key . '=?';
      }
      $query = "UPDATE " . $table_name . " SET " . join(', ', $set) . " WHERE " . $table_name . ".id = ?";
      $this->exec($query, array_merge(array_values($arr), array($id))); //послдений ? - id
   }

   public function Update_from_fields($table_name, $id, $fields)
   {
      if (!$this->isConnected) return;
      $res = array();
      foreach ($fields as $field) {
         $field->validate();
         $res[$field->table_name] = $field->val;
      }
      $this->Update($table_name, $id, $res);
   }

   public function Delete($table_name, $id)
   {
      if (!$this->isConnected) return;
      $query = "DELETE FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
      $this->exec($query, array($id));
   }

   public function last_insert_id()
   {
      return $this->link->lastInsertId();
   }

}

$db = new DBConnect(DB_dsn, DB_user, DB_pass);

?>