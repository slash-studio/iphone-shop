$(function(){
	var $btnUpload = $('#upload_photo');
	var $status = $('#status_photo');
	new AjaxUpload($btnUpload, {
		action: '/includes/uploadfile.php',
		name: 'uploadfile',
		data: {good_id: $btnUpload.attr('data')},
		onSubmit: function(file, ext){
			 if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))) { 
				// extension is not allowed 
				$status.text('This extension is not allowed. Only JPG, PNG or GIF');
				return false;
			}
			$status.text('Downloading...');
		},
		onComplete: function(file, response) {
			//On completion clear the status
			$status.text('');
			//Add uploaded file to list
			if(response != "error") {
				file_name = response;
				$.post(
					"/includes/rename.php", 
					{
						name: file_name
					}, 
					function(data){
						$('#photos_div').append('<div class="in_image"><img src="/includes/uploads/' + file_name + '_s.jpg" /><button data="' + file_name + '">X</button></div>');
					}
				);
			} else {
				alert('File cannot be download ' + file);
			}
		}
	});
	
	$('#photos_div div.in_image button').live('click', function(){
		$button = $(this);
		$.post(
			"/includes/handlers/handler.Images.php", 
			{
				mode: 'Delete',
				id: $button.attr('data')
			}, 
			function() {
				$button.parent().empty().remove();
			}
		);
	});
	
});