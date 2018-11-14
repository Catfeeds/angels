<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>出货查询</title>
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
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Dealer/index');?>" ></i><h1 style="color: #0C0C0C">出货查询</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace">
　
</div>
<div class="ui-form ui-border-t">
    <form action="<?php echo U('./Angels/Dealer/shipsearch');?>" id="fmm" >
        <div class="ui-form-item ui-form-item-r ui-border-b">
            <input type="text" placeholder="输入条码"  name="brcode" id="brcode" >
			<button type="button" class="ui-border-l ui-btn-primary"  id="search" >查询</button>
        </div>
    </form>
</div>
<div class="ui-whitespace">
<div style="text-align:center; padding-top:20px">或</div>
</div>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary"  id="scanQRCode1" >扫码直接查询</button>
</div>
<div class="ui-whitespace">
<p style="text-align:center; padding-top:20px; font-size:0.8em">只能查询自己收货或发货的产品条码</p>
</div>

</section>


<script>
(function (){
        $("#search").click(function(){
            if($("#brcode").val() == "") { 
				mpoptips("请输入条码","warn",2000);
				return false; 
			} 
			
			var filter=/^\s*[a-zA-Z0-9]{5,20}\s*$/; 
			if  (!filter.test($("#brcode").val())) { 
				mpoptips("请正确输入条码","warn",2000);
				return false; 
			}
			
			$("#fmm").submit();

          
        });
		
		
		$('.ui-icon-return').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
	
})();
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
	     var result = res.resultStr; 
       self.location.href="<?php echo U('./Angels/Dealer/shipsearch/brcode');?>/"+result;
		    // self.location.href="<?php echo U('./Angels/Dealer/shipsearch/brcode');?>/"+result;  
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