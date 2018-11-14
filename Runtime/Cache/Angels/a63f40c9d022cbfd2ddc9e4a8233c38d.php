<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>投诉建议</title>
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
<body ontouchstart="" >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>"  ></i><h1 style="color: #0C0C0C">投诉建议</h1>
</header>
<section class="ui-container">
<div class="ui-whitespace">
<p>　</p>
</div>
<div class="ui-form ui-border-t">
<form action="#">
<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">
<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">	

<div class="ui-form-item ui-border-b">
	<label for="#">您的姓名</label>
	<input type="text" value=""  placeholder="请输入..."  id="fb_contact"  >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">联系电话</label>
	<input type="text" value=""  placeholder="请输入..." id="fb_tel" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">QQ</label>
	<input type="text" value=""  placeholder="请输入..." id="fb_qq" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">Email</label>
	<input type="text" value=""  placeholder="请输入..." id="fb_email" >
</div>
<div class="ui-form-item ui-border-b" style="height:120px">
	<label for="#">反馈内容</label>
	<textarea placeholder="请输入..." id="fb_content"  style="height:120px"></textarea>
</div>
        <div class="ui-form-item ui-border-b">
	        <label for="#">验证码</label>
            <input    type="text" size="4" maxlength="4"  name="checkcode"  id="checkcode" placeholder="请输入..."   >

        </div>
		 <div class="ui-whitespace" style="text-align:center">
		 <img  alt="点击换另一个" title="点击换另一个"   style="vertical-align:middle; cursor:pointer"  id="verifyImg" src="<?php echo U('Angels/Feedback/verify');?>"  />
		 </div>
</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="feedback" >
        提交反馈
    </button>
</div>

</div>

</section>
<script>
(function (){
	//点击提交
    $("#feedback").click(function(){
	
			if($("#fb_contact").val() == "") { 
				mpoptips("请填写您的姓名","warn",2000);
				return false; 
			}
			
            if($("#fb_tel").val() == "") { 
				mpoptips("请填写联系电话","warn",2000);
				return false; 
			} 
			 
			if($("#fb_content").val() == "") { 
				mpoptips("请填写反馈内容","warn",2000);
				return false; 
			}

			if($("#checkcode").val() == "") { 
				mpoptips("请填写验证码","warn",2000);
				return false; 
			}

			
			
			var ttamp = $("#ttamp").val();
			var sture = $("#sture").val();
			var fb_contact = $("#fb_contact").val();
			var fb_tel = $("#fb_tel").val();
			var fb_qq = $("#fb_qq").val();
			var fb_email = $("#fb_email").val();
			var fb_content = $("#fb_content").val();
			var checkcode = $("#checkcode").val();
			
            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Feedback/index');?>',
					data: {action: 'save', fb_contact:fb_contact, fb_tel:fb_tel, fb_qq:fb_qq, fb_email:fb_email, fb_content:fb_content, checkcode:checkcode, ttamp:ttamp, sture:sture },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {

						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 1) {
							 alert(data.msg);
						     location.href = "<?php echo U('./Angels/Feedback/index');?>";
						}else if(stat == 2){
						     mpoptips(data.msg,"warn",2000);
							 location.href = "<?php echo U('./Angels/Feedback/index');?>";
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
	
	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});

	$("#verifyImg").click(function(){
			$("#verifyImg").attr("src","<?php echo U('Angels/Feedback/verify');?>?"+ Math.random());
	});
		
})();
</script>
</body>
</html>