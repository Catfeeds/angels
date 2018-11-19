<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>购物车</title>
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
.quantity-decrease{
    height: 100%;
	text-align:center;
	font-size:1.4em;
	color: #67738a;
	outline: 0 none;
    text-decoration: none;
    border: 1px solid #cbcbcb;
    margin: 0 0.3em;
    padding: 0 0.1em;
}
.quantity-increase{
    height: 100%;
	text-align:center;
	font-size:1.4em;
	color: #67738a;
	outline: 0 none;
    text-decoration: none;
    border: 1px solid #cbcbcb;
    margin: 0 0.3em;
    padding: 0 0.3em;
}
.quantity {
    color: #232326;
    text-align: center;
    width: 60px;
	height:30px;
}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return"  data-href="<?php echo U('./Angels/Orders/prolist');?>"   ></i><h1>购物车</h1>
</header>
<section class="ui-container" >


<ul class="ui-list ui-list-text ui-list-text ui-border-tb">

<?php if(is_array($shopcartlist)): foreach($shopcartlist as $key=>$item): if($item["pro_dlprice"] != '' ): ?><li class="ui-border-t"  >
        <div class="ui-list-thumb">
            <span style="background-image:url(/Public/uploads/product/<?php echo ($item["pro_pic"]); ?>)"></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item["pro_name"]); ?></h4>
			<p class="ui-nowrap"><?php if(($item["pro_price"] != '') AND ($item["pro_price"] != '0') ): ?>零售价:<?php echo (number_format($item["pro_price"],2,'.','')); ?> 元　<?php endif; if(($item["pro_dlprice"] != '') AND ($item["pro_dlprice"] != '0') ): ?>代理价:<?php echo (number_format($item["pro_dlprice"],2,'.','')); ?> 元<?php endif; if(($item["pri_minimum"] != '') AND ($item["pri_minimum"] != '0') ): ?>　最低补货:<?php echo ($item["pri_minimum"]); endif; ?></p>
			
			
        <div class="customize-qua">
			<a class="quantity-decrease" id="subnum<?php echo ($item["sc_id"]); ?>" href="javascript:subWareBybutton('#num<?php echo ($item["sc_id"]); ?>',<?php echo ($item["sc_id"]); ?>);" >﹣</a>
			<input size="4" value="<?php echo ($item["sc_qty"]); ?>" name="num" id="num<?php echo ($item["sc_id"]); ?>" class="quantity"  onChange="modifyWare('#num<?php echo ($item["sc_id"]); ?>',<?php echo ($item["sc_id"]); ?>)" type="text" >
			<a class="quantity-increase" id="addnum<?php echo ($item["sc_id"]); ?>" href="javascript:addWareBybutton('#num<?php echo ($item["sc_id"]); ?>',<?php echo ($item["sc_id"]); ?>);">+</a>
		</div>
        </div>
		
		<div class="ui-btn removecart" data-href="<?php echo U('./Angels/Orders/removecart?sc_id='.$item['sc_id'].'');?>" >移除</div>
    </li><?php endif; endforeach; endif; ?>

</ul>

<div class="ui-whitespace" style="margin:5px 0 5px 0" >
    <p  style="text-align:right">合计：<span id="total"><?php echo ($total); ?></span> 元</p>
</div>

<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="checkshopcart" data-href="<?php echo U('./Angels/Orders/checkshopcart');?>"  >
        去结算
    </button>
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

$('.removecart').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('#checkshopcart').click(function(){
	if($(this).data('href')){
	   location.href=$(this).data('href');
	}
});

//减数量
function subWareBybutton(num,scid){
    var sc_qty=parseInt($(num).val());
	var sc_id=parseInt(scid);
	if(sc_qty<=1){
	    sc_qty=1;
	}else{
	    sc_qty=sc_qty-1;
	}
	
	try{
		$.ajax({
			type: 'POST',
			url: '<?php echo U('./Angels/Orders/modifycart');?>',
			data: { sc_id:sc_id, sc_qty:sc_qty },
			dataType: 'json',
			timeout: 30000,
			success: function (data) {

				var stat=0;
				stat=parseInt(data.stat);
				
				if (stat == 1) {
                     $(num).val(data.qty);
					 $("#total").html(data.total);
					 return false; 
				}else{
					 mpoptips(data.msg,"warn",2000);
					 return false; 
				}
			},
			error: function (xhr, type) {
				mpoptips("超时或服务错误","warn",2000);
				return false; 
			}
		});

	} catch (e) {
		mpoptips(e,"warn",2000);
		return false; 
	}
}

//加数量
function addWareBybutton(num,scid){
    var sc_qty=parseInt($(num).val());
	var sc_id=parseInt(scid);
	sc_qty=sc_qty+1;

	try{
		$.ajax({
			type: 'POST',
			url: '<?php echo U('./Angels/Orders/modifycart');?>',
			data: { sc_id:sc_id, sc_qty:sc_qty },
			dataType: 'json',
			timeout: 30000,
			success: function (data) {

				var stat=0;
				stat=parseInt(data.stat);
				
				if (stat == 1) {
                     $(num).val(data.qty);
					 $("#total").html(data.total);
					 return false; 
				}else{
					 mpoptips(data.msg,"warn",2000);
					 return false; 
				}
			},
			error: function (xhr, type) {
				mpoptips("超时或服务错误","warn",2000);
				return false; 
			}
		});

	} catch (e) {
		mpoptips(e,"warn",2000);
		return false; 
	}
}

//改变数量
function modifyWare(num,scid){
    
    var sc_qty=parseInt($(num).val());
	var sc_id=parseInt(scid);
	
	if(sc_qty<=1){
	    sc_qty=1;
	}

	try{
		$.ajax({
			type: 'POST',
			url: '<?php echo U('./Angels/Orders/modifycart');?>',
			data: { sc_id:sc_id, sc_qty:sc_qty },
			dataType: 'json',
			timeout: 30000,
			success: function (data) {

				var stat=0;
				stat=parseInt(data.stat);
				
				if (stat == 1) {
                     $(num).val(data.qty);
					 $("#total").html(data.total);
					 return false; 
				}else{
					 mpoptips(data.msg,"warn",2000);
					 return false; 
				}
			},
			error: function (xhr, type) {
				//mpoptips("超时或服务错误","warn",2000);
				return false; 
			}
		});

	} catch (e) {
		mpoptips(e,"warn",2000);
		return false; 
	}
}

</script>
</body>
</html>