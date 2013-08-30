{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/checkout.css" rel="stylesheet" />
	<script src="/js/checkout.js"></script>
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
					<input type="radio" name="delivery_type" id="ems" value="d_ems" /><label for="d_ems" class="right">EMS</label>
					<input type="radio" name="delivery_type" id="emd1" value="d_emd1" /><label for="d_emd1" class="right">emd1</label>
					<input type="radio" name="delivery_type" id="d_govno" value="d_govno" /><label for="d_govno" class="right">Почта россии</label>
				</div>
				<div id="no_delivery">
					Доставка бесплатна!
				</div>
			</div>
			<button class="white_button big_button">Подтвердить</button>
			<small>* - поля обязательные для заполнения</small>
		</form>
	</section>
{/block}