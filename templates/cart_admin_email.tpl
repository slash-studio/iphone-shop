{extends file='html.tpl'}
{block name='links' append}
   <link href="/css/main.css" rel="stylesheet" />
   <link href="/css/header.css" rel="stylesheet" />
   <link href="/css/cart.css" rel="stylesheet" />
{/block}
{block name='page'}
   <div id="wrap">
      <p><strong>Имя:&nbsp;</strong>{$user_name}</p>
      <p><strong>Телефон:&nbsp;</strong>{$user_phone}</p>
      <p><strong>Email:&nbsp;</strong>{$user_email}</p>
      <p><strong>Адрес:&nbsp;</strong>{$user_address|default:'Пусто'}</p>
      <p><strong>Доставка:&nbsp;</strong>{if {$user_delivery}}Да{else}Нет{/if}</p>
      {if {$user_delivery}}
         <p><strong>Тип доставки:&nbsp;</strong>{$delivery_name}</p>
      {/if}
      <div id="main">
         <div id="cart">
            <table>
               <tr class="head">
                  <td>
                     Название
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
               {assign var="total" value=0}
               {foreach $goods item=good}
                  {assign var="total" value=$total+$good.amount*$good.price}
                  <tr>
                     <td class="name">
                        {$good.name}
                     </td>
                     <td class="price">
                        {$good.price} руб.
                     </td>
                     <td class="quantity">
                        {$good.amount}
                     </td>
                     <td class="price">
                        {$good.amount*$good.price} руб.
                     </td>
                  </tr>
               {/foreach}
                  <tr class="head">
                     <td colspan="3">
                     </td>
                     <td>
                        Итого: {$total|default:0} руб.
                     </td>
                  </tr>
            </table> 
         </div>
      </div>
   </div>
   <footer>
      ©2013 iGleb, Vladivostok
   </footer>
{/block}