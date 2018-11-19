<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>扫描结果</title>
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
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Orders/odshipscan?od_id='.$ordersinfo['oddt_odid'].'&odbl_id='.$ordersinfo['oddt_odblid'].'&oddt_id='.$ordersinfo['oddt_id'].'');?>" ></i><h1>扫描结果</h1>
</header>
<section class="ui-container" >
<ul class="ui-list ui-list-text ui-border-tb">
    <li class="ui-border-t active">
        <div class="ui-list-info">
            <h4 class="ui-nowrap">发货订单号：<?php echo ($ordersinfo["oddt_orderid"]); ?></h4>
        </div>
    </li>
	<li class="ui-border-t">
	<div class="ui-list-info">
	<p>发货产品：<?php echo ($ordersinfo["oddt_proname"]); ?> (<?php echo ($ordersinfo["oddt_pronumber"]); ?>)</p>
	<p>订购数量：<?php echo ($ordersinfo["oddt_qty"]); echo ($ordersinfo["oddt_prounits"]); echo ($ordersinfo["oddt_totalqty"]); ?></p>
	<p>已发数量：<?php echo ($ordersinfo["oddt_shipqty"]); ?>　<a href="<?php echo U('./Angels/Orders/odshiplist?od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'&back=1');?>" >已发记录</a></p>
	<p>已扫产品数：<?php echo ($scanprocount); ?> </p>
	</div>
	</li>
</ul>

<?php if($success == '1' ): ?><div class="ui-tips ui-tips-success">
    <i></i><span><?php echo ($msg); ?></span>
</div>
<?php else: ?>
<div class="ui-tips ui-tips-warn">
    <i></i><span><?php echo ($msg); ?></span>
</div><?php endif; ?>
<ul class="ui-list ui-list-text  ui-border-tb">
	<?php if(!empty($barinfo["code"])): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">所扫条码：<?php echo ($barinfo["code"]); ?></h4>
    </li><?php endif; ?>
	<?php if(!empty($barinfo["pro_name"])): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">对应产品：<?php echo ($barinfo["pro_name"]); ?></h4>
    </li><?php endif; ?>
	<?php if(!empty($barinfo["qty"])): ?><li class="ui-border-t">
        <h4 class="ui-nowrap">产品数量：<?php echo ($barinfo["qty"]); ?></h4>
    </li><?php endif; ?>
</ul>

<div class="ui-whitespace">
<p>　</p>
</div>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary"  id="scanQRCode1" >继续扫描</button>
</div>
	
<div class="ui-footer ui-footer-stable ui-btn-group ui-border-t">
    <button class="ui-btn-lg"  id="shipscanlist"  data-href="<?php echo U('./Angels/Orders/odshipscanlist?od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>" >
        已扫<?php echo ($scancount); ?>条记录
    </button>
    <button class="ui-btn-lg"  id="shiping"  data-href="<?php echo U('./Angels/Orders/odshipping?od_id='.$od_id.'&odbl_id='.$odbl_id.'&oddt_id='.$oddt_id.'');?>" >
        下一步出货
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
		
		$('#shipscanlist').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
		$('#shiping').click(function(){
			if($(this).data('href')){
				location.href= $(this).data('href');
			}
		});
	
})();
</script>

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
		  // self.location.href='http://www.cn315fw.com/Angels/Orders/odshipscanres?od_id=<?php echo ($od_id); ?>&odbl_id=<?php echo ($odbl_id); ?>&oddt_id=<?php echo ($oddt_id); ?>&brcode='+result;
      self.location.href="<?php echo U('./Angels/Orders/odshipscanres/od_id');?>/"+"<?php echo ($od_id); ?>"+"/odbl_id/"+"<?php echo ($odbl_id); ?>"+"/oddt_id/"+"<?php echo ($oddt_id); ?>"+"/brcode/"+result; 
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