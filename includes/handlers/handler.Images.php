<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/handlers/handler.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';

class Images_Handler
{
	public function Delete($params)
	{
		Images::Delete($params['id']);
	}
}

$handler = new Images_Handler();
$handler->$_POST['mode']($_POST);
?>