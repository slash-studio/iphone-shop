<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/connect.php');

	class Images
	{
		const TABLE = 'images';

		public static function Insert($good_id)
		{
			global $db;
			$query = "INSERT INTO " . self::TABLE . "(good_id) VALUES (?)";
			$db->exec($query, array($good_id));
			return $db->link->lastInsertId();
		}

		public static function Delete($id)
		{
			global $db;
			$query = "DELETE FROM " . self::TABLE . " WHERE " . self::TABLE . ".id = ?";
			$db->exec($query, array($id));

			unlink($_SERVER['DOCUMENT_ROOT'] . '/includes/uploads/' . $id . '.jpg');
			unlink($_SERVER['DOCUMENT_ROOT'] . '/includes/uploads/' . $id . '_b.jpg');
			unlink($_SERVER['DOCUMENT_ROOT'] . '/includes/uploads/' . $id . '_m.jpg');
			unlink($_SERVER['DOCUMENT_ROOT'] . '/includes/uploads/' . $id . '_s.jpg');
		}

		public static function Delete_all_of_good($good_id)
		{
			$images = self::Select($good_id);
			foreach ($images as $image) {
				self::Delete($image['id']);
			}
		}

		public static function Select($good_id)
		{
			global $db;
			$query = "SELECT * FROM " . self::TABLE . " t WHERE t.good_id = ?";
			return $db->query($query, array($good_id));
		}

		public static function Select_first($good_id)
		{
			$photos = self::Select($good_id);
			return empty($photos) ? null : $photos[0];
		}

		public static function Get_first_image_id($good_id)
		{
			$photo = self::Select_first($good_id);
			return $photo['id'];
		}
	}
?>