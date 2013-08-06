<?php
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Good.php';
	require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php';


	class Cart_good
	{
		public $g_id;
		public $g_name;
		public $g_count;
		public $g_params;
		public $g_price;

		public function __construct($g_id, $g_name, $g_price, $g_params)
		{
			$this->g_id = $g_id;
			$this->g_name = $g_name;
			$this->g_count = 1;
			$this->g_price = $g_price;
			$this->g_params = $g_params;
		}

		public function Total()
		{
			return $this->g_price * $this->g_count;
		}

		public static function Get_id_for_cart($g_id, $g_params) {
			return $g_id. '@' . $g_params;
		}

		public function Get_array()
		{
			return array(
				'id' => $this->g_id,
				'name' => $this->g_name,
				'count' => $this->g_count,
				'price' => $this->g_price,
				'params' => join(' - ', explode('@', $this->g_params)),
				'image' => Images::Get_first_image_id($this->g_id),
				'c_id' => $this->Get_id_for_cart($this->g_id, $this->g_params),
				'total' => $this->Total()
			);
		}
	}

	class Cart
	{
		private $goods = array();
		public $goods_count = 0;
		public $goods_total = 0;

		public function is_Exists($c_id)
		{
			return $this->goods[$c_id]->g_count > 0;
		}

		public function Update()
		{
			$this->goods_count = 0;
			$this->goods_total = 0;
			foreach ($this->goods as $good) {
				$this->goods_count += $good->g_count;
				$this->goods_total += $good->Total();
			}
		}

		public function Add($g_id, $g_params)
		{
			global $db;

			$c_id = Cart_good::Get_id_for_cart($g_id, $g_params);

			if ($this->is_Exists($c_id)) {
				$this->goods[$c_id]->g_count++;
			} else {
				$good = Good::Get_from_id($g_id);
				$this->goods[$c_id] = new Cart_good($g_id, $good['name'], $good['price'], $g_params);
			}
		}

		public function Remove_good($c_id)
		{
			unset($this->goods[$c_id]);
		}

		public function Clear()
		{
			$this->goods = array();
			$this->goods_count = 0;
			$this->goods_total = 0;
		}

		public function Update_count($c_id, $new_count)
		{
			$this->goods[$c_id]->g_count = $new_count;
		}

		public function Get_array()
		{
			$cart_arr = array();
			foreach ($this->goods as $good) {
				$cart_arr[] = $good->Get_array();
			}
			return $cart_arr;
		}
	}
?>