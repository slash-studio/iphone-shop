{extends file='page.tpl'}
{block name='links' append}
	<link href="/css/shop.css" rel="stylesheet" />
	<link href="/css/slider.css" rel="stylesheet" />
	<link href="/css/slider_responsive.css" rel="stylesheet" />
	<script src="/js/jquery.slides.min.js"></script>
	<script>
		{literal}
		$(function() {
		  $('#slides').slidesjs({
			width: 738,
			height: 286,
			play: {
			  active: true,
			  auto: true,
			  interval: 4000,
			  swap: true
			}
		  });
		});
		{/literal}
		</script>
	<script src="/js/jquery.powerful-placeholder.min.js"></script>
	<script>
	{literal}
	  $(function(){
		$.Placeholder.init({color: "#aaa"});
	  });
	{/literal}
	</script>
{/block}
{block name='div.main'}
    <div class="container" style="width: 738px !important; height: 286px !important;">
		<div id="slides">
		    <img src="/images/slider/example-slide-1.jpg" alt="Photo by: Missy S Link: http://www.flickr.com/photos/listenmissy/5087404401/">
		    <img src="/images/slider/example-slide-2.jpg" alt="Photo by: Daniel Parks Link: http://www.flickr.com/photos/parksdh/5227623068/">
		    <img src="/images/slider/example-slide-3.jpg" alt="Photo by: Mike Ranweiler Link: http://www.flickr.com/photos/27874907@N04/4833059991/">
		    <img src="/images/slider/example-slide-4.jpg" alt="Photo by: Stuart SeegerLink: http://www.flickr.com/photos/stuseeger/97577796/">
		</div>
    </div>
	{include file='catalog.tpl'}
{/block}
