$(function() {
	$('#delivery_yes').change(function(){
		$('#vlad_section').show();
	});
	$('#delivery_no').change(function(){
		$('#vlad_section').hide();
	});
	$('#vlad_yes').change(function(){
		$('#no_delivery').show();
		$('#delivery_section').hide();
	});
	$('#vlad_no').change(function(){
		$('#delivery_section').show();
		$('#no_delivery').hide();
	});
});