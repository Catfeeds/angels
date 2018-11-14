<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>微商控价</title>
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
.ui-border-t span.jicon {
    color: rgb(0, 0, 0);
    font-size: 40px;
    padding: 0;
    position: inherit;
}

</style>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white;">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>" ></i><h1 style="color: #0C0C0C;">微商控价</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace" style="margin:1px 0 5px 0;background-color: white;font-size: 14px" >
    <p style="padding-top: 6px">您好，<?php echo ($dl_name); ?></p>
	<?php if(!empty($dl_number)): ?><p style="padding-top: 6px">邀请码：<?php echo ($dl_number); ?></p><?php endif; ?>
	<!--<?php if(!empty($dl_weixin)): ?><p>微信：<?php echo ($dl_weixin); ?></p><?php endif; ?>-->
	<?php if(!empty($dl_tel)): ?><p style="padding-top: 6px">手机号：<?php echo ($dl_tel); ?></p><?php endif; ?>
	<?php if(!empty($dl_tel)): ?><p style="padding-top: 6px">级别：<?php echo ($dltype_name); ?></p><?php endif; ?>
</div>
    <!--九宫格-->
    <div class="weui-grids" style="margin-top: 9px;background-color: white">
        <a href="<?php echo U('./Angels/Dealer/authorization');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/授权证书@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                授权证书
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/invite');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/邀请代理@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                邀请代理
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/brandlevel');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/下级代理@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                下级代理查看
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/applylist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/审核@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                下级申请审核
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/shipadd');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/扫码.png" alt="">
            </div>
            <p class="weui-grid__label">
                扫码出货
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/shiplist');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/出货记录@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                出货记录
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/shipsearch');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/出货查询@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                出货查询
            </p>
        </a>
        <a href="<?php echo U('./Angels/Orders/dladdress');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/我的地址@2x.png" alt="">
            </div>
            <p class="weui-grid__label">
                我的地址
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/updatedltypeindex');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/调级申请@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                代理调级申请
            </p>
        </a>
        <a href="<?php echo U('./Angels/Dealer/updatepwd');?>" class="weui-grid js_grid">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/修改密码@3x.png" alt="">
            </div>
            <p class="weui-grid__label">
                修改密码
            </p>
        </a>
        <a href="javascript:;" class="weui-grid js_grid" id="quit">
            <div class="weui-grid__icon">
                <img src="/Public/angels/img/退出@3x.png" alt="">
            </div>
            <p class="weui-grid__label" >
                退出
            </p>
        </a>

    </div>
    <!--九宫格-->
</section>
<!--<div class="ui-dialog">-->
    <!--<div class="ui-dialog-cnt">-->
        <!--<div class="ui-dialog-bd">-->
		    <!--<h4>确认退出？</h4>-->
        <!--</div>-->
        <!--<div class="ui-dialog-ft">-->
            <!--<button type="button" data-role="button" id="cancel"  style="z-index:9999" >取消</button>-->
            <!--<button type="button" data-role="button" id="confirm" style="z-index:9999"  >确认</button>-->
        <!--</div>-->
    <!--</div>-->
<!--</div>-->
<script>
    $(document).on("click", "#quit", function() {
        $.confirm("退出登录", "确认退出吗?", function() {
            location.href= "<?php echo U('./Angels/Dealer/quit');?>";
            $.toast("退出成功!");
        }, function() {
            //取消操作
        });
    });
$("#cancel").click(function(){
	$(".ui-dialog-cnt").css('display','none');
	$(".ui-dialog").css('display','none');
	return false;
});

$("#confirm").click(function(){
	$(".ui-dialog-cnt").css('display','none');
	$(".ui-dialog").css('display','none');
	location.href= "<?php echo U('./Angels/Dealer/quit');?>";
	return false;
});

$('.ui-list li').click(function(){
	if($(this).data('href')){
	    if($(this).data('href')=='quit'){
	        $(".ui-dialog").css('display','-webkit-box');
	        $(".ui-dialog-cnt").css('display','block');
		}else{
		    location.href= $(this).data('href');
		}
	}
});

$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});



</script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
</body>
</html>