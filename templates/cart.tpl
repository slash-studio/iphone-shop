{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/cart.css" rel="stylesheet" />
	<script src="/js/cart_interface.js"></script>
{/block}
{block name='div.main'}{include file='cart_table.tpl'}{/block}