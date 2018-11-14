<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>下级代理查看</title>
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
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Dealer/brandlevel');?>"  ></i><h1>下级代理查看</h1>
</header>
<section class="ui-container" >

<ul class="ui-list  ui-border-tb">
<li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($dltinfo["dlt_name"]); ?></h4>
        </div>
</li>
</ul>


<ul class="ui-list ui-list-link  ui-border-tb">

<?php if(is_array($dllist)): foreach($dllist as $key=>$item): ?><li class="ui-border-t" data-href="<?php echo U('./Angels/Dealer/dealerdetail?dlid='.$item['dl_id'].'');?>"   >
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item["dl_name"]); ?> <?php if($item["dl_number"] != '' ): ?>(<?php echo ($item["dl_number"]); ?>)<?php endif; ?> <?php echo ($item["dlstt_name"]); ?></h4>
			<p class="ui-nowrap">微信号：<?php echo ($item["dl_weixin"]); ?>　　手机号：<?php echo ($item["dl_tel"]); ?></p>
			<p class="ui-nowrap">地址：<?php echo ($item["dl_address"]); ?></p>
        </div>
    </li><?php endforeach; endif; ?>
</ul>
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
</body>
</html>