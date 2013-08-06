$(function(){
	$('button.save').click(function(){
		$name = $('#g_name').val();
		$price = $('#g_price').val();
		$description = $('#g_description').val();
		$display = $('#g_display').is(':checked') | 0;
		$sizes = [];
		$id = $(this).attr('data');
		$mode = 'Update';
		if ($(this).attr('id') == 'add') {
			$mode = 'Insert';
		}
		$('input[name=g_size]').each(function(){
			if ($(this).is(':checked')) {
				$sizes.push($(this).val());
			}
		});
		$sizes = $sizes.join(',');
		$.post(
			'/includes/handlers/handler.Good.php',
			{  
				mode: $mode,
				id: $id,
				g_name: $name,
				g_price: $price,
				g_description: $description,
				g_sizes: $sizes,
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