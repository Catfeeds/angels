<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>下家的订单</title>
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
	<i class="ui-icon-return"  data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1>下家的订单</h1>
</header>
<section class="ui-container" >
<div class="ui-tab" id="tab1">
    <ul class="ui-tab-nav ui-border-b">
        <li <?php if($od_state == '1' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Orders/dlorders?od_state=1');?>" >待发货</li>
        <li <?php if($od_state == '3' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Orders/dlorders?od_state=3');?>" >已发货</li>
        <li <?php if($od_state == '0' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Orders/dlorders?od_state=0');?>" >待确认</li>
		<li <?php if($od_state == '8' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Orders/dlorders?od_state=8');?>"  >已完成</li>
		<li <?php if($od_state == '9' ): ?>class="current"<?php endif; ?>  data-href="<?php echo U('./Angels/Orders/dlorders?od_state=9');?>"  >已取消</li>
    </ul>
</div>
<?php if(is_array($orderlist)): foreach($orderlist as $key=>$item): ?><ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">订单号：<?php echo ($item["od_orderid"]); ?></h4>
        </div>
		<div class="ui-badge-muted"><?php echo ($item["od_state_str"]); ?></div>
    </li>
	<?php if(is_array($item['orderdetail'])): foreach($item['orderdetail'] as $key2=>$item2): ?><li class="ui-border-t">
        <div class="ui-list-icon">
		    <?php if($item2["oddt_propic"] == '' ): ?><span style="background-image:url(/Public/angels/static/nophoto.jpg)"></span>
			<?php else: ?>
            <span style="background-image:url(/Public/uploads/product/<?php echo ($item2["oddt_propic"]); ?>)"></span><?php endif; ?>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item2["oddt_proname"]); ?> (<?php echo ($item2["oddt_pronumber"]); ?>)</h4>
			<p class="ui-nowrap">订购：<?php echo ($item2["oddt_qty"]); echo ($item2["oddt_prounits"]); echo ($item2["oddt_totalqty"]); ?> 已发：<?php echo ($item2["oddt_shipqty"]); ?> <?php if($item2["oddt_shipqty"] != '0' ): ?><a href="<?php echo U('./Angels/Orders/odshiplist?od_id='.$item2['oddt_odid'].'&odbl_id='.$item2['oddt_odblid'].'&oddt_id='.$item2['oddt_id'].'&back=1');?>" >已发记录</a><?php endif; ?></ </p>
			
        </div>
		<?php echo ($item2["oddt_shipment"]); ?>
    </li><?php endforeach; endif; ?>

	<li class="ui-border-t">
	    <h4 class="ui-nowrap"><?php echo ($item["od_dl_name"]); ?> (<?php echo ($item["od_dl_tel"]); ?>)</h4>
		<div class="ui-txt-info"><?php echo (date('Y-m-d H:i:s',$item["od_addtime"])); ?></div>
	
	</li>
	<li class="ui-border-t">
	    <h4 class="ui-nowrap">总额：<?php echo (number_format($item["odbl_total"],2,'.','')); ?> 元</h4>
	    <?php echo ($item["caozuostr"]); ?>
	</li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div><?php endforeach; endif; ?>
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

$('.ui-btn').click(function(){
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