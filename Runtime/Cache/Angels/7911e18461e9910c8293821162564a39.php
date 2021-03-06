<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>选择收货地址</title>
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
.thumbhidden{display:none}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return"  data-href="<?php echo U('./Angels/Orders/checkshopcart?dladd_id='.$dladd_id.'');?>"  ></i><h1>选择收货地址</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text  ui-border-tb">

<?php if(is_array($addresslist)): foreach($addresslist as $key=>$item): ?><li class="ui-border-t"   >
	
	<div class="ui-list-thumb-s <?php if($item["dladd_id"] == $dladd_id ): else: ?>thumbhidden<?php endif; ?> " >
            <span style="background-image:url(/Public/angels/static/selected.png)"></span>
    </div>
	
	 <div class="ui-list-info"  data-href="<?php echo U('./Angels/Orders/checkshopcart?dladd_id='.$item['dladd_id'].'');?>" >
        <h4 class="ui-nowrap"><?php echo ($item['dladd_contact']); ?> <?php echo ($item['dladd_tel']); ?> </h4>
		<p class="ui-nowrap "><?php echo ($item['dladd_address']); ?></p>
	 </div>
	 <div class="ui-btn-s ui-btn-primary" data-href="<?php echo U('./Angels/Orders/updateaddress?addid='.$item['dladd_id'].'&f=1');?>" >编辑</div>
    </li><?php endforeach; endif; ?>

	
</ul>

<div class="ui-form ui-border-t">

<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="addaddress"   data-href="<?php echo U('./Angels/Orders/addaddress?f=1');?>"  >
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

$('.ui-btn-s').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-list li .ui-list-info').click(function(){
	if($(this).data('href')){
	    $('.ui-list li .ui-list-thumb-s').hide();
	    $(this).parent().find('.ui-list-thumb-s').show();
		location.href= $(this).data('href');
	}
});


$('#addaddress').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});



</script>
</body>
</html>