<?php
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');


class Search 
{
   
   public static function get_by_category($category_id)
   {
      global $db;
      $goods = Array();
      $new_arr = Good::get_all_with_where(" WHERE t.category_id = $category_id");
      foreach ($new_arr as $arr) {
         $goods[] = $arr;
      }
      $result = $db->query('SELECT id FROM subcategory WHERE parent_id=?', Array($category_id));
      if (empty($result)) return $goods;
      
      foreach ($result as $num => $id) {
         if ($id['id'] == $category_id) continue;
         $new_arr = self::get_by_category($id['id']);
         foreach ($new_arr as $arr) {
            $goods[] = $arr;
         }
      }
      return $goods;
   }

   public static function clean_post_data($data)
   {
      $data = strip_tags($data);
      $data = strtolower($data);
      $data = preg_replace('~[^a-z0-9 \x80-\xFF]~i', "",$data); 
      return $data;
   }


   public static function clean_array_to_search($words = array(), $max = 0, $min_length)
   {
      $result = array();
      $i = 0;
      foreach($words as $key => $value) {
         if(strlen(trim($value)) >= $min_length) {
            $i++;
            if($i <= $max) {
               $result[] = trim($value);
            }
         }
      }
      return $result;
   }

   public static function get_goods_result($words)
   {
      $sql = 'WHERE ';
      $i = 0;
      $params = Array();
      foreach($words as $key => $value) {
         $i++;
         for ($j = 0; $j < 3; $j++) {
            $params[] = "%$value%";
         }
         $sql = $sql." t.name LIKE ? OR t.description LIKE ? OR t.keywords LIKE ?".($i==count($words)?"":" OR");
      }
      // print_r(Good::get_all_with_where($sql, ' ORDER BY t.good_view DESC', $params));

      return Good::get_all_with_where($sql, ' ORDER BY t.good_view DESC', $params);
   }

   public function get_matches($content, $word = array())
   {
      $matches = array();
      foreach($content as $p) {
         $res[$p->page_id] = $p;
         foreach($word as $w) {
            if(trim($w) != "") {
               $w = trim($w);
               $matches[$p->page_id] = $matches[$p->page_id] + count(explode($w, $p->page_name));
               $matches[$p->page_id] = $matches[$p->page_id] + count(explode($w, $p->page_text));
            }
         }
      }
      arsort($matches);
      $i = 0;
      foreach($matches as $k => $v) {
         $result[$i] = $res[$k];
         $result[$i]->matches = $v;
         $i++;
      }
      return $result;
   }

   public static function search_good($query)
   {
      $max = 10;
      $min_length = 3;
      $word = explode(" ", self::clean_post_data($query));
      $words = self::clean_array_to_search($word, $max, $min_length);
      if (empty($words)) return Array();
      $result = self::get_goods_result($words);
      // $result = self::get_matches($results, $words);
      return $result;
   }

}

?>