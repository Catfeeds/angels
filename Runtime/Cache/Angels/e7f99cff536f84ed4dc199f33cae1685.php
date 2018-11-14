<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>我的地址</title>
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
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1 style="color: #0C0C0C">我的地址</h1>
</header>
<section class="ui-container" style="margin-top: 3px">
<ul class="ui-list ui-list-text  ui-border-tb">

<?php if(is_array($addresslist)): foreach($addresslist as $key=>$item): ?><li class="ui-border-t"  >
	 <div class="ui-list-info timeList">
        <h4 class="ui-nowrap"><?php echo ($item['dladd_contact']); ?> <?php echo ($item['dladd_diqustr']); ?> </h4>
		<p class="ui-nowrap ">收货人：<?php echo ($item['dladd_contact']); ?></p>
		<p class="ui-nowrap ">所在地区：<?php echo ($item['dladd_diqustr']); ?></p>
		<p class="ui-nowrap ">地址：<?php echo ($item['dladd_address']); ?></p>
		<p class="ui-nowrap ">电话：<?php echo ($item['dladd_tel']); ?></p>
	 </div>
	 <?php if($item["dladd_default"] == 1 ): ?><div class="ui-btn-s ui-btn-danger"   >默认</div> 
	 <?php else: ?>
	 <div class="ui-btn-s ui-btn-primary" data-href="<?php echo U('./Angels/Orders/defaultaddress?addid='.$item['dladd_id'].'');?>" >设默认</div><?php endif; ?>
	 <div class="ui-btn-s ui-btn-primary" data-href="<?php echo U('./Angels/Orders/updateaddress?addid='.$item['dladd_id'].'');?>" >编辑</div>
    </li><?php endforeach; endif; ?>

	
</ul>
<div class="ui-form ui-border-t">


		

<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="addaddress"   data-href="<?php echo U('./Angels/Orders/addaddress');?>"  >
        + 新增地址
    </button>
</div>

</div>
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


$('#addaddress').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-btn-s').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

</script>
</body>
</html>