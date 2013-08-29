<!DOCTYPE html>
<html>
<head>
   <title>Опрос</title>
   <meta charset="utf-8" />
</head>
<style>
   * {
      margin: 0;
      padding: 0;
   }
   #form {
      left: 50%;
      margin-left: -125px;
      width: 250px;
      top: 50%;
      position: absolute;
      margin-top: -100px;
   }
   #form input {
      margin: 5px 0;
      display: block;
      padding: 3px;
      font-size: 15px;
   }
   #form input[type=submit] {
      width: 100px;
      margin-top: 10px;
   }
</style>
<body>
   <div id="form">
      <form action="/admin/" method="POST" ENCTYPE="multipart/form-data" name="my_id">
         <label for="login">Имя</label>
         <input type="text" name="login">
         <label for="pass">Пароль</label>
         <input type="password" name="pass">
         <input type="submit" value="Войти" name="submit">
      </form>
   </div>
</body>
</html>