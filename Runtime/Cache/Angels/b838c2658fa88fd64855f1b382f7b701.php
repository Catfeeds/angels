<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>关注微信</title>
<link rel="stylesheet" type="text/css" href="/Public/angels/css/frozen.css" />
<link rel="stylesheet" type="text/css" href="/Public/angels/css/app.css" />
<link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
<!--<style type="text/css">-->
    <!--.ui-header ui-header-positive ui-border-b {-->
        <!--background-color: white;-->
     <!--}-->
    <!--.ui-header ui-header-positive ui-border-b i{-->
        <!--color:#E8E8E8;-->
    <!--}-->
    <!--.ui-header ui-header-positive ui-border-b h1{-->
        <!--color: #0C0C0C;-->
    <!--}-->
<!--</style>-->
<script type="text/javascript" src="/Public/angels/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/angels/js/frozen.js"></script>
<script type="text/javascript" src="/Public/angels/js/app.js"></script>
<style>

</style>
</head>
<body ontouchstart="" >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>"  ></i><h1 style="color: #0C0C0C">关注微信</h1>
</header>
<section class="ui-container">
<div class="ui-whitespace">
<p>　</p>
<p >请通过以下三种方式关注：</p>
<p>　</p>
</div>
<ul class="ui-list ui-list-text  ui-border-tb">
    <li class="ui-border-t">
        <h4  class="ui-nowrap" >1、官方微信： 请搜索公众号"泰国安吉思燕窝"</h4>
    </li>
    <li class="ui-border-t">
	    <div class="ui-list-info">
        <h4  class="ui-nowrap">2、通过长按二维码关注"泰国安吉思燕窝"</h4>
		<p  class="ui-nowrap"  style="padding-left:18px"><img src="/Public/angels/static/weixin.jpg"  style="width:90%"></p>
		</div>
    </li>
    <li class="ui-border-t">
        <h4  class="ui-nowrap" >3、<a href="<?php echo ($bas_content); ?>" >从这里进入文章,点击蓝色小字关注</a></h4>
    </li>
</ul>
</section>
<script>
(function (){
	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});
})();
</script>
</body>
</html>