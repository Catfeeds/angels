<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title><?php echo (C("QY_COMPANY")); ?></title>
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
.ui-header{height:60px; line-height:60px;position: relative;}
.ui-header ~ .ui-container {
    border-top: 0px solid transparent;
}
.ui-table .img_td{ max-height:80px}
.index_img {
    margin: 0px auto;
    overflow: hidden;
    text-align: center;
    line-height: 0;
	
}
.index_img img {
    margin: 0px auto;
    max-height: 100%;
    max-width: 100%;
    min-height: 70px;
    min-width: 70px;
    overflow: hidden;
}
.menuBox {
    margin: 0 auto;
}
.ui-slider {
       padding-top: <?php echo ($wvsh); ?>; /*滚图宽高比*/

}
.ui-footer{
	background-color: #E9441E;
	height: 36px; 
	padding-top: 5px;
	padding-bottom: 5px;
	color:#FFFFFF;
	box-shadow: 0 0 10px 0 rgba(155, 143, 143, 0.6);
}
.ui-footer img{
	max-height:40px
}
.ui-border-r{
	border-right: 1px solid #fff;
}
.zoomImage{
	width:100%;
	height: auto;
    padding-bottom: 100%;
    overflow:hidden;
    background-position: center;
    background-repeat: no-repeat;
    -webkit-background-size:cover;
    -moz-background-size:cover;
    background-size:cover;
}
.menu{
	position:absolute;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
}
.menu_img {
        width: 50px;
        height: 50px;
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -25px; /* 高度的一半 */
        margin-left: -25px; /* 宽度的一半 */
    }
</style>
</head>
<body ontouchstart="" style="background-color:#FFFFFF" >
<!--<header class="ui-header">
	<h1 style="color:#fff"><?php echo ($bas_logopic); ?></h1>
</header>-->
<section class="ui-container" >
<div class="ui-slider">
    <ul class="ui-slider-content" style="width:300%" >
	<?php if(is_array($adlist)): foreach($adlist as $key=>$item): if($item["ad_url"] == '' ): ?><li ><span style="background-image:url(/Public/uploads/mobi/<?php echo ($item["ad_pic"]); ?>)"></span></li>
	  <?php else: ?>	
	   <li ><a href="<?php echo ($item["ad_url"]); ?>" ><span style="background-image:url(/Public/uploads/mobi/<?php echo ($item["ad_pic"]); ?>)"></span></a></li><?php endif; endforeach; endif; ?>
    </ul>
</div>
<script>
(function (){
	var slider = new fz.Scroll('.ui-slider', {
		role: 'slider',
		indicator: true,
		autoplay: true,
		interval: 3000
	});
	slider.on('beforeScrollStart', function(fromIndex, toIndex) {
	});
	slider.on('scrollEnd', function(cruPage) {
	});
})();
</script>
	<!--九宫格-->
	<div class="weui-grids" style="background-color: white;margin-bottom: 120px">
		<a href="<?php echo U('./Angels/About');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/公司介绍@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				公司介绍
			</p>
		</a>
		<a href="<?php echo U('./Angels/Orders/prolist');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/产品中心@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				产品中心
			</p>
		</a>
		<a href="<?php echo U('./Angels/Xiu');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/买家秀@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				买家秀
			</p>
		</a>
		<a href="<?php echo U('./Angels/Query');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/防伪查询@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				防伪查询
			</p>
		</a>
		<a href="<?php echo U('./Angels/Agent');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/代理查询@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				代理查询
			</p>
		</a>
		<a href="<?php echo U('./Angels/Wechat');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/关注微信@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				关注微信
			</p>
		</a>
		<a href="<?php echo U('./Angels/News');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/企业动态@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				企业动态
			</p>
		</a>
		<a href="<?php echo U('./Angels/Feedback');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/投诉建议@2x.png" alt="">
			</div>
			<p class="weui-grid__label">
				投诉建议
			</p>
		</a>
		<a href="<?php echo U('./Angels/apply');?>" class="weui-grid js_grid">
			<div class="weui-grid__icon" style="height: 50px;width: 50px">
				<img src="/Public/angels/img/我要代理@3x.png" alt="">
			</div>
			<p class="weui-grid__label">
				我要代理
			</p>
		</a>
	</div>
	<!--九宫格-->
</section>
	<footer class="ui-footer" style="box-shadow:none;">
        <ul class="ui-tiled">
<!-- 			<li data-href="<?php echo ($bas_content); ?>"" class="ui-border-r">
				<div style="display: flex; flex-direction:column;align-items:center;margin:5px;">
					<img src="/Public/angels/static/home_icon.png" style="height:35px;width:35px">
					<span style="font-size: 13px;">官方网址</span>
				</div>
			</li> -->
			<li data-href="<?php echo U('./Angels/Dealer');?>">
				<div style="display: flex; flex-direction:column;align-items:center;margin:5px;">
					<!-- <img src="/Public/angels/static/login_icon.png" style="height:35px;width:35px"> -->
					<span style="font-size:18px;">代理后台</span>
				</div>
			</li>
		</ul>
	</footer>
<script>
$('.ui-footer li').click(function(){
	if($(this).data('href')){
		location.href=$(this).data('href');
	}
});
$('.menu').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});
</script>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
</body>
</html>