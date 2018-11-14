<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理调级</title>
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
<link rel="stylesheet" type="text/css" href="/Public/angels/css/font.css" />
<style>
.ui-border-t span.jicon {
    color: rgb(0, 0, 0);
    font-size: 40px;
    padding: 0;
    position: inherit;
}

</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Dealer/index');?>" ></i><h1 style="color: #0C0C0C">代理调级</h1>
</header>
<section class="ui-container" style="margin-top: 3px">

<ul class="ui-list ui-list-text ui-list-link ui-border-tb">
    <li class="ui-border-t" data-href="<?php echo U('./Angels/Dealer/updatedltype');?>" >
        <div class="ui-list-thumb">
            <span class="jicon  arrow-up-2"></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap">申请调级</h4>
			<p class="ui-nowrap">申请代理调级</p>
        </div>
		
    </li>
    <li class="ui-border-t" data-href="<?php echo U('./Angels/Dealer/myupdatedltypelist');?>" >
        <div class="ui-list-thumb">
            <span  class="jicon user" ></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap">我的申请调级</h4>
            <p class="ui-nowrap">查看我的申请调级</p>
        </div>
    </li>
	<li class="ui-border-t" data-href="<?php echo U('./Angels/Dealer/dlupdatedltypelist');?>" >
        <div class="ui-list-thumb">
            <span  class="jicon users" ></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap">下级申请调级</h4>
            <p class="ui-nowrap">查看下级申请调级</p>
        </div>
    </li>
</ul>
</section>

<script>

$('.ui-list li').click(function(){
	if($(this).data('href')){
	    if($(this).data('href')=='quit'){
	        $(".ui-dialog").css('display','-webkit-box');
	        $(".ui-dialog-cnt").css('display','block');
		}else{
		    location.href= $(this).data('href');
		}
	}
});

$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});



</script>

</body>
</html>