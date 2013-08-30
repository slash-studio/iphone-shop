$(function(){
   $('#checkout').click(function(){
   	$name   	 = $('input#name').val();
   	$phone  	 = $('input#tel').val();
   	$email    = $('input#mail').val();
   	$delivery = $('#delivery_yes').is(':checked');
   	$address  = '';
   	if $('#vlad_yes').is(':checked') {
   		$address = 'Владивосток';
   	}
   	$address += $('#adress').val();
   	alert($name);
   	alert($phone);
   	alert($email);
   	alert($delivery);
   	alert($address);;
      // $.post(
      //    '/includes/handlers/handler.Cart.php',
      //    {  
      //       mode: 'Checkout'
      //    }, 
      //    function(data) {
      //       alert(data);
      //       location.reload();
      //    }
      // );
      return false;
   });
});