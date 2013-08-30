{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/checkout.css" rel="stylesheet" />
	<script src="/js/checkout.js"></script>
{/block}
{block name='div.main'}
	<form method="POST" action="#">
		<h1>Форма заказа</h1>
		<label for="name">Имя *</label>
		<input name="name" id="name" />
		<label for="name">Ваш телефон *</label>
		<input type="tel" name="tel" id="tel" />
		<label for="mail">Ваш e-mail *</label>
		<input type="mail" name="mail" id="mail" />
		<label for="delivery_yes">Нужна ли доставка? *</label>
		<input type="radio" name="delivery" id="delivery_yes" value="1" /><label for="delivery_yes">Да</label>
		<input type="radio" name="delivery" id="delivery_no" value="0" checked="checked" /><label for="delivery_no">Нет</label>
		<div id="vlad_section">
			<label for="vlad_yes">Вы из владивостока? *</label>
			<input type="radio" name="vlad" id="vlad_yes" value="1" checked="checked" /><label for="vlad_yes">Да</label>
			<input type="radio" name="vlad" id="vlad_no" value="0" /><label for="vlad_no">Нет</label>
			<div id="delivery_section">
				<label>Тип доставки *</label>
				<input type="radio" name="delivery_type" id="ems" value="EMS" /><label for="d_ems">EMS</label>
				<input type="radio" name="delivery_type" id="emd1" value="emd1" /><label for="d_emd1">emd1</label>
				<input type="radio" name="delivery_type" id="d_govno" value="Почта россии" /><label for="d_govno">Почта россии</label>
			</div>
			<div id="no_delivery">
				Доставка бесплатна!
			</div>
			<div id="end_section">
				<label for="adress">Ваш адрес *</label>
				<textarea name="adress" id="adress"></textarea>
				<button id="checkout">Подтвердить</button>
			</div>
		</div>
		<small>* - поля обязательные для заполнения</small>
	</form>
{/block}