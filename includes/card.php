<?php
	if (empty($request[1])) header("Location: /");
	$good = Good::Get_from_id($request[1]);
	if (empty($good)) {
		//указан неверный id карточки, нужно что-то сделать
	}
	$smarty->assign('good', $good);
	$images = Images::Select($request[1]);
	array_shift($images);
	$smarty->assign('images', $images)
			 ->assign('active', 'shop');
	$smarty->display('card.tpl');
?>