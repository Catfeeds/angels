<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>我的返利</title>
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
    font-size: 36px;
    padding: 0;
    position: inherit;
}
</style>
</head>
<body ontouchstart="" >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1>我的返利</h1>
</header>
<section class="ui-container">
<ul class="ui-row">
<li class="ui-col ui-col-50">
<div style="border:solid 1px #dcdcdc; padding:20px 0 20px 0; text-align:center"><?php if($dl_name != ''): echo ($dl_name); endif; ?> <?php if($dl_weixin != ''): ?>(<?php echo ($dl_weixin); ?>)<?php endif; ?></div>
</li>
<li class="ui-col ui-col-50">
<div style="border:solid 1px #dcdcdc; border-left:none; padding:20px 0 20px 0; text-align:center"><?php echo (number_format($addfl,2,'.','')); ?>元</div>
</li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
    <!--九宫格-->
    <div class="weui-grids" style="margin-top: 9px;background-color: white">
        <a href="<?php echo U('./Angels/Fanli/fanlilist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/返利明细.png" alt="">
            </div>
            <p class="weui-grid__label">
                返利明细
            </p>
        </a>
        <a href="<?php echo U('./Angels/Fanli/paylist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/我应付返利.png" alt="">
            </div>
            <p class="weui-grid__label">
                我应付返利
            </p>
        </a>
        <a href="<?php echo U('./Angels/Fanli/receivelist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/我应收返利.png" alt="">
            </div>
            <p class="weui-grid__label">
                我应收返利
            </p>
        </a>
        <a href="<?php echo U('./Angels/Fanli/recashlist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/提现记录.png" alt="">
            </div>
            <p class="weui-grid__label">
                提现记录
            </p>
        </a>
        <a href="<?php echo U('./Angels/Fanli/salemonthly');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/按月业绩奖金.png" alt="">
            </div>
            <p class="weui-grid__label">
                按月业绩奖金
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/referee');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/推荐代理查看.png" alt="">
            </div>
            <p class="weui-grid__label">
                推荐代理查看
            </p>
        </a>


    </div>
    <!--九宫格-->
</section>

<script>

$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});


$('.ui-list li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});


</script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
</body>
</html>