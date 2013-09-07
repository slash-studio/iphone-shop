$(function(){
   $('#checkout').click(function(){
      $name             = $.trim($('input#name').val());
      $phone            = $.trim($('input#tel').val());
      $email            = $.trim($('input#mail').val());
      $delivery         = $('#delivery_yes').is(':checked') ? 1 : 0;
      $address          = '';
      $delivery_type_id = null;
      $from_vlad        = false;
      if ($('#vlad_yes').is(':checked')) {
         $address = 'Владивосток, ';
         $from_vlad = true;
      } else {
         $('#delivery_section input').each(function(i,elem) {
            if ($(elem).is(':checked')) {
               input_id = $(elem).attr('id');
               $delivery_type_id = (input_id.substring(input_id.indexOf('_') + 1));
            }
         });
      }
      $address += $.trim($('#adress').val());
      if ($name == '' || $phone == '' || $email == '' || ($delivery && $address == '')) {
         $.colorbox({html:"<div style='border: 1px black solid; width: 400px; text-align: center; padding: 50px 0;'>Вы не корректно заполнили форму!</div>"});
         return false;
      }
      // alert($name);
      // alert($phone);
      // alert($email);
      // alert($address);
      // alert($delivery);
      // alert($delivery_type_id);
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode:             'Checkout',
            name:             $name,
            phone:            $phone,
            email:            $email,
            address:          $address,
            delivery:         $delivery,
            delivery_type_id: $delivery_type_id,
            from_vlad:        $from_vlad
         }, 
         function(data) {
            $.colorbox({html:"<div style='border: 1px black solid; width: 400px; text-align: center; padding: 50px 0;'>" + data.message + "</div>"});
            if (data.result) {
               location.reload();
            } else {
            }
         },
         "json"
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