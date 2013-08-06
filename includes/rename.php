<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php');
	$uploaddir = 'uploads/'; 
	$path = $uploaddir . $_POST['name'] . '.jpg';
	//$im = imagecreatefromjpeg($path);
	//$arr = getimagesize($path);
	const BIGGEST_SIZE_WIDTH = 550;
	const BIG_SIZE_WIDTH = 400;
	const MIDDLE_SIZE_WIDTH = 250;
	const SMALL_SIZE_WIDTH = 80;
	
	$arr = getimagesize($path);
	
	function resize($image, $new_width, $path, $width, $height) 
	{
		$new_height = round($new_width / $width * $height);
		$command = "convert " . $image . " -resize \"" . $new_width . "x" . $new_height . "\" " . $path;
		exec($command);
		return $new_height;
	}
	$arr[1] = resize($path, 
			  BIGGEST_SIZE_WIDTH, 
			  $uploaddir . $_POST['name'] . '.jpg',
			  $arr[0],
			  $arr[1]);
	$arr[1] = resize($path, 
			  BIG_SIZE_WIDTH, 
			  $uploaddir . $_POST['name'] . '_b.jpg',
			  BIGGEST_SIZE_WIDTH,
			  $arr[1]);
	$arr[1] = resize($path, 
			  MIDDLE_SIZE_WIDTH, 
			  $uploaddir . $_POST['name'] . '_m.jpg',
			  BIG_SIZE_WIDTH,
			  $arr[1]);
	$arr[1] = resize($path, 
			  SMALL_SIZE_WIDTH, 
			  $uploaddir . $_POST['name'] . '_s.jpg',
			  MIDDLE_SIZE_WIDTH,
			  $arr[1]);
	
	/*
	function resize($image, $size, $path) 
	{
		$new_height = round($size / $image->getImageWidth() * $image->getImageHeight());
		$image->resizeImage($size, $new_height, Imagick::FILTER_LANCZOS, 1);
		$image->writeImage($path);
		return $image;
	}
	
	$image = new Imagick($path);
	$image = resize($image, BIG_SIZE_WIDTH, $uploaddir . $_POST['name'] . '.jpg');
	$image = resize($image, MIDDLE_SIZE_WIDTH, $uploaddir . $_POST['name'] . '_m.jpg');
	$image = resize($image, SMALL_SIZE_WIDTH, $uploaddir . $_POST['name'] . '_s.jpg');
	$image->clear();
	$image->destroy(); 
	*/
	//big
	/*
	$w = BIG_SIZE_WIDTH;
	$h = round(BIG_SIZE_WIDTH / $arr[0] * $arr[1]);
	
	$big = imagecreatetruecolor($w, $h);
	imagecopyresampled($big, $im, 0, 0, 0, 0, $w, $h, $arr[0], $arr[1]);
	
	//middle
	
	$im = $big;
	$arr[0] = $w; $arr[1] = $h;
	
	$w = MIDDLE_SIZE_WIDTH;
	$h = round(MIDDLE_SIZE_WIDTH / $arr[0] * $arr[1]);
	
	$middle = imagecreatetruecolor($w, $h);
	imagecopyresampled($middle, $im, 0, 0, 0, 0, $w, $h, $arr[0], $arr[1]);
	
	//small
	
	$im = $middle;
	$arr[0] = $w; $arr[1] = $h;
	
	$w = SMALL_SIZE_WIDTH;
	$h = round(SMALL_SIZE_WIDTH / $arr[0] * $arr[1]);
	
	$small = imagecreatetruecolor($w, $h);
	imagecopyresampled($small, $im, 0, 0, 0, 0, $w, $h, $arr[0], $arr[1]);
	
	imagejpeg($big, $uploaddir . $_POST['name'] . '.jpg');
	imagejpeg($middle, $uploaddir . $_POST['name'] . '_m.jpg');
	imagejpeg($small, $uploaddir . $_POST['name'] . '_s.jpg');
	*/
?>