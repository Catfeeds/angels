<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>按月业绩奖金</title>
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
    font-size: 36px;
    padding: 0;
    position: inherit;
}
</style>
</head>
<body ontouchstart="" >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Fanli/index');?>"  ></i><h1>按月业绩奖金</h1>
</header>
<section class="ui-container">
<ul class="ui-row">
<li class="ui-col">
<div style="border:solid 1px #dcdcdc; border-left:none; padding:20px 0 20px 0; text-align:center">当月业绩<br>个人：<?php echo (number_format($odsum,2,'.','')); ?>元<br></div>
</li>
</ul>
<div class="ui-whitespace">
<p>　</p>
</div>
<ul class="ui-list ui-list-text ui-list-link ui-border-tb">

<?php if(is_array($list)): foreach($list as $key=>$item): ?><li class="ui-border-t" data-href="<?php echo U('./Angels/Fanli/salemonthlydetail?sm_id='.$item['sm_id'].'');?>" >
        <div class="ui-list-info">
            <h1 class="ui-nowrap" ><?php echo ($item["sm_rewardstr"]); ?> <span style="font-size:0.7em; font-style:normal; color:#666666">元　　<?php echo (date('Y-m',$item["sm_date"])); ?></span></h1>
			<p class="ui-nowrap"><?php echo ($item["sm_remark"]); ?></p>
        </div>
    </li><?php endforeach; endif; ?>

</ul>

<?php if($page != ''): ?><div style="margin:0 auto;" >
<table class="page" cellpadding="0" cellspacing="0" align="center"><tbody>
<tr>
<td><?php echo ($page); ?></td>
</tr></tbody></table>
</div><?php endif; ?>

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


</script>
</body>
</html>