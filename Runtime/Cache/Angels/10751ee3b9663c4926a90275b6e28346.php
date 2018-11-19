<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>订单详细</title>
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
	<i class="ui-icon-return"  data-href="<?php echo U('./Angels/Orders/dlorders?od_state='.$od_state.'');?>" ></i><h1>订单详细</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">订单号：<?php echo ($ordersinfo["od_orderid"]); ?></h4>
        </div>
		<div class="ui-badge-muted"><?php echo ($ordersinfo["od_state_str"]); ?></div>
    </li>
</ul>
<ul class="ui-list  ui-list-text ui-border-tb address">
 <li class="ui-border-t"   >
   <div class="ui-list-info">
   <h4 class="ui-nowrap">收货地址：</h4>
   <p class="ui-nowrap"><?php echo ($ordersinfo["od_contact"]); ?>　　<?php echo ($ordersinfo["od_tel"]); ?></p>
   <p class="ui-nowrap"><?php echo ($ordersinfo["od_address"]); ?></p>

   </div>
 </li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list ui-list-text ui-list-text ui-border-tb">

<?php if(is_array($ordersinfo['orderdetail'])): foreach($ordersinfo['orderdetail'] as $key=>$item): ?><li class="ui-border-t"  >
        <div class="ui-list-thumb">
			<?php if($item["oddt_propic"] == '' ): ?><span style="background-image:url(/Public/angels/static/nophoto.jpg)"></span>
			<?php else: ?>
            <span style="background-image:url(/Public/uploads/product/<?php echo ($item["oddt_propic"]); ?>)"></span><?php endif; ?>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item["oddt_proname"]); ?> (<?php echo ($item["oddt_pronumber"]); ?>)</h4>
			<p class="ui-nowrap"><?php if($item["oddt_dlprice"] != '' ): ?>单价:<?php echo (number_format($item["oddt_dlprice"],2,'.','')); ?> 元<?php endif; ?></p>
			<p class="ui-nowrap">订购：<?php echo ($item["oddt_qty"]); echo ($item["oddt_prounits"]); echo ($item["oddt_totalqty"]); ?> 已发：<?php echo ($item["oddt_shipqty"]); ?> <?php if($item["oddt_shipqty"] != '0' ): ?><a href="<?php echo U('./Angels/Orders/odshiplist?od_id='.$item['oddt_odid'].'&odbl_id='.$item['oddt_odblid'].'&oddt_id='.$item['oddt_id'].'&back=1');?>" >已发记录</a><?php endif; ?></p>
        </div>
		<?php echo ($item["oddt_shipment"]); ?>
    </li><?php endforeach; endif; ?>

</ul>

<div class="ui-whitespace" style="margin:5px 0 5px 0" >
    <p  style="text-align:right">合计：<span id="total"><?php echo ($ordersinfo["odbl_total"]); ?></span> 元 <br>下单时间：<?php echo (date('Y-m-d H:i:s',$ordersinfo["od_addtime"])); ?></p>
</div>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list ui-list-text ui-border-tb">
<li class="ui-border-t">
	    <h4 class="ui-nowrap">操作：</h4>
	    <?php echo ($ordersinfo["caozuostr"]); ?>
</li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>

<ul class="ui-list  ui-list-text ui-border-tb">
 <li class="ui-border-t"   >
   <div class="ui-list-info">
   <h4>订单留言：</h4>
   <p><?php echo ($ordersinfo["odbl_remark"]); ?></p>
   </div>
 </li>
  <li class="ui-border-t"   >
  <div class="ui-list-info">
   <h4>支付凭证：</h4>
   <p><?php echo ($ordersinfo["odbl_paypic_str"]); ?></p>
   </div>
 </li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list  ui-list-text ui-border-tb">
 <li class="ui-border-t"   >
   <div class="ui-list-info">
   <h4>下单代理：</h4>
   <p>微信：<?php echo ($ordersinfo["od_dl_weixin"]); ?></p>
   <p>名称：<?php echo ($ordersinfo["od_dl_name"]); ?></p>
   <p>电话：<?php echo ($ordersinfo["od_dl_tel"]); ?></p>
   </div>
 </li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list  ui-list-text ui-border-tb">
 <li class="ui-border-t"   >
   <div class="ui-list-info">
   <h4>物流信息：</h4>
   <?php if($ordersinfo["od_expressname"] != '' ): ?><p>快递：<?php echo ($ordersinfo["od_expressname"]); ?></p><?php endif; ?>
   <?php if($ordersinfo["od_expressnum"] != '' ): ?><p>单号：<?php echo ($ordersinfo["od_expressnum"]); ?></p><?php endif; ?>
   <?php if(($ordersinfo["od_expressdate"] != '') AND ($ordersinfo["od_expressdate"] != 0 )): ?><p>时间：<?php echo (date('Y-m-d H:i:s',$ordersinfo["od_expressdate"])); ?></p><?php endif; ?>
   <?php if($ordersinfo["od_remark"] != '' ): ?><p>备注：<?php echo ($ordersinfo["od_remark"]); ?></p><?php endif; ?>
   </div>
 </li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list  ui-list-text ui-border-tb">
 <li class="ui-border-t"   >
   <div class="ui-list-info">
   <h4>操作日志：</h4>
   <?php if(is_array($orderlogs)): foreach($orderlogs as $key=>$item): ?><p><b><?php echo ($item["odlg_action"]); ?></b>　<?php echo ($item["odlg_dlname"]); ?>　<?php echo (date('Y-m-d H:i:s',$item["odlg_addtime"])); ?></p><?php endforeach; endif; ?>

   </div>
 </li>
</ul>
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

$('.ui-list li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.address li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-btn-s').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-btn').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

</script>
</body>
</html>