$(function(){
	$('button.delete').click(function(){
		$tr = $(this).parent().parent();
		if (confirm('Уверены?')) {
			$.post(
				'/includes/handlers/handler.Good.php',
				{  
					mode: 'Delete',
					id: $(this).attr('id').split('d').pop()
				}, 
				function(data) {
					$tr.empty().remove();
				}
			);
		};
	});
	$("a.edit").colorbox({
		iframe:true, 
		height:"85%",
		width:"50%"
	});
	$("#add_new").colorbox({
		iframe:true, 
		height:"85%",
		width:"50%"
	}).click(function(){
		
	});
	$("a.edit_images").colorbox({
		iframe:true, 
		height:"85%",
		width:"50%"
	});
});