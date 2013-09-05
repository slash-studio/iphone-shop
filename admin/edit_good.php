<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php';
   $good = new Good();
   if (isset($_GET['id'])) {
      $good->Select_from_id($_GET['id']);
      $smarty->assign('mode', 'edit');
   } else {
      $smarty->assign('mode', 'add');
   }
   $good = $good->Get_array();
   $smarty->assign('good', $good);
   $smarty->assign('categories', Category::make_select_tree());
   $smarty->display('admin.edit_good.tpl');
?>