<!DOCTYPE HTML>
<html lang="ru" style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;"><head style="margin: 0; padding: 0;"><title style="margin: 0; padding: 0;">Sevnlayers</title><meta charset="utf-8" style="margin: 0; padding: 0;"><script src="/js/jquery.js" style="margin: 0; padding: 0;"></script><!--[if lt IE 9]>
   <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
   <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]--></head><body style="margin: 0; padding: 0; color: black; font-family: inherit; font-size: 100%; background: white; line-height: 1; border: 0; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;">
   
      <div id="wrap" style="margin: 0 auto; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; width: 1024px;">
         <header style="margin: 0; padding: 20px; height: 52px; display: block;"><a href="/" style="margin: 0; padding: 0; color: inherit; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;"><img id="header_logo" src="{$host}/images/logo.png" style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; float: left; margin-right: 30px;"></a>
            <h1 id="mail_title" style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 20pt; font-style: inherit; font-weight: bold; outline: 0; vertical-align: baseline; margin-top: 12px;">Вы совершили покупку в магазине iGleb!</h1>
         </header><div id="main" style="margin: 0 auto; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; text-align: center;">
            <div id="cart" style="margin: 20px auto 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; text-align: center;">
   <table style="margin: 0 auto; padding: 0; border: 0; font-family: Helvetica, Arial, sans-serif; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; border-collapse: collapse; border-spacing: 0; text-align: center; width: 700px;"><tr class="head" style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;"><td colspan="2" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
            Description
         </td>
         <td style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
            Price
         </td>
         <td style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
            Quantity
         </td>
         <td style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
            Total
         </td>
      </tr>
      {foreach $cart item=good}
      <tr style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;"><td class="image" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0;">
               <img src="{$host}/includes/uploads/{$good['image']}_s.jpg" style="margin: 5px; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; width: 50px;"></td>
            <td class="name" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0;">
               <a href="/includes/card.php?id={$good['id']}" style="margin: 0; padding: 0; color: inherit; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline; text-decoration: none;">{$good['name']}</a>
            </td>
            <td class="price" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0;">
               {$good['price']}€
            </td>
            <td class="quantity" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0;">{$good['count']}</td>
            <td class="price" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0;">
               {$good['total']}€
            </td>
         </tr>
         {/foreach}
         <tr class="head" style="margin: 0; padding: 0; border: 0; font-family: inherit; font-size: 100%; font-style: inherit; font-weight: inherit; outline: 0; vertical-align: baseline;"><td colspan="4" style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
            </td>
            <td style="margin: 0; padding: 10px; font-weight: inherit; text-align: left; border: 1px #ddd solid; font-family: inherit; font-size: 100%; font-style: inherit; outline: 0; vertical-align: middle; border-left: 0; border-right: 0; margin-bottom: 10px;">
               Total: {$total}€
            </td>
         </tr></table>
</div><a href="{$host}/cart_confirm/?h={$hash}&m={$email}">Подтвердить заказ</a>
         </div>
      </div>
      <footer style="margin: 20px 0; padding: 0; font-size: 80%; text-align: center; display: block;">
         ©2013 iGleb, Vladivostok
      </footer></body></html>
