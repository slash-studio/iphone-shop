{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/main.css" rel="stylesheet" />
	<link href="/css/header.css" rel="stylesheet" />
{/block}
{block name='page'}
	<div id="wrap">
		{include file='header.tpl'}
		<div id="main">
			{if isset($category_tree)}<nav id="shop_menu">{$category_tree}</nav>{/if}
			{block name='div.main'}{/block}
		</div>
	</div>
	<footer>
		©2013 iGleb, Vladivostok
	</footer>
{/block}