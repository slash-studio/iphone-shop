<?php
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/settings.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');
   require_once($_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php');

   class Category
   {

      function __construct()
      {
         $this->tblName = 'subcategory';
      }

      public function edit($id, $parent_id, $name)
      {
         global $db;
         $st = $db->link->prepare('UPDATE category SET name=? WHERE id=?');
         if (!$st->execute(Array($name, $id))) {
            throw new Exception("error 1");
            return false;
         }
         global $main_categories;
         foreach ($main_categories as $idx) {
            if (($id == $idx) && ($parent_id != -1)) {
               throw new Exception("Нельзя менять родителя главной категории");
            }
         }
         // $st = $db->link->prepare('SELECT id FROM goods WHERE category_id=?');
         // if ($st->execute(Array($parent_id))) {
         //    $cnt = count($st->fetchAll());
         // } else {
         //    throw new Exception("error 2");
         //    return false;
         // }
         // if (!$cnt) {
            $p_id = $parent_id == -1 ? $id : $parent_id;
            $st = $db->link->prepare('UPDATE subcategory SET parent_id=? WHERE id=?');
            return $st->execute(Array($p_id, $id));
         // } else {
            // throw new Exception("error 3");
            // return false;
         // }
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
            $st->execute([$id, $p_id]);
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

      public function make_tree($isShowTree = true)
      {
         global $db;
         $result = $db->query('SELECT id, parent_id FROM subcategory');
         $vertex    = [];
         $sub_trees = [];
         foreach ($result as $k => $v) {
          if ($v['parent_id'] == $v['id']) {
               $vertex[] = $v['parent_id'];
            } else {
               $sub_trees[$v['parent_id']][] = $v['id'];
            }
         }
         $category = $db->query('SELECT id, name FROM category');
         $names  = [];
         foreach ($category as $k => $v) {
            $names[$v['id']][] = $v['name'];
         }
         $leaf = [];
         $buildTree = function(&$t, $id) use(&$buildTree, &$leaf, $sub_trees, $names) {
            $cnt    = 0;
            $t[$id] = [];
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
         $buildTree = function($t) use(&$buildTree, $names) {
            if (!count($t)) {
               return '';
            }
            $result = "<ul>";
            $isLeaf = false;
            foreach ($t as $k => $sub) {
               $new_node = "<li id='category_$k'><a href='javascript:void(0)' class='parent'>" . $names[$k][0] . "</a>";
               $next_node = $buildTree($sub);
               $new_node .= $next_node;
               if ($next_node == '') {
                  $result .= "<li id='category_$k'><a href='javascript:void(0)'>" . $names[$k][0] . "</a>";
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
                   ->assign('category_tree', $buildTree($tree));
         } else {
            return $buildTree($tree);
         }
         // echo $result;
      }

   }
?>