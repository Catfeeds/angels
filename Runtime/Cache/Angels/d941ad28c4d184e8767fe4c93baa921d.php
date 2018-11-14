<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>防伪查询</title>
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
.ui-btn:before{
	border:0;
}
</style>
</head>
<body ontouchstart="" >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>"  ></i>
	<h1 style="color: #0C0C0C">防伪查询</h1>
	<button class="ui-btn" id="scanQRCode1" style='background:url(/Public/angels/img/扫码.png) no-repeat;
 background-size: 100% 100%;width:28px;height:28px;min-width:28px;border: none;'></button>
</header>
<section class="ui-container" style="margin-top: 3px">
<div style="display: flex;align-items:center; justify-content:center;background-color: #fff">
	<img src="/Public/angels/static/query_pic.png" style="width:80%;"/>
</div>
<div class="ui-form ui-border-t">
<form action="#">
<input type="hidden" name="referer" id="referer" value="<?php echo ($referer); ?>" />
<div class="ui-form-item ui-form-item-pure ui-border">
	<input type="text" value="<?php echo ($fwcode); ?>"  placeholder="请输入防伪码"  id="fwcode"  >
</div>

<div id="verify">
<div class="ui-form-item ui-form-item-pure ui-border-b" style="padding-right: 0">
	<div class="kl-layout-horizontally-between">
		<input type="text" placeholder="请输入验证码" maxlength="4" name="checkcode" value="" id="checkcode" style="width: 50%;">
		<img  style="flex:0" alt="点击换另一个" title="点击换另一个" style="vertical-align:middle; cursor:pointer"  id="verifyImg" src="<?php echo U('Angels/Query/verify');?>"  />
	</div>
</div>
</div>
</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="search">
        提交查询
    </button>
</div>
<div class="ui-whitespace"  id="result" style="padding:15px; color:#FF0000" ><?php echo ($msg); ?></div>
<?php if(!empty($prodata["pro_pic2"])): if($hasQuery != true): ?><div id='pro_pic2' style="display: flex;align-items:center; justify-content:center;background-color: #fff">
			<img src="/Public/uploads/product/<?php echo ($prodata["pro_pic2"]); ?>" style="width:100%;"/>
		</div><?php endif; endif; ?>
<ul class="ui-list ui-list-text  ui-border-tb" id="prodata" style="display:none">
    
    <li class="ui-border-t"  id="proname" >
        <h4   >产品名称：<?php echo ($prodata["pro_name"]); ?></h4>
    </li>
	
	
	<li class="ui-border-t"   id="dlname" >
        <h4   >代理姓名：<?php echo ($prodata["dl_name"]); ?></h4>
    </li>
	
	
	<li class="ui-border-t"  id="dltname" >
        <h4   >代理级别：<?php echo ($prodata["dlt_name"]); ?></h4>
    </li>
	
	
	<li class="ui-border-t"   id="dlnumber" >
        <h4  >授权编号：<?php echo ($prodata["dl_number"]); ?></h4>
    </li>
	
	
	<li class="ui-border-t"  id="proprice"  >
        <h4  >统一零售价：<?php echo (number_format($prodata["pro_price"],2,'.','')); ?> 元</h4>
    </li>
	
</ul>
<!-- <br>
<div  class="ui-whitespace" <?php if($msg == '' ): ?>style="display:none"<?php endif; ?> id="guanzhu" >
<p  style="text-align:center"><img src="/Public/angels/static/weixin.jpg" style="width:40%"><br>长按二维码关注</p>
</div>
<br> -->
</div>

</section>

<script>
(function (){

	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});
	
	$("#verifyImg").click(function(){
			$("#verifyImg").attr("src","<?php echo U('Angels/Query/verify');?>?"+ Math.random());
	});

	//点击提交
    $("#search").click(function(){
            if($("#fwcode").val() == "") { 
				mpoptips("请输入防伪码","warn",2000);
				$("#result").html('');
				return false; 
			} 
			
			var filter=/^\s*[0-9]{12,27}\s*$/; 
			if  (!filter.test($("#fwcode").val())) { 
				mpoptips("防伪码只能填数字,不要有空格,长度不能少于12位","warn",2000);
				$("#result").html('');
				return false; 
			}
			
			var fwcode = $("#fwcode").val();
			var referer = $("#referer").val();
			var checkcode = $("#checkcode").val();

			$("#result").html("正在查询......");
			$("#search").attr("disabled", true);

            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Query/ajaxres');?>',
					data: {fwcode:fwcode, checkcode:checkcode, referer:referer },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {
						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 9) {
						    $("#checkcode").val(""); 
						    $("#verify").show();
							$("#verifyImg").attr("src","<?php echo U('Angels/Query/verify');?>?"+ Math.random());
							msg=data.msg;
						}else if(stat == 1){
						    $("#verify").hide();
							if(data.fwc==""){
								msg=data.msg+'<br/>'+'公司名称：徐州安吉思有限公司';
							}else{
								// msg="<b>您输入的防伪码：</b>"+data.fwc+"<br><b>查询结果：</b>"+data.msg;
								msg="<b>您输入的防伪码：</b>"+data.fwc+"<br><b>查询结果：</b>"+'您好，你所查询的产品是徐州安吉思有限公司旗下的正牌产品：'+data.prodata.pro_name+'，请放心购买！'+'<br/>'+'公司名称：徐州安吉思有限公司';
							}
							$("#fwcode").val(""); 
						}else{
							$("#verify").hide();
							msg=data.msg+'<br/>'+'公司名称：徐州安吉思有限公司';
						}
						$("#result").html(msg);
						
						if(typeof(data.ischuhuo) == "undefined"){
							// $("#prodata").hide();
							$("#pro_pic2").show();
						}else{
						    if(parseInt(data.ischuhuo)==1){
							    // $("#prodata").show();
							    $("#pro_pic2").hide();
							}else{
							    // $("#prodata").hide();
							    $("#pro_pic2").show();
							}
						}
						
      //                   if(typeof(data.prodata) == "undefined"){
						//     // $("#prodata").hide();
						// 	$("#proname").html("");
						// 	$("#dlname").html("");
						// 	$("#dltname").html("");
						// 	$("#dlnumber").html("");
						// 	$("#proprice").html("");
						// }else{
      //                       if(typeof(data.prodata.pro_name) == "undefined" || typeof(data.prodata.dl_name) == "undefined" ){
						// 		// $("#prodata").hide();
						// 		$("#proname").html("");
						// 		$("#dlname").html("");
						// 		$("#dltname").html("");
						// 		$("#dlnumber").html("");
						// 		$("#proprice").html("");
						// 	}else{
						// 		$("#proname").html("<h4>产品名称："+data.prodata.pro_name+"</h4>");
						// 		$("#dlname").html("<h4>代理名称："+data.prodata.dl_name+"</h4>");
						// 		$("#dltname").html("<h4>代理级别："+data.prodata.dlt_name+"</h4>");
						// 		$("#dlnumber").html("<h4>授权编号："+data.prodata.dl_number+"</h4>");
						// 		if(data.prodata.pro_price!=""){
						// 			$("#proprice").html("<h4>统一零售价："+data.prodata.pro_price+" 元</h4>");
						// 		}
						// 		// $("#prodata").show();
						// 	}
						// }
						
						// $("#guanzhu").show();
						setTimeout(btnEnabled, 2000);
					},
					error: function (xhr, type) {
						mpoptips("超时或服务错误","warn",2000);
						$("#search").attr("disabled", null);
						$("#result").html("");
						return false; 
					}
				});

			} catch (e) {
				mpoptips(e,"warn",2000);
				$("#search").attr("disabled", null);
				$("#result").html(".");
				return false; 
			}
	});
	


	
})();

function btnEnabled() {
	$("#search").attr("disabled", null);
}
</script>
<script type="text/javascript" src="/Public/angels/js/base64Util.js"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" language="javascript" >
  /*
   * 注意：
   * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
   * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
   * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
   *
   * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
   * 邮箱地址：weixin-open@qq.com
   * 邮件主题：【微信JS-SDK反馈】具体问题
   * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
   */
  wx.config({
    debug:false,
    appId: '<?php echo ($signPackage["appId"]); ?>',
    timestamp: <?php echo ($signPackage["timestamp"]); ?>,
    nonceStr: '<?php echo ($signPackage["nonceStr"]); ?>',
    signature: '<?php echo ($signPackage["signature"]); ?>',
    jsApiList: [
	    'checkJsApi',
		'scanQRCode'
      // 所有要调用的 API 都要加到这个列表中
    ]
  });
  
  wx.ready(function () {
    // 在这里调用 API
  // 1 判断当前版本是否支持指定 JS 接口，支持批量判断
      wx.checkJsApi({
      jsApiList: [
        'scanQRCode'
      ],
      success: function (res) {

      },
	  fail:function (res) {
	     alert("微信版本比较低，不支持该功能");
	  }
    });
	
    document.querySelector('#scanQRCode1').onclick = function () {
    //调用摄像头
	wx.scanQRCode({
      needResult: 1,
	  scanType: ["barCode","qrCode"], 
      success: function (res) {
	     var result =res.resultStr;
	     if (result.indexOf("Angels")>=0)
	     {
	     	result=result.split("=")[1];
	     }
	     self.location.href="<?php echo U('./Angels/Query/index/fwcode');?>/"+Base64.encode(encodeURIComponent(result))+'/from/1';
      }
    });
	};
  });
  wx.error(function (res) {
		alert(res.errMsg);
  });
</script>
</body>
</html>