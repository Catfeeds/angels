<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>产品详细</title>
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
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Product/index');?>"  ></i><h1 style="color: #0C0C0C">产品详细</h1>
</header>
<section class="ui-container" >
<div>
<?php echo ($proinfo["pro_pic_str"]); ?>
</div>

<ul class="ui-list ui-list-text  ui-border-tb" >
    <li class="ui-border-t">
        <p class="ui-nowrap">产品名称：<?php echo ($proinfo["pro_name"]); ?></p>
    </li>
	 <li class="ui-border-t">
        <p class="ui-nowrap">产品编号：<?php echo ($proinfo["pro_number"]); ?></p>
    </li>
	<?php if(($proinfo["pro_price"] != '') AND ($proinfo["pro_price"] != '0') ): ?><li class="ui-border-t">
        <p class="ui-nowrap">统一零售价：<?php echo (number_format($proinfo["pro_price"],2,'.','')); ?> 元</p>
    </li><?php endif; ?>
	<?php if(($proinfo["pro_link"] != '') ): ?><li class="ui-border-t">
	<a href="<?php echo ($proinfo["pro_link"]); ?>" style="text-align:center" target="_blank" >点击购买</a>
	</li><?php endif; ?>


</ul>
<div class="ui-whitespace" style="background-color:#FFFFFF; padding:15px"  id="prodesc">
<?php echo ($proinfo["pro_desc"]); ?>
</div>

</section>
<script>


$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});
</script>
</body>
</html>