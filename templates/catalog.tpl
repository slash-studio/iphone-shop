<div id="catalog">
   <table>
      {for $i=0 to $goods_count / 3}
         <tr>
            {for $j=0 to 2}
               <td>
                  {if ($i*3 + $j) < $goods_count}              
                     <article class="good">
                        <a href="/includes/card.php?id={$goods[$i*3 + $j]['id']}">
                           <img src="/includes/uploads/{$goods[$i*3 + $j]['image']}_m.jpg" />
                        </a>
                        <h1><a href="/includes/card.php?id={$goods[$i*3 + $j]['id']}">{$goods[$i*3 + $j]['name']}</a></h1>
                        <span class="price">{$goods[$i*3 + $j]['price']}€</span>
                     </article>
                  {/if}
               </td>
            {/for}
         </tr>
      {/for}
   </table>
</div>