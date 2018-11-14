<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>修改密码</title>
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
.info_head_img {
    background: #000000 none repeat scroll 0 0;
    border-radius: 40px;
    color: #ffffff;
    font-size: 40px;
    height: 80px;
    margin: 15px 0 15px 0;
    width: 80px;
}
.info_head_img i {
    margin-left: 20px;
    margin-top: 10px;
    position: absolute;
}
.info_head_img img {
    width: 60px;
}
</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" onClick="history.back()"></i><h1 style="color: #0C0C0C">修改密码</h1>
</header>
<section class="ui-container" >
<div class="ui-flex ui-flex-pack-center">
<div class="info_head_img">
	<i class="jicon user"></i>
</div>
</div>
<div class="ui-form ui-border-t">
    <form action="#" >
        <div class="ui-form-item ui-form-item-pure ui-border-b">
            <input type="password" placeholder="旧密码"  name="oldpwd" id="oldpwd" >
        </div>
        <div class="ui-form-item ui-form-item-pure ui-border-b">
            <input type="password" placeholder="新密码" name="newpwd" id="newpwd"  >
        </div>
		<div class="ui-form-item ui-form-item-pure ui-border-b">
            <input type="password" placeholder="确认新密码" name="newpwd2" id="newpwd2"  >
        </div>
    </form>
</div>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary"  id="btnlogin" >确认修改</button>
</div>
	

</section>
<script>
(function (){
        $("#btnlogin").click(function(){
            if($("#oldpwd").val() == "") { 
				mpoptips("请输入旧密码","warn",2000);
				return false; 
			} 
			if($("#newpwd").val() == "") { 
				mpoptips("请输入新密码","warn",2000);
				return false; 
			}
			if($("#newpwd2").val() == "") { 
				mpoptips("请输入确认新密码","warn",2000);
				return false; 
			}
			if($("#newpwd2").val() != $("#newpwd").val()) { 
				mpoptips("输入两新密码不一致","warn",2000);
				return false; 
			}
			
			var oldpwd = $("#oldpwd").val();
			var newpwd = $("#newpwd").val();
			var newpwd2 = $("#newpwd2").val();
			
            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Dealer/updatepwd');?>',
					data: { action: 'save', oldpwd: oldpwd, newpwd: newpwd, newpwd2: newpwd2 },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {

						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 1) {
						     //mpoptips(data.msg,"warn",2000);
                             alert('修改密码成功');
						     location.href = "<?php echo U('./Angels/Dealer/index');?>";
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
})();
</script>
</body>

</html>