<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>出货记录</title>
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
	<i class="ui-icon-return"  <?php if($back == '1' ): ?>onclick="history.back()" <?php else: ?> data-href="<?php echo U('./Angels/Orders/dlorders/od_state/1');?>"<?php endif; ?> ></i><h1>出货记录</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">发货订单号：<?php echo ($ordersinfo["oddt_orderid"]); ?></h4>
        </div>
    </li>
	<li class="ui-border-t">
	<div class="ui-list-info">
	<p>发货产品：<?php echo ($ordersinfo["oddt_proname"]); ?> (<?php echo ($ordersinfo["oddt_pronumber"]); ?>)</p>
	<p>订购数量：<?php echo ($ordersinfo["oddt_qty"]); echo ($ordersinfo["oddt_prounits"]); echo ($ordersinfo["oddt_totalqty"]); ?></p>
	<p>已发数量：<?php echo ($ordersinfo["oddt_shipqty"]); ?>  </p>
	</div>
	</li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>

<ul class="ui-list ui-list-text ui-list-link ui-border-tb">

<?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="ui-border-t" data-href="<?php echo U('./Angels/Orders/odshipdetail?shid='.$item['ship_id'].'&od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>" >
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item["ship_barcode"]); ?></h4>
			<p class="ui-nowrap"><?php echo ($item["ship_proname"]); ?></p>
			<p class="ui-nowrap"><?php echo (date('Y-m-d H:i:s',$item["ship_date"])); ?>　发向　<?php echo ($item["dl_name"]); ?></p>
        </div>
		<div class="ui-badge-muted"><?php echo ($item["ship_proqty"]); ?></div>
    </li><?php endforeach; endif; ?>

</ul>

<?php if($page != ''): ?><div style="margin:0 auto;" >
<table class="page" cellpadding="0" cellspacing="0" align="center"><tbody>
<tr>
<td><?php echo ($page); ?></td>
</tr></tbody></table>
</div><?php endif; ?>

<div class="ui-whitespace">
<p>　</p>
</div>

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
</script>
</body>
</html>