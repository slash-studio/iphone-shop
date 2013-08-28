{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/admin_edit_good.css" rel="stylesheet" />
	<script src="/js/admin_edit_good.js"></script>
{/block}
{block name='page'}
	<form id="edit_good" name="edit_good">
		<div class="inline">
			<div class="block">
				<label for="g_name">Название</label>
				<input id="g_name" name="g_name" value="{$good['name']}" />
			</div>
			<div class="block">
				<label for="g_category_id">Категория</label>
				<input id="g_category_id" name="g_category_id" value="{$good['category_id']}" />
			</div>
			<div class="block">
				<label for="g_price">Цена</label>
				<input id="g_price" name="g_price" value="{$good['price']}" />
			</div>
			<div class="block">
				<label for="g_old_price">Старая цена</label>
				<input id="g_old_price" name="g_old_price" value="{$good['old_price']}" />
			</div>
			<div class="block">
				<label for="g_description">Описание</label>
				<textarea id="g_description" name="g_description" cols="40" rows="6">{$good['description']}</textarea>
			</div>
			<div class="block">
				<label for="g_keywords">Ключевые слова</label>
				<textarea id="g_keywords" name="g_keywords" cols="40" rows="6">{$good['keywords']}</textarea>
			</div>
			<div class="block">
				<label for="g_display">Показывать на сайте</label>
				<input type="checkbox" id="g_display" name="g_display" {if $good['display']}checked="checked"{/if} />
			</div>
		</div>
		<div class="block">
			<button class="white_button big_button save" id="{$mode}" data="{$good['id']}">Add changes</button>
		</div>
	</form>
{/block}