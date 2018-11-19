<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>我应收返利</title>
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
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Fanli/index');?>"  ></i><h1>我应收返利</h1>
</header>
<section class="ui-container" >

<ul class="ui-list ui-list-text  ui-border-tb">

<?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="ui-border-t" >
        <div class="ui-list-info">
            <h1 class="ui-nowrap" ><?php if(!empty($item["fl_sdl_name"])): echo ($item["fl_sdl_name"]); endif; ?> <?php if(!empty($item["fl_sdl_username"])): ?>(<?php echo ($item["fl_sdl_username"]); ?>)<?php endif; ?></span></h1>
			<p class="ui-nowrap">累计返利：<?php echo (number_format($item["fltotail"],2,'.','')); ?> 元</p>
			<p class="ui-nowrap">已收款：<?php echo (number_format($item["flreceived"],2,'.','')); ?> 元</p>
			<p class="ui-nowrap">待收款：<?php echo (number_format($item["flready"],2,'.','')); ?> 元</p>
			<p class="ui-nowrap">可提现：<?php echo (number_format($item["flcanrecash"],2,'.','')); ?> 元</p>
        </div>
        <?php if($item["flcanrecash"] >= 100): ?><div class="ui-btn-s ui-btn-primary" data-href="<?php echo U('./Angels/Fanli/recash?dlid='.$item['fl_senddlid'].'');?>" >申请提现</div>
		<?php else: ?>
		<div class="ui-btn-s " style="background:#F8F8F8; border-radius: 2px;color:#7B7B7B">申请提现</div><?php endif; ?>
    </li><?php endforeach; endif; ?>

</ul>

<?php if($page != ''): ?><div style="margin:0 auto;" >
<table class="page" cellpadding="0" cellspacing="0" align="center"><tbody>
<tr>
<td><?php echo ($page); ?></td>
</tr></tbody></table>
</div><?php endif; ?>

</section>
<script>
$('.ui-list li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

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
</script>
</body>
</html>