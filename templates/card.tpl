{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/card.css" rel="stylesheet" />
	<script src="/js/cart_interface.js"></script>
	<link href="/colorbox/colorbox.css" rel="stylesheet" />
	<script src="/colorbox/jquery.colorbox-min.js"></script>
	<script>
		{literal}
			$(function(){
				$("a[rel=gallery]").colorbox({rel:'gallery'});
			});
		{/literal}
	</script>
{/block}
{block name='div.main'}
	<article id="card">
		<div class="left">
			<img {if isset($good['image'])}src="/includes/uploads/{$good['image']}_b.jpg"{/if} class="main_img" />
			<a href="{if isset($good['image'])}/includes/uploads/{$good['image']}.jpg{else}#{/if}" rel="gallery" class="more">+</a>
			{foreach $images item=image}
				<a href="{if isset($good['image'])}/includes/uploads/{$image['id']}.jpg{else}#{/if}" rel="gallery" class="hidden"></a>
			{/foreach}
		</div>
		<div class="right">
			<h1>{if isset($good['name'])}{$good['name']}{else}Название товара{/if}</h1>
			<p class="description">
				{if isset($good['description'])}{$good['description']}{else}Описание{/if}
			</p>
			<form id="card_form">
				<span class="price">{if isset($good['price'])}{$good['price']} руб.{else}0 руб.{/if}</span>
				<button id="add_to_cart" class="white_button big_button" data="{$good['id']}">Add to cart</button>
			</form>
		</div>
	</article>
{/block}