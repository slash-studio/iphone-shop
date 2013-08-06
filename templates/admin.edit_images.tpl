{extends file='html.tpl'}
{block name='links' append}
	<link href="/css/admin_edit_images.css" rel="stylesheet" />
	<script src="/js/ajaxupload.3.5.js"></script>
	<script src="/js/admin_edit_images.js"></script>
{/block}
{block name='page'}
	<button class="white_button big_button" id="upload_photo" data="{$good_id}">Add photo</button>
	<div id="photos_div">
		{foreach $images item=image}
			<div class="in_image"><img src="/includes/uploads/{$image['id']}_s.jpg" /><button data="{$image['id']}">X</button></div>
		{/foreach}
	</div>
	<span id="status_photo"></span>
{/block}