<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>出货详细</title>
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
	<i class="ui-icon-return"  onclick="history.back()" ></i><h1>出货详细</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace">
　
</div>
<ul class="ui-list ui-list-text  ui-border-tb">
    <li class="ui-border-t">
        <h4 class="ui-nowrap">条码：<?php echo ($shipinfo["ship_barcode"]); ?></h4>
    </li>
	 <li class="ui-border-t">
        <h4 class="ui-nowrap">单号：<?php echo ($shipinfo["ship_number"]); ?></h4>
    </li>
	<?php if(!empty($shipinfo["ship_pro_name"])): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">产品：<?php echo ($shipinfo["ship_pro_name"]); ?> (<?php echo ($shipinfo["ship_pro_number"]); ?>)</h4>
    </li><?php endif; ?>
	 <?php if(!empty($shipinfo["ship_proqty"])): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">数量：<?php echo ($shipinfo["ship_proqty"]); ?></h4>
    </li><?php endif; ?>
	 <li class="ui-border-t">
	 <div class="ui-list-info">
        <h4 class="ui-nowrap">流向：</h4>
		<p class="ui-nowrap">
		 <?php if(!empty($shipinfo["ship_dealer_from_name"])): echo (date('Y-m-d',$shipinfo["ship_date_from"])); ?>  由 <b><?php echo ($shipinfo["ship_dealer_from_name"]); ?></b>  发向  <b>我</b> <br/><?php endif; ?>
		 <?php if(!empty($shipinfo["ship_dealer_name"])): echo (date('Y-m-d',$shipinfo["ship_date"])); ?>  由 <b>我</b>  发向 <b><?php echo ($shipinfo["ship_dealer_name"]); ?></b><?php endif; ?>
		</p>
	</div>
    </li>

</ul>
 <div class="ui-btn-wrap" style="text-align:center">
    <button class="ui-btn ui-btn-primary" id="shdelete" data-href="<?php echo U('./Angels/Orders/odshdelete?shid='.$shipinfo['ship_id'].'&od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>"  >
        删除
    </button>
</div>
     
</section>


<script>
(function (){

		$('.ui-icon-return').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});	
		
		$('#shdelete').click(function(){
			var truthBeTold = window.confirm('该操作将彻底删除该出货记录,请谨慎操作!'); 
			if(truthBeTold){
				if($(this).data('href')){
					location.href= $(this).data('href');
				}
			}
		});	
		
})();
</script>
</body>

</html>