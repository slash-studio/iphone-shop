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
   <form method="get" action="/search/">
      <input type="submit" value="">
      <input type="text" name="q" value="{$search_query|default:'поиск по сайту'}" data="поиск по сайту" style="color: rgb(0, 0, 0);">
   </form>
</header>