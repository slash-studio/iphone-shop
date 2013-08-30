$(function(){
   $('#checkout').click(function(){
      $name          = $('input#name').val();
      $phone         = $('input#tel').val();
      $email         = $('input#mail').val();
      $delivery      = $('#delivery_yes').is(':checked');
      $address       = '';
      $delivery_type = '';
      $from_vlad     = false;
      if ($('#vlad_yes').is(':checked')) {
         $address = 'Владивосток';
         $from_vlad = true;
      } else {
         $('#delivery_section input').each(function(i,elem) {
            if ($(elem).is(':checked')) {
               $delivery_type = $(elem).val();
            }
         });
      }
      $address += $('#adress').val();
      // alert($name);
      // alert($phone);
      // alert($email);
      // alert($delivery);
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode:          'Checkout',
            name:          $name,
            phone:         $phone,
            email:         $email,
            address:       $address,
            delivery:      $delivery,
            delivery_type: $delivery_type,
            from_vlad:     $from_vlad
         }, 
         function(data) {
            alert(data);
            location.reload();
         }
      );
      return false;
   });
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