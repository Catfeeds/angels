<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>返利明细</title>
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
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Fanli/index');?>"  ></i><h1>返利明细</h1>
</header>
<section class="ui-container" >
<div class="ui-tab" id="tab1">
    <ul class="ui-tab-nav ui-border-b">
        <li <?php if($state == '0' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Fanli/fanlilist?state=0');?>" >待收款</li>
        <li <?php if($state == '1' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Fanli/fanlilist?state=1');?>" >已收款</li>
        <li <?php if($state == '2' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Fanli/fanlilist?state=2');?>" >待付款</li>
		<li <?php if($state == '3' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Fanli/fanlilist?state=3');?>"  >已付款</li>
		<li <?php if($state == '9' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Fanli/fanlilist?state=9');?>"  >已取消</li>
    </ul>
</div>
<ul class="ui-list ui-list-text ui-list-link ui-border-tb">

<?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="ui-border-t" data-href="<?php echo U('./Angels/Fanli/fanlidetail?state='.$state.'&fl_id='.$item['fl_id'].'');?>" >
        <div class="ui-list-info">
            <h1 class="ui-nowrap" ><?php echo ($item["fl_moneystr"]); ?> <span style="font-size:0.7em; font-style:normal; color:#666666">元　　<?php echo (date('Y-m-d H:i:s',$item["fl_addtime"])); ?></span></h1>
			<p class="ui-nowrap"><?php echo ($item["fl_remark"]); ?></p>
        </div>
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

$('.ui-tab-nav li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});
</script>
</body>
</html>