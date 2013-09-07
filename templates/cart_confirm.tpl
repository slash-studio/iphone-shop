{extends file='page.tpl'}
{block name='div.main'}
   {if $isError|default:true}
      <p style="font-weight: bold">Возникла ошибка при подтверждении заказа</p>
   {else}
      <p style="font-weight: bold">Вы успешно подтвердили заказ!</p>
   {/if}
{/block}