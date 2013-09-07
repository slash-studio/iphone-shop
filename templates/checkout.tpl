{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/checkout.css" rel="stylesheet" />
	<script src="/js/checkout.js"></script>
	<link href="/colorbox/colorbox.css" rel="stylesheet" />
	<script src="/colorbox/jquery.colorbox-min.js"></script>
{/block}
{block name='div.main'}
	<section id="order_form">
		<form method="POST" action="#">
			<h1>Форма заказа</h1>
			<label for="name">Имя *</label>
			<input name="name" id="name" />
			<label for="name">Ваш телефон *</label>
			<input type="tel" name="tel" id="tel" />
			<label for="mail">Ваш e-mail *</label>
			<input type="mail" name="mail" id="mail" />
			<label for="delivery_yes">Нужна ли доставка? *</label>
			<input type="radio" name="delivery" id="delivery_yes" value="1" /><label for="delivery_yes" class="right">Да</label>
			<input type="radio" name="delivery" id="delivery_no" value="0" /><label for="delivery_no" class="right">Нет</label>
			<div id="vlad_section">
				<label for="vlad_yes">Вы из Владивостока? *</label>
				<input type="radio" name="vlad" id="vlad_yes" value="1" /><label for="vlad_yes" class="right">Да</label>
				<input type="radio" name="vlad" id="vlad_no" value="0" /><label for="vlad_no" class="right">Нет</label>
				<label for="adress">Ваш адрес *</label>
				<textarea name="adress" id="adress" cols="30" rows="3"></textarea>
				<div id="delivery_section">
					<label>Тип доставки *</label>
					{if !($delivery_types|@count == 0)}
						{foreach from=$delivery_types item=type}
							<input type="radio" name="delivery_type" id="dtype_{$type.id}" value="{$type.name}" /><label for="dtype_{$type.id}" class="right">{$type.name}</label>
						{/foreach}
					{else}
						<p style="font-weight: bold">Невозможно выбрать тип доставки. Проблема с подключением к базе данных.</p>
					{/if}
				</div>
				<div id="no_delivery">
					Доставка бесплатна!
				</div>
			</div>
			<button class="white_button big_button" id="checkout">Подтвердить</button>
			<small>* - поля обязательные для заполнения</small>
		</form>
	</section>
{/block}