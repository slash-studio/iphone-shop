<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/user_consts.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Field.php';

class DBConnect
{
	public $link;
	
	public function DBConnect($db_dsn, $db_user, $db_pass)
	{
		try {
			$this->link = new PDO($db_dsn, $db_user, $db_pass);
		} catch (PDOException $e) {
			die('Подключение не удалось: ' . $e->getMessage());
		}
		$this->link->exec("SET CHARACTER SET utf8");
	}

	public function exec($query, $params = array())
	{
		$f = $this->query($query, $params);
	}

	public function query($query, $params = array())
	{
		$st = $this->link->prepare($query);
		if (!$st->execute($params)) {
			throw new Exception(ERROR_QUERY);
		}
		return $st->fetchAll(PDO::FETCH_ASSOC);
	}

	public function Insert($table_name, $arr) //первый параметр название таблицы
	{
		$values = array_values($arr);
		$query = "INSERT INTO " . $table_name . " (" . join(',', array_keys($arr)) . ") VALUES (" . str_repeat('?,', count($values) - 1) . "?)";
		$this->exec($query, $values);
		return $this->link->lastInsertId();
	}

	public function Insert_from_fields($table_name, $fields)
	{
		$res = array();
		foreach ($fields as $field) {
			$field->validate();
			$res[$field->table_name] = $field->val;
		}
		return $this->Insert($table_name, $res);
	}

	public function Select_from_ID($table_name, $id)
	{
		$query = "SELECT * FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
		$arr = $this->query($query, array($id));
		return $arr[0];
	}

	public function Update($table_name, $id, $arr)
	{
		$set = array();
		foreach ($arr as $key => $val) {
			$set[] = $key . '=?';
		}
		$query = "UPDATE " . $table_name . " SET " . join(', ', $set) . " WHERE " . $table_name . ".id = ?";
		$this->exec($query, array_merge(array_values($arr), array($id))); //послдений ? - id
	}

	public function Update_from_fields($table_name, $id, $fields)
	{
		$res = array();
		foreach ($fields as $field) {
			$field->validate();
			$res[$field->table_name] = $field->val;
		}
		return $this->Update($table_name, $id, $res);
	}

	public function Delete($table_name, $id)
	{
		$query = "DELETE FROM " . $table_name . " WHERE " . $table_name . ".id = ?";
		$this->exec($query, array($id));
	}

	public function last_insert_id()
	{
		return $this->link->lastInsertId();
	}

}

$db = new DBConnect(DB_dsn, DB_user, DB_pass);


// try {
// 	$db_link = new PDO(DB_dsn, DB_user, DB_pass);
// } catch (PDOException $e) {
// 	die('Подключение не удалось: ' . $e->getMessage());
// }
// $db_link->exec("SET CHARACTER SET utf8");
?>