<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>核对扫描记录</title>
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
.ui-form-item-r button {color: #FFFFFF;}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Orders/odshipscanlist?od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>" ></i><h1>核对扫描记录</h1>
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
	<p>已发数量：<?php echo ($ordersinfo["oddt_shipqty"]); ?></p>
	<p>已扫产品数：<?php echo ($scanprocount); ?> </p>
	<p>已扫条码数：<?php echo ($scancount); ?> </p>
	</div>
	</li>
</ul>

<div class="ui-tips ui-tips-info">
    <i></i><span>请核对扫描记录和订单信息后确认出货</span>
</div>
<ul class="ui-list ui-list-text  ui-border-tb">

<?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="ui-border-t"  >
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($jishu++); ?>、<?php echo ($key); ?></h4>
        </div>
		<div class="ui-badge-muted"><?php echo ($item); ?></div>
    </li><?php endforeach; endif; ?>

</ul>

	
<div class="ui-footer ui-footer-stable ui-btn-group ui-border-t">
    <button class="ui-btn-lg"  id="shipscanlist"   data-href="<?php echo U('./Angels/Orders/odshipscanlist?od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>" >
        已扫<?php echo ($scancount); ?>条记录
    </button>
    <button class="ui-btn-lg"  id="shiping"  data-href="<?php echo U('./Angels/Orders/odshipping?step=1&od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>"  >
        确认出货
    </button>
</div>

</section>


<script>
(function (){
		$('#shiping').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
		
		
		$('.ui-icon-return').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
		
		$('#shipscanlist').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
	
})();
</script>

</body>

</html>