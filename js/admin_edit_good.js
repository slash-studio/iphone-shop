$(function(){
	$('button.save').click(function(){
		$name = $('#g_name').val();
		$old_price = $('#g_old_price').val();
		$new_price = $('#g_new_price').val();
		$description = $('#g_description').val();
		$keywords = $('#g_keywords').val();
		$display = $('#g_display').is(':checked') | 0;
		$id = $(this).attr('data');
		$mode = 'Update';
		if ($(this).attr('id') == 'add') {
			$mode = 'Insert';
		}
		$.post(
			'/includes/handlers/handler.Good.php',
			{  
				mode: $mode,
				id: $id,
				g_name: $name,
				g_old_price: $old_price,
				g_new_price: $new_price,
				g_description: $description,
				g_keywords: $keywords,
				g_display: $display
			}, 
			function(data) {
				alert(data);
				parent.location.reload(); //вау
			}
		);
		return false;
	});
});