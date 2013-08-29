$(function() {
   $('td.quantity input').bind("change keyup input click", function(){
      if (this.value.match(/^0|[^0-9]/g)){
         this.value = this.value.replace(/^0|[^0-9]/g, '');
      }
   });
   $('#add_to_cart').click(function(){
      $id = $(this).attr('data');
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode: 'Add',
            g_id: $id,
         }, 
         function(data) {
            alert(data);
         }
      );
      return false;
   });
   $('#clear').click(function(){
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode: 'Clear'
         }, 
         function(data) {
            location.reload();
         }
      );
      return false;
   });
   $('#checkout').click(function(){
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode: 'Checkout'
         }, 
         function(data) {
            alert(data);
            location.reload();
         }
      );
      return false;
   });
   $('td.quantity button').click(function(){
      $count = $(this).siblings('input').val();
      $count = $count == 0 ? 1 : $count;
      $c_id = $(this).attr('data');
      $.post(
         '/includes/handlers/handler.Cart.php',
         { 
            mode: 'Update_count',
            g_count: $count,
            c_id: $c_id
         }, 
         function(data) {
            location.reload();
         }
      );
      return false;
   });
   $('td.delete button').click(function(){
      $c_id = $(this).attr('data');
      $.post(
         '/includes/handlers/handler.Cart.php',
         {  
            mode: 'Remove_good',
            c_id: $c_id
         }, 
         function(data) {
            location.reload();
         }
      );
      return false;
   });
});