<?php
namespace Wxship\Controller;
use Think\Controller;
class StorageController extends CommController {
    //入库处理

    public function index(){
        exit;
    }
	
	//入库记录
    public function storlist(){
         $this->checksu_qypurview('16004',1);
		 
		 
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
		//-------------------------------
		$Storage= M('Storage');

        $map=array();
		$parameter=array();
        $map['stor_unitcode']=$qycode;
        $map['stor_cztype']=1;     //0-企业主账户  1-企业子管理用户  2-经销商
		$map['stor_czid']=session('subuser_id');
		
        $count = $Storage->where($map)->count();
        $Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Storage->where($map)->order('stor_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

		$Product = M('Product');
		foreach($list as $k=>$v){ 
            $map2=array();
            $map2['pro_unitcode']=$qycode;
            $map2['pro_id'] = $v['stor_pro'];
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
		
        $this->display('storlist');
    }
	
	//入库记录-详细
    public function stordetail(){
        $this->checksu_qypurview('16004',1);
		 
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$stor_id=intval(I('get.stor_id',0));
		
		$Storage= M('Storage');
        $map=array();
        $map['stor_unitcode']=$qycode;
		$map['stor_id']=$stor_id;
        $data=$Storage->where($map)->find();
		
		$Warehouse = M('Warehouse');
		$Product = M('Product');
        if($data){
            $map2=array();
            $map2['pro_unitcode']=$qycode;
            $map2['pro_id'] = $data['stor_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                  $data['pro_name']=$Proinfo['pro_name'].'('.$Proinfo['pro_number'].')';
            }else{
                  $data['pro_name']='';
            }
			
            $map2=array();
            $map2['wh_unitcode']=$qycode;
            $map2['wh_id'] = $data['stor_whid'];
            $warehouse = $Warehouse->where($map2)->find();

            if($warehouse){
                  $data['warehouse']=$warehouse['wh_name'];
            }else{
                  $data['warehouse']='';
            }
			
			if($data['stor_isship']>0 && $this->checksu_qypurview('16005',0)){
				$isstordelete=1;
			}else{
				$isstordelete=0;
			}
			
        }else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('isstordelete', $isstordelete);
		$this->assign('storinfo', $data);
		$this->display('stordetail');
	}
	
    //入库记录-删除
    public function stordelete(){
        $this->checksu_qypurview('16005',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		$map=array();
        $map['stor_id']=intval(I('get.stor_id',0));
        $map['stor_unitcode']=$qycode;
        $Storage= M('Storage');
        $Storchaibox= M('Storchaibox');
		$Shipment= M('Shipment');
        //判断是否可删 保持数据完整性 待完善
        $data=$Storage->where($map)->find();
        if($data){
            //如果经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$qycode;
            $where=array();
            $where['ship_barcode']=array('EQ',$data['stor_barcode']);
            $where['ship_tcode']=array('EQ',$data['stor_barcode']);
            $where['ship_ucode']=array('EQ',$data['stor_barcode']);
            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
               $this->error('该入库记录已出货，暂不能删除','',3);
            }

           //判断处理拆箱记录
            if($data['stor_tcode']!='' || $data['stor_ucode']!=''){

				if($data['stor_tcode']!='' &&  $data['stor_tcode']!=$data['stor_barcode']){	
                    $map2=array();
                    $map2['stor_tcode']=$data['stor_tcode'];
                    $map2['stor_unitcode']=$qycode;

                    $map2['stor_id'] = array('NEQ',$data['stor_id']);
                    $data2=$Storage->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['stor_tcode'];
                        $map3['chai_unitcode']=$qycode;
                        $Storchaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['stor_ucode']!='' && $data['stor_ucode']!=$data['stor_barcode'] && $data['stor_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['stor_ucode']=$data['stor_ucode'];
                    $map2['stor_unitcode']=$qycode;

                    $map2['stor_id'] = array('NEQ',$data['stor_id']);
                    $data2=$Storage->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['stor_ucode'];
                        $map3['chai_unitcode']=$qycode;
                        $Storchaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['stor_tcode']=$data['stor_tcode'];
                    $map22['ship_unitcode']=$qycode;

                    $map22['stor_id'] = array('NEQ',$data['stor_id']);
                    $data22=$Storage->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['stor_tcode'];
                        $map33['chai_unitcode']=$qycode;
                        $Storchaibox->where($map33)->delete(); 
                    }
                }
            }
             
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('subuser_id'),
                        'log_user'=>session('subuser_name'),
                        'log_qycode'=>$qycode,
                        'log_action'=>'删除入库记录',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $Storage->where($map)->delete(); 
            $this->success('删除成功',U('Wxship/Storage/storlist'),2);
        }else{
            $this->error('没有该记录','',2);
        }     
    }
  
	//入库扫描 设置 
    public function storinscanset(){
		$this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------
	
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
		
		
        if(is_not_null(session('stor_number'))){
			$this->assign('stor_number', session('stor_number'));
		}else{
			$this->assign('stor_number', '');
		}
		
		if(is_not_null(session('stor_prodate'))){
			$this->assign('stor_prodate', session('stor_prodate'));
		}else{
			$this->assign('stor_prodate', '');
		}
		
		if(is_not_null(session('stor_batchnum'))){
			$this->assign('stor_batchnum', session('stor_batchnum'));
		}else{
			$this->assign('stor_batchnum', '');
		}
		
        if(is_not_null(session('stor_whid'))){
			$this->assign('stor_whid', session('stor_whid'));
		}else{
			$this->assign('stor_whid', '');
		}
		
		if(is_not_null(session('stor_pro'))){
			$this->assign('stor_pro', session('stor_pro'));
		}else{
			$this->assign('stor_pro', '');
		}
		
		if(is_not_null(session('stor_remark'))){
			$this->assign('stor_remark', session('stor_remark'));
		}else{
			$this->assign('stor_remark', '');
		}
		
		$this->display('storinscanset');
    }
	
	//入库扫描 
    public function storinscan(){
		$this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------
		
	    if(IS_POST){
			$stor_number=I('post.stor_number','');
			$stor_whid=intval(I('post.stor_whid',0));
			$stor_pro=intval(I('post.stor_pro',0));
			$stor_prodate=I('post.stor_prodate','');
			$stor_batchnum=I('post.stor_batchnum','');
			$stor_remark=I('post.stor_remark','');
		}else{

			if(is_not_null(session('stor_number'))){
				$stor_number=session('stor_number');
			}else{
				$stor_number='';
			}
			if(is_not_null(session('stor_whid'))){
				$stor_whid=session('stor_whid');
			}else{
				$stor_whid=0;
			}
			if(is_not_null(session('stor_pro'))){
				$stor_pro=session('stor_pro');
			}else{
				$stor_pro=0;
			}
			
			if(is_not_null(session('stor_prodate'))){
				$stor_prodate=session('stor_prodate');
			}else{
				$stor_prodate='';
			}
			if(is_not_null(session('stor_batchnum'))){
				$stor_batchnum=session('stor_batchnum');
			}else{
				$stor_batchnum='';
			}
			if(is_not_null(session('stor_remark'))){
				$stor_remark=session('stor_remark');
			}else{
				$stor_remark='';
			}
		}
		
		

		if($stor_number==''){
			$this->error('请填写入库单号',U('Wxship/Storage/storinscanset'),2);
		}
		if($stor_whid<=0){
			$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
		}
		if($stor_pro<=0){
			$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
		}

		
		//产品
		$map2=array();
		$map2['pro_unitcode']=$qycode;
		$map2['pro_active'] = 1;
		$map2['pro_id'] = $stor_pro;
		$Product = M('Product');
		$proinfo = $Product->where($map2)->find();
        if($proinfo){
			$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
		}else{
			$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
		}
		$this->assign('proname', $proname);
			
		//仓库
		$map2=array();
		$map2['wh_unitcode']=$qycode;
		$map2['wh_id']=$stor_whid;
		$Warehouse = M('Warehouse');
		$whinfo = $Warehouse->where($map2)->find();
		if($whinfo){
			$whname=$whinfo['wh_name'];
		}else{
			$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
		}
		$this->assign('whname', $whname);
			
		//暂存用户选择历史
		session('stor_number',$stor_number);
		session('stor_whid',$stor_whid);
		session('stor_pro',$stor_pro);
		session('stor_prodate',$stor_prodate);
		session('stor_batchnum',$stor_batchnum);
		session('stor_remark',$stor_remark);

		
        $this->assign('stor_number', $stor_number);
		$this->assign('stor_prodate', $stor_prodate);
		$this->assign('stor_batchnum', $stor_batchnum);
		$this->assign('stor_remark', $stor_remark);
		
		//统计扫描纪录 session 保存json数据
		$brcodestr=session('storsubrcode');
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
		
		
		$this->display('storinscan');
    }
	
	//入库扫描-结果
    public function storinscanres(){
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
		$Storchaibox= M('Storchaibox');
		$Storage= M('Storage');
        $barcode=array();
		
		//检测该条码是否已录入
		$map['stor_unitcode']=$qycode;
		$map['stor_barcode'] = $brcode;
		$data=$Storage->where($map)->find();
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
		
        //是否已入库 ucode-大标  	tcode-中标 
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
        $map['stor_barcode'] = $where;
        $map['stor_unitcode']=$qycode;

        $data=$Storage->where($map)->find();
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

        $data2=$Storchaibox->where($map2)->find();

        if(is_not_null($data2)){
			$msg='条码<b>'.$brcode.'</b>已经拆箱，不能再使用';
			$barcode=array();
			goto gotoEND;
			exit;
        }
		
	    //暂存session
		if(is_not_null($barcode)){
			$brcodestr=session('storsubrcode');
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
			session('storsubrcode',$brcodestr); 
			
			$msg='条码<b>'.$brcode.'</b>扫描成功!';
		}else{
			$msg='对不起，你没有条码<b>'.$brcode.'</b>操作权限';
			$barcode=array();
			goto gotoEND;
			exit;
		}

		/////////////
		gotoEND:
		
		if(is_not_null(session('stor_number'))){
			$stor_number=session('stor_number');
		}else{
			$stor_number='';
		}
		if(is_not_null(session('stor_whid'))){
			$stor_whid=session('stor_whid');
		}else{
			$stor_whid=0;
		}
		if(is_not_null(session('stor_pro'))){
			$stor_pro=session('stor_pro');
		}else{
			$stor_pro=0;
		}
		
		if(is_not_null(session('stor_prodate'))){
			$stor_prodate=session('stor_prodate');
		}else{
			$stor_prodate='';
		}
		if(is_not_null(session('stor_batchnum'))){
			$stor_batchnum=session('stor_batchnum');
		}else{
			$stor_batchnum='';
		}
		if(is_not_null(session('stor_remark'))){
			$stor_remark=session('stor_remark');
		}else{
			$stor_remark='';
		}
		
		if($stor_number==''){
			$this->error('请填写入库单号',U('Wxship/Storage/storinscanset'),2);
		}
		if($stor_whid<=0){
			$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
		}
		if($stor_pro<=0){
			$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
		}
		
		//产品
		$map2=array();
		$map2['pro_unitcode']=$qycode;
		$map2['pro_active'] = 1;
		$map2['pro_id'] = $stor_pro;
		$Product = M('Product');
		$proinfo = $Product->where($map2)->find();
        if($proinfo){
			$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
		}else{
			$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
		}
		$this->assign('proname', $proname);
			
		//仓库
		$map2=array();
		$map2['wh_unitcode']=$qycode;
		$map2['wh_id']=$stor_whid;
		$Warehouse = M('Warehouse');
		$whinfo = $Warehouse->where($map2)->find();
		if($whinfo){
			$whname=$whinfo['wh_name'];
		}else{
			$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
		}
		$this->assign('whname', $whname);
		
		
        $this->assign('stor_number', $stor_number);
		$this->assign('stor_prodate', $stor_prodate);
		$this->assign('stor_batchnum', $stor_batchnum);
		$this->assign('stor_remark', $stor_remark);
		
		//统计扫描纪录 session 保存json数据
		$brcodestr=session('storsubrcode');
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
        $this->display('storinscanres');	
	}	
	
	
    //入库扫描记录
    public function storscanlist(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
		//-------------------------------
		$brcodearr=array();
		$brcodestr=session('storsubrcode');
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
			$this->error('没有扫描纪录',U('Wxship/Storage/storinscanset'),2);
		}
		

	    $this->assign('list', $brcodearr);
		$this->assign('jishu', 1);
        $this->display('storscanlist');
	}	
   
	
   //入库扫描记录-移除
    public function storremove(){
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
		
		$brcodestr=session('storsubrcode');
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
		session('storsubrcode',$brcodestr); 
		
		
        $this->success('移除成功',U('Wxship/Storage/storscanlist'),1);
	}
	
    //入库扫描-确认入库
    public function storing(){
        $this->checksu_qypurview('16004',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		
		$step=intval(I('get.step',0));
		if($step==1){  //确认入库
			$stor_time=time();
			
			if(is_not_null(session('stor_number'))){
				$stor_number=session('stor_number');
			}else{
				$stor_number='';
			}
			if(is_not_null(session('stor_whid'))){
				$stor_whid=session('stor_whid');
			}else{
				$stor_whid=0;
			}
			if(is_not_null(session('stor_pro'))){
				$stor_pro=session('stor_pro');
			}else{
				$stor_pro=0;
			}
			
			if(is_not_null(session('stor_prodate'))){
				$stor_prodate=session('stor_prodate');
			}else{
				$stor_prodate='';
			}
			if(is_not_null(session('stor_batchnum'))){
				$stor_batchnum=session('stor_batchnum');
			}else{
				$stor_batchnum='';
			}
			if(is_not_null(session('stor_remark'))){
				$stor_remark=session('stor_remark');
			}else{
				$stor_remark='';
			}
			
			if($stor_number==''){
				$this->error('请填写入库单号',U('Wxship/Storage/storinscanset'),2);
			}
			if($stor_whid<=0){
				$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
			}
			if($stor_pro<=0){
				$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
			}
			
			//产品
			$map2=array();
			$map2['pro_unitcode']=$qycode;
			$map2['pro_active'] = 1;
			$map2['pro_id'] = $stor_pro;
			$Product = M('Product');
			$proinfo = $Product->where($map2)->find();
			if($proinfo){
				$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
			}else{
				$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
			}
			$this->assign('proname', $proname);
				
			//仓库
			$map2=array();
			$map2['wh_unitcode']=$qycode;
			$map2['wh_id']=$stor_whid;
			$Warehouse = M('Warehouse');
			$whinfo = $Warehouse->where($map2)->find();
			if($whinfo){
				$whname=$whinfo['wh_name'];
			}else{
				$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
			}
			$this->assign('whname', $whname);
			
			
			$this->assign('stor_number', $stor_number);
			$this->assign('stor_prodate', $stor_prodate);
			$this->assign('stor_batchnum', $stor_batchnum);
			$this->assign('stor_remark', $stor_remark);

			
			$brcodestr=session('storsubrcode');
			$brcodearr=array();
			$brcarr=array();
			if(is_not_null($brcodestr)){
				$brcodearr=explode(',',$brcodestr);
			}else{
				$this->error('没有扫描纪录','',2);
			}
			
			
            $brcodearr=array();
			$brcodestr=session('storsubrcode');
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
				$this->error('没有扫描纪录',U('Wxship/Storage/storinscanset'),2);
			}
			
		    $Storchaibox= M('Storchaibox');
		    $Storage= M('Storage');
			
			foreach($brcodearr as $v=>$k){ 
				if($v!=''){
					$brcode=$v;
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
					$map2['stor_unitcode']=$qycode;
					$map2['stor_barcode'] = $brcode;

					$data2=$Storage->where($map2)->find();
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
					$map2['stor_barcode'] = $where2;
					$map2['stor_unitcode']=$qycode;

					$data2=$Storage->where($map2)->find();
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

					$data2=$Storchaibox->where($map2)->find();
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
						$insert['stor_unitcode']=$qycode;
						$insert['stor_number']=$stor_number;
						$insert['stor_pro']=$stor_pro;
						$insert['stor_whid']=$stor_whid;
						$insert['stor_proqty']=$barcode['qty'];
						$insert['stor_barcode']=$brcode;
						$insert['stor_date']=$stor_time;
						$insert['stor_ucode']=$barcode['ucode'];
						$insert['stor_tcode']=$barcode['tcode'];
						$insert['stor_remark']=$stor_remark;
						$insert['stor_cztype']=1;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
						$insert['stor_czid']=session('subuser_id');
						$insert['stor_czuser']=session('subuser_name');
						$insert['stor_prodate']=$stor_prodate;
						$insert['stor_batchnum']=$stor_batchnum;
						$insert['stor_isship']=0;
						
                        $rs=$Storage->create($insert,1);
						if($rs){
						   $result = $Storage->add(); 
						   if($result){
								//记录拆箱
								if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
									$insert2=array();
									$data3=array();
									$insert2['chai_unitcode']=$qycode;
									$insert2['chai_barcode']=$barcode['tcode'];
									$data3=$Storchaibox->where($insert2)->find();
									if(!$data3){
										$insert2['chai_addtime']=$stor_time;
										$Storchaibox->create($insert2,1);
										$Storchaibox->add(); 
									}
								}
								if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$qycode;
									$insert3['chai_barcode']=$barcode['ucode'];
									$data4=$Storchaibox->where($insert3)->find();
									if(!$data4){
										$insert3['chai_addtime']=$stor_time;
										$Storchaibox->create($insert3,1);
										$Storchaibox->add(); 
									}
								}

								//记录日志 begin
								$log_arr=array();
								$log_arr=array(
											'log_qyid'=>session('subuser_id'),
											'log_user'=>session('subuser_name'),
											'log_qycode'=>$qycode,
											'log_action'=>'企业子用户入库',
											'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
											'log_addtime'=>$stor_time,
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
			session('storsubrcode',null);
			
			$this->assign('success', $success);
			$this->assign('fail', $fail);
			$this->assign('scanprocount', $scanprocount);
			$this->assign('list', $brcarr);
			$this->assign('title', '入库结果');
			$this->display('storing2');
			
		}else{ 
			if(is_not_null(session('stor_number'))){
				$stor_number=session('stor_number');
			}else{
				$stor_number='';
			}
			if(is_not_null(session('stor_whid'))){
				$stor_whid=session('stor_whid');
			}else{
				$stor_whid=0;
			}
			if(is_not_null(session('stor_pro'))){
				$stor_pro=session('stor_pro');
			}else{
				$stor_pro=0;
			}
			
			if(is_not_null(session('stor_prodate'))){
				$stor_prodate=session('stor_prodate');
			}else{
				$stor_prodate='';
			}
			if(is_not_null(session('stor_batchnum'))){
				$stor_batchnum=session('stor_batchnum');
			}else{
				$stor_batchnum='';
			}
			if(is_not_null(session('stor_remark'))){
				$stor_remark=session('stor_remark');
			}else{
				$stor_remark='';
			}
			
			if($stor_number==''){
				$this->error('请填写入库单号',U('Wxship/Storage/storinscanset'),2);
			}
			if($stor_whid<=0){
				$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
			}
			if($stor_pro<=0){
				$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
			}
			
			//产品
			$map2=array();
			$map2['pro_unitcode']=$qycode;
			$map2['pro_active'] = 1;
			$map2['pro_id'] = $stor_pro;
			$Product = M('Product');
			$proinfo = $Product->where($map2)->find();
			if($proinfo){
				$proname=$proinfo['pro_name'].'('.$proinfo['pro_number'].')';
			}else{
				$this->error('请选择产品',U('Wxship/Storage/storinscanset'),2);
			}
			$this->assign('proname', $proname);
				
			//仓库
			$map2=array();
			$map2['wh_unitcode']=$qycode;
			$map2['wh_id']=$stor_whid;
			$Warehouse = M('Warehouse');
			$whinfo = $Warehouse->where($map2)->find();
			if($whinfo){
				$whname=$whinfo['wh_name'];
			}else{
				$this->error('请选择仓库',U('Wxship/Storage/storinscanset'),2);
			}
			$this->assign('whname', $whname);
			
			
			$this->assign('stor_number', $stor_number);
			$this->assign('stor_prodate', $stor_prodate);
			$this->assign('stor_batchnum', $stor_batchnum);
			$this->assign('stor_remark', $stor_remark);
			
			$brcodearr=array();
			$brcodestr=session('storsubrcode');
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
				$this->error('没有扫描纪录',U('Wxship/Storage/storinscanset'),2);
			}
			$this->assign('list', $brcodearr);
			$this->assign('jishu', 1);
			$this->display('storing1');
		}
	}	
	
}