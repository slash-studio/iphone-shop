<?php
	require_once ($_SERVER['DOCUMENT_ROOT'] . '/admin/check_pass.php');
	$uploaddir = 'uploads/'; 
	preg_match('/(.*)(\..*)/', basename($_FILES['uploadfile']['name']), $arr);
	$ext = $arr[2];  
	$filetypes = array('.jpg','.gif','.bmp','.png','.JPG','.BMP','.GIF','.PNG','.jpeg','.JPEG');

	if (!in_array($ext, $filetypes)) {
		echo "error";
	} else { 
		require_once ($_SERVER['DOCUMENT_ROOT'] . '/includes/class.Images.php');
		$file = Images::Insert($_POST['good_id']);
		$path = $uploaddir . $file . '.jpg';
		if (move_uploaded_file($_FILES['uploadfile']['tmp_name'], $path)) { 
		  echo $file; 
		} else {
			echo "error";
		}
	}
?>