<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no,email=no,adress=no">
<title>扫描出货</title>
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
	<i class="ui-icon-return" style="color:#E8E8E8"  data-href="<?php echo U('./Angels/Dealer/index');?>"  ></i><h1 style="color: #0C0C0C">扫码出货</h1>
</header>
<section class="ui-container" style="margin-top: 3px">
    <div class="ui-form ui-border-t">
    <form action="<?php echo U('./Angels/Dealer/shipadd_save');?>" method="post">
        <div class="ui-form-item ui-border-b">
            <label>出货日期</label>
            <div class="ui-select-group">
                <div class="ui-select">
                    <select name="year">
                        <option selected="" value="">请选择</option>
                        <option value="2018">2018</option>
                        <option value="2019">2019</option>
                        <option value="2020">2020</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                    </select>
                </div>
                <div class="ui-select">
                    <select name="month" >
                        <option selected="" value="">请选择</option>
                        <option  value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </div>
                <div class="ui-select">
                    <select name="day">
                        <option selected="" value="">请选择</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                出货单号
            </label>
            <input type="text" name="ship_number" placeholder="请填写单号">
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                出货仓库
            </label>
            <div class="ui-select" style="margin-left: 120px">
                <select name="ship_whid" >
                    <option selected="" value="" >请选择仓库</option>
                    <?php if(is_array($warehouselist)): $i = 0; $__LIST__ = $warehouselist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ware): $mod = ($i % 2 );++$i;?><option  value="<?php echo ($ware['wh_id']); ?>"><?php echo ($ware['wh_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
            <!--<input type="text" name="ship_whid" placeholder="请填写仓库">-->
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                收货经销商
            </label>
            <div class="ui-select" style="margin-left: 120px">
                <select name="ship_dealer" >
                    <option selected="" value="" >请选择经销商</option>
                    <?php if(is_array($dealerlist)): $i = 0; $__LIST__ = $dealerlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$dl): $mod = ($i % 2 );++$i;?><option  value="<?php echo ($dl['dl_id']); ?>"><?php echo ($dl['dl_number']); ?>&nbsp<?php echo ($dl['dl_name']); ?>&nbsp<?php echo ($dl['dl_username']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
            <!--<input type="text" name="ship_dealer">-->
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                出货产品
            </label>
            <div class="ui-select" style="margin-left: 120px">
                <select name="ship_pro" >
                    <option selected="" value="" >请选择产品</option>
                    <?php if(is_array($productlist)): $i = 0; $__LIST__ = $productlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro): $mod = ($i % 2 );++$i;?><option  value="<?php echo ($pro['pro_id']); ?>"><?php echo ($pro['pro_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
            <!--<input type="text" name="ship_pro">-->
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                条码扫描
            </label>
            <input type="text" name="ship_barcode" placeholder="注：多个条码用逗号隔开">
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="ui-form-item ui-border-b">
            <label>
                备注
            </label>
            <input type="text" name="ship_remark">
            <!--<a href="#" class="ui-icon-close">-->
            <!--</a>-->
        </div>
        <div class="demo" style="margin-top: 13px;text-align:center">
            <button class="ui-btn ui-btn-primary">出货</button>
        </div>
    </form>

    </div>
<?php if($page != ''): ?><div style="margin:0 auto;" >
<table class="page" cellpadding="0" cellspacing="0" align="center"><tbody>
<tr>
<td><?php echo ($page); ?></td>
</tr></tbody></table>
</div><?php endif; ?>

</section>
<script>
$('.ui-list li').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});

$('.ui-icon-return').click(function(){
	if($(this).data('href')){
		location.href= $(this).data('href');
	}
});
</script>
</body>
</html>