<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理邀请</title>
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
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1 style="color: #0C0C0C">代理邀请</h1>
</header>
<section class="ui-container" style="margin-top: 3px">
<ul class="ui-list ui-list-text ui-list-link ui-border-tb">
<?php if(is_array($sharelinkslist)): foreach($sharelinkslist as $key=>$item): ?><li class="ui-border-t" data-href="<?php echo U('./Angels/Dealer/marklinks?slid='.$item['sl_id'].'');?>" >
	 <div class="ui-list-info timeList">
        <h4 class="ui-nowrap"><?php echo ($item['br_name']); ?> <?php echo ($item['dlt_name']); ?> 邀请链接</h4>
		<p class="ui-nowrap ">打开:<?php echo ($item['sl_views']); ?> / 已申请:<?php echo ($item['sl_applynum']); ?>  倒计时:<span><?php echo ($item['timing']); ?></span></p>
	 </div>	
	 <div class="ui-btn-s ui-btn-primary">分享</div>
    </li><?php endforeach; endif; ?>
</ul>
<div class="ui-form ui-border-t">
<form action="<?php echo U('./Angels/Dealer/marklinks');?>" method="get" id="fmm" >
<div class="ui-form-item ui-border-b">
	<label for="#"></label>
</div>
		
<div class="ui-form-item ui-border-b">
	<label>选择级别：</label>
	<div class="ui-select">
		<select name="dltype" >
		    <?php if(is_array($dltypelist)): foreach($dltypelist as $key=>$item): ?><option  value="<?php echo ($item["dlt_id"]); ?>" ><?php echo ($item["dlt_name"]); ?></option><?php endforeach; endif; ?>
			<?php if(is_array($dlsttypelist)): foreach($dlsttypelist as $key=>$item): ?><option  value="<?php echo ($item["dlstt_id"]); ?>" ><?php echo ($item["dlstt_name"]); ?></option><?php endforeach; endif; ?>
		</select>
	</div>
</div>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="makelinks" >
        生成邀请链接
    </button>
</div>
</form>
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

(function (){
    //计时
    var timeList = $(".timeList");
    function startTime() {
	    var hasCount = 0;
	    timeList.each(function(index){  
		    var self = this;
			var count = parseInt($(self).find('span').text());
			if(count > 0){
				  count--;
				  $(self).find('span').text(count);
				  hasCount++;
			}else{
			    $(self).find('span').remove();
				$(self).find('p').html('已过期');
			}
		});

		if (hasCount == 0) {
			stopTime();
		} 
	}
	
    var monitorInterval = null;
	monitorInterval = setInterval(startTime, 1000);
	
	//删除计时
	function stopTime() {
	  if (monitorInterval) {
		  clearInterval(monitorInterval);
		  monitorInterval = null;
	  }
	}
	
	//点击分享按钮
    $("#sharelinks").click(function(){
	     var count = parseInt($("#timing").text());
		 if(count<=0){
			stopTime();
			mpoptips("该邀请链接已过期","warn",2000);
			$("#timing").hide();
			$("#timingtxt").text('该邀请链接已过期');
			return false; 
		 }
		 
	     $("#shareit").show();
	
	});
	
	$("#shareit").click(function() {
	    $("#shareit").hide();
	});
	
})();
</script>
</body>
</html>