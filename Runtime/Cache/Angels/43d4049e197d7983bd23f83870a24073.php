<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>新闻详细</title>
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
iframe{ width:100%}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white" >
	<i class="ui-icon-return" style="color:#E8E8E8" onClick="history.back()"></i>
	<h1 style="color: #0C0C0C">新闻详细</h1>
</header>
<section class="ui-container" >
<div style="text-align:center">
<?php echo ($newsinfo["news_pic_str"]); ?>
</div>

<ul class="ui-list ui-list-text  ui-border-tb" > 
    <li class="ui-border-t">
        <p class="ui-nowrap"><b><?php echo ($newsinfo["news_title"]); ?></b></p>
    </li>
	 <li class="ui-border-t">
        <p class="ui-nowrap"><?php echo (date('Y-m-d H:i:s',$newsinfo["news_addtime"])); ?></p>
    </li>

</ul>
<div class="ui-whitespace" style="background-color:#FFFFFF; padding:15px" id="newsdesc" >
<?php echo ($newsinfo["news_content"]); ?>
</div>

</section>
<script>


$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

window.onload = window.onresize = function () {
    resizeIframe();
}
var resizeIframe=function(){
    var bodyw=document.body.clientWidth;
    for(var ilength=0;ilength<=document.getElementsByTagName("iframe").length;ilength++){

        document.getElementsByTagName("iframe")[ilength].height = bodyw*3/4;//设定高度

    }
}
</script>
</body>
</html>