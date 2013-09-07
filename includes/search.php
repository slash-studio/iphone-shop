<?php
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');
require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Search.php');

$goods = Array();
if (isset($_GET['q'])) {
   $smarty->assign('search_query', $_GET['q']);
   $goods = Search::search_good($_GET['q']);
}

$smarty->assign('active', 'shop')
       ->assign('goods', $goods)
       ->assign('goods_count', count($goods))
       ->display('shop.tpl');      
?>