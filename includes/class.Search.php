<?php
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');


class Search 
{
   
   public static function get_by_category_alias($alias)
   {
      $goods = Array();
      try {
         global $db;
         $data = $db->query('SELECT id FROM category WHERE alias = ?', Array($alias));
         if (empty($data)) throw new Exception("");
         $category_id = $data[0]['id'];
         $new_arr = Good::get_all_with_where(" WHERE t.category_id = $category_id");
         foreach ($new_arr as $arr) {
            $goods[] = $arr;
         }
         $result = $db->query('SELECT id FROM subcategory WHERE parent_id=?', Array($category_id));
         if (empty($result)) return $goods;
         
         foreach ($result as $num => $id) {
            if ($id['id'] == $category_id) continue;
            $data = $db->query('SELECT alias FROM category WHERE id = ?', Array($id['id']));
            $new_arr = self::get_by_category_alias($data[0]['alias']);
            foreach ($new_arr as $arr) {
               $goods[] = $arr;
            }
         }
      } catch (Exception $e) {
         //
      }
      return $goods;
   }

   public static function clean_post_data(&$data)
   {
      $data = trim($data);
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

      return Good::get_all_with_where($sql, '', $params);
   }

   public function get_matches($content, $word = array())
   {
      $matches = array();
      $one = floor(100 / count($word));
      $residue = 150 - $one * count($word);
      foreach ($content as $p) {
         $matches[$p['id']] = empty($matches[$p['id']]) ? 0 : $matches[$p['id']];
         foreach ($word as $keyword) {
            $matches[$p['id']] += strpos($p['name'], $keyword)  ? $one : 0;
         }
         $matches[$p['id']] += $residue;
      }
      foreach($content as $p) {
         foreach($word as $w) {
            if(trim($w) != "") {
               $w = trim($w);
               $matches[$p['id']] += count(explode($w, $p['name']))
                                   + count(explode($w, $p['description']))
                                   + count(explode($w, $p['keywords']));
            }
         }
      }
      arsort($matches);
      $result = Array();
      foreach($matches as $id => $cnt) {
         foreach ($content as $good) {
            if ($good['id'] == $id) {
               $result[] = $good;
               break;
            }
         }
      }
      return $result;
   }

   public static function search_good($query)
   {
      $max = 15;
      $min_length = 2;
      $word = explode(" ", self::clean_post_data($query));
      $words = self::clean_array_to_search($word, $max, $min_length);
      if (empty($words)) return Array();
      $result = self::get_goods_result($words);
      $words = self::clean_array_to_search($word, $max, 0);
      $result = self::get_matches($result, $words);
      return $result;
   }

}

?>