<div id="catalog">
   <table>
      {for $i=0 to $goods_count / 4}
         <tr>
            {for $j=0 to 3}
               <td>
                  {if ($i*4 + $j) < $goods_count}              
                     <article class="good">
                        <a href="/card/{$goods[$i*4 + $j]['id']}">
                           <img src="/includes/uploads/{$goods[$i*4 + $j]['image']}_m.jpg" />
                        </a>
                        <h1><a href="/card/{$goods[$i*4 + $j]['id']}">{$goods[$i*4 + $j]['name']}</a></h1>
                        <span class="price">{$goods[$i*4 + $j]['price']} руб.</span>
                     </article>
                  {/if}
               </td>
            {/for}
         </tr>
      {/for}
   </table>
</div>