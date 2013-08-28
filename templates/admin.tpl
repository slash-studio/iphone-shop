{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/admin.css" rel="stylesheet" />
	<link href="/colorbox/colorbox.css" rel="stylesheet" />
	<script src="/colorbox/jquery.colorbox-min.js"></script>
	<script src="/js/admin.js"></script>
{/block}
{block name='page'}
	<div id="main">
		<div id="main_area">
			<article id="goods">
				<a href="/admin/edit_good.php" id="add_new" class="white_button big_button">Add new good</a>
				<a href="/admin/edit_category.php" id="add_new" class="white_button big_button">Edit category</a>
				<table>
					<tr class="head">
						<td>
							Display
						</td>
						<td colspan="2">
							Description
						</td>
						<td>
							Category
						</td>
						<td>
							Price
						</td>
						<td>
							Keywords
						</td>
						<td colspan="2">
							Edit
						</td>
						<td>
							Delete
						</td>
					</tr>
					{foreach from = $goods item=good}
					<tr>
						<td>
							{if $good['display'] == 1} Yes {else} No {/if}
						</td>
						<td class="image">
							<a href="/admin/edit_images.php?id={$good['id']}" class="edit_images" title="Edit images">
								<img src="/includes/uploads/{$good['image']}_s.jpg" />
							</a>
						</td>
						<td class="name">
							<a href="/includes/card.php?id={$good['id']}">{$good['name']}</a>
						</td>
						<td>
							{$good['category']}
						</td>
						<td class="price">
							{$good['price']} r
						</td>
						<td class="sizes" colspan="2">
							{$good['keywords']}
						</td>
						<td>
							<a href="/admin/edit_good.php?id={$good['id']}" class="white_button edit">Change</a>
						</td>
						<td>
							<button id="d{$good['id']}" class="delete white_button">Remove</button>
						</td>
					</tr>
					{/foreach}
				</table>
			</article>
		</div>
	</div>
{/block}