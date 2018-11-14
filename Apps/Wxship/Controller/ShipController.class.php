<?php
namespace Wxship\Controller;
use Think\Controller;
class ShipController extends CommController {
    //普通出货处理

    public function index(){
        exit;
    }
	
	//出货记录
    public function shiplist(){

		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
        //-------------------------------
		$Shipment= M('Shipment');

        //出货记录
        $map=array();
		$parameter=array();
        $map['ship_unitcode']=$qycode;
		$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
        $map['ship_cztype']=1;     //0-企业主账户  1-企业子管理用户  2-经销商
		$map['ship_czid']=session('subuser_id');
		
        $count = $Shipment->where($map)->count();
        $Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Shipment->where($map)->order('ship_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		$Dealer = M('Dealer');
		$Product = M('Product');
		foreach($list as $k=>$v){ 
            $map2=array();
            $map2['dl_unitcode']=$qycode;
            $map2['dl_id'] = $v['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $list[$k]['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $list[$k]['dl_name']='';
            }
			
            $map2=array();
            $map2['pro_unitcode']=$qycode;
            $map2['pro_id'] = $v['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                  $list[$k]['pro_name']=$Proinfo['pro_name'].'('.$Proinfo['pro_number'].')';
            }else{
                  $list[$k]['pro_name']='';
            }
		}
		
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('shiplist');
    }
	
	//出货记录-详细
    public function shipdetail(){
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$ship_id=intval(I('get.ship_id',0));
		
		$Shipment= M('Shipment');
        $map=array();
        $map['ship_unitcode']=$qycode;
		$map['ship_id']=$ship_id;
        $data=$Shipment->where($map)->find();
		
		$Warehouse = M('Warehouse');
		$Product = M('Product');
		$Dealer = M('Dealer');
        if($data){
            $map2=array();
            $map2['pro_unitcode']=$qycode;
            $map2['pro_id'] = $data['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                  $data['pro_name']=$Proinfo['pro_name'].'('.$Proinfo['pro_number'].')';
            }else{
                  $data['pro_name']='';
            }
			
            $map2=array();
            $map2['wh_unitcode']=$qycode;
            $map2['wh_id'] = $data['ship_whid'];
            $warehouse = $Warehouse->where($map2)->find();

            if($warehouse){
                  $data['warehouse']=$warehouse['wh_name'];
            }else{
                  $data['warehouse']='';
            }
			
            $map2=array();
            $map2['dl_unitcode']=$qycode;
            $map2['dl_id'] = $data['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $data['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $data['dl_name']='';
            }
			
			if($this->checksu_qypurview('16009',0) || $this->checksu_qypurview('30008',0)){
				$isshipdelete=1;
			}else{
				$isshipdelete=0;
			}
			
			
        }else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('isshipdelete', $isshipdelete);
		$this->assign('shipinfo', $data);
		$this->display('shipdetail');
	}
	
    //出货记录-删除
    public function shipdelete(){
        $this->checksu_qypurview('30008',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		$map=array();
        $map['ship_id']=intval(I('get.ship_id',0));
        $map['ship_unitcode']=$qycode;

        $Chaibox= M('Chaibox');
		$Shipment= M('Shipment');
        //判断是否可删 保持数据完整性 待完善
        $data=$Shipment->where($map)->find();
        if($data){
			//如果是按订单出货 并且已确认收货 
			if($data['ship_odid']>0 && $data['ship_odblid']>0){
				$Model=M();
				$map2=array();
				$order=array();
				$map2['a.od_unitcode']=$qycode;
				$map2['a.od_id']=array('exp','=b.odbl_odid');
				$map2['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map2['b.odbl_id']=$data['ship_odblid'];
				$map2['b.odbl_odid']=$data['ship_odid'];
				$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map2)->find();
				if($order){
					if($order['odbl_state']==3){
					    $this->error('该出货记录对应订单已发货，暂不能删除','',2);
				    }
					if($order['odbl_state']==8){
						$this->error('该出货记录对应订单已确认收货，暂不能删除','',2);
					}
				}else{
					$this->error('该出货记录对应订单记录不存在，暂不能删除','',2);
				}
			}
			
            //如果经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$qycode;
            $map2['ship_deliver']=array('gt',0);
            $map2['ship_id'] = array('NEQ',$data['ship_id']);

            $where=array();
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);
            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
               $this->error('该出货记录已被下级经销商重新出货，暂不能删除','',3);
            }

           //判断处理拆箱记录
            if($data['ship_tcode']!='' || $data['ship_ucode']!=''){

				if($data['ship_tcode']!='' &&  $data['ship_tcode']!=$data['ship_barcode']){	
                    $map2=array();
                    $map2['ship_tcode']=$data['ship_tcode'];
                    $map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_tcode'];
                        $map3['chai_unitcode']=$qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['ship_ucode']!='' && $data['ship_ucode']!=$data['ship_barcode'] && $data['ship_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['ship_ucode']=$data['ship_ucode'];
                    $map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_ucode'];
                        $map3['chai_unitcode']=$qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['ship_tcode']=$data['ship_tcode'];
                    $map22['ship_unitcode']=$qycode;
					$map22['ship_deliver']=0;  
                    $map22['ship_id'] = array('NEQ',$data['ship_id']);
                    $data22=$Shipment->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['ship_tcode'];
                        $map33['chai_unitcode']=$qycode;
						$map33['chai_deliver'] = 0;
                        $Chaibox->where($map33)->delete(); 
                    }
                }
            }
             
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('subuser_id'),
                        'log_user'=>session('subuser_name'),
                        'log_qycode'=>$qycode,
                        'log_action'=>'删除出货记录',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $Shipment->where($map)->delete(); 
            $this->success('删除成功',U('Wxship/Ship/shiplist'),2);
        }else{
            $this->error('没有该记录','',2);
        } 
	}
	
  
	//普通出货扫描 设置 
    public function shipscanset(){
		$this->checksu_qypurview('30004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------

		
		//是否显示生产日期 生产批号		
		//生产日期
		if($this->checksu_qypurview('20010',0)){
			$isshipprodate=1;
		}else{
			$isshipprodate=0;
		}
		$this->assign('isshipprodate', $isshipprodate);
		//生产批号
		if($this->checksu_qypurview('20011',0)){
			$isshipbatchnum=1;
		}else{
			$isshipbatchnum=0;
		}
		$this->assign('isshipbatchnum', $isshipbatchnum);
		
		//产品
        $map2['pro_unitcode']=$qycode;
        $map2['pro_active'] = 1;
        $Product = M('Product');
        $list2 = $Product->where($map2)->order('pro_number ASC')->select();
        $this->assign('productlist', $list2);
		
		//仓库
		$map2=array();
        $map2['wh_unitcode']=$qycode;
        $Warehouse = M('Warehouse');
        $list3 = $Warehouse->where($map2)->order('wh_id ASC')->select();
        $this->assign('warehouselist', $list3);
		

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
		
		if(is_not_null(session('ship_prodate'))){
			$this->assign('ship_prodate', session('ship_prodate'));
		}else{
			$this->assign('ship_prodate', '');
		}
		
		if(is_not_null(session('ship_batchnum'))){
			$this->assign('ship_batchnum', session('ship_batchnum'));
		}else{
			$this->assign('ship_batchnum', '');
		}
		
		if(is_not_null(session('ship_dealer'))){
			$this->assign('ship_dealer', session('ship_dealer'));
		}else{
			$this->assign('ship_dealer', '');
		}
		
		if(is_not_null(session('ship_whid'))){
			$this->assign('ship_whid', session('ship_whid'));
		}else{
			$this->assign('ship_whid', '');
		}
		
		if(is_not_null(session('ship_pro'))){
			$this->assign('ship_pro', session('ship_pro'));
		}else{
			$this->assign('ship_pro', '');
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
		$this->checksu_qypurview('30004',1);
		
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
			$ship_pro=intval(I('post.ship_pro',0));
			$ship_whid=intval(I('post.ship_whid',0));
			$ship_prodate=I('post.ship_prodate','');
			$ship_batchnum=I('post.ship_batchnum','');
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
			if(is_not_null(session('ship_pro'))){
				$ship_pro=session('ship_pro');
			}else{
				$ship_pro=0;
			}
			if(is_not_null(session('ship_whid'))){
				$ship_whid=session('ship_whid');
			}else{
				$ship_whid=0;
			}
			
			if(is_not_null(session('ship_prodate'))){
				$ship_prodate=session('ship_prodate');
			}else{
				$ship_prodate='';
			}
			if(is_not_null(session('ship_batchnum'))){
				$ship_batchnum=session('ship_batchnum');
			}else{
				$ship_batchnum='';
			}
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}
		}
		
		if($ship_date==''){
			$this->error('请选择出货日期',U('Wxship/Ship/shipscanset'),2);
		}
		
		if($ship_number==''){
			$this->error('请填写出货单号',U('Wxship/Ship/shipscanset'),2);
		}

		if($ship_dealer<=0){
			$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
		}
		if($ship_pro<=0){
			$this->error('请选择出货产品',U('Wxship/Ship/shipscanset'),2);
		}
		
		if($ship_whid<=0){
			$this->error('请选择出货仓库',U('Wxship/Ship/shipscanset'),2);
		}


		
		//产品
		$map2=array();
		$map2['pro_unitcode']=$qycode;
		$map2['pro_active'] = 1;
		$map2['pro_id'] = $ship_pro;
		$Product = M('Product');
		$proinfo = $Product->where($map2)->find();
        if($proinfo){
			$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
		}else{
			$this->error('请选择产品',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('proname', $proname);
			
		//仓库
		$map2=array();
		$map2['wh_unitcode']=$qycode;
		$map2['wh_id']=$ship_whid;
		$Warehouse = M('Warehouse');
		$whinfo = $Warehouse->where($map2)->find();
		if($whinfo){
			$whname=$whinfo['wh_name'];
		}else{
			$this->error('请选择仓库',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('whname', $whname);
		
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
			$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('dlname', $dlname);
		
		
		//暂存用户选择历史
		session('ship_date',$ship_date);
		session('ship_number',$ship_number);
		session('ship_dealer',$ship_dealer);
		session('ship_whid',$ship_whid);
		session('ship_prodate',$ship_prodate);
		session('ship_batchnum',$ship_batchnum);
		session('ship_pro',$ship_pro);
		session('ship_remark',$ship_remark);
		
        $this->assign('ship_date', $ship_date);
		$this->assign('ship_number', $ship_number);
		$this->assign('ship_prodate', $ship_prodate);
		$this->assign('ship_batchnum', $ship_batchnum);
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
				if(intval($v)>0){
					$scancount+=1;
					$scanprocount+=intval($v);
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
        $this->checksu_qypurview('30004',1);
		
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
		
        //是否已已录入
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
						$brcodearr[strval($brcode)]=$barcode['qty'];
					}else{
						//如果是小标
						if($barcode['ucode']==$barcode['tcode']){
							if(array_key_exists(strval($barcode['tcode']),$brcodearr)===false){	
								$brcodearr[strval($brcode)]=$barcode['qty'];
							}else{
								$msg='条码<b>'.$brcode.'</b>的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}else{
							if(array_key_exists(strval($barcode['ucode']),$brcodearr)===false  && array_key_exists(strval($barcode['tcode']),$brcodearr)===false){
								$brcodearr[strval($brcode)]=$barcode['qty'];
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
				$brcodearr[strval($brcode)]=$barcode['qty'];
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
		if(is_not_null(session('ship_pro'))){
			$ship_pro=session('ship_pro');
		}else{
			$ship_pro=0;
		}
		if(is_not_null(session('ship_whid'))){
			$ship_whid=session('ship_whid');
		}else{
			$ship_whid=0;
		}
		
		if(is_not_null(session('ship_prodate'))){
			$ship_prodate=session('ship_prodate');
		}else{
			$ship_prodate='';
		}
		if(is_not_null(session('ship_batchnum'))){
			$ship_batchnum=session('ship_batchnum');
		}else{
			$ship_batchnum='';
		}
		if(is_not_null(session('ship_remark'))){
			$ship_remark=session('ship_remark');
		}else{
			$ship_remark='';
		}

		
		if($ship_date==''){
			$this->error('请选择出货日期',U('Wxship/Ship/shipscanset'),2);
		}
		
		if($ship_number==''){
			$this->error('请填写出货单号',U('Wxship/Ship/shipscanset'),2);
		}

		if($ship_dealer<=0){
			$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
		}
		if($ship_pro<=0){
			$this->error('请选择出货产品',U('Wxship/Ship/shipscanset'),2);
		}
		
		if($ship_whid<=0){
			$this->error('请选择出货仓库',U('Wxship/Ship/shipscanset'),2);
		}


		
		//产品
		$map2=array();
		$map2['pro_unitcode']=$qycode;
		$map2['pro_active'] = 1;
		$map2['pro_id'] = $ship_pro;
		$Product = M('Product');
		$proinfo = $Product->where($map2)->find();
        if($proinfo){
			$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
		}else{
			$this->error('请选择产品',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('proname', $proname);
			
		//仓库
		$map2=array();
		$map2['wh_unitcode']=$qycode;
		$map2['wh_id']=$ship_whid;
		$Warehouse = M('Warehouse');
		$whinfo = $Warehouse->where($map2)->find();
		if($whinfo){
			$whname=$whinfo['wh_name'];
		}else{
			$this->error('请选择仓库',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('whname', $whname);
		
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
			$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
		}
		$this->assign('dlname', $dlname);
		
		
		//暂存用户选择历史
		session('ship_date',$ship_date);
		session('ship_number',$ship_number);
		session('ship_dealer',$ship_dealer);
		session('ship_whid',$ship_whid);
		session('ship_prodate',$ship_prodate);
		session('ship_batchnum',$ship_batchnum);
		session('ship_pro',$ship_pro);
		session('ship_remark',$ship_remark);
		
        $this->assign('ship_date', $ship_date);
		$this->assign('ship_number', $ship_number);
		$this->assign('ship_prodate', $ship_prodate);
		$this->assign('ship_batchnum', $ship_batchnum);
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
				if(intval($v)>0){
					$scancount+=1;
					$scanprocount+=intval($v);
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
        $this->checksu_qypurview('30004',1);
		
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

            foreach($brcodearr as $k=>$v){
				if(intval($v)>0){
					$scancount+=1;
					$scanprocount+=intval($v);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		
		if(count($brcodearr)<=0){
			$this->error('没有扫描纪录',U('Wxship/Ship/shipscanset'),2);
		}
		
		

	    $this->assign('list', $brcodearr);
		$this->assign('jishu', 1);
        $this->display('shipscanlist');
	}	
   
	
   //出货扫描记录-移除
    public function shipremove(){
        $this->checksu_qypurview('30004',1);
		
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
				if(intval($v)>0){
				}else{
					unset($brcodearr[$k]);
				}
			}

			unset($brcodearr[strval($brcode)]);
		}
        $brcodestr=json_encode($brcodearr);
		session('shipsubrcode',$brcodestr); 
		
		
        $this->success('移除成功',U('Wxship/Ship/shipscanlist'),1);
	}
	
    //出货扫描-确认出货
    public function shiping(){
        $this->checksu_qypurview('30004',1);
		
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
			if(is_not_null(session('ship_pro'))){
				$ship_pro=session('ship_pro');
			}else{
				$ship_pro=0;
			}
			if(is_not_null(session('ship_whid'))){
				$ship_whid=session('ship_whid');
			}else{
				$ship_whid=0;
			}
			
			if(is_not_null(session('ship_prodate'))){
				$ship_prodate=session('ship_prodate');
			}else{
				$ship_prodate='';
			}
			if(is_not_null(session('ship_batchnum'))){
				$ship_batchnum=session('ship_batchnum');
			}else{
				$ship_batchnum='';
			}
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}

			
			if($ship_date==''){
				$this->error('请选择出货日期',U('Wxship/Ship/shipscanset'),2);
			}
			
			if($ship_number==''){
				$this->error('请填写出货单号',U('Wxship/Ship/shipscanset'),2);
			}

			if($ship_dealer<=0){
				$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
			}
			if($ship_pro<=0){
				$this->error('请选择出货产品',U('Wxship/Ship/shipscanset'),2);
			}
			
			if($ship_whid<=0){
				$this->error('请选择出货仓库',U('Wxship/Ship/shipscanset'),2);
			}


			
			//产品
			$map2=array();
			$map2['pro_unitcode']=$qycode;
			$map2['pro_active'] = 1;
			$map2['pro_id'] = $ship_pro;
			$Product = M('Product');
			$proinfo = $Product->where($map2)->find();
			if($proinfo){
				$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
			}else{
				$this->error('请选择产品',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('proname', $proname);
				
			//仓库
			$map2=array();
			$map2['wh_unitcode']=$qycode;
			$map2['wh_id']=$ship_whid;
			$Warehouse = M('Warehouse');
			$whinfo = $Warehouse->where($map2)->find();
			if($whinfo){
				$whname=$whinfo['wh_name'];
			}else{
				$this->error('请选择仓库',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('whname', $whname);
			
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
				$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('dlname', $dlname);
			
			
			$this->assign('ship_date', $ship_date);
			$this->assign('ship_number', $ship_number);
			$this->assign('ship_prodate', $ship_prodate);
			$this->assign('ship_batchnum', $ship_batchnum);
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
				$this->error('没有扫描纪录',U('Wxship/Ship/shipscanset'),2);
			}
			
		    $Shipment= M('Shipment');
		    $Chaibox= M('Chaibox');
			
			foreach($brcodearr as $k=>$v){ 
				if($k!=''){
					$brcode=$k;
					if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
                        $brcarr[$kk]['barcode']=$brcode;
                        $brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
						$brcarr[$kk]['qty']=0;
						$fail=$fail+1;
						$kk=$kk+1;
						continue;
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
			if(is_not_null(session('ship_pro'))){
				$ship_pro=session('ship_pro');
			}else{
				$ship_pro=0;
			}
			if(is_not_null(session('ship_whid'))){
				$ship_whid=session('ship_whid');
			}else{
				$ship_whid=0;
			}
			
			if(is_not_null(session('ship_prodate'))){
				$ship_prodate=session('ship_prodate');
			}else{
				$ship_prodate='';
			}
			if(is_not_null(session('ship_batchnum'))){
				$ship_batchnum=session('ship_batchnum');
			}else{
				$ship_batchnum='';
			}
			if(is_not_null(session('ship_remark'))){
				$ship_remark=session('ship_remark');
			}else{
				$ship_remark='';
			}

			
			if($ship_date==''){
				$this->error('请选择出货日期',U('Wxship/Ship/shipscanset'),2);
			}
			
			if($ship_number==''){
				$this->error('请填写出货单号',U('Wxship/Ship/shipscanset'),2);
			}

			if($ship_dealer<=0){
				$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
			}
			if($ship_pro<=0){
				$this->error('请选择出货产品',U('Wxship/Ship/shipscanset'),2);
			}
			
			if($ship_whid<=0){
				$this->error('请选择出货仓库',U('Wxship/Ship/shipscanset'),2);
			}


			
			//产品
			$map2=array();
			$map2['pro_unitcode']=$qycode;
			$map2['pro_active'] = 1;
			$map2['pro_id'] = $ship_pro;
			$Product = M('Product');
			$proinfo = $Product->where($map2)->find();
			if($proinfo){
				$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
			}else{
				$this->error('请选择产品',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('proname', $proname);
				
			//仓库
			$map2=array();
			$map2['wh_unitcode']=$qycode;
			$map2['wh_id']=$ship_whid;
			$Warehouse = M('Warehouse');
			$whinfo = $Warehouse->where($map2)->find();
			if($whinfo){
				$whname=$whinfo['wh_name'];
			}else{
				$this->error('请选择仓库',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('whname', $whname);
			
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
				$this->error('请选择出货经销商',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('dlname', $dlname);
			
			
			$this->assign('ship_date', $ship_date);
			$this->assign('ship_number', $ship_number);
			$this->assign('ship_prodate', $ship_prodate);
			$this->assign('ship_batchnum', $ship_batchnum);
			$this->assign('ship_remark', $ship_remark);
			
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
				foreach($brcodearr as $k=>$v){
					if(intval($v)>0){
						$scancount+=1;
						$scanprocount+=intval($v);
					}else{
						unset($brcodearr[$k]);
					}
				}
			}
			$this->assign('scancount', $scancount);
			$this->assign('scanprocount', $scanprocount);
			
			if(count($brcodearr)<=0){
				$this->error('没有扫描纪录',U('Wxship/Ship/shipscanset'),2);
			}
			$this->assign('list', $brcodearr);
			$this->assign('jishu', 1);
			$this->display('shiping1');
		}
	}	
	
	
	public function shipsearch(){
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$brcode=I('param.brcode','');
		$barr=explode(',',$brcode);
		$brcode=end($barr);
		$isstordelete=0;
		$isshipdelete=0;
		if($brcode!=''){
			if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
				$this->error('条码不正确','',2);
			}
			
			//检测是否已发行
			$barcode=wlcode_to_packinfo($brcode,$qycode);
			if(!is_not_null($barcode)){
				$this->error('该条码不存在或还没发行','',2);
			}
			
			$Product = M('Product');
			$Warehouse = M('Warehouse');
			
			//条码入库信息
			//检测是否已入库 ucode-大标  	tcode-中标 
			$Storage= M('Storage');
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
			if(is_not_null($data2)){
			    //已入库
				$storinfo['brcode']=$brcode;
				$storinfo['tcode']=$barcode['tcode'];
				$storinfo['ucode']=$barcode['ucode'];
				$storinfo['qty']=$barcode['qty'];
				$storinfo['stor_prodate']=$data2['stor_prodate'];
				$storinfo['stor_batchnum']=$data2['stor_batchnum'];
				$storinfo['stor_date']=$data2['stor_date'];
				$storinfo['stor_number']=$data2['stor_number'];
				$storinfo['stor_remark']=$data2['stor_remark'];
				$storinfo['stor_id']=$data2['stor_id'];
				
				$storinfo['dabiao']='';
				if($barcode['tcode']!='' || $barcode['ucode']!=''){
					if($barcode['tcode']!=$barcode['ucode']){
						$storinfo['dabiao']=$barcode['ucode'].'/'.$barcode['tcode'];
					}else{
						$storinfo['dabiao']=$barcode['ucode'];
					}
				}else{
					$storinfo['dabiao']='';
				}
				
		        //对应产品
				if($data2['stor_pro']>0){
					$map2=array();
					$map2['pro_unitcode']=$qycode;
					$map2['pro_id'] = $data2['stor_pro'];
					$proinfo = $Product->where($map2)->find();
					if($proinfo){
						$storinfo['pro_name']=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
					}else{
						$storinfo['pro_name']=='产品不存在';
					}
				}else{
					$storinfo['pro_name']='';
				}
		
				//对应仓库
				if($data2['stor_whid']>0){
					$map2=array();
					$map2['wh_unitcode']=$qycode;
					$map2['wh_id']=$data2['stor_whid'];
					$Warehouse = M('Warehouse');
					$whinfo = $Warehouse->where($map2)->find();
					if($whinfo){
						$storinfo['wh_name']=$whinfo['wh_name'];
					}else{
						$storinfo['wh_name']='';
					}
				}else{
					$storinfo['wh_name']='';
				}
				
				if($this->checksu_qypurview('16005',0) && $barcode['code']==$data2['stor_barcode']){
					$isstordelete=1;
				}
				
				$this->assign('storinfo', $storinfo);
			}else{
				$this->assign('storinfo', '');
			}

			
			//条码出库信息
			$Shipment= M('Shipment');
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
			$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
			$data=$Shipment->where($map)->find();
			
			if($data){
				$Dealer= M('Dealer');
				$barcode['ship_dealer_from_name']='总公司';

				//对应发给的经销商
				$map2=array();
				$map2['dl_id']=$data['ship_dealer'];
				$map2['dl_unitcode']=$qycode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$barcode['ship_dealer_name']=$data2['dl_name'];
				}else{
					$barcode['ship_dealer_name']='';
				}
				//对应的产品
				$map2=array();
				$map2['pro_unitcode']=$qycode;
				$map2['pro_id'] = $data['ship_pro'];
				$proinfo = $Product->where($map2)->find();
				if($proinfo){
					$barcode['ship_pro_name']=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
				}else{
					$barcode['ship_pro_name']='';
				}
				
				//仓库
				$map2=array();
				$map2['wh_unitcode']=$qycode;
				$map2['wh_id'] = $data['ship_whid'];
				$warehouse = $Warehouse->where($map2)->find();

				if($warehouse){
					$barcode['warehouse']=$warehouse['wh_name'];
				}else{
					$barcode['warehouse']='';
				}
				
				$barcode['ship_prodate']=$data['ship_prodate'];
				$barcode['ship_batchnum']=$data['ship_batchnum'];
				$barcode['ship_date']=$data['ship_date'];
				$barcode['ship_number']=$data['ship_number'];
				$barcode['ship_proqty']=$data['ship_proqty'];
				$barcode['ship_remark']=$data['ship_remark'];
				$barcode['ship_id']=$data['ship_id'];
				
				$barcode['dabiao']='';
				if($barcode['tcode']!='' || $barcode['ucode']!=''){
					if($barcode['tcode']!=$barcode['ucode']){
						$barcode['dabiao']=$barcode['ucode'].'/'.$barcode['tcode'];
					}else{
						$barcode['dabiao']=$barcode['ucode'];
					}
				}else{
					$barcode['dabiao']='';
				}
				
				$isstordelete=0;

				if(($this->checksu_qypurview('16009',0) || $this->checksu_qypurview('30008',0)) && $barcode['code']==$data['ship_barcode']){
				    $isshipdelete=1;
			    }
			}else{
				$barcode='';
			}

			$this->assign('isshipdelete', $isshipdelete);
			$this->assign('isstordelete', $isstordelete);
            $this->assign('shipinfo', $barcode);
			$this->assign('brcode', $brcode);
			
			$this->display('shipsearchres');	
			exit;
        }
		
		//扫码入库
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'),C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		
		$this->display('shipsearch');
		
	}
	
}