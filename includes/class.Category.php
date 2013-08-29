<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php';

   class Category
   {

      function __construct()
      {
         $this->tblName = 'subcategory';
      }
     
      public static function Get_all() 
      {
         $result = Array();
         try {
            global $db;
            $categories = $db->query('SELECT * FROM category');
            foreach ($categories as $cat) {
               $result[$cat['id']] = $cat['name'];
            }
         } catch (Exception $e) {
            //
         }
         return $result;
      }

      public function edit($id, $parent_id, $name)
      {
         global $db;
         $st = $db->link->prepare('UPDATE category SET name=? WHERE id=?');
         if (!$st->execute(Array($name, $id))) {
            throw new Exception("Не получается обновить название категории.");
            return false;
         }
         global $main_categories;
         foreach ($main_categories as $idx) {
            if (($id == $idx) && ($parent_id != -1)) {
               throw new Exception("Нельзя менять родителя главной категории!");
            }
         }
         $p_id = $parent_id == -1 ? $id : $parent_id;
         $st = $db->link->prepare('UPDATE subcategory SET parent_id=? WHERE id=?');
         return $st->execute(Array($p_id, $id));
      }

      public function add($parent_id, $name)
      {
         global $db;
         try {
            $db->link->beginTransaction();
            $st = $db->link->prepare('INSERT INTO category(name) VALUES(?)');
            $st->execute(Array($name));
            $st = $db->link->prepare("INSERT INTO $this->tblName(id, parent_id) VALUES(?, ?)");
            $id = $db->link->lastInsertId();
            $p_id = $parent_id == -1 ? $id : $parent_id;
            $st->execute(array($id, $p_id));
            $db->link->commit();
         } catch (Exception $e) {
            $db->link->rollBack();
            return false;
         }
         return true;
      }

      public function delete($id, $parent_id)
      {
         if (!isset($id)) {
            return false;
         }
         if ($parent_id == -1) {
            throw new Exception("Нельзя удалять верхние уровни категорий!");
         }
         global $db;
         $st = $db->link->prepare('DELETE FROM category WHERE id=?');
         if (!$st) {
            return false;
         }
         return $st->execute(Array($id));
      }

      public static function make_select_tree()
      {
         try {
            global $db;
            $result = $db->query('SELECT id, parent_id FROM subcategory');
            $vertex    = array();
            $sub_trees = array();
            foreach ($result as $k => $v) {
             if ($v['parent_id'] == $v['id']) {
                  $vertex[] = $v['parent_id'];
               } else {
                  $sub_trees[$v['parent_id']][] = $v['id'];
               }
            }
            $category = $db->query('SELECT id, name FROM category');
            $names  = array();
            foreach ($category as $k => $v) {
               $names[$v['id']][] = $v['name'];
            }
            $leaf = array();
            $buildTree = function(&$t, $id) use(&$buildTree, &$leaf, $sub_trees, $names) {
               $cnt    = 0;
               $t[$id] = array();
               if (isset($sub_trees[$id])) {
                  foreach ($sub_trees[$id] as $k => $v) {
                     $buildTree($t[$id], $v);
                     $cnt++;
                  }
               }
               if (!$cnt) {
                  $leaf[$id] = $names[$id][0];
               }
            };
            foreach ($vertex as $v) {
               $buildTree($tree, $v);
            }
            $buildTree = function($t, $depth = 0) use(&$buildTree, $names) {
               if (!count($t)) {
                  return '';
               }
               $result = '';
               foreach ($t as $k => $sub) {
                  $result .= "<option value='$k'>" . str_repeat('&ensp;', $depth) . $names[$k][0] . "</option>\n";
                  $result .= $buildTree($sub, $depth + 1);
               }
               return $result;
            };
            return isset($tree) ? $buildTree($tree) : '';
         } catch (Exception $e) {
            return '';
         }
      }

      public function make_tree($isShowTree = true, $isTopMenu = false)
      {
         try {
            global $db;
            $result = $db->query('SELECT id, parent_id FROM subcategory');
            $vertex    = array();
            $sub_trees = array();
            foreach ($result as $k => $v) {
             if ($v['parent_id'] == $v['id']) {
                  $vertex[] = $v['parent_id'];
               } else {
                  $sub_trees[$v['parent_id']][] = $v['id'];
               }
            }
            $category = $db->query('SELECT id, name FROM category');
            $names  = array();
            foreach ($category as $k => $v) {
               $names[$v['id']][] = $v['name'];
            }
            $leaf = array();
            $buildTree = function(&$t, $id) use(&$buildTree, &$leaf, $sub_trees, $names) {
               $cnt    = 0;
               $t[$id] = array();
               if (isset($sub_trees[$id])) {
                  foreach ($sub_trees[$id] as $k => $v) {
                     $buildTree($t[$id], $v);
                     $cnt++;
                  }
               }
               if (!$cnt) {
                  $leaf[$id] = $names[$id][0];
               }
            };
            foreach ($vertex as $v) {
               $buildTree($tree, $v);
            }
            $buildTree = function($t) use(&$buildTree, $names, $isTopMenu) {
               if (!count($t)) {
                  return '';
               }
               $result = "<ul>";
               foreach ($t as $k => $sub) {
                  $href_str = $isTopMenu ? "/category/$k" : 'javascript:void(0)';
                  $new_node = "<li id='category_$k'><a href='$href_str' class='parent'>" . $names[$k][0] . "</a>";
                  $next_node = $buildTree($sub);
                  $new_node .= $next_node;
                  if ($next_node == '') {
                     $result .= "<li id='category_$k'><a href='$href_str'>" . $names[$k][0] . "</a>";
                  } else {
                     $result .= $new_node;
                  }
                  $result .= "</li>";
               }
               $result .= "</ul>";
               return $result;
            };
            global $smarty;
            if ($isShowTree) {
               $smarty->assign('category', $category)
                      ->assign('category_tree', isset($tree) ? $buildTree($tree) : '');
            } else {
               return isset($tree) ? $buildTree($tree) : '';
            }
         } catch (Exception $e) {
            return '';
         }
      }

   }
?>