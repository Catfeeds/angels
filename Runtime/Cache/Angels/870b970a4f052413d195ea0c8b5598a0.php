<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title><?php echo ($addtitle); ?></title>
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
<script type="text/javascript" src="/Public/angels/js/Area.js"></script>
<script type="text/javascript" src="/Public/angels/js/AreaData_min.js"></script>
</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b">
	<i class="ui-icon-return" onClick="history.back()"  ></i><h1><?php echo ($addtitle); ?></h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace">
　
</div>
<form action="#">
<input type="hidden" id="dladd_id"  value="<?php echo ($dladd_id); ?>" >
<input type="hidden" id="f"  value="<?php echo ($f); ?>" >
<div class="ui-form-item ui-border-b">
	<label for="#">姓名</label>
	<input type="text" value="<?php echo ($addressinfo["dladd_contact"]); ?>"  placeholder="姓名"  id="dladd_contact" >
</div>

<div class="ui-form-item ui-border-b">
	<label for="#">省份</label>
	<div class="ui-select">
	<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"  ></select>
	</div>
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">城市</label>
	<div class="ui-select">
	<select id="seachcity" name="seachcity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"   ><option value="0">请选择</option></select>
	</div>
</div>
<div class="ui-form-item ui-border-b" id="seachdistrict_div" >
	<label for="#">地区</label>
	<div class="ui-select">
	<select id="seachdistrict" name="seachdistrict"   ><option value="0">请选择</option></select>
	</div>
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">地址</label>
	<input type="text" value="<?php echo ($addressinfo["dladd_address"]); ?>"  placeholder="地址" id="dladd_address" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">电话</label>
	<input type="text" value="<?php echo ($addressinfo["dladd_tel"]); ?>"  placeholder="电话" id="dladd_tel" >
</div>
</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="addaddress" >
        <?php echo ($addtitle); ?>
    </button>
</div>
<?php if(($dladd_id > 0) AND ($f == '0') ): ?><div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary"  id="deladdress"  data-href="<?php echo U('./Angels/Orders/deleteaddress?addid='.$dladd_id.'');?>" >
        删除地址
    </button>
</div><?php endif; ?>

</section>


<script>
	$('.ui-icon-return').click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});
	
    $("#deladdress").click(function(){
		if($(this).data('href')){
			location.href= $(this).data('href');
		}
	});
	
	$("#dladd_address").click(function(){
			var diqustr="";
			var seachprov = $("#seachprov").val();
			var seachcity = $("#seachcity").val();
            if(parseInt($("#seachprov").val())>0){
				   diqustr=$("#seachprov option").eq($("#seachprov").attr("selectedIndex")).text();
				   if(parseInt($("#seachcity").val())>0){
						diqustr=diqustr+$("#seachcity option").eq($("#seachcity").attr("selectedIndex")).text();
				   }
			}
			
			
			var seachdistrict = "";
			if($("#seachdistrict").length > 0 ){
			    seachdistrict = $("#seachdistrict").val();
			    if(parseInt($("#seachdistrict").val())>0){
				   diqustr=diqustr+$("#seachdistrict option").eq($("#seachdistrict").attr("selectedIndex")).text();
			    }
			}
			
			if($("#dladd_address").val()==""){
			    $("#dladd_address").val(diqustr);
			}
	});

	//点击提交
    $("#addaddress").click(function(){
            if($("#dladd_contact").val() == "") { 
				mpoptips("请填写姓名","warn",2000);
				return false; 
			} 
			 

			if($("#seachprov").val() == "" || $("#seachprov").val() == 0) { 
				mpoptips("请选择省份","warn",2000);
				return false; 
			}
			if($("#seachcity").val() == "" || $("#seachcity").val() == 0) { 
				mpoptips("请选择城市","warn",2000);
				return false; 
			}
			
			if($("#dladd_address").val() == "") { 
				mpoptips("请填写地址","warn",2000);
				return false; 
			}
			
			if($("#dladd_tel").val() == "") { 
				mpoptips("请填写电话","warn",2000);
				return false; 
			}
			

			var dladd_contact = $("#dladd_contact").val();
			var dladd_tel = $("#dladd_tel").val();
			var dladd_address = $("#dladd_address").val();
			var dladd_id = $("#dladd_id").val();
			var f = $("#f").val();
			
			var diqustr="";
			var seachprov = $("#seachprov").val();
			var seachcity = $("#seachcity").val();
            if(parseInt($("#seachprov").val())>0){
				   diqustr=$("#seachprov option").eq($("#seachprov").attr("selectedIndex")).text();
				   if(parseInt($("#seachcity").val())>0){
						diqustr=diqustr+$("#seachcity option").eq($("#seachcity").attr("selectedIndex")).text();
				   }
			}
			
			
			var seachdistrict = "";
			if($("#seachdistrict").length > 0 ){
			    seachdistrict = $("#seachdistrict").val();
			    if(parseInt($("#seachdistrict").val())>0){
				   diqustr=diqustr+$("#seachdistrict option").eq($("#seachdistrict").attr("selectedIndex")).text();
			    }
			}
			
			
            try {
				$.ajax({
					type: 'POST',
					url: '<?php echo U('./Angels/Orders/saveaddress');?>',
					data: {f:f,dladd_id:dladd_id, dladd_contact:dladd_contact, dladd_tel:dladd_tel, dladd_address:dladd_address, seachprov:seachprov, seachcity:seachcity, seachdistrict:seachdistrict, dladd_diqustr:diqustr },
					dataType: 'json',
					timeout: 30000,
					success: function (data) {

						var stat=0;
						stat=parseInt(data.stat);
						
						if (stat == 1) {
						     var f=0;
						     f=parseInt(data.f);
							 if(f==1){
							     location.href = "<?php echo U('./Angels/Orders/orderaddress');?>";
							 }else{
								 alert(data.msg);
								 location.href = "<?php echo U('./Angels/Orders/dladdress');?>";
							 }
							 return false; 
						}else if(stat == 2){
							 mpoptips(data.msg,"warn",2000);
							 location.href = "<?php echo U('./Angels/Dealer/login');?>";
							 return false; 
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
	
	
    initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, sub_arr, '<?php echo ($addressinfo["dladd_sheng"]); ?>', '<?php echo ($addressinfo["dladd_shi"]); ?>', '<?php echo ($addressinfo["dladd_qu"]); ?>');
</script>	
</body>

</html>