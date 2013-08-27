<?php
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php');

$category = new Category();
try {
   if (isset($_POST['type'])) {
      switch ($_POST['type']) {
         case 'add':
            $result['result'] = $category->add($_POST['parent_id'], $_POST['name']);
            break;
         case 'change':
            $result['result'] = $category->edit($_POST['id'], $_POST['parent_id'], $_POST['name']);
            break;
         case 'delete':
            $result['result'] = $category->delete($_POST['id'], $_POST['parent_id']);
            break;
      }
   }  
} catch (Exception $e) {
   $result['message'] = $e->getMessage();
   $result['result'] = false;
}
if (isset($_POST['type'])) {
   $result['table'] = $category->make_tree(false);
   echo json_encode($result);
} else {
   $category->make_tree();
   $smarty->display('admin.edit_category.tpl');
}
?>