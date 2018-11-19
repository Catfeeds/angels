<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title><?php echo ($title); ?></title>
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
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Orders/dlorderdetail?od_id='.$od_id.'&odbl_id='.$odbl_id.'&od_state=1');?>"  ></i><h1><?php echo ($title); ?></h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">订单号：<?php echo ($ordersinfo["od_orderid"]); ?></h4>
        </div>
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
<div class="ui-form ui-border-t">
<form action="#">
<input type="hidden" id="od_id"  value="<?php echo ($od_id); ?>" >
<input type="hidden" id="odbl_id"  value="<?php echo ($odbl_id); ?>" >
<input type="hidden" id="od_state"  value="<?php echo ($od_state); ?>" >

<div class="ui-form-item ui-border-b">
	<label for="#">物流快递：</label>
	<div class="ui-select">
	    <select name="od_express" id="od_express" >
		    <option value="0"  >请选择物流快递</option>
		<?php if(is_array($expresslist)): foreach($expresslist as $key=>$item): ?><option  value="<?php echo ($item["exp_id"]); ?>"  <?php if($item["exp_id"] == $ordersinfo["od_express"] ): ?>selected<?php endif; ?>  ><?php echo ($item["exp_name"]); ?></option><?php endforeach; endif; ?>
		</select>
	</div>
</div>

<div class="ui-form-item ui-border-b">
	<label for="#">物流单号：</label>
	<input type="text" value="<?php echo ($ordersinfo["od_expressnum"]); ?>"  placeholder=""  id="od_expressnum" name="od_expressnum" >
	</div>
</div>
<div class="ui-form-item ui-border-b">
<label for="#">处理备注：</label>
<input type="text" value="<?php echo ($ordersinfo["od_remark"]); ?>"  placeholder=""  id="od_remark" name="od_remark" >
</div>
</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="finishship" >
        <?php echo ($title); ?>
    </button>
</div>
</div>
</section>


<script>
	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});
	

	//点击提交
    $("#finishship").click(function(){

			if($("#od_express").val() == "" || $("#od_express").val() == 0) { 
				mpoptips("请选择物流快递","warn",2000);
				return false; 
			}
			
			if($("#od_express").val() != 1) { 
				if($("#od_expressnum").val() == "") { 
					mpoptips("物流单号","warn",2000);
					return false; 
				}
			}
			

			var od_express = $("#od_express").val();
			var od_expressnum = $("#od_expressnum").val();
			var od_remark = $("#od_remark").val();
			var od_id = $("#od_id").val();
			var odbl_id = $("#odbl_id").val();
			var od_state = $("#od_state").val();

            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Orders/odfinishship');?>',
					data: {action:'save', od_id:od_id, odbl_id:odbl_id, od_state:od_state, od_express:od_express, od_expressnum:od_expressnum, od_remark:od_remark },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {

						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 1) {
							 alert(data.msg);
							 location.href = "<?php echo U('./Angels/Orders/dlorderdetail?od_id='.$od_id.'&odbl_id='.$odbl_id.'&od_state='.$od_state.'');?>";
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
	
	});
</script>	
</body>

</html>