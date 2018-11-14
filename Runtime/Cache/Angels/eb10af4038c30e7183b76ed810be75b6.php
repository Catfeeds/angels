<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理申请审核</title>
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
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1 style="color: #0C0C0C">代理申请审核</h1>
</header>
<section class="ui-container" style="margin-top: 3px">
<ul class="ui-list ui-list-text ui-list-link ui-border-tb">

<?php if(is_array($dllist)): foreach($dllist as $key=>$item): ?><li class="ui-border-t" >
        <div class="ui-list-info"   data-href="<?php echo U('./Angels/Dealer/applydetail?dlid='.$item['dl_id'].'');?>" >
            <h4 class="ui-nowrap"><?php echo ($item["dl_name"]); ?> <?php if($item["level_name"] != '' ): ?>(<?php echo ($item["level_name"]); ?>)<?php endif; echo ($item["dlstt_name"]); ?></h4>
			<p class="ui-nowrap">微信号:<?php echo ($item["dl_weixin"]); ?></p>
			<p class="ui-nowrap">手机号:<?php echo ($item["dl_tel"]); ?></p>
        </div>
<!-- 		<div class="ui-btn-s ui-btn-primary disabled" data-href="<?php echo U('./Angels/Dealer/applyactive?dlid='.$item['dl_id'].'');?>" >通过</div>
		<div class="ui-btn-s ui-btn-primary disabled" data-href="<?php echo U('./Angels/Dealer/applydelete?dlid='.$item['dl_id'].'');?>" >删除</div> -->
    </li><?php endforeach; endif; ?>
</ul>
</section>
<script>
$('.ui-btn-s').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-list-info').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});
</script>
</body>
</html>