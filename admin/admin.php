<?php
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/constants.php';
   require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php';

   $admin_login = isset($_SESSION['admin_login']) ? $_SESSION['admin_login'] : null;
   $admin_pass = isset($_SESSION['admin_pass']) ? $_SESSION['admin_pass'] : null;
   if (($admin_login != ADMIN_LOGIN) || ($admin_pass != ADMIN_PASS)) {
      $smarty->display('admin_auth.tpl');
      if (isset($_POST['submit'])) {
         if (($_POST['login'] == ADMIN_LOGIN) && ($_POST['pass'] == ADMIN_PASS)) {
            $_SESSION['admin_login'] = ADMIN_LOGIN;
            $_SESSION['admin_pass'] = ADMIN_PASS;
            @header("Location: /admin/good");
         } else {
            @header("Location: /");
         }
      }
   } else {
      switch ($request[1]) {
         case 'good':
            $goods = Good::get_all();
            $smarty->assign('active', 'good')
                   ->assign('goods', $goods)
                   ->assign('categories', Category::Get_all())
                   ->display('admin_good.tpl');
            break;
         
         case 'category':
            $smarty->assign('active', 'category');
            require_once $_SERVER['DOCUMENT_ROOT'] . '/admin/edit_category.php';
            break;

         default:
            header("Location: /admin/good");
            break;
      }
   }
?>