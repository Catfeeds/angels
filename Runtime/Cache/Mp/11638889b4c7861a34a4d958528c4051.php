<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品管理</title>
<link rel="stylesheet" type="text/css" href="/Public/mp/css/style.css" />
<script type="text/javascript" src="/Public/mp/js/jquery.min.js"></script>
<script type="text/javascript" >
        $(document).ready(function() {
            $(".pro_jftype").click(function(){
				if($(this).val()==1){
				    $("#gudingjf").show();
					$("#suijijf").hide();
				}else{
				    $("#gudingjf").hide();
					$("#suijijf").show();
				}
			 });
		 });
</script>
</head>
<body>
<div class="header">
<div class="bound">
<div class="logo">
<?php if(!empty($qypic)): ?><img src="/Public/uploads/product/<?php echo ($qypic); ?>"  height="40" style="vertical-align:middle" />
<?php else: ?> 
<img src="/Public/mp/static/logo0.png"  height="40" style="vertical-align:middle" /><?php endif; ?>
</div>
<div class="topright">您好,<?php echo ($qyuser); ?>　<a href="<?php echo U('Mp/Login/quit');?>" style="color:#fff;" >退出系统</a> </div>
</div>
</div>
<div class="main" >
<div class="bound" >
<div class="leftmenu">
<div class="menu_list">
<div class="menu_top">
<div  style="line-height:51px; height:51px;"><img src="/Public/mp/static/home2.png"   style="vertical-align:middle; width:20px; height:20px; margin:0 3px 4px 10px" /> <A href="<?php echo U('Mp/Index/index');?>" style="color:#06c; font-size:14px" >首页</A></div>
</div>  
<?php if(($qypurview["10000"]) == "10000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu01"  onClick="nemuclose('#zi01',this)" >基本资料</ul>
	<ul class="menu_son" id="zi01" >
	<?php if(($qypurview["10001"]) == "10001"): ?><li><A href="<?php echo U('Mp/Dealer/index');?>"   class="<?php echo ($curr =='dealer_list' ?'curr':''); ?>" >经销商管理</A></li><?php endif; ?>
	<?php if(($qypurview["20001"]) == "20001"): ?><li><A href="<?php echo U('Mp/Product/index');?>"  class="<?php echo ($curr =='pro_list' ?'curr':''); ?>" >产品管理</A></li><?php endif; ?>	
	<?php if(($qypurview["20005"]) == "20005"): ?><li><A href="<?php echo U('Mp/Product/proprice');?>"  class="<?php echo ($curr =='pro_price' ?'curr':''); ?>" >价格体系</A></li><?php endif; ?>
	<?php if(($qypurview["11001"]) == "11001"): ?><li><A href="<?php echo U('Mp/Warehouse/index');?>"  class="<?php echo ($curr =='warehouse_list' ?'curr':''); ?>" >仓库管理</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>   
<?php if(($qypurview["30000"]) == "30000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu07" onClick="nemuclose('#zi07',this)" >出货管理</ul>
	<ul class="menu_son" id="zi07">
	<?php if(($qypurview["30001"]) == "30001"): ?><li><A href="<?php echo U('Mp/Shipment/index');?>" class="<?php echo ($curr =='shipment_list' ?'curr':''); ?>">总公司出货</A></li><?php endif; ?>	
	<?php if(($qypurview["90004"]) == "90004"): ?><li><A href="<?php echo U('Mp/Shipment/dlshiplist');?>" class="<?php echo ($curr =='dealer_shiplist' ?'curr':''); ?>">经销商出货</A></li><?php endif; ?>	
	<?php if(($qypurview["30007"]) == "30007"): ?><li><A href="<?php echo U('Mp/Tongji/index');?>" class="<?php echo ($curr =='tongji_list' ?'curr':''); ?>">出货统计</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>  

<?php if(($qypurview["13000"]) == "13000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu13" onClick="nemuclose('#zi13',this)" >订单管理</ul>
	<ul class="menu_son" id="zi13">
	<?php if(($qypurview["13001"]) == "13001"): ?><li><A href="<?php echo U('Mp/Orders/cporders');?>" class="<?php echo ($curr =='cporders' ?'curr':''); ?>" >公司订单</A></li><?php endif; ?>
<!-- 	<?php if(($qypurview["13002"]) == "13002"): ?><li><A href="<?php echo U('Mp/Orders/index');?>" class="<?php echo ($curr =='order_list' ?'curr':''); ?>" >所有订单</A></li><?php endif; ?> -->
<!-- 	<?php if(($qypurview["13008"]) == "13008"): ?><li><A href="<?php echo U('Mp/Orders/qborders');?>" class="<?php echo ($curr =='qborders' ?'curr':''); ?>" >所有订单</A></li><?php endif; ?> -->
	<?php if(($qypurview["13005"]) == "13005"): ?><li><A href="<?php echo U('Mp/Orders/dlordersum');?>" class="<?php echo ($curr =='dlordersum' ?'curr':''); ?>" >代理业绩</A></li><?php endif; ?>
	<?php if(($qypurview["13003"]) == "13003"): ?><li><A href="<?php echo U('Mp/Orders/addresslist');?>" class="<?php echo ($curr =='address' ?'curr':''); ?>" >发货地址</A></li><?php endif; ?>
<!-- 	<?php if(($qypurview["13006"]) == "13006"): ?><li><A href="<?php echo U('Mp/Returnable/index');?>" class="<?php echo ($curr =='returnable' ?'curr':''); ?>" >公司退换货</A></li><?php endif; ?>
	<?php if(($qypurview["13006"]) == "13006"): ?><li><A href="<?php echo U('Mp/Returnable/dlreturn');?>" class="<?php echo ($curr =='dlreturn' ?'curr':''); ?>" >代理退换货</A></li><?php endif; ?> -->
	</ul>
</div><?php endif; ?>  

 <?php if(($qypurview["14000"]) == "14000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu14" onClick="nemuclose('#zi14',this)" >返利管理</ul>
	<ul class="menu_son" id="zi14">
	<?php if(($qypurview["14001"]) == "14001"): ?><li><A href="<?php echo U('Mp/Fanli/index');?>" class="<?php echo ($curr =='fanlidllist' ?'curr':''); ?>" >代理返利</A></li><?php endif; ?>
	<?php if(($qypurview["14002"]) == "14002"): ?><li><A href="<?php echo U('Mp/Fanli/fanlilist');?>" class="<?php echo ($curr =='fanlilist' ?'curr':''); ?>" >返利明细</A></li><?php endif; ?>
	<?php if(($qypurview["14003"]) == "14003"): ?><li><A href="<?php echo U('Mp/Fanli/paylist');?>" class="<?php echo ($curr =='paylist' ?'curr':''); ?>" >我应付返利</A></li><?php endif; ?>
	<?php if(($qypurview["14003"]) == "14003"): ?><li><A href="<?php echo U('Mp/Fanli/recashlist');?>" class="<?php echo ($curr =='recashlist' ?'curr':''); ?>" >提现记录</A></li><?php endif; ?>
	<!--<?php if(($qypurview["14004"]) == "14004"): ?>-->
	    <!--<li><A href="<?php echo U('Mp/Fanli/salesreward');?>" class="<?php echo ($curr =='salesreward' ?'curr':''); ?>" >销售累计奖</A></li>-->
	<!--<?php endif; ?>-->
	<!--<?php if(($qypurview["14005"]) == "14005"): ?>-->
	    <!--<li><A href="<?php echo U('Mp/Fanli/salemonthly');?>" class="<?php echo ($curr =='salemonthly' ?'curr':''); ?>" >按月销售奖</A></li>-->
	<!--<?php endif; ?>-->

	</ul>
</div><?php endif; ?>

<?php if(($qypurview["18000"]) == "18000"): ?><div class="menu_parent">

	<ul class="menu_sontitle" id="fu18" onClick="nemuclose('#zi18',this)" >资金管理</ul>
	<ul class="menu_son" id="zi18">

	<?php if(($qypurview["18001"]) == "18001"): ?><li><A href="<?php echo U('Mp/Capital/index');?>" class="<?php echo ($curr =='capital' ?'curr':''); ?>" >代理资金</A></li><?php endif; ?>
	<?php if(($qypurview["18002"]) == "18002"): ?><li><A href="<?php echo U('Mp/Capital/yufukuan');?>" class="<?php echo ($curr =='yufukuan' ?'curr':''); ?>" >预付款明细</A></li><?php endif; ?>
	<?php if(($qypurview["18004"]) == "18004"): ?><li><A href="<?php echo U('Mp/Capital/dlbalance');?>" class="<?php echo ($curr =='dlbalance' ?'curr':''); ?>" >余额明细</A></li><?php endif; ?>
	<?php if(($qypurview["18006"]) == "18006"): ?><li><A href="<?php echo U('Mp/Capital/recashlist');?>" class="<?php echo ($curr =='recashlist2' ?'curr':''); ?>" >提现记录</A></li><?php endif; ?>
	<?php if(($qypurview["18007"]) == "18007"): ?><li><A href="<?php echo U('Mp/Capital/payinlist');?>" class="<?php echo ($curr =='payinlist' ?'curr':''); ?>" >充值记录</A></li><?php endif; ?>
	</ul>
	
</div><?php endif; ?>

<!-- <?php if(($qypurview["15000"]) == "15000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu15" onClick="nemuclose('#zi15',this)" >积分管理</ul>
	<ul class="menu_son" id="zi15">
	<?php if(($qypurview["15001"]) == "15001"): ?><li><A href="<?php echo U('Mp/Dljf/index');?>" class="<?php echo ($curr =='dljflist' ?'curr':''); ?>" >代理积分</A></li><?php endif; ?>
	<?php if(($qypurview["15001"]) == "15001"): ?><li><A href="<?php echo U('Mp/Dljf/dljflist');?>" class="<?php echo ($curr =='dljdetail' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>
	<?php if(($qypurview["15002"]) == "15002"): ?><li><A href="<?php echo U('Mp/Dljf/dljfexch');?>" class="<?php echo ($curr =='dljfexch' ?'curr':''); ?>" >兑换管理</A></li><?php endif; ?>
	<?php if(($qypurview["15003"]) == "15003"): ?><li><A href="<?php echo U('Mp/Dljf/dljfgift');?>" class="<?php echo ($curr =='dljfgift' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?> -->

<?php if(($qypurview["40000"]) == "40000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu02" onClick="nemuclose('#zi02',this)" >会员积分管理</ul>
	<ul class="menu_son" id="zi02">
	<?php if(($qypurview["40001"]) == "40001"): ?><li><A href="<?php echo U('Mp/Jfuser/index');?>" class="<?php echo ($curr =='jfuser_list' ?'curr':''); ?>" >会员管理</A></li><?php endif; ?>
	<?php if(($qypurview["50001"]) == "50001"): ?><li><A href="<?php echo U('Mp/Jfdetail/index');?>"  class="<?php echo ($curr =='jfdetail_list' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>	
	<?php if(($qypurview["50002"]) == "50002"): ?><li><A href="<?php echo U('Mp/Jfexchange/index');?>" class="<?php echo ($curr =='jfexchange_list' ?'curr':''); ?>">礼品兑换</A></li><?php endif; ?>	
	<?php if(($qypurview["50003"]) == "50003"): ?><li><A href="<?php echo U('Mp/Jfgift/index');?>" class="<?php echo ($curr =='jfgift_list' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>	
	</ul>
</div><?php endif; ?>	
<?php if(($qypurview["12000"]) == "12000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu12" onClick="nemuclose('#zi12',this)" >导购管理</ul>
	<ul class="menu_son" id="zi12">
	<?php if(($qypurview["12001"]) == "12001"): ?><li><A href="<?php echo U('Mp/Dguser/index');?>" class="<?php echo ($curr =='dguser_list' ?'curr':''); ?>" >导购员列表</A></li><?php endif; ?>
	<?php if(($qypurview["12006"]) == "12006"): ?><li><A href="<?php echo U('Mp/Dgjfdetail/index');?>"  class="<?php echo ($curr =='dgjfdetail_list' ?'curr':''); ?>" >积分明细</A></li><?php endif; ?>	
	<?php if(($qypurview["12007"]) == "12007"): ?><li><A href="<?php echo U('Mp/Dgjfexchange/index');?>" class="<?php echo ($curr =='dgjfexchange_list' ?'curr':''); ?>">礼品兑换</A></li><?php endif; ?>	
	<?php if(($qypurview["12008"]) == "12008"): ?><li><A href="<?php echo U('Mp/Dgjfgift/index');?>" class="<?php echo ($curr =='dgjfgift_list' ?'curr':''); ?>" >礼品管理</A></li><?php endif; ?>	
	</ul>
</div><?php endif; ?>
<?php if(($qypurview["70000"]) == "70000"): ?><div class="menu_parent">
	<ul class="menu_sontitle" id="fu04" onClick="nemuclose('#zi04',this)" >前台设置</ul>
	<ul class="menu_son" id="zi04" >
	<?php if(($qypurview["70001"]) == "70001"): ?><li><A href="<?php echo U('Mp/Jfmobi/basic');?>" class="<?php echo ($curr =='jfmo_basic' ?'curr':''); ?>" >基本设置</A></li><?php endif; ?>
	<?php if(($qypurview["70017"]) == "70017"): ?><li><A href="<?php echo U('Mp/Jfmobi/setlogo');?>" class="<?php echo ($curr =='jfmo_logo' ?'curr':''); ?>" >Logo设置</A></li><?php endif; ?>
	<?php if(($qypurview["70019"]) == "70019"): ?><li><A href="<?php echo U('Mp/Jfmobi/setfoot');?>" class="<?php echo ($curr =='jfmo_foot' ?'curr':''); ?>" >底部图片</A></li><?php endif; ?>
	<?php if(($qypurview["70018"]) == "70018"): ?><li><A href="<?php echo U('Mp/Jfmobi/haibaolist');?>" class="<?php echo ($curr =='jfmo_haibao' ?'curr':''); ?>" >海报设置</A></li><?php endif; ?>
	<?php if(($qypurview["70006"]) == "70006"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=1');?>" class="<?php echo ($curr =='jfmo_news' ?'curr':''); ?>" >企业动态</A></li><?php endif; ?>	
	
	<!--<?php if(($qypurview["70020"]) == "70020"): ?>-->
		<!--<li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=4');?>" class="<?php echo ($curr =='jfmo_sucai' ?'curr':''); ?>" >素材中心</A></li>-->
	<!--<?php endif; ?>-->
	<?php if(($qypurview["70021"]) == "70021"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=5');?>" class="<?php echo ($curr =='jfmo_shiti' ?'curr':''); ?>" >线下实体店</A></li><?php endif; ?>
	<?php if(($qypurview["70022"]) == "70022"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=6');?>" class="<?php echo ($curr =='jfmo_peixun' ?'curr':''); ?>" >培训机构</A></li><?php endif; ?>
	<?php if(($qypurview["70013"]) == "70013"): ?><li><A href="<?php echo U('Mp/Jfmobi/newslist?news_type=2');?>" class="<?php echo ($curr =='jfmo_buyer' ?'curr':''); ?>" >买家秀</A></li><?php endif; ?>
	<?php if(($qypurview["70005"]) == "70005"): ?><li><A href="<?php echo U('Mp/Jfmobi/product');?>" class="<?php echo ($curr =='jfmo_pro' ?'curr':''); ?>">产品展示</A></li><?php endif; ?>
	<!--<?php if(($qypurview["70007"]) == "70007"): ?>-->
		<!--<li><A href="<?php echo U('Mp/Jfmobi/piclist');?>" class="<?php echo ($curr =='jfmo_pics' ?'curr':''); ?>">图片管理</A></li>-->
	<!--<?php endif; ?>	-->
	<?php if(($qypurview["70007"]) == "70007"): ?><li><A href="<?php echo U('Mp/Jfmobi/feedback');?>" class="<?php echo ($curr =='jfmo_feedback' ?'curr':''); ?>">留言反馈</A></li><?php endif; ?>
	<!--<?php if(($qypurview["70014"]) == "70014"): ?>-->
		<!--<li><A href="<?php echo U('Mp/Jfmobi/feedback');?>" class="<?php echo ($curr =='jfmo_survey' ?'curr':''); ?>">调查问卷</A></li>-->
	<!--<?php endif; ?>-->
	</ul>
</div><?php endif; ?>
<?php if(($qypurview["80000"]) == "80000"): ?><div class="menu_parent">
	<ul class="menu_sontitle2"  id="fu05"  onClick="nemuclose('#zi05',this)" >查询</ul>
	<ul class="menu_son" id="zi05"  style="display:none"  >
	<?php if(($qypurview["80001"]) == "80001"): ?><li><A href="<?php echo U('Mp/Chaxun/fangcuan');?>" class="<?php echo ($curr =='fangcuan' ?'curr':''); ?>" >防窜货查询</A></li><?php endif; ?>
	<?php if(($qypurview["80002"]) == "80002"): ?><li><A href="<?php echo U('Mp/Chaxun/fwlist');?>"  class="<?php echo ($curr =='fwlist' ?'curr':''); ?>" >防伪码查询记录</A></li><?php endif; ?>
	</ul>
</div><?php endif; ?>
<div class="menu_parent">
	<ul class="menu_sontitle2" id="fu06" onClick="nemuclose('#zi06',this)" >系统管理</ul>
	<ul class="menu_son" id="zi06"  style="display:none" >
	<?php if(($qypurview["17001"]) == "17001"): ?><li><A href="<?php echo U('Mp/Subuser/index');?>" class="<?php echo ($curr =='subuser' ?'curr':''); ?>" >子用户管理</A></li><?php endif; ?>
		<li><A href="<?php echo U('Mp/Index/updatepwd');?>" class="<?php echo ($curr =='updatepwd' ?'curr':''); ?>">修改密码</A></li>
		<li><A href="<?php echo U('Mp/Login/quit');?>"  >退出系统</A></li>
	</ul>
</div>
</div>
<script type="text/javascript" >
function nemuclose(z,obj){
  $(z).toggle();
  if($(z).css("display")=="none"){
      $(obj).removeClass();
      $(obj).addClass("menu_sontitle2");
  }else{
      $(obj).removeClass();
      $(obj).addClass("menu_sontitle");
  }
}
</script>
</div>
<div class="rightcontent">
<div class="content_nav" >
<div class="nav_l"><a href="<?php echo U('Mp/Index/index');?>">首页</a>　&gt;　<A href="<?php echo U('Mp/Product/index');?>">产品管理</A>　&gt;　<A href="#"><?php echo ($atitle); ?></A></div>
<div class="nav_r"></div>
</div>
<div class="height20"></div>
<div class="content">
<form action="<?php echo U('Mp/Product/edit_save');?>"   method="post" name="fmmm"  enctype="multipart/form-data" >
<input type="hidden" value="<?php echo ($proinfo["pro_id"]); ?>" name="pro_id" />
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
             <tr>     
                  <td height="40"   width="25%" class="txtright" ></td>
				  <td width="75%" class="txtleft" ></td>
			  </tr>
			  <tr>     
                  <td height="40"   class="txtright" >产品名称：</td>
				  <td class="txtleft" ><input    type="text" size="50" maxlength="50"  name="pro_name"  class="input"  value="<?php echo ($proinfo["pro_name"]); ?>"   >  * </td>
			  </tr>
			   <tr>     
                  <td height="40"  class="txtright" > 产品编号：</td>
				  <td  class="txtleft" ><input type="text" size="25" maxlength="25"  name="pro_number" class="input" value="<?php echo ($proinfo["pro_number"]); ?>" > *</td>
			  </tr>
			   <?php if($qypurview["20006"] == '20006' ): ?><tr>     
                  <td height="40"  class="txtright" > 零售价：</td>
				  <td  class="txtleft" ><input type="text" size="10" maxlength="10"  name="pro_price" class="input" value="<?php if(($proinfo["pro_price"] != '') AND ($proinfo["pro_price"] != '0') ): echo ($proinfo["pro_price"]); endif; ?>" > 元 *</td>
			  </tr><?php endif; ?>
			    <?php if($qypurview["20012"] == '20012' ): ?><tr>     
                  <td height="40"  class="txtright" > 库存：</td>
				  <td  class="txtleft" ><input type="text" size="10" maxlength="10"  name="pro_stock" class="input" value="<?php if(($proinfo["pro_stock"] != '') AND ($proinfo["pro_stock"] != '0') ): echo ($proinfo["pro_stock"]); endif; ?>" ></td>
			  </tr><?php endif; ?>
			   <tr>     
                  <td height="40"  class="txtright" > 单位：</td>
				  <td  class="txtleft" ><input type="text" size="10" maxlength="10"  name="pro_units" class="input" value="<?php echo ($proinfo["pro_units"]); ?>" > * 如：箱、盒</td>
			  </tr>
			   <?php if($qypurview["20007"] == '20007' ): ?><tr>     
                  <td height="40"  class="txtright" > 产品包装比例：</td>
				  <td  class="txtleft" >大标：<input type="text" size="4" maxlength="4"  name="pro_dbiao" class="input" value="<?php echo ($proinfo["pro_dbiao"]); ?>" >　小标：<input type="text" size="4" maxlength="5"  name="pro_xbiao" class="input" value="<?php echo ($proinfo["pro_xbiao"]); ?>" >　　(一个包装单位里面大标与小标比例，如没有则不用填或为0)</td>
			  </tr><?php endif; ?>
			   
			   <tr>     
                  <td height="40"  class="txtright" >产品类别：</td>
				  <td  class="txtleft" >
				  <select name="pro_typeid"   class="select" >
					<option value="0"   >选择产品类别</option>
					<?php if(is_array($typelist)): $key = 0; $__LIST__ = $typelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($key % 2 );++$key;?><option value="<?php echo ($vo["protype_id"]); ?>" style="font-weight:bold;" <?php echo ($vo["selected"]); ?> ><?php echo ($vo["protype_name"]); ?></option>
					<?php if(is_array($vo['subarr'])): $i = 0; $__LIST__ = $vo['subarr'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?><option value="<?php echo ($sub["protype_id"]); ?>"  <?php echo ($sub["selected"]); ?> >　├<?php echo ($sub["protype_name"]); ?></option><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
				  </select> *
				  </td>
			  </tr>
			  <tr>     
                  <td height="40"  class="txtright" >产品图片：</td>
				  <td  class="txtleft"  style="padding:5px 5px 10px 0" >
				  <?php if(($proinfo["pro_pic_str"]) != ""): ?><a href="/Public/uploads/product/<?php echo ($proinfo["pro_pic"]); ?>" target="_blank" ><?php echo ($proinfo["pro_pic_str"]); ?></a><?php endif; ?> <input name="pic_file" type="file" /> (建议图片大小:300X300) <input type="hidden"  value="<?php echo ($proinfo["pro_pic"]); ?>" name="old_pro_pic" />
				  </td>
			  </tr>
			   <tr>     
                  <td height="40"  class="txtright" >产品详细图示：</td>
				  <td  class="txtleft"  style="padding:5px 5px 10px 0" >
				  <?php if(($proinfo["pro_pic2_str"]) != ""): ?><a href="/Public/uploads/product/<?php echo ($proinfo["pro_pic2"]); ?>" target="_blank" ><?php echo ($proinfo["pro_pic2_str"]); ?></a> <a href="<?php echo U('Mp/Product/delpic?proid='.$proinfo['pro_id'].'&pic=2');?>" >删</a><?php endif; ?> <input name="pic_file2" type="file" /> *竖版：建议图片大小:640X1000 (用于防伪结果显示) <input type="hidden"  value="<?php echo ($proinfo["pro_pic2"]); ?>" name="old_pro_pic2" />
				  </td>
			  </tr>
			  <?php if($qypurview["20008"] == '20008' ): ?><tr>     
                  <td height="40"  class="txtright" ></td>
				  <td  class="txtleft" > <input name="pro_jftype" type="radio" value="1"  class="pro_jftype" <?php if(($proinfo["pro_jftype"]) == "1"): ?>checked<?php endif; ?>  />固定积分　　　<input name="pro_jftype" type="radio" value="2" class="pro_jftype" <?php if(($proinfo["pro_jftype"]) == "2"): ?>checked<?php endif; ?> />随机积分 </td>
			  </tr>
			  
			   <tr id="gudingjf" <?php if(($proinfo["pro_jftype"]) == "2"): ?>style="display:none"<?php endif; ?>  >     
                  <td height="40"  class="txtright" >固定积分：</td>
				  <td  class="txtleft" ><input type="text" size="5" maxlength="8"  name="pro_jifen" class="input" value="<?php echo ($proinfo["pro_jifen"]); ?>" > *</td>
			  </tr>
			   <tr id="suijijf" <?php if(($proinfo["pro_jftype"]) == "1"): ?>style="display:none"<?php endif; ?>  >     
                  <td height="40"  class="txtright" >随机积分范围：</td>
				  <td  class="txtleft" ><input type="text" size="5" maxlength="8"  name="pro_jifen2" class="input" value="<?php echo ($proinfo["pro_jifen"]); ?>" >　<input type="text" size="5" maxlength="8"  name="pro_jfmax" class="input" value="<?php echo ($proinfo["pro_jfmax"]); ?>" > *</td>
			  </tr><?php endif; ?>
<!--		<?php if($qypurview["15001"] == '15001' ): ?><tr >     
                  <td height="40"  class="txtright" >代理积分：</td>
				  <td  class="txtleft" ><input type="text" size="5" maxlength="8"  name="pro_dljf" class="input" value="<?php echo ($proinfo["pro_dljf"]); ?>" ></td>
			  </tr><?php endif; ?>
-->
			   <tr>     
                  <td height="40"  class="txtright" >产品描述：</td>
				  <td  class="txtleft" ><textarea cols="50" rows="10" name="pro_desc"  ><?php echo ($proinfo["pro_desc"]); ?></textarea><br /><br /></td>
			  </tr>
			   <tr>     
                  <td height="40"  class="txtright" >备注：</td>
			     <td  class="txtleft" ><textarea cols="50" rows="3" name="pro_remark"  ><?php echo ($proinfo["pro_remark"]); ?></textarea></td>
			  </tr>

			  <tr>  <td height="60" ></td>
                    <td  class="txtleft"  >
             <input type="submit" name="Submit" value="<?php echo ($atitle); ?>" class="botton" >　　　　<input name="" type="reset" value="返 回"  onClick="javascript:window.history.go(-1);" class="botton" >
            </td>
			  </tr>
			</table>
</form>
</div>
<div class="height20"></div>
</div>
</div>
</div>
<div class="clear"></div>
<div class="footer">
<div class="bound">
<div class="f1"> &copy; <span id="cyear" ></span></div>
<script>var myDate = new Date();$("#cyear").html(myDate.getFullYear());</script>
</div>
</div>
</body>
</html>