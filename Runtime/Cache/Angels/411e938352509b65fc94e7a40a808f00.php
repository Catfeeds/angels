<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>上传支付凭证</title>
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
.weui_uploader_input_wrp {
    border: 1px solid #d9d9d9;
    float: left;
    height: 77px;
    margin-bottom: 9px;
    margin-right: 9px;
    position: relative;
    width: 77px;
}
.weui_uploader_input_wrp::after, .weui_uploader_input_wrp::before {
    background-color: #d9d9d9;
    content: " ";
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
}
.weui_uploader_input_wrp::before {
    height: 39.5px;
    width: 2px;
}
.weui_uploader_input_wrp::after {
    height: 2px;
    width: 39.5px;
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
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Orders/index?od_state='.$od_state.'');?>"   ></i><h1>上传支付凭证</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">订单号：<?php echo ($ordersinfo["od_orderid"]); ?></h4>
        </div>
    </li>
    <li class="ui-border-t">
	    <h4 class="ui-nowrap"><?php echo ($ordersinfo["od_contact"]); ?> (<?php echo ($ordersinfo["od_tel"]); ?>)</h4>
		<div class="ui-txt-info"><?php echo (date('Y-m-d H:i:s',$ordersinfo["od_addtime"])); ?></div>
	
	</li>
	<li class="ui-border-t">
	    <h4 class="ui-nowrap">总额：<?php echo (number_format($ordersinfo["od_total"],2,'.','')); ?> 元</h4>
	</li>
</ul>
<div class="ui-whitespace">
<p style="text-align:center;padding:10px" ><?php echo ($ordersinfo["odbl_paypic_str"]); ?></p>
</div>
<form action="<?php echo U('./Angels/Orders/uploadpaypic_save');?>"   method="post" name="fmmm"  enctype="multipart/form-data" >
<input type="hidden" name="odbl_id" id="odbl_id"  value="<?php echo ($odbl_id); ?>" >
<input type="hidden" name="od_id" id="od_id"  value="<?php echo ($od_id); ?>" >
<input type="hidden" name="od_state" id="od_state"  value="<?php echo ($od_state); ?>" >
<input type="hidden" name="file_name" id="file_name"  value="" >

<div class="ui-whitespace" style="margin:10px 0 10px 0" >
<div style="float:left;padding-right:5px; max-height:77px; max-width:77px;border:none;display:none" id="img_div" >
<img id="img_file" name="file_name" style=" width:100%;border:none" src="" />
</div>
<div class="weui_uploader_input_wrp"> 
<input id="pic_file" name="pic_file" class="weui_uploader_input js_file"  type="file"   accept="image/gif,image/jpeg,image/jpg,image/png" >
</div>

<p  style="font-size:0.8em; padding-top:30px">文件大小2M以内</p>
<p>　</p>
</div>

<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary"  >
        上传支付凭证
    </button>
</div>
</form>


</section>


<script>
	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
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
                        url: '<?php echo U('./Angels/Orders/uploadpic');?>',
                        type: 'post',
                        data: {pic_file: rst.base64},
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
								alert('图片提交失败');
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