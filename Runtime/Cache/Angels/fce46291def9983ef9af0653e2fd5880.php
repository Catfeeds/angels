<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>返利提现</title>
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
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" data-href="<?php echo U('./Angels/Fanli/receivelist');?>" ></i><h1>返利提现</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace" style="margin:10px 0 10px 0" >
    <p>付款代理：<?php if(!empty($fl_sdl_name)): echo ($fl_sdl_name); endif; ?> <?php if(!empty($fl_sdl_username)): ?>(<?php echo ($fl_sdl_username); ?>)<?php endif; ?></p>
</div>
<div class="ui-whitespace" style="margin:10px 0 10px 0" >
    <p>收款代理：<?php echo ($dl_name); ?> (<?php echo ($dl_username); ?>)</p>
</div>
<div class="ui-form ui-border-t">
<form action="<?php echo U('./Angels/Fanli/recash_save');?>"  method="post" id="fmmm" name="fmmm" >
<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">	
<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">	
<input type="hidden" name="fl_senddlid" id="fl_senddlid" value="<?php echo ($fl_senddlid); ?>" >	
<input type="hidden" name="rc_money" id="rc_money" value="<?php echo ($dl_fanli2); ?>" >	
<div class="ui-form-item ui-border-b">
	<label for="#">待收金额 </label>
	<input type="text" value="<?php echo (number_format($dl_fanli,2,'.','')); ?> 元"  readonly >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">可提金额 </label>
	<input type="text" value="<?php echo (number_format($dl_fanli2,2,'.','')); ?> 元"  readonly >
</div>
<div class="ui-form-item ui-border-b">
	<label>开户银行</label>
	<div class="ui-select">
		<select name="rc_bank"  id="rc_bank"  >
		    <option  value="0" >请选择开户银行</option>
		    <?php if(is_array($bankarr)): foreach($bankarr as $key=>$item): ?><option  value="<?php echo ($key); ?>" ><?php echo ($item); ?></option><?php endforeach; endif; ?>
		</select>
	</div>
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">卡号/账号</label>
	<input type="text" value=""  placeholder="卡号/账号必须与卡号姓名对应"  id="rc_bankcard" name="rc_bankcard" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">卡号姓名</label>
	<input type="text" value="<?php echo ($dl_name); ?>"  placeholder=""  id="rc_name" name="rc_name" readonly >
</div>

<div class="ui-form-item ui-border-b">
	<label for="#">账号登录密码</label>
	<input type="password" value=""  placeholder="填写该账号的登录密码" id="rc_pwd" name="rc_pwd" >
</div>
</form>
<ul class="ui-list ui-border-tb">
<li class="ui-border-t">
<div class="ui-list-info">
            <h4 class="ui-nowrap">温馨提示</h4>
			<p class="ui-nowrap">1、务必核对填写信息是否正确</p>
            <p class="ui-nowrap">2、卡号和姓名必须一致</p>
			<p class="ui-nowrap">3、只能提现到与收款代理姓名一致的卡号或账号</p>
			<p class="ui-nowrap">4、只能提现<?php echo ($jiangetime); ?>天前的返利</p>
			<p class="ui-nowrap">5、最低提现额度<?php echo ($edurecash); ?>元</p>
</div>
</li>		
</ul>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="recash" >
        申请提现
    </button>
</div>

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
    $("#recash").click(function(){
	
            if(parseInt($("#rc_bank").val())<=0){
				mpoptips("请选择开户银行","warn",2000);
				return false; 
			}
			
            if($("#rc_bankcard").val() == "") { 
				mpoptips("请填写卡号或支付宝账号","warn",2000);
				return false; 
			} 
			 

			if($("#rc_pwd").val() == "") { 
				mpoptips("请填写密码","warn",2000);
				return false; 
			}
			
			if($("#rc_money").val() == "") { 
				mpoptips("可提现的金额为0,只能提现<?php echo ($jiangetime); ?>天前的返利","warn",2000);
				return false; 
			}
			if(parseInt($("#rc_money").val())<=0){
				mpoptips("可提现的金额为0,只能提现<?php echo ($jiangetime); ?>天前的返利","warn",2000);
				return false; 
			}
			
			
			
			var truthBeTold = window.confirm('请核实填写信息无误后确认提交!'); 
			if(truthBeTold){
				$("#fmmm").submit(); 
			}else{
			    return false; 
			}
			
	});
	
		
})();

</script>
</body>
</html>