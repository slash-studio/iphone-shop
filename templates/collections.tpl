{extends file='page.tpl'}
{block name='links' append}
	<link rel="stylesheet" href="/css/collection.css" />
	<link rel="stylesheet" href="/css/slider.css" />
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-capable" content="yes" /> 
	<script src="/js/jquery.iosslider.js"></script>
	<script>
		{literal}
			$(window).load(function() {
				$('.iosSlider').iosSlider({ 
					desktopClickDrag: true,
					autoSlide: true,
					infiniteSlider: true
				});
				$('#loading_div').hide();
                $('.iosSlider .slider img').show();
			});
		{/literal}
	</script>
{/block}
{block name='div.main'}
    <div id="loading_div">Loading...</div>
	<div class="responsiveHeight">
			<div class="inner">
				<div class="iosSlider">
					<div class="slider">
						<img src="/images/slider/1.jpg" />
						<img src="/images/slider/2.jpg" />
						<img src="/images/slider/3.jpg" />
						<img src="/images/slider/4.jpg" />
						<img src="/images/slider/5.jpg" />
						<img src="/images/slider/6.jpg" />
						<img src="/images/slider/7.jpg" />
						<img src="/images/slider/8.jpg" />
					</div>
				</div>
			</div>
		</div>
	</div>
{/block}