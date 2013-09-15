<!DOCTYPE HTML>
<html lang="ru"><head><title>Apple tree phones</title>
<meta charset="utf-8"><link href="/css/style.css" rel="stylesheet">
</head><body>
   
   <div id="wrap" style="margin: 0 auto; width: 1160px;">
      <p><strong>Имя:&nbsp;</strong>{$user_name}</p>
      <p><strong>Телефон:&nbsp;</strong>{$user_phone}</p>
      <p><strong>Email:&nbsp;</strong>{$user_email}</p>
      <p><strong>Адрес:&nbsp;</strong>{$user_address|default:'Пусто'}</p>
      <p><strong>Доставка:&nbsp;</strong>{if {$user_delivery}}Да{else}Нет{/if}</p>
      {if {$user_delivery}}
         <p><strong>Тип доставки:&nbsp;</strong>{$delivery_name}</p>
      {/if}
            <div id="main" style="margin: 0 auto; text-align: center;">
         <div id="cart" style="margin: 20px auto 0; text-align: center;">
            <table style="border-collapse: collapse; margin: 0 auto; text-align: center; width: 700px;"><tr class="head"><td style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">Название</td>
                  <td style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">Цена</td>
                  <td style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">Количество</td>
                  <td style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">Всего</td>
               </tr>
               {assign var="total" value=0}
               {foreach $goods item=good}
                  {assign var="total" value=$total+$good.amount*$good.price}
               <tr><td class="name" style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle;">
                        {$good.name}
                     </td>
                     <td class="price" style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle;">
                        {$good.price} руб.
                     </td>
                     <td class="quantity" style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle;">
                        {$good.amount}
                     </td>
                     <td class="price" style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle;">
                        {$good.amount*$good.price} руб.
                     </td>
                  </tr>
                  {/foreach}
                  <tr class="head"><td colspan="3" style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">
                     </td>
                     <td style="border: 1px #ddd solid; border-left: 0; border-right: 0; padding: 10px; text-align: left; vertical-align: middle; margin-bottom: 10px;">
                        Итого: {$total|default:0} руб.
                     </td>
                  </tr></table></div>
      </div>
   </div>
   <footer style="font-size: 80%; margin: 20px 0; text-align: center;">
      ©2013 Apple tree, Vladivostok
   </footer></body></html>
