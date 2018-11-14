<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理申请详细</title>
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
<!--<style>-->
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
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Dealer/applylist');?>" ></i><h1>代理申请详细</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace">
　
</div>
<ul class="ui-list ui-list-text  ui-border-tb">
    <li class="ui-border-t">
        <h4 class="ui-nowrap">姓名：<?php echo ($dlinfo["dl_name"]); ?></h4>
    </li>
	 <li class="ui-border-t">
        <h4 class="ui-nowrap">微信号：<?php echo ($dlinfo["dl_weixin"]); ?></h4>
    </li>
	 <li class="ui-border-t">
        <h4 class="ui-nowrap">手机号：<?php echo ($dlinfo["dl_tel"]); ?></h4>
    </li>
    <li class="ui-border-t">
        <h4 class="ui-nowrap">地区：<?php echo ($dlinfo["dl_qustr"]); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">地址：<?php echo ($dlinfo["dl_address"]); ?></h4>
    </li>
	 <li class="ui-border-t">
        <h4 class="ui-nowrap">身份证：<?php echo ($dlinfo["dl_idcard"]); ?></h4>
    </li>
	<?php if(($dlinfo["dl_idcardpic_str"]) != ""): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">身份证图片：<br><?php echo ($dlinfo["dl_idcardpic_str"]); ?></h4>
    </li><?php endif; ?>
	<?php if(($dlinfo["dl_idcardpic2_str"]) != ""): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">身份证图片：<br><?php echo ($dlinfo["dl_idcardpic2_str"]); ?></h4>
    </li><?php endif; ?>
    <?php if(($dlinfo["dlt_name"]) != ""): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">代理级别：<?php echo ($dlinfo["dlt_name"]); ?></h4>
    </li><?php endif; ?>
	<?php if(($dlinfo["dlstt_name"]) != ""): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">门店级别：<?php echo ($dlinfo["dlstt_name"]); ?></h4>
    </li><?php endif; ?>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">申请时间：<?php echo (date('Y-m-d H:i:s',$dlinfo["dl_addtime"])); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">推荐人：<?php echo ($dlinfo["dl_referee_str"]); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">上家代理：<?php echo ($dlinfo["dl_belong_str"]); ?></h4>
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