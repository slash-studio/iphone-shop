<div id="cart">
   <table>
      <tr class="head">
         <td colspan="2">
            Описание
         </td>
         <td>
            Цена
         </td>
         <td>
            Количество
         </td>
         <td>
            Всего
         </td>
      </tr>
      {foreach $cart item=good}
         <tr>
            <td class="image">
               <img src="/includes/uploads/{$good['image']}_s.jpg" />
            </td>
            <td class="name">
               <a href="/includes/card.php?id={$good['id']}">{$good['name']}</a>
            </td>
            <td class="price">
               {$good['price']} руб.
            </td>
            <td class="quantity">
               <input value="{$good['count']}" /> <button class="white_button" data="{$good['c_id']}">Обновить</button>
            </td>
            <td class="delete">
               <button class="white_button" data="{$good['c_id']}">Удалить</button>
            </td>
            <td class="price">
               {$good['total']} руб.
            </td>
         </tr>
      {/foreach}
         <tr class="head">
            <td colspan="5">
            </td>
            <td>
               Итого: {$total} руб.
            </td>
         </tr>
   </table>
   <button id="clear" class="white_button big_button">Удалить все</button>
   <button id="checkout" class="white_button big_button">Заказать</button>
</div>