<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>授权证书</title>
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
	<i class="ui-icon-return" style="color:#E8E8E8" onClick="history.back()"></i><h1 style="color: #0C0C0C">授权证书</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace" style="margin:5px 0 5px 0" >
    <?php if(!empty($dl_number)): ?><p>名称：<?php echo ($dl_name); ?></p><?php endif; ?>
	<?php if(!empty($dl_number)): ?><p>编号：<?php echo ($dl_number); ?></p><?php endif; ?>
	<?php if(!empty($dl_weixin)): ?><p>微信：<?php echo ($dl_weixin); ?></p><?php endif; ?>
	<?php if(!empty($dl_tel)): ?><p>手机：<?php echo ($dl_tel); ?></p><?php endif; ?>
	<?php if(!empty($dl_tel)): ?><p>级别：<?php echo ($dlt_namestr); ?></p><?php endif; ?>
<!-- 	<?php if(!empty($dl_referee_str)): ?><p>当前推荐人：<?php echo ($dl_referee_str); ?></p><?php endif; ?>
	<?php if(!empty($dl_belong_str)): ?><p>当前上家：<?php echo ($dl_belong_str); ?></p><?php endif; ?> -->
	<!-- <?php if(!empty($shouquandate)): ?><p>有效期：<?php echo ($shouquandate); ?></p><?php endif; ?> -->
</div>
<div class="ui-whitespace" style="margin:5px 0 5px 0; text-align:center" >
<?php echo ($dl_picstr); ?>
</div>
</section>
</body>
</html>