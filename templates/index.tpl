{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/shop.css" rel="stylesheet" />
	<link href="/css/slider.css" rel="stylesheet" />

	<link href="/css/slider.css" rel="stylesheet" />
	<script src="/js/jquery.slides.min.js"></script>
	{literal}
	<script>
	$(function() {
		$('#slides').slidesjs({
			width: 940,
			height: 528,
			navigation: false,
			start: 3,
			play: {
				auto: true
			}
		});
	});
	</script>
<style>
    #slides {
      display: none
    }

    .container {
      margin: 0 auto
    }
  </style>
	{/literal}
{/block}
{block name='div.main'}
{if isset($category_tree)}<nav id="shop_menu">{$category_tree}</nav>{/if}
<!--
	<div class='container'>
		<div id='slides'>
			{foreach from=$slider_images item=img}<img src='/images/slider/{$img}' alt='main_slider_image' />{/foreach}
			<a href="#" class="slidesjs-previous slidesjs-navigation"><img src="images/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
			<a href="#" class="slidesjs-next slidesjs-navigation"><img src="images/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
		</div>
	</div>	-->
	{include file='catalog.tpl'}
{/block}
