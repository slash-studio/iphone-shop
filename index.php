<?php
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Search.php');

   // require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/handlers/handler.Cart.php');

   // $cart_Handler = new Cart_Handler();
   // $cart_Handler->Add();
   // $_SESSION['cart_info'] = serialize($cart_Handler->cart);

if (isset($_GET['cid']) && !empty($_GET['cid'])) {
   $goods = Search::get_by_category(intval($_GET['cid']));
} else {
   $goods = Good::get_all_displayed();
}
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
?>