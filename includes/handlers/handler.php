<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Entity.php';

abstract class Handler
{
    public $entity;

    abstract public function __construct();

    public function Delete($params)
    {
        $id = $params['id'];
        $this->entity->Id($id);
        $this->entity->Delete();
    }

    public function Insert($params)
    {
		foreach($this->entity->fields as $name => $field) {
			$this->entity->fields[$name]->val = $params[$name];
		}
		$this->entity->Insert();
		echo "ok";
    }
	
	public function Update($params)
    {
		$this->entity->Select_from_id($params['id']);
		foreach($this->entity->fields as $name => $field) {
			$this->entity->fields[$name]->val = $params[$name];
		}
		$this->entity->Update();
		echo "ok";
    }
}


?>