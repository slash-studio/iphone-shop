<header>
	<a href="/"><img id="header_logo" src="/images/logo.png" /></a>
	<nav>
		<ul>
			<li><a href="/cart" {if isset($active) && $active == 'cart'}class="active"{/if}>Cart</a></li>
         <li><a href="/shop" {if isset($active) && $active == 'shop'}class="active"{/if}>Shop</a></li>
         <li><a href="/collections" {if isset($active) && $active == 'collections'}class="active"{/if}>Collections</a></li>
         <li><a href="/contacts" {if isset($active) && $active == 'contacts'}class="active"{/if}>Contacts</a></li><li><a href="/">Home</a></li>
		</ul>
	</nav>
	<div id="search">
	    <form method="get" action="/search/">
		    <input type="text" id="q_text" name="q" autofocus placeholder="Поиск по сайту" value="{if isset($search_query)}{$search_query}{else}Поиск по сайту{/if}" data="Поиск по сайту">
			<button id="search_button">s</button>
	    </form>
	</div>
</header>