<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>核对订单</title>
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
<script type="text/javascript" src="/Public/angels/js/lrz.all.bundle.js"></script>
<style>
.kl-layout-horizontally-between{
  box-sizing:border-box;
  display:-webkit-box;
  display:-webkit-flex;
  display:flex;
  -webkit-justify-content:space-between;
  justify-content:space-between;
  -webkit-box-align:center;
  -webkit-align-items:center;
  align-items:center;
}
.lo-hr {
  box-sizing: border-box;
  display: -webkit-box;
  display: -webkit-flex;
  display: flex;
  flex-direction:row-reverse;
  -webkit-box-align: center;
  -webkit-align-items: center;
  align-items: center;
}
.ui-radio input {
	width:20px;
	height:20px;
}
.ui-radio input:before {
	width:16px;
	height:16px;
}
.ui-radio input:checked:after{
	width:10px;
	height:10px;
	left:4px;
	top:4px;
}
.weui_uploader_input_wrp {
    border: 1px solid #d9d9d9;
    float: left;
    height: 70px;
    margin-bottom: 9px;
    margin-right: 9px;
    position: relative;
    width: 70px;
}
.weui_uploader_input_wrp::after, .weui_uploader_input_wrp::before {
    background-color: #fff;
    content: "凭证";
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
}



.weui_uploader_input_wrp:active {
    border-color: #999;
}
.weui_uploader_input_wrp:active::after, .weui_uploader_input_wrp:active::before {
    background-color: #999;
}
.weui_uploader_input {
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1;
}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return"  data-href="<?php echo U('./Angels/Orders/shopcart');?>"  ></i><h1>核对订单</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-link  ui-border-tb address">
 <li class="ui-border-t" data-href="<?php echo U('./Angels/Orders/orderaddress?dladd_id='.$dladd_id.'');?>"  >
   <div class="ui-list-info">
   <?php if($dladd_id == '0' ): ?><h4 class="ui-nowrap">请选择收货地址</h4>
   <?php else: ?>
   <h4 class="ui-nowrap"><?php echo ($dladd_address["dladd_contact"]); ?>　　<?php echo ($dladd_address["dladd_tel"]); ?></h4>
   <p class="ui-nowrap"><?php echo ($dladd_address["dladd_address"]); ?></p><?php endif; ?>
   </div>
 </li>
</ul>
<div class="ui-whitespace">
<p style="height: 8px;"></p>
</div>
<ul class="ui-list ui-list-text ui-list-text ui-border-tb">

<?php if(is_array($shopcartlist)): foreach($shopcartlist as $key=>$item): if($item["pro_dlprice"] != '' ): ?><li class="ui-border-t"  >
        <div class="ui-list-thumb">
            <span style="background-image:url(/Public/uploads/product/<?php echo ($item["pro_pic"]); ?>)" ></span>
        </div>
        <div class="ui-list-info">
            <h4 class="ui-nowrap"><?php echo ($item["pro_name"]); ?></h4>
			<p class="ui-nowrap"><?php if(($item["pro_price"] != '') AND ($item["pro_price"] != '0') ): ?>零售价:<?php echo (number_format($item["pro_price"],2,'.','')); ?> 元　<?php endif; if(($item["pro_dlprice"] != '') AND ($item["pro_dlprice"] != '0') ): ?>代理价:<?php echo (number_format($item["pro_dlprice"],2,'.','')); ?> 元<?php endif; ?></p>
        </div>
		<div class="ui-badge-num"><?php echo ($item["sc_qty"]); ?></div>
    </li><?php endif; endforeach; endif; ?>

</ul>

<div class="ui-whitespace" style="margin:5px 0 5px 0" >
    <p  style="text-align:right">合计：<span id="total"><?php echo (number_format($total,2,'.','')); ?></span> 元</p>
</div>
<div class="ui-form ui-border-t">
	<input type="hidden"  id="ttamp" value="<?php echo ($ttamp); ?>">
	<input type="hidden"  id="sture" value="<?php echo ($sture); ?>">	
	<input type="hidden"  id="dladd_id" value="<?php echo ($dladd_id); ?>">
	<input type="hidden" name="file_name" id="file_name"  value="" >
	<div class="ui-form-item ui-border-b">
		<label for="#">订单留言</label>
		<input type="text" value=""  placeholder="请输入..." id="od_remark" >
	</div>
	<div class="ui-form-item ui-form-item-radio ui-border-b">
		<label >支付方式</label>
        <label class="ui-radio" for="radio" style="margin: 0 2px 0 80px;">
            <input type="radio" checked="" name="radio" value="0">
        </label>
        <p style="font-size: 14px;">线下支付</p>
        <!-- <label class="ui-radio" for="radio" style="margin: 0 2px 0 10px;">
            <input type="radio" name="radio" value="1" <?php if($hasBalance == false): ?>disabled<?php endif; ?>>
        </label>
        <p <?php if($hasBalance == true): ?>style="color:red;font-size:14px;"<?php else: ?>style="color:#ccc;font-size: 14px;"<?php endif; ?>>余额(<?php echo (number_format($my_balance,2,'.','')); ?>元)<?php echo ($hasBalance); ?></p> -->
    </div>
    <div class="ui-whitespace" id='od_paypic_label' style="margin:10px 0 20px 0;" >
	    <h1>上传凭证<span style="color: red;font-size:20px;">*</span><span style="font-size:14px; font-weight:normal">(文件小于2M)</span></h1>
		<div style="float:left;padding-right:5px;max-width:70px;display:none" id="img_div" >
		<img id="img_file" style=" width:100%; border:none"  />
	</div>
	<div class="weui_uploader_input_wrp" id='od_paypic' style="background: #fff;"> 
		<input id="pic_file" name="pic_file" class="weui_uploader_input js_file"  type="file"   accept="image/gif,image/jpeg,image/jpg,image/png" >
	</div>
</div>

<!-- <div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="submitorders"  >
        确认提交订单
    </button>
</div> -->
</section>
<footer class="ui-footer" style="box-shadow:none;background-color:#FFF;height:50px;padding-top: 0">
	<div class="kl-layout-horizontally-between" style="height:50px;line-height: 50px;">
		<div id="pay_total" style="height:50px;padding:0 20px;color:red;font-weight:bold;">实付：<?php echo (number_format($total,2,'.','')); ?>元</div>
		<div id="submitorders" style="height:50px;padding:0 40px;background-color:#1FBAF3;color:#FFF;">提交</div>
	</div>
</footer>

<script>
	var total="<?php echo (number_format($total,2,'.','')); ?>";
	var my_balance="<?php echo (number_format($my_balance,2,'.','')); ?>";
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

	$("input[name='radio']").change(function(){  
	    if($(this).is(":checked")&&$(this).val()==0){  
	          // alert($(this).attr("autocomplete"));  
	         $("#od_paypic_label").css('display','');
	         $("#od_paypic").css('display','');
	         $("#pay_total").html('实付：'+total+'元');
	    }else if($(this).is(":checked")&&$(this).val()){
	           $("#od_paypic_label").css('display','none');
	           $("#od_paypic").css('display','none');
	           $("#pay_total").html('实付：0.00元'); 
	    }  
	 });  

	//点击提交
	$("#submitorders").click(function(){
		if($("#dladd_id").val() == "" || $("#dladd_id").val() == 0) { 
			mpoptips("请选择收货地址","warn",2000);
			return false; 
		}
		var pay_mode =$("input[name='radio']:checked").val();
		// if (pay_mode==0)
		// {
		// 	if($("#file_name").val()== "") {
		// 		mpoptips("请先上传凭证","warn",2000);
		// 		return false;
		// 	}
		// }

	    var od_remark = $("#od_remark").val();
		var ttamp = $("#ttamp").val();
		var sture = $("#sture").val();
		var dladd_id = $("#dladd_id").val();
		var file_name = $("#file_name").val();
		try {
			$.ajax({
				type: 'POST',
				url: '<?php echo U('./Angels/Orders/submitorders');?>',
				data: {
					ttamp:ttamp,
					sture:sture,
					dladd_id:dladd_id, 
					od_remark:od_remark,
					file_name: file_name,
					pay_mode:pay_mode
				},
				dataType: 'json',
				timeout: 30000,
				success: function (data) {

					var stat=0;
					stat=parseInt(data.stat);
					
					if (stat == 1) {
						alert(data.msg);
						location.href = "<?php echo U('./Angels/Orders/index');?>";
						return false; 
					}else if(stat == 2){
						 mpoptips(data.msg,"warn",2000);
						 location.href = "<?php echo U('./Angels/Index/index');?>";
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

<script>
(function(){
    $("#pic_file").change(function(){
         lrz(this.files[0], {width: 800})
            .then(function (rst) {
                //console.log(rst);
				 var el=$.loading({
						content:'上传中...',
				 });
                $.ajax({
                    url: '<?php echo U('./Angels/Dealer/uploadpic');?>',
                    type: 'post',
                    data: {"pic_file":rst.base64,"ttamp":"<?php echo ($ttamp); ?>","sture":"<?php echo ($sture); ?>"},
                    dataType: 'json',
                    timeout: 200000,
                    success: function (response) {
					    el.loading("hide");
                        if (response.stat == '0') {
							$("#file_name").val(response.filename);
							$("#img_file").attr('src',"/Public/uploads/temp/"+response.filename); 
							$("#img_div").show();
                             return true;
                        } else {
							alert('图片提交失败,请刷新后提交');
							return false;
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown) {
                        el.loading("hide");
                        if (textStatus == 'timeout') {
                            a_info_alert('请求超时');
                            return false;
                        }

                        alert(jqXHR.responseText);
                    }
                });
                    
            })
            .catch(function (err) {
               el.loading("hide");
            })
            .always(function () {
               el.loading("hide");
            });
    });
})();
</script>
</body>
</html>