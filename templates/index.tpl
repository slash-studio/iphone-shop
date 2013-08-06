{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/index.css" rel="stylesheet" />
{/block}
{block name='page'}
    <div id="floater">&nbsp;</div>
	<div id="center_block">
		<img src="/images/logo.jpg" class="logo">
		<div id="buttons">
			<a href="/includes/collections.php" class="button">Lookbook</a>
			<a href="/includes/shop.php" class="button">Shop</a>
			<a href="/includes/contacts.php" class="button">Contacts</a>
		</div>
	</div>
{/block}