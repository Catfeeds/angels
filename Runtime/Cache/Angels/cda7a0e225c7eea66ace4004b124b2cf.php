<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>提现详细</title>
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

</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" onClick="history.back()"  ></i><h1>提现详细</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace">
　
</div>
<ul class="ui-list ui-list-text  ui-border-tb">
    <li class="ui-border-t">
        <h4 class="ui-nowrap">开户银行：<?php echo ($recashinfo["rc_bankstr"]); ?> </h4>
    </li>
	 <li class="ui-border-t">
        <h4 class="ui-nowrap">卡号/账号：<?php echo ($recashinfo["rc_bankcardstr"]); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">卡号姓名：<?php echo ($recashinfo["rc_name"]); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">提取金额：<?php echo ($recashinfo["rc_moneystr"]); ?> 元</h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">提现时间：<?php echo (date('Y-m-d H:i:s',$recashinfo["rc_addtime"])); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">付款代理：<?php if(!empty($recashinfo["fl_sdl_name"])): echo ($recashinfo["fl_sdl_name"]); endif; ?> <?php if(!empty($recashinfo["fl_sdl_username"])): ?>(<?php echo ($recashinfo["fl_sdl_username"]); ?>)<?php endif; ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">处理状态：<?php echo ($recashinfo["rc_statestr"]); ?></h4>
    </li>
	<li class="ui-border-t">
        <h4 class="ui-nowrap">凭证：<?php echo ($recashinfo["rc_pic_str"]); ?></h4>
    </li>
	
	<li class="ui-border-t">
        <h4 class="ui-nowrap">处理时间：<?php if(($recashinfo["rc_dealtime"] > 0)): echo (date('Y-m-d H:i:s',$recashinfo["rc_dealtime"])); endif; ?></h4>
    </li>

	<li class="ui-border-t">
        <h4 class="ui-nowrap">处理备注：<?php echo (nl2br($recashinfo["rc_remark"])); ?></h4>
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