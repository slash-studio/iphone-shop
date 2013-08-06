<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/handlers/handler.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';

class Good_Handler extends Handler
{
    public function __construct()
    {
        $this->entity = new Good();
    }
}

$handler = new Good_Handler();
$handler->$_POST['mode']($_POST);
?>