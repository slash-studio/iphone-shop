<header>
	<a href="/"><img id="header_logo" src="/images/header_logo.jpg" /></a>
	<nav>
		<ul>
			<li><a href="/includes/cart.php" {if $active == 'cart'}class="active"{/if}>Cart</a></li>
			<li><a href="/includes/shop.php" {if $active == 'shop'}class="active"{/if}>Shop</a></li>
			<li><a href="/includes/collections.php" {if $active == 'collections'}class="active"{/if}>Collections</a></li>
			<li><a href="/includes/contacts.php" {if $active == 'contacts'}class="active"{/if}>Contacts</a></li>
			<li><a href="/">Home</a></li>
		</ul>
	</nav>
</header>