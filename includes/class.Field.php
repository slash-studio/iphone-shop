<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Validate.php';

class Field
{
   public $table_name;
   public $validate = array();
   public $default_val;
   public $val;

   public function __construct($table_name, $default_val, $validate = array())
   {
      $this->table_name = $table_name;
      $this->default_val = $default_val;
      $this->val = $default_val;
      $this->validate = $validate;
   }

   public function validate()
   {
      foreach ($this->validate as $sign) {
         Validate::$sign($this->val);
      }
   }
}

?>