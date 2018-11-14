<?php
namespace Mp\Controller;
use Think\Controller;
class WxshipController extends Controller {
	protected $qy_wxappid='wx59d77f3f0317d4a8';
	protected $qy_wxappsecret='2b975403fa7dc7445b24667771e10ac3';
	
	//用于微信出货扫描 
    public function index(){
        $user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			//验证是否有效链接
			$ttamp=trim(I('get.ttamp',''));
			$sture=trim(I('get.sture',''));
			$qycode=trim(I('get.qycode',''));
			$nowtime=time();
				
			if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('该链接已失效,请刷新二维码重新扫描','',-1);
			}
			if(MD5($ttamp.$qycode.$ttamp)!=$sture){
				$this->error('该链接已失效,请刷新二维码重新扫描','',-1);
			}
	
            $ttamp2=time();
		    $sture2=MD5($ttamp2.$qycode.$ttamp2);
			$this->redirect('Mp/Wxship/wxshiplogin/qycode/'.$qycode.'/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		
		//确保openid存在
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
		$qycode2=I('get.qycode','');

		if($qycode2!=''){
			if($qycode!=$qycode2){
				session(null);
				$this->error('对不起，你没有权限','',-1);
			}	
			
		}
		
		$map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//----------------------------
		
		//扫码出货
		$Jssdk = new \Org\Util\Jssdk($this->qy_wxappid,$this->qy_wxappsecret);
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('title', '出货扫描');
		$this->display('shipscan');
    }
	
	//扫描结果
    public function shipscanres(){
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
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
			$brcodestr=session('subrcode');
			if(is_not_null($brcodestr)){
				if(stripos($brcodestr,','.$brcode.',')===FALSE){
					
					if($barcode['tcode']=='' && $barcode['ucode']==''){
						//如果是大标
						if(stripos($brcodestr,','.$brcode)===FALSE){
							$brcodestr=$brcodestr.$brcode.',';
						}else{
							$msg='条码<b>'.$brcode.'</b>的小标条码已在扫描记录里';
							$barcode=array();
							goto gotoEND;
							exit;
						}
					}else{
						//如果是小标
						if($barcode['ucode']==$barcode['tcode']){
							if(stripos($brcodestr,','.$barcode['ucode'].',')===FALSE){
								if(stripos($brcodestr,','.$brcode)===FALSE){
									$brcodestr=$brcodestr.$brcode.',';
								}else{
									$msg='条码<b>'.$brcode.'</b>的小标条码已在扫描记录里';
									$barcode=array();
									goto gotoEND;
									exit;
								}
							}else{
								$msg='条码<b>'.$brcode.'</b>的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}else{
							if(stripos($brcodestr,','.$barcode['tcode'].',')===FALSE){
								if(stripos($brcodestr,','.$barcode['ucode'].',')===FALSE){
									$brcodestr=$brcodestr.$brcode.',';
								}else{
									$msg='条码<b>'.$brcode.'</b>的大标条码已在扫描记录里';
									$barcode=array();
									goto gotoEND;
									exit;
								}
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
				$brcodestr=','.$brcode.',';
			}
			session('subrcode',$brcodestr); 
			
			$msg='条码<b>'.$brcode.'</b>扫描成功!';
		}else{
			$msg='对不起，你没有条码<b>'.$brcode.'</b>操作权限';
			$barcode=array();
			goto gotoEND;
			exit;
		}

		/////////////
		gotoEND:
		
		$Jssdk = new \Org\Util\Jssdk($this->qy_wxappid,$this->qy_wxappsecret);
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('msg', $msg);
		$this->assign('barinfo', $barcode);
		$this->assign('title', '扫描结果');
        $this->display('shipscanres');	
	}	
		
    //出货扫描记录
    public function shipscanlist(){
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
	    $brcodestr=session('subrcode');
		$brcodearr=array();
		$brcarr=array();
		if(is_not_null($brcodestr)){
            $brcodearr=explode(',',$brcodestr);
		}
		foreach($brcodearr as $k=>$v){ 
		    if($v!=''){
				$brcarr[]=$v;
			}
		}
		if(count($brcarr)<=0){
			$this->error('没有扫描纪录',U('Mp/Wxship/index'),2);
		}
		
		$Jssdk = new \Org\Util\Jssdk($this->qy_wxappid,$this->qy_wxappsecret);
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
	    $this->assign('list', $brcarr);
		$this->assign('title', '扫描记录');
        $this->display('shipscanlist');
	}	
   
   //出货扫描记录-移除
    public function shipremove(){
        $user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
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
		
		$brcodestr=session('subrcode');
		if(is_not_null($brcodestr)){
            $brcodestr=str_replace(','.$brcode.',',',',$brcodestr);
			session('subrcode',$brcodestr); 
		}
        $this->success('移除成功',U('Mp/Wxship/shipscanlist'),1);
	}
	
    //出货扫描-确认出货
    public function shipping(){
        $user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$step=intval(I('get.step',0));
		if($step==1){  //确认出货
			$ship_date=I('post.ship_date','');
			$ship_number=I('post.ship_number','');
			$ship_dealer=intval(I('post.ship_dealer',0));
			$ship_dealer2=intval(I('post.ship_dealer2',0));
			$ship_dealer3=intval(I('post.ship_dealer3',0));
			$ship_pro=intval(I('post.ship_pro',0));
			$ship_remark=I('post.ship_remark','');
			$ship_whid=intval(I('post.ship_whid',0));
			
			if($ship_date==''){
                $this->error('请选择出货日期','',2);
            }
			if($ship_number==''){
                $this->error('请填写出货单号','',2);
            }
			if($ship_dealer3>0){
				$ship_dealer=$ship_dealer3;
			}else if($ship_dealer2>0){
				$ship_dealer=$ship_dealer2;
			}
			if($ship_dealer<=0){
                $this->error('请选择出货经销商客户','',2);
            }
			if($ship_pro<=0){
                $this->error('请选择出货产品','',2);
            }
			if($ship_whid<=0){
                $this->error('请选择出货仓库','',2);
            }
			
			//暂存用户选择历史
			session('ship_date',$ship_date);
			session('ship_number',$ship_number);
			session('ship_dealer',$ship_dealer);
			session('ship_whid',$ship_whid);

			
			$brcodestr=session('subrcode');
			$brcodearr=array();
			$brcarr=array();
			if(is_not_null($brcodestr)){
				$brcodearr=explode(',',$brcodestr);
			}else{
				$this->error('没有扫描纪录','',2);
			}
			
			$Shipment= M('Shipment');
			$Chaibox= M('Chaibox');
			$ship_time=time();
			foreach($brcodearr as $key=>$v){ 
				if($v!=''){
					$brcode=$v;
					if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
                        $brcarr[$key]['barcode']=$brcode;
                        $brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
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
						$brcarr[$key]['barcode']=$brcode;
						$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已使用</span>';
						continue;
					}
					
					//检测是否已发行
					$barcode=wlcode_to_packinfo($brcode,$qycode);
							
					if(!is_not_null($barcode)){
						$brcarr[$key]['barcode']=$brcode;
						$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码不存在或还没发行</span>';
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
						$brcarr[$key]['barcode']=$brcode;
						$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已使用</span>';
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
						$brcarr[$key]['barcode']=$brcode;
						$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已经拆箱，不能再使用</span>';
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
											'log_addtime'=>time(),
											'log_ip'=>real_ip(),
											'log_link'=>__SELF__,
											'log_remark'=>json_encode($insert)
											);
								save_log($log_arr);
								//记录日志 end
								$brcarr[$key]['barcode']=$brcode;
								$brcarr[$key]['error']='添加条码 <b>'.$brcode.' </b>成功。';
								continue;
							}else{
								$brcarr[$key]['barcode']=$brcode;
								$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
								continue;
							}
						}else{
							$brcarr[$key]['barcode']=$brcode;
							$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
							continue;
						}	
					}else{
						$brcarr[$key]['barcode']=$brcode;
						$brcarr[$key]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
						continue;
					}
				}
			}
			session('subrcode',null);
			
			$this->assign('list', $brcarr);
			$this->assign('title', '出货结果');
			$this->display('shipping2');
			
		}else{         
		    //确认出货经销商产品等
			$Dealer= M('Dealer');

			//经销商
			$map=array();
			$map['dl_unitcode']=$qycode;
			$map['dl_belong']=0;
			$map['dl_status']=1;
			$list = $Dealer->where($map)->order('dl_id DESC')->limit(500)->select();
			$this->assign('dealerlist', $list);
			//产品
			$map2=array();
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
			
			//出货日期 显示当天前后30天
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
			
			if(is_not_null(session('ship_whid'))){
				$this->assign('ship_whid', session('ship_whid'));
			}else{
				$this->assign('ship_whid', '');
			}
			

			$this->assign('title', '确认出货');
			$this->display('shipping1');
		}
	}	
	
	//经销商出货记录
    public function shiplist(){
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
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
                  $list[$k]['dl_name']='-';
            }
			
            $map2=array();
            $map2['pro_unitcode']=$qycode;
            $map2['pro_id'] = $v['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                  $list[$k]['pro_name']=$Proinfo['pro_name'];
            }else{
                  $list[$k]['pro_name']='-';
            }
		}
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		$this->assign('title', '我的出货记录');
		
        $this->display('shiplist');
		
	}	
    	
	//返回下级经销商数组 json方式
    public function subdealerarr(){
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
            $arr=array();
			echo json_encode($arr);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
            $arr=array();
			echo json_encode($arr);
			exit;
        }
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
            $arr=array();
			echo json_encode($arr);
			exit;
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
            $arr=array();
			echo json_encode($arr);
			exit;
		}
		//-------------------------------
		$map=array();
		$dl_id=intval(I('post.dl_id',0));
		if($dl_id>0){
			$map['dl_unitcode']=$qycode;
			$map['dl_status'] = 1;
			$map['dl_belong'] = $dl_id;
			$Dealer = M('Dealer');
			$list = $Dealer->where($map)->order('dl_number ASC')->select();
			$arr=array();
			foreach($list as $k=>$v){	
				//直接下线数
				$map3=array();
				$map3['dl_belong']=$v['dl_id'];
				$map3['dl_unitcode']=session('unitcode');
				$count3 = $Dealer->where($map3)->count();
				$list[$k]['dl_subcount']=$count3;
				$list[$k]['dl_wxnickname']=wxuserTextDecode2($v['dl_wxnickname']);
				
				$arr[$k]['dl_id']=$v['dl_id'];
				$arr[$k]['dl_number']=$v['dl_number'];
				$arr[$k]['dl_name']=$v['dl_name'];
				$arr[$k]['dl_contact']=$v['dl_contact'];
				$arr[$k]['dl_subcount']=$count3;
				$arr[$k]['dl_wxnickname']=wxuserTextDecode2($v['dl_wxnickname']);
			}
			
			echo json_encode($arr);
			exit;
		}else{
			$arr=array();
			echo json_encode($arr);
			exit;
		}
    }
   
   
	//出货查询
	public function shipsearch(){
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        if(!$this->is_subuser_wxlogin()){
			$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
			exit;
        }
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){

		}else{
			session(null);
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		

		$brcode=I('param.brcode','');
		$barr=explode(',',$brcode);
		$brcode=end($barr);
		if($brcode!=''){
			if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
				$this->error('条码不正确','',2);
			}
			
			//检测是否已发行
			$barcode=wlcode_to_packinfo($brcode,$qycode);
			if(!is_not_null($barcode)){
				$this->error('该条码不存在或还没发行','',2);
			}
			
			//查询条码相关信息
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
				$Product = M('Product');
				$Warehouse = M('Warehouse');
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
				$Proinfo = $Product->where($map2)->find();
				if($Proinfo){
					$barcode['ship_pro_name']=$Proinfo['pro_name'];
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
				
			}else{
				$this->error('没有该记录');
			}
			$barcode['ship_date']=$data['ship_date'];
			
			
            $this->assign('shipinfo', $barcode);
			
			$this->assign('title', '出货查询结果');
			$this->display('shipsearchres');	
			exit;
        }
		
		$Jssdk = new \Org\Util\Jssdk($this->qy_wxappid,$this->qy_wxappsecret);
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('title', '出货查询');
        $this->display('shipsearch');	
	}

	
   	//添加子账户 
    public function subuseradd(){
        $user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}
		
        //保存提交申请
	    if (IS_POST) {
			$openid=session('subuser_openid');
			$qycode=I('post.qycode','');
			$sture=I('post.sture','');
			$ttamp=I('post.ttamp','');
			$su_weixin=I('post.su_weixin','');
			$su_name=I('post.su_name','');
			
			$nowtime=time();
			if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$msg=array('stat'=>2,'msg'=>'该链接已失效,请刷新二维码重新扫描');
                echo json_encode($msg);
                exit;
			}
			if(MD5($qycode.$openid.$ttamp)!=$sture){
				$msg=array('stat'=>2,'msg'=>'该链接已失效,请刷新二维码重新扫描');
                echo json_encode($msg);
                exit;
			}
			if(($nowtime - $ttamp) > 1200) {
				$msg=array('stat'=>2,'msg'=>'该链接已失效,请刷新二维码重新扫描');
                echo json_encode($msg);
                exit;
			}
			if(!is_not_null($openid)){
				$msg=array('stat'=>2,'msg'=>'对不起，你的微信授权已过期');
                echo json_encode($msg);
                exit;
			}
			
			if($su_weixin==''){
				$msg=array('stat'=>0,'msg'=>'请填写微信号');
				echo json_encode($msg);
				exit;
			}
			if($su_name==''){
				$msg=array('stat'=>0,'msg'=>'请填写你的名称');
				echo json_encode($msg);
				exit;
			}
			
			//确保openid唯一
			$map=array();
			$map['su_openid']=$openid;
			$map['su_unitcode']=$qycode;
	
			$Qysubuser= M('Qysubuser');
			$data=$Qysubuser->where($map)->find();
			if($data){
				$msg=array('stat'=>0,'msg'=>'对不起，该微信已存在');
                echo json_encode($msg);
                exit;
			}
			
			//确保微信号唯一
			$map2=array();
            $map2['su_weixin']=$su_weixin;
            $map2['su_unitcode']=$qycode;
			$map2['su_belong']=0;
            $data2=$Qysubuser->where($map2)->find();
			if($data2){
				$msg=array('stat'=>0,'msg'=>'你填写的微信号已存在');
				echo json_encode($msg);
				exit;
			}
			
			$data2=array();
			$data2['su_unitcode']=$qycode;
			$data2['su_openid']=$openid;
			$data2['su_weixin']=$su_weixin;
			$data2['su_name']=$su_name;
			$data2['su_logintime']=time();
			$data2['su_status']=0;
			$data2['su_belong']=0;
			
			
            $rs=$Qysubuser->create($data2,1);
			$result = $Qysubuser->add(); 
			if($result){
				$msg=array('stat'=>1,'msg'=>'你的申请提交成功，请等待审核');
				echo json_encode($msg);
				exit;
			}else{
				$msg=array('stat'=>0,'msg'=>'申请提交失败');
				echo json_encode($msg);
				exit;
			}
		}
	
	
		//-----------------------------------------------------------
        //验证是否有效链接
		$ttamp=trim(I('get.ttamp',''));
        $sture=trim(I('get.sture',''));
		$qycode=trim(I('get.qycode',''));
		$openid=session('subuser_openid');
		$nowtime=time();
		
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
            $this->error('该链接已失效,请刷新二维码重新扫描','',2);
        }
		if(MD5($ttamp.$qycode.$ttamp)!=$sture){
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
        if(($nowtime - $ttamp) > 30) {
            $this->error('该链接已失效,请刷新二维码重新扫描','',2);
        }
		if(!is_not_null($openid)){
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
		$Qysubuser= M('Qysubuser');
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		
		$data=$Qysubuser->where($map)->find();
		if($data){
			$this->error('该微信已存在','',2);
		}
		$ttamp2=time();
		$sture2=MD5($qycode.$openid.$ttamp2);
		
		$this->assign('qycode', $qycode);
		$this->assign('sture', $sture2);
		$this->assign('ttamp', $ttamp2);
	    $this->assign('title', '申请微信出货权限');
		$this->display('subuseradd');	
	}		

	
	//微信授权登录 
	public function wxshiplogin(){	
		$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
		if (strpos($user_agent, 'micromessenger') === false){
			$this->error('请在微信客户端打开链接','',-1);
			exit;
		}

	    $ttamp=trim(I('get.ttamp',''));
	    $sture=trim(I('get.sture',''));
	    $qycode=trim(I('get.qycode',''));
        $nowtime=time();
		
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
		if(MD5($ttamp.$qycode.$ttamp)!=$sture){
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
		if(($nowtime - $ttamp) > 30) {
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
	   
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->qy_wxappid.'&redirect_uri=http%3a%2f%2fwww.cn315fw.com%2fmp%2fwxship%2fwxshipcallback?qycode='.$qycode.'&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';  
	    header("Location:".$url);  
    }
	
	//消费会员微信授权回调 获取用户信息 用于微信出货扫描 
	public function wxshipcallback(){	
	    $code=trim(I('get.code',''));
		$qycode=trim(I('get.qycode',''));

        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			goto gotoEND;
			exit;
		}
		
		if($code!=''){
			$Qysubuser= M('Qysubuser');
			//用code换取access_token
			$get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->qy_wxappid.'&secret='.$this->qy_wxappsecret.'&code='.$code.'&grant_type=authorization_code';  
			$res=@file_get_contents($get_token_url);
			if($res===FALSE){
				goto gotoEND;
                exit;
			}else{
				$res_arr=json_decode($res,true); 
				if(!is_array($res_arr)){
					goto gotoEND;
                    exit;
				}else{
					//根据openid和access_token查询用户信息  
                    $access_token = $res_arr['access_token'];  
                    $openid = trim($res_arr['openid']);  

                    if($openid==''){
						goto gotoEND;
                        exit;
					}else{
						//检测openid 是否存在 如果没有就增加
						$map=array();
						$map['su_openid']=$openid;
						$map['su_unitcode']=$qycode;
						$map['su_belong']=0;
						
						$data=$Qysubuser->where($map)->find();
						if($data){
							if($data['su_status']==1){
								$data3['su_logintime']=time();
								$Qysubuser->where($map)->save($data3);
								//
                                //记录日志 begin
								$log_arr=array();
								$log_arr=array(
											'log_qyid'=>$data['su_id'],
											'log_user'=>$data['su_name'],
											'log_qycode'=>$qycode,
											'log_action'=>'企业子用户登录',
											'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
											'log_addtime'=>time(),
											'log_ip'=>real_ip(),
											'log_link'=>__SELF__,
											'log_remark'=>json_encode($data)
											);
								save_log($log_arr);
								//记录日志 end
							}else{
								$this->error('申请已提交,请等待审核','',-1);
								exit;
							}
						}else{
                            //提交申请子用户
							$ttamp2=time();
							$sture2=MD5($ttamp2.$qycode.$ttamp2);
							session('subuser_openid',$openid);
							$this->redirect('Mp/Wxship/subuseradd/qycode/'.$qycode.'/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
							exit;
						}
						//写入session
						$user_time=time();
						$subuser_check=MD5($data['su_openid'].$user_time).MD5($user_time);
						session('subuser_name',$data['su_name']);
						session('subuser_time',$user_time);
						session('subuser_id',$data['su_id']);
						session('subuser_openid',$data['su_openid']);
						session('subuser_unitcode',$qycode);
						cookie('subuser_check',$subuser_check,36000);
						
						$this->redirect('Mp/Wxship/index','' , 0, '');
						exit;
					}
				}
			}				
		}else{
			goto gotoEND;
            exit;
		}
		/////////////
		gotoEND:
		$this->error('微信授权失败，请刷新二维码重新尝试','',-1);
		exit;
	}

	
	//判断子用户微信登录
	public function is_subuser_wxlogin(){
		$user_check=cookie('subuser_check');
		$user_time=session('subuser_time');
		$user_id=session('subuser_id');
		$user_unitcode=session('subuser_unitcode');
		$user_openid=session('subuser_openid');
		$user_name=session('subuser_name');
			
		if($user_check=='' || $user_name=='' || $user_time=='' || $user_id=='' || $user_unitcode==''|| $user_openid==''){
			return false;
		}else{
			if($user_check==MD5($user_openid.$user_time).MD5($user_time)){
				return true;
			}else{
				return false;
			}
		}
	}
		
    public function _empty()
    {
      header('HTTP/1.0 404 Not Found');
      echo'error:404';
      exit;
    }
}