{extends file='html.tpl'}
{block name='links' append}
   <script src="/js/jquery.jstree.js"></script>
   <script src="/js/category.js"></script>
   <script src="/js/admin_logout.js"></script>
   <link rel="stylesheet" type="text/css" href="/css/admin.css">
   {literal}
   <style type="text/css">
   #category_tree ul + li a {
      font-weight: bold !important;
   }
   </style>
   {/literal}
{/block}
{block name='page'}
    {include file='admin_menu.tpl'}
	<section id="categories_edit">
		<h1>Редактирование категорий</h1>
		  <div id="category_tree">
			{$category_tree|default:''}
		  </div>
		<div id="edit-box">
		   <input type="radio" id="in_add" name="sumbit_type" value="add" checked>
		   <label for="in_add">Добавление</label>
		   <input type="radio" id="in_change" name="sumbit_type" value="change" disabled>
		   <label for="in_change">Редактирование</label>
		  <form method="post" action="/admin/products" class="edit-form">
		  <fieldset>
			<legend>Добавление</legend>
			  <label for="category_id">Родительская категория</label>
			  <select name="category_id" id="category_id" style="margin-bottom: 3px">
			  <option value="-1" disabled>Без родителя</option>
			  {foreach from=$category item=cat}<option value='{$cat.id}'>{$cat.name}</option>{/foreach}
			  </select>
			<label for="category">Название категории</label>
			  <input type="text" name="category" id="category">
			<label for="alias">Адрес категории</label>
			  <input type="text" name="alias" id="alias">
			  <input type="text" name="id" id="id" style="display: none">
			<button type="submit" name="submit" class="white_button green big_button" value="add">Добавить</button>
			<button type="submit" name="submit" class="white_button red big_button" value="delete" style="display: none;">Удалить</button>
		  </fieldset>
		  </form>
		 </div>
	 </section>
{/block}