<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>代理申请</title>
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
<script type="text/javascript" src="/Public/angels/js/lrz.all.bundle.js"></script>
<style>
.weui_uploader_input_wrp {
    border: 1px solid #d9d9d9;
    float: left;
    height: 70px;
    margin-bottom: 9px;
    margin-right: 9px;
    position: relative;
    width: 70px;
}
.weui_uploader_input_wrp::after, .weui_uploader_input_wrp::before {
    background-color: #fff;
    content: "正面";
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
}

.weui_uploader_input_wrp2::after, .weui_uploader_input_wrp2::before {
    background-color: #fff;
    content: "背面";
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
}

.weui_uploader_input_wrp:active {
    border-color: #999;
}
.weui_uploader_input_wrp:active::after, .weui_uploader_input_wrp:active::before {
    background-color: #999;
}
.weui_uploader_input {
    height: 100%;
    left: 0;
    opacity: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1;
}
</style>

</head>
<body ontouchstart >
<header class="ui-header ui-header-positive ui-border-b" style="background-color: white">
	<i class="ui-icon-return" style="color:#E8E8E8" data-href="<?php echo U('./Angels/Index/index');?>"  ></i><h1 style="color: #0C0C0C">代理申请</h1>
</header>
<section class="ui-container" >
<div class="ui-whitespace" style="margin:10px 0 10px 0" >
</div>
<div class="ui-form ui-border-t">
<form action="<?php echo U('./Angels/Apply/index');?>" action="" enctype="multipart/form-data" method="post" id="fmmm" name="fmmm" >
<input type="hidden" name="ttamp" id="ttamp" value="<?php echo ($ttamp); ?>">	
<input type="hidden" name="sture" id="sture" value="<?php echo ($sture); ?>">		
<input type="hidden" name="action" id="action" value="save">
<input type="hidden" name="diqustr" id="diqustr" value="">
<input type="hidden" name="file_name" id="file_name"  value="" >
<input type="hidden" name="file_name2" id="file_name2"  value="" >
<div class="ui-form-item ui-border-b">
	<label>代理级别</label>
	<div class="ui-select">
		<select name="dltype"  id="dltype"  >
		<?php if(is_array($dltypelist)): foreach($dltypelist as $key2=>$item2): ?><option  value="<?php echo ($item2["dlt_id"]); ?>" ><?php echo ($item2["dlt_name"]); ?></option><?php endforeach; endif; ?>
		</select>
	</div>

</div>
<div class="ui-form-item ui-border-b">
	<label for="#">姓名</label>
	<input type="text" value=""  placeholder="姓名"  id="dl_name" name="dl_name" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">微信号</label>
	<input type="text" value=""  placeholder="微信号" id="dl_weixin" name="dl_weixin" >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">手机号</label>
	<input type="text" value=""  placeholder="手机号" id="dl_tel" name="dl_tel" maxlength="11">
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">身份证</label>
	<input type="text" value=""  placeholder="身份证" id="dl_idcard" name="dl_idcard" maxlength="18" minlength="15">
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">省份</label>
	<div class="ui-select">
	<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
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
	<label for="#">收货地址</label>
	<input type="text" value=""  placeholder="收货地址" id="dl_address" name="dl_address"  >
</div>
<div class="ui-form-item ui-border-b">
	<label for="#">推荐人编号</label>
	<input type="text" value=""  placeholder="请填写推荐人编号" id="dl_referee" name="dl_referee"  >
</div>

<!--<div class="ui-whitespace" style="margin:10px 0 10px 0" >
    <h1>上传证件<span style="font-size:0.8em; font-weight:normal">(文件小于2M)</span></h1>
<div style="float:left;padding-right:5px;max-width:70px;display:none" id="img_div" >
<img id="img_file" style=" width:100%; border:none"  />
</div>
<div class="weui_uploader_input_wrp"> 
<input id="pic_file" name="pic_file" class="weui_uploader_input js_file"  type="file"   accept="image/gif,image/jpeg,image/jpg,image/png" >
</div>

<div style="float:left;padding-right:5px;max-width:70px;display:none" id="img_div2" >
<img id="img_file2" style=" width:100%; border:none"  />
</div>
<div class="weui_uploader_input_wrp weui_uploader_input_wrp2"> 
<input id="pic_file2" name="pic_file2" class="weui_uploader_input js_file"  type="file"   accept="image/gif,image/jpeg,image/jpg,image/png" >
</div>
</div>-->

</form>
<div class="ui-btn-wrap">
    <button class="ui-btn-lg ui-btn-primary" id="qyapply" >
        提交申请
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
	
	$("#dl_address").click(function(){
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
			
			if($("#dl_address").val()==""){
			    $("#dl_address").val(diqustr);
			}
	});


	//点击提交
    $("#qyapply").click(function(){
	
			if($("#dltype").val() == "") { 
				mpoptips("请选择代理级别","warn",2000);
				return false; 
			}
			
            if($("#dl_name").val() == "") { 
				mpoptips("请填写姓名","warn",2000);
				return false; 
			} 
			 
			if($("#dl_weixin").val() == "") { 
				mpoptips("请填写微信号","warn",2000);
				return false; 
			}
			
			
			var filter=/^\s*[a-zA-Z0-9_-]{6,20}\s*$/; 
			if  (!filter.test($("#dl_weixin").val())) { 
				mpoptips("请正确填写微信号,支持6-20个字母、数字、下划线和减号","warn",2000);
				return false; 
			}
		
			
			if($("#dl_tel").val() == "") { 
				mpoptips("请填写手机号","warn",2000);
				return false; 
			}
			var filter2=/^\s*[0-9]{10,15}\s*$/; 
			if  (!filter2.test($("#dl_tel").val())) { 
				mpoptips("请正确填写手机号,手机号由11位数字组成,","warn",2000);
				return false; 
			}
			
			
			if($("#dl_idcard").val() == "") { 
				mpoptips("请填写身份证号","warn",2000);
				return false; 
			}
			
			if($("#dl_idcard").val().length==18)
			{
            	var filter=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/; 
				if  (!filter.test($("#dl_idcard").val())) { 
					mpoptips("请正确填写第二代18位身份证号","warn",2000);
					return false; 
				}
			}else if($("#dl_idcard").val().length<7)
			{
					mpoptips("请正确填写身份证号","warn",2000);
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
			
			if($("#dl_address").val() == "") { 
				mpoptips("请填写收件地址","warn",2000);
				return false; 
			}
			
			if($("#dl_referee").val() == "") { 
				mpoptips("请填写推荐人编号","warn",2000);
				return false; 
			}
			
			
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
			
			$("#diqustr").val(diqustr);
			$("#fmmm").submit(); 

	
	});

    initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, sub_arr, '0', '0', '0');
	
})();
</script>


<script>
(function(){
        $("#pic_file").change(function(){
             lrz(this.files[0], {width: 800})
                .then(function (rst){
                    //console.log(rst);
					 var el=$.loading({
							content:'上传中...',
					 });
                    $.ajax({
                        url: '<?php echo U('./Angels/Dealer/uploadpic');?>',
                        type: 'post',
                        data: {"pic_file":rst.base64,"ttamp":"<?php echo ($ttamp); ?>","sture":"<?php echo ($sture); ?>"},
                        dataType: 'json',
                        timeout: 200000,
                        success: function (response) {
						    el.loading("hide");
                            if (response.stat == '0') {
								$("#file_name").val(response.filename);
								$("#img_file").attr('src',"/Public/uploads/temp/"+response.filename); 
								$("#img_div").show();
                                 return true;
                            } else {
								alert('图片提交失败');
								return false;
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            el.loading("hide");
                            if (textStatus == 'timeout') {
                                a_info_alert('请求超时');
                                return false;
                            }

                            alert(jqXHR.responseText);
                        }
                    });
                        
                })
                .catch(function (err) {
                   el.loading("hide");
                })
                .always(function () {
                   el.loading("hide");
                });
        });
		
        $("#pic_file2").change(function(){
             lrz(this.files[0], {width: 800})
                .then(function (rst) {
                    //console.log(rst);
					 var el=$.loading({
							content:'上传中...',
					 });
                    $.ajax({
                        url: '<?php echo U('./Angels/Dealer/uploadpic');?>',
                        type: 'post',
                        data: {"pic_file":rst.base64,"ttamp":"<?php echo ($ttamp); ?>","sture":"<?php echo ($sture); ?>"},
                        dataType: 'json',
                        timeout: 200000,
                        success: function (response) {
						    el.loading("hide");
                            if (response.stat == '0') {
								$("#file_name2").val(response.filename);
								$("#img_file2").attr('src',"/Public/uploads/temp/"+response.filename); 
								$("#img_div2").show();
                                 return true;
                            } else {
								alert('图片提交失败');
								return false;
                            }
                        },

                        error: function (jqXHR, textStatus, errorThrown) {
                            el.loading("hide");
                            if (textStatus == 'timeout') {
                                a_info_alert('请求超时');
                                return false;
                            }

                            alert(jqXHR.responseText);
                        }
                    });
                        
                })
                .catch(function (err) {
                   el.loading("hide");
                })
                .always(function () {
                   el.loading("hide");
                });
        });
		
})();
</script>

</body>
</html>