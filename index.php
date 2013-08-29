<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/container.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Search.php';

$request = explode('/', substr($_SERVER['REQUEST_URI'], 1));
switch ($request[0]) {
   case '': case null: case false:
      $goods = Good::get_all_displayed();
      $smarty->assign('goods', $goods)
             ->assign('goods_count', count($goods));

      $active = 'shop';
      $smarty->assign('active', $active);

      require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php');
      $category = new Category;
      $smarty->assign('category_tree', $category->make_tree(false, true));

      $images = array();
      $slider_img_fold = opendir($_SERVER['DOCUMENT_ROOT'] . '/images/slider');
      while ($file = readdir($slider_img_fold)) {
         if (($file != ".") && ($file != "..")) {

            $images[] = $file;
         }
      }
      closedir($slider_img_fold);

      usort($images, function ($a, $b) {
         return intval(substr($a, 0, strpos($a, '.'))) < intval(substr($b, 0, strpos($b, '.'))) ? -1 : 1;
      });

      $smarty->assign('slider_images', $images)
             ->display('index.tpl');
      break;

   case 'category':
      if (isset($request[1]) && !empty($request[1])) {
         $goods = Search::get_by_category(intval($request[1]));
      } else {
         header("Location: /");
      }
      $smarty->assign('goods', $goods)
             ->assign('goods_count', count($goods));

      $active = 'shop';
      $smarty->assign('active', $active);

      require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php');
      $category = new Category;
      $smarty->assign('category_tree', $category->make_tree(false, true))
             ->display('index.tpl');
      break;

   case 'search':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/search.php';
      break;

   case 'admin':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/admin/admin.php';
      break;

   case 'card':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/card.php';
      break;

   case 'cart':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/cart.php';
      break;

   case 'cart_confirm':
      require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/cart_confirm.php';
      break;

   case 'shop':
      $goods = Good::get_all_displayed();
      $smarty->assign('active', 'shop')
             ->assign('goods', $goods)
             ->assign('goods_count', count($goods));
      $smarty->display('shop.tpl');
      break;

   default:
      $smarty->display('error404.tpl');
}
?>