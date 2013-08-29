$(function(){
   $('#admin_logout').click(function(){
      $.post(
         '/includes/admin_logout.php',
         {}, 
         function(data) {
            window.location = "/";
         });
      return false;
   });
});