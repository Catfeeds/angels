<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理查询</title>
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
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>" ></i><h1 style="color: #0C0C0C">代理查询</h1>
</header>
<section class="ui-container">
<div class="ui-whitespace">
<p>　</p>
</div>
<div class="ui-form ui-border-t">
<form action="#">
<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">
<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">	
<div class="ui-form-item ui-form-item-pure ui-border-b">
	<input type="text" value=""  placeholder="输入代理商微信号/手机号查询"  id="keyword"  >
</div>
</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="search" >
        提交查询
    </button>
</div>
<div class="ui-whitespace">
<p>　</p>
</div>

<ul class="ui-list ui-list-text ui-border-tb" id="dlres" >

</ul>

</div>
</section>
<script>
(function (){

	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});


	//点击提交
    $("#search").click(function(){
	
			
            if($("#keyword").val() == "") { 
				mpoptips("请输入代理商微信号/手机号查询","warn",2000);
				$("#dlres").html('');
				return false; 
			} 

			var ttamp = $("#ttamp").val();
			var sture = $("#sture").val();
			var keyword = $("#keyword").val();

			
            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Agent/index');?>',
					data: {action: 'search', ttamp:ttamp, sture:sture, keyword:keyword },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {
						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 1) {
						     $("#dlres").html(data.msg);
						}else if(stat == 2){
						     mpoptips(data.msg,"warn",2000);
							 $("#dlres").html('');
							 location.href = "<?php echo U('./Angels/Agent/index');?>";
						}else{
							mpoptips(data.msg,"warn",2000);
							$("#dlres").html('');
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