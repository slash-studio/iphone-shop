{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/admin_edit_good.css" rel="stylesheet" />
	<script src="/js/admin_edit_good.js"></script>
{/block}
{block name='page'}
	<form id="edit_good" name="edit_good">
		<div class="inline">
			<div class="block">
				<label for="g_name">Name</label>
				<input id="g_name" name="g_name" value="{$good['name']}" />
			</div>
			<div class="block">
				<label for="g_price">Price</label>
				<input id="g_price" name="g_price" value="{$good['price']}" />
			</div>
			<div class="block">
				<label>Sizes</label>
				<div class="inline">
					<label for="g_size_s">S</label>
					<input type="checkbox" name="g_size" id="g_size_s" value="S" {if $good['sizes']['S']}checked="checked"{/if} />
				</div>
				<div class="inline">
					<label for="g_size_m">M</label>
					<input type="checkbox" name="g_size" id="g_size_m" value="M" {if $good['sizes']['M']}checked="checked"{/if} />
				</div>
				<div class="inline">
					<label for="g_size_l">L</label>
					<input type="checkbox" name="g_size" id="g_size_l" value="L" {if $good['sizes']['L']}checked="checked"{/if} />
				</div>
				<div class="inline">
					<label for="g_size_xl">XL</label>
					<input type="checkbox" name="g_size" id="g_size_xl" value="XL" {if $good['sizes']['XL']}checked="checked"{/if} />
				</div>
			</div>
			<div class="block">
				<label for="g_description">Description</label>
				<textarea id="g_description" name="g_description" cols="40" rows="6">{$good['description']}</textarea>
			</div>
			<div class="block">
				<label for="g_display">Display</label>
				<input type="checkbox" id="g_display" name="g_display" {if $good['display']}checked="checked"{/if} />
			</div>
		</div>
		<div class="block">
			<button class="white_button big_button save" id="{$mode}" data="{$good['id']}">Add changes</button>
		</div>
	</form>
{/block}