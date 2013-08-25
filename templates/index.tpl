{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/shop.css" rel="stylesheet" />
	<script src="/js/jquery.slides.min.js"></script>
	{literal}
	<script>
		$(function() {
			$('#slides').slidesjs({
				width: 940,
				height: 528,
				play: {
				 active: true,
				 auto: true,
				 interval: 4000,
				 swap: true
				}
			});
		});
	</script>
	{/literal}
{/block}
{block name='div.main'}
	<div id='slides'>
		{foreach from=$slider_images item=img}<img src='/images/slider/{$img}' alt='main_slider_image' />{/foreach}
	</div>
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
{/block}