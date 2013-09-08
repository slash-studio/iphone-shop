<!DOCTYPE HTML>
<meta charset="utf-8"><script src="/js/jquery.js"></script><!--[if lt IE 9]>
<html lang="ru"><head>
   <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
   <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
	<style>
		* {
			margin: 0;
			padding: 0;
		}

		article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section {
			display:block;
		}

		html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,img,ins,kbd,q,s,samp,small,strike,sub,sup,tt,var,dl,dt,dd,ol,ul,li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td { margin:0; padding:0; border:0; outline:0; font-weight:inherit; font-style:inherit; font-size:100%; font-family:inherit; vertical-align:baseline; }
		:focus { outline:0; }
		a:active { outline:none; }
		body { line-height:1; color:black; background:white; }
		ol,ul { list-style:none; }
		table { border-collapse:separate; border-spacing:0; }
		caption,th,td { text-align:left; font-weight:normal; }
		blockquote:before,blockquote:after,q:before,q:after { content:""; }
		blockquote,q { quotes:"" ""; }
		a { color: inherit; }

		body {
			color: black;
			font-size: 90%;
		}

		body * {
			font-family: 'Lucida Grande', Verdana, Arial, sans-serif;
		}
		#cart {
			margin: 20px auto 0;
			text-align: center;
		}
		#cart table {
			margin: 0 auto;
			text-align: center;
			border-collapse: collapse;
			width: 700px;
		}
		#cart table td {
			text-align: left;
			padding: 10px;
			vertical-align: middle;
			border: 1px #ddd solid;
			border-left: 0;
			border-right: 0;
		}
		#cart table td a {
			text-decoration: none;
		}
		#cart table td.image img {
			margin: 5px;
			width: 50px;
		}
		#cart table tr.head td {
			margin-bottom: 10px;
		}
		#cart table tr td.quantity input {
			width: 30px;
			border: 1px black solid;
			padding: 3px;
		}
		#mail_title {
			text-align: center;
		}
		.white_button {
			padding: 3px;
			border: 1px black solid;
			background: white;	
			cursor: pointer;
			text-decoration: none;
			font-size: 90%;
		}
		.big_button {
			padding: 5px 8px;
			min-width: 90px;
			margin-top: 30px;
			display: inline-block;
		}
	</style>
</head>	
<body>
    <h1 id="mail_title">Вы совершили покупку в магазине iGleb!</h1>
	<div id="cart">
			<table>
			   <tr class="head">
				  <td colspan="2">
					 Описание
				  </td>
				  <td>
					 Цена
				  </td>
				  <td>
					 Количество
				  </td>
				  <td>
					 Всего
				  </td>
			   </tr>
				{foreach $cart item=good}
				  <tr>
				  <td class="image">
						   <img src="{$host}/includes/uploads/{$good['image']}_s.jpg"></td>
						<td class="name">
						   <a href="{$host}/includes/card.php?id={$good['id']}">{$good['name']}</a>
						</td>
						<td class="price">
						   {$good['price']} руб.
						</td>
						<td class="quantity">{$good['count']}</td>
						<td class="price">
						   {$good['total']} руб.
						</td>
					 </tr>
				 {/foreach}
				 <tr class="head">
				 <td colspan="4">
					</td>
					<td>
					   Total: {$total} руб.
					</td>
				 </tr>
		</table>
		<a href="{$host}/cart_confirm/?h={$hash}&m={$email}&cn={$cart_num}" class="white_button big_button">Подтвердить заказ</a>
      </div>
	</body>
</html>