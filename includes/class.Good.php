<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Entity.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php';

class Good extends Entity
{
   const TABLE = 'goods';

   public function __construct()
   {
      $this->fields = array(
            'g_name' => new Field('name', '', array('is_Set')),
            'g_description' => new Field('description', ''),
            'g_keywords' => new Field('keywords', ''),
            'g_category_id' => new Field('category_id', 1, array('is_Set')),
            'g_old_price' => new Field('old_price', 0, array('is_Set')),
            'g_price' => new Field('price', 0, array('is_Set')),
			   'g_main_display' => new Field('main_display', 0),
            'g_display' => new Field('display', 1)
      );
   }

   public static function get_all_with_where($where = '', $order_by = '', $params = Array())
   {
      try {
         global $db;
         $query = 'SELECT * FROM ' . self::TABLE . ' t ' . $where . (empty($order_by) ? ' ORDER BY t.id DESC' : $order_by);
         $goods = $db->query($query, $params);
         foreach ($goods as $key => $good) {
            $goods[$key]['image'] = Images::Get_first_image_id($goods[$key]['id']);
         }
      } catch (Exception $e) {
         $goods = Array();
      }
      return $goods;
   } 

   public static function Get_all()
   {
      return Good::get_all_with_where();
   } 

   public static function Get_all_displayed()
   {
      return Good::get_all_with_where('WHERE t.display = 1');
   }

   public static function Get_all_main_displayed($value='')
   {
      return Good::get_all_with_where('WHERE t.display = 1 AND t.main_display = 1');
   } 

   public static function Get_from_id($id)
   {
      $result = Array();
      try {
         global $db;
         $query = 'SELECT * FROM ' . self::TABLE . ' t WHERE t.id = ?';
         $res = $db->query($query, array($id));
         if (!empty($res)) {
            $res[0]['image'] = Images::Get_first_image_id($res[0]['id']);
            $result = $res[0];
         }
      } catch (Exception $e) {
         //
      }
      return $result;
   }

   public function Delete() 
   {
      parent::Delete();
      Images::Delete_all_of_good($this->id);
   }

}

?>