<header>
	<a href="/"><img id="header_logo" src="/images/logo.png" /></a>
	<nav>
		<ul>
			<li><a href="/cart" {if isset($active) && $active == 'cart'}class="active"{/if}>Корзина</a></li><li><a href="/catalog" {if isset($active) && $active == 'catalog'}class="active"{/if}>Каталог</a></li><li><a href="/delivery" {if isset($active) && $active == 'delivery'}class="active"{/if}>Оплата и доставка</a></li><li><a href="/contacts" {if isset($active) && $active == 'contacts'}class="active"{/if}>О нас</a></li><li><a href="/">Главная</a></li>
		</ul>
	</nav>
	<div id="search">
	    <form method="get" action="/search/">
		    <input type="text" id="q_text" name="q" autofocus placeholder="Поиск по сайту" value="{if isset($search_query)}{$search_query}{/if}" data="Поиск по сайту">
			<button id="search_button">s</button>
	    </form>
	</div>
</header>