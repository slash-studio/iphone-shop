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
<nav id="shop_menu">
	<ul>
		<li><a href="#" class="parent">iPhone</a>
		<ul>
			<li><a href="#">Мега</a></li><li><a href="#">Ультра</a></li>
		</ul></li><li><a href="#">iPod</a></li><li><a href="#">iPad</a></li><li><a href="#" class="parent">Аксессуары</a>
		<ul>
			<li><a href="#" class="parent">Чехлы</a>
				<ul>
					<li><a href="#">Gem</a></li><li><a href="#">Devine Rapier</a></li><li><a href="#">MaelStorm</a></li><li><a href="#">Hyperstone</a></li>
				</ul>
			</li><li><a href="#" class="parent">Няшки</a>
				<ul>
					<li><a href="#">Ня-Ня-Ня</a></li><li><a href="#">Лю-Лю-Лю</a></li>
				</ul>
			</li>
		</ul>
		</li><li><a href="#" class="parent">Прочее</a>
		<ul>
			<li><a href="#">Зарядки</a></li><li><a href="#">Колонки</a></li><li><a href="#">Блудсикер</a></li>
		</ul></li>
	</ul>
</nav>
<!--
	<div class='container'>
		<div id='slides'>
			{foreach from=$slider_images item=img}<img src='/images/slider/{$img}' alt='main_slider_image' />{/foreach}
			<a href="#" class="slidesjs-previous slidesjs-navigation"><img src="images/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
			<a href="#" class="slidesjs-next slidesjs-navigation"><img src="images/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
		</div>
	</div>	-->
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
