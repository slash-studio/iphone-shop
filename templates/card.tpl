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
			<img src="/includes/uploads/{$good['image']}_b.jpg" class="main_img" />
			<a href="/includes/uploads/{$good['image']}.jpg" rel="gallery" class="more">+</a>
			{foreach $images item=image}
				<a href="/includes/uploads/{$image['id']}.jpg" rel="gallery" class="hidden"></a>
			{/foreach}
		</div>
		<div class="right">
			<h1>{$good['name']}</h1>
			<p class="description">
				{$good['description']}
			</p>
			<form id="card_form">
				<span class="price">{$good['price']}€</span>
				<button id="add_to_cart" class="white_button big_button" data="{$good['id']}">Add to cart</button>
			</form>
		</div>
	</article>
{/block}