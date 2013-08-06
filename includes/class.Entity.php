<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Field.php';

abstract class Entity
{
    const TABLE = 'undefined';
    protected $id = 'undefined';
    public $fields;

    abstract public function __construct();

    public function Id($id)
    {
        $this->id = $id;
    }

    public function Insert()
    {
        global $db;
        return $db->Insert_from_fields(static::TABLE, $this->fields);
    }

    public function Delete()
    {
        global $db;
        $db->Delete(static::TABLE, $this->id);
    }

    public function Update()
    {
        global $db;
        $db->Update_from_fields(static::TABLE, $this->id, $this->fields);
    }

    public function Select_from_id($id)
    {
        global $db;
        $arr = $db->Select_from_id(static::TABLE, $id);
        foreach ($this->fields as $name => $field) {
            $this->fields[$name]->val = $arr[$field->table_name];
            //$field->val = $arr[$field->table_name];
        }

        $this->id = $id;
    }
	
	public function Get_array() 
	{
		$res = array();
		foreach ($this->fields as $field) {
			$res[$field->table_name] = $field->val;
		}
		$res['id'] = $this->id;
		return $res;
	}
}

?>