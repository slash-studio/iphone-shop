{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/shop.css" rel="stylesheet" />
	<link href="/css/slider.css" rel="stylesheet" />
	<link href="/css/slider_responsive.css" rel="stylesheet" />
	<script src="/js/jquery.slides.min.js"></script>
	<script>
		{literal}
		$(function() {
		  $('#slides').slidesjs({
			width: 1160,
			height: 286,
			play: {
			  active: true,
			  auto: true,
			  interval: 4000,
			  swap: true
			}
		  });
		});
		{/literal}
		</script>
	<script src="/js/jquery.powerful-placeholder.min.js"></script>
	<script>
	{literal}
	  $(function(){
		$.Placeholder.init({color: "#aaa"});
	  });
	{/literal}
	</script>
{/block}
{block name='div.main'}
	<div class="container" style="width: 1160px !important; height: 286px !important;">
		{if isset($slider_images)}
		<div id="slides">
			{foreach from=$slider_images item=img}
				<img src="/images/slider/{$img}" />
			{/foreach}
		</div>
		{/if}
	</div>
	{include file='catalog.tpl'}
{/block}
