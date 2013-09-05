{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/admin.css" rel="stylesheet" />
	<link href="/colorbox/colorbox.css" rel="stylesheet" />
	<script src="/colorbox/jquery.colorbox-min.js"></script>
	<script src="/js/admin.js"></script>
	<script src="/js/admin_logout.js"></script>
{/block}
{block name='page'}
	<div id="main">
		{include file='admin_menu.tpl'}
		<div id="main_area">
			<article id="goods">
				<a href="/admin/edit_good.php" id="add_new" class="white_button big_button">Добавить товар</a>
				<table>
					<tr class="head">
						<td>
							+
						</td>
						<td>
							На главной
						</td>
						<td colspan="2">
							Описание
						</td>
						<td>
							Категория
						</td>
						<td>
							Цена
						</td>
						<td>
							Тэги
						</td>
						<td colspan="2">
							Редактировать
						</td>
						<td>
							Удалить
						</td>
					</tr>
					{foreach from = $goods item=good}
					<tr>
						<td>
							{if $good['display'] == 1} Да {else} Нет {/if}
						</td>
						<td>
							{if $good['main_display'] == 1} Да {else} Нет {/if}
						</td>
						<td class="image">
							<a href="/admin/edit_images.php?id={$good['id']}" class="edit_images" title="Редактирование фото">
								<img src="/includes/uploads/{$good['image']}_s.jpg" />
							</a>
						</td>
						<td class="name">
							<a href="/card/{$good['id']}">{$good['name']}</a>
						</td>
						<td>
							{$categories[$good['category_id']]}
						</td>
						<td class="price">
							{$good['price']} руб.
						</td>
						<td class="sizes" colspan="2">
							{$good['keywords']}
						</td>
						<td>
							<a href="/admin/edit_good.php?id={$good['id']}" class="white_button edit">Изменить</a>
						</td>
						<td>
							<button id="d{$good['id']}" class="delete white_button">Удалить</button>
						</td>
					</tr>
					{/foreach}
				</table>
			</article>
		</div>
	</div>
{/block}