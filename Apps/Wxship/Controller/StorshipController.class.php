<?php
namespace Wxship\Controller;
use Think\Controller;
class StorshipController extends CommController {
    //结合入库的出货
    public function index(){
        exit;
    }
	//出货扫描 设置 
    public function shipscanset(){
		$this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------
        $qysu_purview=session('qysu_purview');
		
		

		//经销商
		$map2=array();
		$map2['dl_unitcode']=$qycode;
		$map2['dl_belong']=0;
		$map2['dl_status']=1;
		$Dealer= M('Dealer');
		$list4 = $Dealer->where($map2)->order('dl_id DESC')->limit(1000)->select();
		$this->assign('dealerlist', $list4);
		
		//出货日期 默认显示当天前后30天
		$day60=array();
		$dayq30=strtotime(date('Y-m-d',strtotime("-30 days")));
		$nowday=strtotime(date('Y-m-d',time()));
		for ($d=0; $d<60; $d++) {
			$day60[]=$dayq30;
			$dayq30=$dayq30+24*3600;
		}
		$this->assign('day60', $day60);
		
		if(is_not_null(session('ship_date'))){
			$this->assign('nowday', session('ship_date'));
		}else{
			$this->assign('nowday', $nowday);
		}
			
		if(is_not_null(session('ship_number'))){
			$this->assign('ship_number', session('ship_number'));
		}else{
			$this->assign('ship_number', '');
		}
		
		if(is_not_null(session('ship_dealer'))){
			$this->assign('ship_dealer', session('ship_dealer'));
		}else{
			$this->assign('ship_dealer', '');
		}
		
		if(is_not_null(session('ship_remark'))){
			$this->assign('ship_remark', session('ship_remark'));
		}else{
			$this->assign('ship_remark', '');
		}
		
		$this->display('shipscanset');
    }
	
	//出货扫描 
    public function shipscan(){
		$this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------
		
	    if(IS_POST){
			$ship_date=I('post.ship_date','');
			$ship_number=I('post.ship_number','');
			$ship_dealer=intval(I('post.ship_dealer',0));
			$ship_remark=I('post.ship_remark','');
		}else{

			if(is_not_null(session('ship_date'))){
				$ship_date=session('ship_date');
			}else{
				$ship_date='';
			}
			if(is_not_null(session('ship_number'))){
				$ship_number=session('ship_number');
			}else{
				$ship_number='';
			}
			if(is_not_null(session('ship_dealer'))){
				$ship_dealer=session('ship_dealer');
			}else{
				$ship_dealer=0;
			}
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}
		}
		
		if($ship_date==''){
			$this->error('请选择出货日期',U('Wxship/Storship/shipscanset'),2);
		}
		
		if($ship_number==''){
			$this->error('请填写出货单号',U('Wxship/Storship/shipscanset'),2);
		}

		if($ship_dealer<=0){
			$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
		}
		
		//经销商
		$Dealer= M('Dealer');
		$map2=array();
		$map2['dl_unitcode']=$qycode;
		$map2['dl_belong']=0;
		$map2['dl_status']=1;
		$map2['dl_id']=$ship_dealer;
		$dlinfo = $Dealer->where($map2)->find();
		if($dlinfo){
			$dlname=$dlinfo['dl_number'].' '.$dlinfo['dl_name'];
		}else{
			$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
		}
		$this->assign('dlname', $dlname);
		
		
		//暂存用户选择历史
		session('ship_date',$ship_date);
		session('ship_number',$ship_number);
		session('ship_dealer',$ship_dealer);
		session('ship_remark',$ship_remark);
		
        $this->assign('ship_date', $ship_date);
		$this->assign('ship_number', $ship_number);
		$this->assign('ship_remark', $ship_remark);
		
		
		//统计扫描纪录 session 保存json数据
		$brcodestr=session('shipsubrcode');
		$scancount=0; //已扫标签数
		$scanprocount=0; //已扫产品数
		if(is_not_null($brcodestr)){
			$brcodearr=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
            foreach($brcodearr as $k=>$v){
				if(intval($v['qty'])>0){
					$scancount+=1;
					$scanprocount+=intval($v['qty']);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		

		//扫码入库
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'),C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		
		$this->display('shipscan');
    }
	
	//出货扫描-结果
    public function shipscanres(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//---------------------
		$brcode=I('get.brcode','');
		$msg='';
		if($brcode==''){
			$msg='条码为空';
			goto gotoEND;
            exit;
		}
		$barr=explode(',',$brcode);
		$brcode=end($barr);
        if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
			$msg='条码信息不正确';
			goto gotoEND;
            exit;
        }
		
		
		$map=array();
		$data=array();
		$Shipment= M('Shipment');
		$Chaibox= M('Chaibox');
		$Storchaibox= M('Storchaibox');
		$Storage= M('Storage');
        $barcode=array();
		
		//检测该条码是否已录入
		$map['ship_unitcode']=$qycode;
		$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
		$map['ship_barcode'] = $brcode;
		$data=$Shipment->where($map)->find();
		if(is_not_null($data)){
            $msg='条码<b>'.$brcode.'</b>已录入';
			$barcode=array();
			goto gotoEND;
			exit;
        }
		//检测是否已发行
        $barcode=wlcode_to_packinfo($brcode,$qycode);
        if(!is_not_null($barcode)){
            $msg='条码<b>'.$brcode.'</b>不存在或还没发行';
			$barcode=array();
			goto gotoEND;
			exit;
        }
		
        //检测是否拆箱入库
		$map2=array();
		$data2=array();
		$map2['chai_unitcode']=$qycode;
		$map2['chai_barcode'] = $brcode;
		$data2=$Storchaibox->where($map2)->find();

		if(is_not_null($data2)){
            $msg='条码<b>'.$brcode.'</b>已经拆箱入库，不能再使用，请录入小标条码';
			$barcode=array();
			goto gotoEND;
			exit;
		}
		
		//检测是否已入库 ucode-大标  	tcode-中标 
		$map2=array();
		$data2=array();
		$where=array();
		if($barcode['code']!=''){
			$where[]=array('EQ',$barcode['code']);
		}
		
		if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
			$where[]=array('EQ',$barcode['tcode']);
		}
		
		if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
			$where[]=array('EQ',$barcode['ucode']);
		}
		$where[]='or';
		$map2['stor_barcode'] = $where;
		$map2['stor_unitcode']=$qycode;
		$data2=$Storage->where($map2)->find();

		
		$stor_pro=0;
		$stor_whid=0;
		$stor_prodate='';
		$stor_batchnum='';
		if(is_not_null($data2)){
			//已入库
			$stor_pro=$data2['stor_pro'];
			$stor_whid=$data2['stor_whid'];
			$stor_prodate=$data2['stor_prodate'];
			$stor_batchnum=$data2['stor_batchnum'];
		}else{
            $msg='条码<b>'.$brcode.'</b>还没入库';
			$barcode=array();
			goto gotoEND;
			exit;
		}
		
        //是否已出货录入 
        $map=array();
        $where=array();
        if($barcode['code']!=''){
            $where[]=array('EQ',$barcode['code']);
        }
        if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
            $where[]=array('EQ',$barcode['tcode']);
        }
        if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
            $where[]=array('EQ',$barcode['ucode']);
        }
        $where[]='or';
        $map['ship_barcode'] = $where;
        $map['ship_unitcode']=$qycode;
        $map['ship_deliver']=0;
        $data=$Shipment->where($map)->find();
        if(is_not_null($data)){
            $msg='条码<b>'.$brcode.'</b>已录入';
			$barcode=array();
			goto gotoEND;
			exit;
        }
        //检测是否拆箱
		$map2=array();
        $map2['chai_unitcode']=$qycode;
        $map2['chai_barcode'] = $brcode;
        $map2['chai_deliver'] = 0;
        $data2=$Chaibox->where($map2)->find();

        if(is_not_null($data2)){
			$msg='条码<b>'.$brcode.'</b>已经拆箱，不能再使用';
			$barcode=array();
			goto gotoEND;
			exit;
        }
		
	    //暂存session
		if(is_not_null($barcode)){
			$brcodestr=session('shipsubrcode');
			$brcodearr=array();
			if(is_not_null($brcodestr)){
				$brcodearr=json_decode($brcodestr,true);
                if(json_last_error()!=0){
					$msg='JSON ERROR';
					$barcode=array();
					goto gotoEND;
					exit;
				}
				
				if(array_key_exists(strval($brcode),$brcodearr)===false){	
					if($barcode['tcode']=='' && $barcode['ucode']==''){
						//如果是大标
						$brcodearr[strval($brcode)]=array('pro'=>$stor_pro,'qty'=>$barcode['qty']);
					}else{
						//如果是小标
						if($barcode['ucode']==$barcode['tcode']){
							if(array_key_exists(strval($barcode['tcode']),$brcodearr)===false){	
								$brcodearr[strval($brcode)]=array('pro'=>$stor_pro,'qty'=>$barcode['qty']);
							}else{
								$msg='条码<b>'.$brcode.'</b>的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}else{
							if(array_key_exists(strval($barcode['ucode']),$brcodearr)===false  && array_key_exists(strval($barcode['tcode']),$brcodearr)===false){
								$brcodearr[strval($brcode)]=array('pro'=>$stor_pro,'qty'=>$barcode['qty']);
							}else{
								$msg='条码<b>'.$brcode.'</b>的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}
					}
				}else{
					$msg='条码<b>'.$brcode.'</b>已在扫描记录里';
					$barcode=array();
					goto gotoEND;
					exit;
				}
			}else{
				$brcodearr[strval($brcode)]=array('pro'=>$stor_pro,'qty'=>$barcode['qty']);
			}
			
			$brcodestr=json_encode($brcodearr);
			session('shipsubrcode',$brcodestr);
			
			$msg='条码<b>'.$brcode.'</b>扫描成功!';
		}else{
			$msg='对不起，你没有条码<b>'.$brcode.'</b>操作权限';
			$barcode=array();
			goto gotoEND;
			exit;
		}

		/////////////
		gotoEND:
		
		if(is_not_null(session('ship_date'))){
			$ship_date=session('ship_date');
		}else{
			$ship_date='';
		}
		if(is_not_null(session('ship_number'))){
			$ship_number=session('ship_number');
		}else{
			$ship_number='';
		}
		if(is_not_null(session('ship_dealer'))){
			$ship_dealer=session('ship_dealer');
		}else{
			$ship_dealer=0;
		}

		if(is_not_null(session('ship_remark'))){
			$ship_remark=session('ship_remark');
		}else{
			$ship_remark='';
		}

		
		if($ship_date==''){
			$this->error('请选择出货日期',U('Wxship/Storship/shipscanset'),2);
		}
		
		if($ship_number==''){
			$this->error('请填写出货单号',U('Wxship/Storship/shipscanset'),2);
		}

		if($ship_dealer<=0){
			$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
		}

		//对应产品
		if($stor_pro>0){
			$map2=array();
			$map2['pro_unitcode']=$qycode;
			$map2['pro_id'] = $stor_pro;
			$Product = M('Product');
			$proinfo = $Product->where($map2)->find();
			if($proinfo){
				$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
			}else{
				$proname='产品不存在';
			}
		}else{
			$proname='';
		}
		$this->assign('proname', $proname);
		
		//对应仓库
		if($stor_whid>0){
			$map2=array();
			$map2['wh_unitcode']=$qycode;
			$map2['wh_id']=$stor_whid;
			$Warehouse = M('Warehouse');
			$whinfo = $Warehouse->where($map2)->find();
			if($whinfo){
				$whname=$whinfo['wh_name'];
			}else{
				$whname='';
			}
		}else{
			$whname='';
		}
		$this->assign('whname', $whname);
		
		$this->assign('stor_prodate', $stor_prodate);
		$this->assign('stor_batchnum', $stor_batchnum);
			
		//经销商
		$Dealer= M('Dealer');
		$map2=array();
		$map2['dl_unitcode']=$qycode;
		$map2['dl_belong']=0;
		$map2['dl_status']=1;
		$map2['dl_id']=$ship_dealer;
		$dlinfo = $Dealer->where($map2)->find();
		if($dlinfo){
			$dlname=$dlinfo['dl_number'].' '.$dlinfo['dl_name'];
		}else{
			$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
		}
		$this->assign('dlname', $dlname);
		
		
		//暂存用户选择历史
		session('ship_date',$ship_date);
		session('ship_number',$ship_number);
		session('ship_dealer',$ship_dealer);
		session('ship_remark',$ship_remark);
		
        $this->assign('ship_date', $ship_date);
		$this->assign('ship_number', $ship_number);
		$this->assign('ship_remark', $ship_remark);
		
		//统计扫描纪录 session 保存json数据
		$brcodestr=session('shipsubrcode');
		$scancount=0; //已扫标签数
		$scanprocount=0; //已扫产品数
		if(is_not_null($brcodestr)){
			$brcodearr=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
            foreach($brcodearr as $k=>$v){
				if(intval($v['qty'])>0){
					$scancount+=1;
					$scanprocount+=intval($v['qty']);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}

		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'),C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('msg', $msg);
		$this->assign('barinfo', $barcode);
        $this->display('shipscanres');	
	}	
	
	
    //出货扫描记录
    public function shipscanlist(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
		//-------------------------------
		$brcodearr=array();
		$brcodestr=session('shipsubrcode');
		$scancount=0; //已扫标签数
		$scanprocount=0; //已扫产品数
		
		if(is_not_null($brcodestr)){
			$brcodearr=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
            $Product = M('Product');
            foreach($brcodearr as $k=>$v){
				if(intval($v['qty'])>0){
					$scancount+=1;
					$scanprocount+=intval($v['qty']);
					
                    $map2=array();
					$map2['pro_unitcode']=$qycode;
					$map2['pro_id'] = $v['pro'];
					$proinfo = $Product->where($map2)->find();
					if($proinfo){
						$brcodearr[strval($k)]['pro_name']=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
					}else{
                        $brcodearr[strval($k)]['pro_name']='产品不存在';
					}
					
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		
		if(count($brcodearr)<=0){
			$this->error('没有扫描纪录',U('Wxship/Storship/shipscanset'),2);
		}
		
		

	    $this->assign('list', $brcodearr);
		$this->assign('jishu', 1);
        $this->display('shipscanlist');
	}	
   
	
   //出货扫描记录-移除
    public function shipremove(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
		//-------------------------------
		
		$brcode=I('get.brcode','');
		
		$msg='';
		if($brcode==''){
			$this->error('没有该记录','',2);
		}
		$barr=explode(',',$brcode);
		$brcode=end($barr);
        if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
			$this->error('没有该记录','',2);
        }
		
		$brcodestr=session('shipsubrcode');
        $brcodearr=array();
		if(is_not_null($brcodestr)){
            $brcodearr=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}

			foreach($brcodearr as $k=>$v){
				if(intval($v['qty'])>0){
				}else{
					unset($brcodearr[$k]);
				}
			}

			unset($brcodearr[strval($brcode)]);
		}
        $brcodestr=json_encode($brcodearr);
		session('shipsubrcode',$brcodestr); 
		
		
        $this->success('移除成功',U('Wxship/Storship/shipscanlist'),1);
	}
	
    //出货扫描-确认出货
    public function shiping(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$step=intval(I('get.step',0));
		if($step==1){  //确认出货
			$ship_time=time();
			
			if(is_not_null(session('ship_date'))){
				$ship_date=session('ship_date');
			}else{
				$ship_date='';
			}
			if(is_not_null(session('ship_number'))){
				$ship_number=session('ship_number');
			}else{
				$ship_number='';
			}
			if(is_not_null(session('ship_dealer'))){
				$ship_dealer=session('ship_dealer');
			}else{
				$ship_dealer=0;
			}
			
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}

			
			if($ship_date==''){
				$this->error('请选择出货日期',U('Wxship/Storship/shipscanset'),2);
			}
			
			if($ship_number==''){
				$this->error('请填写出货单号',U('Wxship/Storship/shipscanset'),2);
			}

			if($ship_dealer<=0){
				$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
			}

			
			//经销商
			$Dealer= M('Dealer');
			$map2=array();
			$map2['dl_unitcode']=$qycode;
			$map2['dl_belong']=0;
			$map2['dl_status']=1;
			$map2['dl_id']=$ship_dealer;
			$dlinfo = $Dealer->where($map2)->find();
			if($dlinfo){
				$dlname=$dlinfo['dl_number'].' '.$dlinfo['dl_name'];
			}else{
				$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
			}
			$this->assign('dlname', $dlname);
			
			
			$this->assign('ship_date', $ship_date);
			$this->assign('ship_number', $ship_number);
			$this->assign('ship_remark', $ship_remark);


            $brcodearr=array();
			$brcodestr=session('shipsubrcode');
			$success=0; 
			$fail=0; 
			$kk=0;
			$scanprocount=0; //已扫产品数
			if(is_not_null($brcodestr)){
				$brcodearr=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
			}else{
				$this->error('没有扫描纪录',U('Wxship/Storship/shipscanset'),2);
			}
			
		    $Shipment= M('Shipment');
		    $Chaibox= M('Chaibox');
			$Storage= M('Storage');
			$Storchaibox= M('Storchaibox');
			$pro_arr=array();
			$Product = M('Product');
			
			foreach($brcodearr as $k=>$v){ 
				if($k!=''){
					$brcode=$k;
					if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
                        $brcarr[$kk]['barcode']=$brcode;
                        $brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
						$brcarr[$kk]['qty']=0;
						$brcarr[$kk]['pro_name']='';
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
					
					$map2=array();
					$map2['pro_unitcode']=$qycode;
					$map2['pro_id'] = $v['pro'];
					$proinfo = $Product->where($map2)->find();
					if($proinfo){
						$brcarr[$kk]['pro_name']=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
					}else{
					    $brcarr[$kk]['pro_name']='产品不存在';
					}
					
							
					//检测该条码是否已被使用
					$map2=array();
					$data2=array();
					$map2['ship_unitcode']=$qycode;
					$map2['ship_barcode'] = $brcode;
					$map2['ship_deliver']=0;

					$data2=$Shipment->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已使用</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
					
					//检测是否已发行
					$barcode=wlcode_to_packinfo($brcode,$qycode);
							
					if(!is_not_null($barcode)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码不存在或还没发行</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
					
					//检测是否拆箱入库
					$map2=array();
					$data2=array();
					$map2['chai_unitcode']=$qycode;
					$map2['chai_barcode'] = $brcode;
					$data2=$Storchaibox->where($map2)->find();

					if(is_not_null($data2)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">录入条码 '.$ship_barcode.' 出错，该条码已经拆箱入库，不能再使用，请录入小标条码。</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
					
					//检测是否已入库 ucode-大标  	tcode-中标 
					$map2=array();
					$data2=array();
					$where=array();
					if($barcode['code']!=''){
						$where[]=array('EQ',$barcode['code']);
					}
					
					if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
						$where[]=array('EQ',$barcode['tcode']);
					}
					
					if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
						$where[]=array('EQ',$barcode['ucode']);
					}
					$where[]='or';
					$map2['stor_barcode'] = $where;
					$map2['stor_unitcode']=$qycode;
					$data2=$Storage->where($map2)->find();
					
					$ship_pro=0;
					$ship_whid=0;
					$ship_prodate='';
					$ship_batchnum='';
					if(is_not_null($data2)){
						//已入库
						$ship_pro=$data2['stor_pro'];
						$ship_whid=$data2['stor_whid'];
						$ship_prodate=$data2['stor_prodate'];
						$ship_batchnum=$data2['stor_batchnum'];
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">录入条码 '.$ship_barcode.' 出错，该条码还没入库。</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
					
					
							
					//检测该条码是否已被使用2
					$map2=array();
					$where2=array();
					$data2=array();
					if($barcode['code']!=''){
						$where2[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
						$where2[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
						$where2[]=array('EQ',$barcode['ucode']);
					}
					$where2[]='or';
					$map2['ship_barcode'] = $where2;
					$map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
					$data2=$Shipment->where($map2)->find();
					
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已使用</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
					
					//检测是否拆箱
					$map2=array();
					$data2=array();
					$map2['chai_unitcode']=$qycode;
					$map2['chai_barcode'] = $brcode;
					$map2['chai_deliver'] = 0;
					$data2=$Chaibox->where($map2)->find();
					
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已经拆箱，不能再使用</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
					
					//保存记录
					if(is_not_null($barcode)){
						$insert=array();
						$insert['ship_unitcode']=$qycode;
						$insert['ship_number']=$ship_number;
						$insert['ship_deliver']=0;
						$insert['ship_dealer']=$ship_dealer;   //ship_dealer--收货方
						$insert['ship_pro']=$ship_pro;
						$insert['ship_whid']=$ship_whid;
						$insert['ship_proqty']=$barcode['qty'];
						$insert['ship_barcode']=$brcode;
						$insert['ship_date']=$ship_date;
						$insert['ship_ucode']=$barcode['ucode'];
						$insert['ship_tcode']=$barcode['tcode'];
						$insert['ship_remark']=$ship_remark;
						$insert['ship_cztype']=1;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
						$insert['ship_czid']=session('subuser_id');
						$insert['ship_czuser']=session('subuser_name');
						$insert['ship_prodate']=$ship_prodate;
						$insert['ship_batchnum']=$ship_batchnum;
						
                        $rs=$Shipment->create($insert,1);
						if($rs){
						   $result = $Shipment->add(); 
						   if($result){
								//记录拆箱
								if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
									$insert2=array();
									$data3=array();
									$insert2['chai_unitcode']=$qycode;
									$insert2['chai_barcode']=$barcode['tcode'];
									$insert2['chai_deliver']=0;
									$data3=$Chaibox->where($insert2)->find();
									if(!$data3){
										$insert2['chai_addtime']=$ship_time;
										$Chaibox->create($insert2,1);
										$Chaibox->add(); 
									}
								}
								if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$qycode;
									$insert3['chai_barcode']=$barcode['ucode'];
									$insert3['chai_deliver']=0;
									$data4=$Chaibox->where($insert3)->find();
									if(!$data4){
										$insert3['chai_addtime']=$ship_time;
										$Chaibox->create($insert3,1);
										$Chaibox->add(); 
									}
								}

								//记录日志 begin
								$log_arr=array();
								$log_arr=array(
											'log_qyid'=>session('subuser_id'),
											'log_user'=>session('subuser_name'),
											'log_qycode'=>$qycode,
											'log_action'=>'企业子用户出货',
											'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
											'log_addtime'=>$ship_time,
											'log_ip'=>real_ip(),
											'log_link'=>__SELF__,
											'log_remark'=>json_encode($insert)
											);
								save_log($log_arr);
								//记录日志 end
								
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='添加条码 <b>'.$brcode.' </b>成功。';
								$brcarr[$kk]['qty']=$barcode['qty'];
								$success=$success+1;
								$scanprocount=$scanprocount+$barcode['qty'];
								$kk=$kk+1;
								
								if(array_key_exists(strval($v['pro']),$pro_arr)===false){
									if($proinfo){
										$pro_arr[strval($v['pro'])]=array('name'=>$proinfo['pro_name'].'('.$proinfo['pro_number'].')','qty'=>$v['qty']);
									}else{
										$pro_arr[strval($v['pro'])]=array('name'=>'产品不存在','qty'=>$v['qty']);
									}
								}else{
									$pro_arr[strval($v['pro'])]['qty']=$pro_arr[strval($v['pro'])]['qty']+$v['qty'];
								}
								continue;
							}else{
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
								$brcarr[$kk]['qty']=0;
								$fail=$fail+1;
								$kk=$kk+1;
								continue;
							}
						}else{
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
							$brcarr[$kk]['qty']=0;
							$fail=$fail+1;
							$kk=$kk+1;
							continue;
						}	
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
					}
				}
			}
			session('shipsubrcode',null);
			
			$this->assign('jishu2', 1);
			$this->assign('pro_arr', $pro_arr);
			$this->assign('success', $success);
			$this->assign('fail', $fail);
			$this->assign('scanprocount', $scanprocount);
			$this->assign('list', $brcarr);
			$this->display('shiping2');
			
		}else{ 
			if(is_not_null(session('ship_date'))){
				$ship_date=session('ship_date');
			}else{
				$ship_date='';
			}
			if(is_not_null(session('ship_number'))){
				$ship_number=session('ship_number');
			}else{
				$ship_number='';
			}
			if(is_not_null(session('ship_dealer'))){
				$ship_dealer=session('ship_dealer');
			}else{
				$ship_dealer=0;
			}
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}

			
			if($ship_date==''){
				$this->error('请选择出货日期',U('Wxship/Storship/shipscanset'),2);
			}
			
			if($ship_number==''){
				$this->error('请填写出货单号',U('Wxship/Storship/shipscanset'),2);
			}

			if($ship_dealer<=0){
				$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
			}

			
			//经销商
			$Dealer= M('Dealer');
			$map2=array();
			$map2['dl_unitcode']=$qycode;
			$map2['dl_belong']=0;
			$map2['dl_status']=1;
			$map2['dl_id']=$ship_dealer;
			$dlinfo = $Dealer->where($map2)->find();
			if($dlinfo){
				$dlname=$dlinfo['dl_number'].' '.$dlinfo['dl_name'];
			}else{
				$this->error('请选择出货经销商',U('Wxship/Storship/shipscanset'),2);
			}
			$this->assign('dlname', $dlname);
			
			
			$this->assign('ship_date', $ship_date);
			$this->assign('ship_number', $ship_number);
			$this->assign('ship_remark', $ship_remark);
			
			$brcodearr=array();
			$brcodestr=session('shipsubrcode');
			$scancount=0; //已扫标签数
			$scanprocount=0; //已扫产品数
			$pro_arr=array();
			if(is_not_null($brcodestr)){
				$brcodearr=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
				
				$Product = M('Product');
				foreach($brcodearr as $k=>$v){
					if(intval($v['qty'])>0){
						$scancount+=1;
						$scanprocount+=intval($v['qty']);
						$map2=array();
						$map2['pro_unitcode']=$qycode;
						$map2['pro_id'] = $v['pro'];
						$proinfo = $Product->where($map2)->find();
						
						
						if(array_key_exists(strval($v['pro']),$pro_arr)===false){
							if($proinfo){
								$pro_arr[strval($v['pro'])]=array('name'=>$proinfo['pro_name'].'('.$proinfo['pro_number'].')','qty'=>$v['qty']);
							}else{
								$pro_arr[strval($v['pro'])]=array('name'=>'产品不存在','qty'=>$v['qty']);
							}
						}else{
							$pro_arr[strval($v['pro'])]['qty']=$pro_arr[strval($v['pro'])]['qty']+$v['qty'];
						}
						
						if($proinfo){
							$brcodearr[strval($k)]['pro_name']=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
						}else{
							$brcodearr[strval($k)]['pro_name']='产品不存在';
						}
					}else{
						unset($brcodearr[$k]);
					}
				}
			}
			$this->assign('scancount', $scancount);
			$this->assign('scanprocount', $scanprocount);
			
			if(count($brcodearr)<=0){
				$this->error('没有扫描纪录',U('Wxship/Storship/shipscanset'),2);
			}
			$this->assign('pro_arr', $pro_arr);
			$this->assign('list', $brcodearr);
			$this->assign('jishu', 1);
			$this->assign('jishu2', 1);
			$this->display('shiping1');
		}
	}	
	
}