<?php
   session_start();
   $_SESSION['admin_login'] = null;
   $_SESSION['admin_pass'] = null;
   unset($_SESSION['admin_login']);
   unset($_SESSION['admin_pass']);
   session_destroy();
?>