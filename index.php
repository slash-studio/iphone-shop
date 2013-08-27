<?php
   require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/container.php');
   require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php');
   require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');

   $goods = Good::get_all_displayed();

   $smarty->assign('goods', $goods);
   $smarty->assign('goods_count', count($goods));

   $active = 'shop';
   $smarty->assign('active', $active);

   // try {
   //    require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Category.php');
   //    $c = new Category;
   //    $c->edit(4,-1,'Аксессуарыd');
   //    echo 32;  
   // } catch (Exception $e) {
   //    echo $e->getMessage(); 
   // }

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