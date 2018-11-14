<?php
namespace Mp\Controller;
use Think\Controller;
//返利管理
class FanliController extends CommController {
	//代理返利
    public function index(){
        $this->check_qypurview('14001',1);
		
        $keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));
		$dl_type=intval(I('param.dl_type',0));
		$dl_status=I('param.dl_status','');
		
		$parameter=array();
		
		if($dl_status!=''){
			$dl_status=intval($dl_status);
			$map['dl_status']=$dl_status;
			$parameter['dl_status']=$dl_status;
		}

		if($dl_type>0){
			$map['dl_type']=$dl_type;
			$parameter['dl_type']=$dl_type;
		}
		
	
		
        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);
            $keyword=sub_str($keyword,20,false);
            $where['dl_name']=array('LIKE', '%'.$keyword.'%');
            $where['dl_number']=array('LIKE', '%'.$keyword.'%');
            $where['dl_tel']=array('LIKE', '%'.$keyword.'%');
            $where['dl_weixin']=array('LIKE', '%'.$keyword.'%');
			$where['dl_contact']=array('LIKE', '%'.$keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
			
			$parameter['keyword']=$keyword;
        }

        $map['dl_unitcode']=session('unitcode');
        $Dealer = M('Dealer');
		$Dltype = M('Dltype');
		$Fanlidetail= M('Fanlidetail');
		
        $count = $Dealer->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Dealer->where($map)->order('dl_type ASC,dl_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			
			//经销商级别
			$map2=array();
			$map2['dlt_id']=$v['dl_type'];
			$map2['dlt_unitcode']=session('unitcode');
			$data2 = $Dltype->where($map2)->find();
			if($data2){
				$list[$k]['dl_type_str']=$data2['dlt_name'];
			}else{
				$list[$k]['dl_type_str']='-';
			}
			
			//上家代理
			if($v['dl_belong']>0){
				$map2=array();
				$map2['dl_id']=$v['dl_belong'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_belong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_belong_str']='-';
				}
			}else{
				$list[$k]['dl_belong_str']='直属公司';
			}
			
			//推荐人
			if($v['dl_referee']>0){
				$map2=array();
				$map2['dl_id']=$v['dl_referee'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_referee_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_referee_str']='-';
				}
			}else{
				$list[$k]['dl_referee_str']='直属公司';
			}
			
			


			//待收返利总额
			$rcsum=0;
			$map2=array();
			$map2['fl_dlid']=$v['dl_id'];
			$map2['fl_unitcode']=session('unitcode');
			$map2['fl_state']=0;
			$rcsum = $Fanlidetail->where($map2)->sum('fl_money'); 

			$list[$k]['dl_rcsum']=$rcsum;
			
            //待付返利总额
			$sendsum=0;
			$map2=array();
			$map2['fl_senddlid']=$v['dl_id'];
			$map2['fl_unitcode']=session('unitcode');
			$map2['fl_state']=0;
			$sendsum = $Fanlidetail->where($map2)->sum('fl_money'); 
			
			$list[$k]['dl_sendsum']=$sendsum;
			
		}

		
		
        //分类列表
		$map2=array();
        $map2['dlt_unitcode']=session('unitcode');
        $list2 = $Dltype->where($map2)->order('dlt_level ASC,dlt_id ASC')->select();
        $this->assign('dltypelist', $list2);
		
		$this->assign('dl_type', $dl_type);
        $this->assign('dl_status', $dl_status);
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'fanlidllist');
        $this->display('list');
    }
	
	//返利代理详细
    public function fanlidldetail(){
        $this->check_qypurview('14002',1);
		
        $dl_id=intval(I('get.dl_id',0));
		
		$map=array();
		$Dealer= M('Dealer');
		$Dltype= M('Dltype');
		$Fanlidetail= M('Fanlidetail');
		$map['dl_id']=$dl_id;
		$map['dl_unitcode']=session('unitcode');

		$data=$Dealer->where($map)->find();
		if($data){
			
			//统计已收返利
            $map3=array();
			$map3['fl_dlid']=$data['dl_id']; //返利收方
			$map3['fl_unitcode']=session('unitcode');
			$map3['fl_state']=1;  //0-待收款 1-已收款 2-收款中  9-已取消
			$flsum2=0;
			$flsum2 = $Fanlidetail->where($map3)->sum('fl_money');
            $data['flreceived']=$flsum2;
			
			//统计待收返利
            $map3=array();
			$map3['fl_dlid']=$data['dl_id']; //返利收方
			$map3['fl_unitcode']=session('unitcode');
			$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
			$flsum3=0;
			$flsum3 = $Fanlidetail->where($map3)->sum('fl_money');
            $data['flreadyrec']=$flsum3;
			
			//统计已付返利
            $map3=array();
			$map3['fl_senddlid']=$data['dl_id']; //返利发方
			$map3['fl_unitcode']=session('unitcode');
			$map3['fl_state']=1;  //0-待收款 1-已收款 2-收款中  9-已取消
			$flsum4=0;
			$flsum4 = $Fanlidetail->where($map3)->sum('fl_money');
            $data['flpayed']=$flsum4;
			
			//统计待付返利
            $map3=array();
			$map3['fl_senddlid']=$data['dl_id']; //返利发方
			$map3['fl_unitcode']=session('unitcode');
			$map3['fl_state']=0;  //0-待收款 1-已收款 2-收款中  9-已取消
			$flsum5=0;
			$flsum5 = $Fanlidetail->where($map3)->sum('fl_money');
            $data['flreadypay']=$flsum5;
			
			//经销商级别
			$map2=array();
			$map2['dlt_id']=$data['dl_type'];
			$map2['dlt_unitcode']=session('unitcode');
			$data2 = $Dltype->where($map2)->find();
			if($data2){
				$data['dl_type_str']=$data2['dlt_name'];
			}else{
				$data['dl_type_str']='-';
			}
			
			//上家代理
			if($data['dl_belong']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_belong'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_belong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_belong_str']='-';
				}
			}else{
				$data['dl_belong_str']='直属公司';
			}
			
			//推荐人
			if($data['dl_referee']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_referee'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_referee_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_referee_str']='-';
				}
			}else{
				$data['dl_referee_str']='直属公司';
			}
			
			
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('fanlidlinfo', $data);
        $this->assign('curr', 'fanlilist');
        $this->display('fanlidldetail');
	}
	
	//返利明细
    public function fanlilist(){
        $this->check_qypurview('14002',1);
		
		$dlusername=trim(I('param.dlusername',''));
		$begintime=I('param.begintime','');
        $endtime=I('param.endtime','');
		$parameter=array();
		
        $Dealer = M('Dealer');
		$Fanlidetail= M('Fanlidetail');
		$back=0;
		if($dlusername!='' && $dlusername!='请输入代理账号'){
            if(!preg_match("/[a-zA-Z0-9_-]{4,20}$/",$dlusername)){
                $this->error('代理账号不正确','',1);
            }
			
			$map2=array();
            $map2['dl_username']=$dlusername;
            $map2['dl_unitcode']=session('unitcode');
            $data22=$Dealer->where($map2)->find();
            if($data22){

			}else{
				$this->error('代理账号不正确','',1);
			}
			
            $map['fl_dlid']=$data22['dl_id'];
			$parameter['dlusername']=$dlusername;
			$this->assign('dlusername', $dlusername);
        }else{
			$this->assign('dlusername', '请输入代理账号');
		}
		$this->assign('back', $back);
		
		
		if($begintime!='' && $endtime!=''){
            $begintime=strtotime($begintime);
			$endtime=strtotime($endtime);
			if($begintime===FALSE || $endtime===FALSE){
				$this->error('请选择查询日期','',1);
			}
			$endtime=$endtime+3600*24-1;
			if($begintime>=$endtime){
				$this->error('查询结束日期要大于开始日期','',1);
			}	
			
			$map['fl_addtime']=array('between',array($begintime,$endtime));
			
			$parameter['begintime']=urlencode(date('Y-m-d',$begintime));
			$parameter['endtime']=urlencode(date('Y-m-d',$endtime));
			
			$this->assign('begintime', date('Y-m-d',$begintime));
			$this->assign('endtime', date('Y-m-d',$endtime));
		}else{
            $begintime='';
            $endtime='';
		    $this->assign('begintime', '');
		    $this->assign('endtime', '');
		}
        $map['fl_unitcode']=session('unitcode');


        $count = $Fanlidetail->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Fanlidetail->where($map)->order('fl_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			//收款代理信息
			if($v['fl_dlid']>0){
				$map2=array();
				$map2['dl_id']=$v['fl_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					$list[$k]['dl_number']=$data2['dl_number'];
				}else{
					$list[$k]['dl_name_str']='未知';
					$list[$k]['dl_number']='-';
				}
			}else{
				$list[$k]['dl_name_str']='未知';
				$list[$k]['dl_number']='-';
			}
			
			//付款代理信息
			if($v['fl_senddlid']>0){
				$map2=array();
				$map2['dl_id']=$v['fl_senddlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_sendname_str']='未知';
				}
			}else{
				$list[$k]['dl_sendname_str']='总公司';
			}
			
		    //返利分类 1-推荐返利 2-订单返利 3-销售累计奖 4-按月销售奖 11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
		    if($v['fl_type']>=1 && $v['fl_type']<=10){
				$list[$k]['fl_moneystr']='<span style="color:#000000">+'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else if($v['fl_type']>=11 && $v['fl_type']<=20){
				$list[$k]['fl_moneystr']='<span style="color:#009900">-'.number_format($v['fl_money'], 2,'.','').'</span>';
			}else{
				$list[$k]['fl_moneystr']=number_format($v['fl_money'], 2,'.','');
			}
			
			if($v['fl_type']==1){
				$list[$k]['fl_typestr']='推荐返利';
			}else if($v['fl_type']==2){
				$list[$k]['fl_typestr']='订单返利';
			}else if($v['fl_type']==3){
				$list[$k]['fl_typestr']='销售累计奖';
			}else if($v['fl_type']==4){
				$list[$k]['fl_typestr']='按月销售奖';
			}else if($v['fl_type']==5){
				$list[$k]['fl_typestr']='销售差价奖';
			}
			else if($v['fl_type']==11){
				$list[$k]['fl_typestr']='提现减少返利';
			}else{
				$list[$k]['fl_typestr']='未定义';
			}
			
			if($v['fl_state']==0){
				$list[$k]['fl_state_str']='待收款';
			}else if($v['fl_state']==1){
				$list[$k]['fl_state_str']='已收款';
			}else if($v['fl_state']==2){
				$list[$k]['fl_state_str']='收款中';
			}else if($v['fl_state']==9){
				$list[$k]['fl_state_str']='已取消';
			}else{
				$list[$k]['fl_state_str']='-';
			}
		}
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'fanlilist');
        $this->display('fanlilist');
    }
	
	//返利详细
    public function fanlidetail(){
        $this->check_qypurview('14002',1);
		
        $fl_id=intval(I('get.fl_id',0));
		$map=array();
		$map['fl_id']=$fl_id;
		$map['fl_unitcode']=session('unitcode');
		$Fanlidetail= M('Fanlidetail');
		$data=$Fanlidetail->where($map)->find();
		if($data){
		    //返利分类 1-推荐返利 2-订单返利 3-销售累计奖 4-按月销售奖  11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
		    if($data['fl_type']>=1 && $data['fl_type']<=10){
				$data['fl_moneystr']='<span style="color:#000000">+'.number_format($data['fl_money'], 2,'.','').'</span>';
			}else if($data['fl_type']>=11 && $data['fl_type']<=20){
				$data['fl_moneystr']='<span style="color:#009900">-'.number_format($data['fl_money'], 2,'.','').'</span>';
			}else{
				$data['fl_moneystr']=number_format($data['fl_money'], 2,'.','');
			}
			
			if(isset(C('FANLI_TYPE')[$data['fl_type']])){
			    $data['fl_typestr']=C('FANLI_TYPE')[$data['fl_type']];
			}else{
				$data['fl_typestr']='其他';
			}
			
			//收款代理信息
			$map2=array();
			$Dealer= M('Dealer');
            $map2['dl_id']=$data['fl_dlid'];
            $map2['dl_unitcode']=session('unitcode');
            $data2=$Dealer->where($map2)->find();
			if($data2){
				$data['fl_dl_name']=$data2['dl_name'].'('.$data2['dl_username'].')';
			}else{
				$data['fl_dl_name']='';
			}
			
            //付款代理信息
			if($data['fl_senddlid']>0){
				$map2=array();
				$map2['dl_id']=$data['fl_senddlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_sendname_str']='未知';
				}
			}else{
				$data['dl_sendname_str']='总公司';
			}
			
            if($data['fl_state']==0){
				$data['fl_state_str']='待收款';
			}else if($data['fl_state']==1){
				$data['fl_state_str']='已收款';
			}else if($data['fl_state']==2){
				$data['fl_state_str']='收款中';
			}else if($data['fl_state']==9){
				$data['fl_state_str']='已取消';
			}else{
				$data['fl_state_str']='-';
			}
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('fanliinfo', $data);
		
		
        $this->assign('curr', 'fanlilist');
        $this->display('fanlidetail');
	}
	
	//提现列表
    public function recashlist(){
        $this->check_qypurview('14003',1);
		
		$map=array();
        $map['rc_unitcode']=session('unitcode');

        $Recash= M('Recash');
		$Dealer= M('Dealer');
        $count = $Recash->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Recash->where($map)->order('rc_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['rc_moneystr']='<span style="color:#009900">'.number_format($v['rc_money'], 2,'.','').'</span>';
			
			//提现代理
			if($v['rc_dlid']>0){
				$map2=array();
				$map2['dl_id']=$v['rc_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					$list[$k]['dl_number']=$data2['dl_number'];
				}else{
					$list[$k]['dl_name_str']='未知';
					$list[$k]['dl_number']='-';
				}
			}else{
				$list[$k]['dl_name_str']='未知';
				$list[$k]['dl_number']='-';
			}
			
			
			//付款代理
			if($v['rc_sdlid']>0){
				$map2=array();
				$map2['dl_id']=$v['rc_sdlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_sendname_str']='未知';
				}
			}else{
				$list[$k]['dl_sendname_str']='总公司';
			}
			
			//发放方式
			if(isset(C('FANLI_BANKS')[$v['rc_bank']])){
				$list[$k]['rc_str']=C('FANLI_BANKS')[$v['rc_bank']];
			}else{
				$list[$k]['rc_str']='未知';
			}
			
            if(MD5($v['rc_unitcode'].$v['rc_dlid'].number_format($v['rc_money'],2,'.','').$v['rc_bankcard'].$v['rc_addtime'])==$v['rc_verify']){
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='未处理';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败';
				}else{
					$list[$k]['rc_statestr']='其他';
				}
            }else{
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='未处理[异常]';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功[异常]';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败[异常]';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
			}
		}
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'recashlist');
        $this->display('recashlist');
    }
	
	//提现详细
    public function recashdetail(){
        $this->check_qypurview('14003',1);
		
        $rc_id=intval(I('get.rc_id',0));
		$back=intval(I('get.back',0));
		$map=array();
		$map['rc_id']=$rc_id;
		$map['rc_unitcode']=session('unitcode');
		$Recash= M('Recash');
		$data=$Recash->where($map)->find();
		if($data){
            $data['rc_moneystr']=number_format($data['rc_money'],2,'.','');
			if(isset(C('FANLI_BANKS')[$data['rc_bank']])){
				$data['rc_bankstr']=C('FANLI_BANKS')[$data['rc_bank']];
			}else{
				$data['rc_bankstr']='';
			}

			$data['rc_bankcardstr']=\Org\Util\Funcrypt::authcode($data['rc_bankcard'],'DECODE',C('WWW_AUTHKEY'),0);
			
            if(MD5($data['rc_unitcode'].$data['rc_dlid'].number_format($data['rc_money'],2,'.','').$data['rc_bankcard'].$data['rc_addtime'])==$data['rc_verify']){
				if($data['rc_state']==0){
					$data['rc_statestr']='未处理';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败';
				}else{
					$data['rc_statestr']='其他';
				}
            }else{
				if($data['rc_state']==0){
					$data['rc_statestr']='未处理[异常]';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功[异常]';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败[异常]';
				}else{
					$data['rc_statestr']='异常';
				}
			}
			
			//提现代理
			if($data['rc_dlid']>0){
				$map2=array();
				$Dealer= M('Dealer');
				$map2['dl_id']=$data['rc_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					if($data2['dl_status']==1){
						$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					}else{
					    $data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')[已禁用]';
					}
				}else{
					$data['dl_name_str']='未知';
				}
			}else{
				$data['dl_name_str']='未知';
			}
			
            //付款代理
			if($data['rc_sdlid']>0){
				$map2=array();
				$map2['dl_id']=$data['rc_sdlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_payname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_payname_str']='未知';
				}
			}else{
				$data['dl_payname_str']='总公司';
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/orders/';
			//图片
            if(is_not_null($data['rc_pic']) && file_exists($imgpath.$data['rc_pic'])){
                $arr=getimagesize($imgpath.$data['rc_pic']);
                if(false!=$arr){
                    $w=$arr[0];
                    $h=$arr[1];
                    if($h>80){
                       $hh=80;
                       $ww=($w*80)/$h;
                    }else{
                       $hh=$h;
                       $ww=$w;
                    }
                    if($ww>80){
                       $ww=80;
                       $hh=($h*80)/$w;
                    }
                    $data['rc_pic_str']='<img src="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'" width="'.$ww.'"  height="'.$hh.'"  border="0" style="vertical-align:middle"  >';
                }
                else{
                    $data['rc_pic_str']='';
                }
            }else{
                $data['rc_pic_str']='';
            }
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('recashinfo', $data);
		$this->assign('back', $back);
		
        $this->assign('curr', 'recashlist');
        $this->display('recashdetail');
	}
	
    //我应付返利
    public function paylist(){
        $this->check_qypurview('14003',1);
		
		$map=array();
        $map['rc_unitcode']=session('unitcode');
        $map['rc_sdlid']=0;
        $Recash= M('Recash');
		$Dealer= M('Dealer');
        $count = $Recash->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Recash->where($map)->order('rc_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			
			$list[$k]['rc_moneystr']='<span style="color:#009900">'.number_format($v['rc_money'], 2,'.','').'</span>';
			
			//提现代理
			if($v['rc_dlid']>0){
				$map2=array();
				$map2['dl_id']=$v['rc_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					$list[$k]['dl_number']=$data2['dl_number'];
				}else{
					$list[$k]['dl_name_str']='未知';
					$list[$k]['dl_number']='-';
				}
			}else{
				$list[$k]['dl_name_str']='未知';
				$list[$k]['dl_number']='-';
			}
			
			
			//付款代理
			if($v['rc_sdlid']>0){
				$map2=array();
				$map2['dl_id']=$v['rc_sdlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_sendname_str']='未知';
				}
			}else{
				$list[$k]['dl_sendname_str']='总公司';
			}
			
			//发放方式
			if(isset(C('FANLI_BANKS')[$v['rc_bank']])){
				$list[$k]['rc_str']=C('FANLI_BANKS')[$v['rc_bank']];
			}else{
				$list[$k]['rc_str']='未知';
			}
			
            if(MD5($v['rc_unitcode'].$v['rc_dlid'].number_format($v['rc_money'],2,'.','').$v['rc_bankcard'].$v['rc_addtime'])==$v['rc_verify']){
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='未处理';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
            }else{
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='未处理[异常]';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功[异常]';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败[异常]';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
			}
		}
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'paylist');
        $this->display('paylist');
    }
	
	//提现处理
    public function recashdeal(){
        $this->check_qypurview('14003',1);
		
        $rc_id=intval(I('get.rc_id',0));
		$map=array();
		$map['rc_id']=$rc_id;
		$map['rc_unitcode']=session('unitcode');
		$map['rc_sdlid']=0;
		$Recash= M('Recash');
		$data=$Recash->where($map)->find();
		if($data){
            $data['rc_moneystr']=number_format($data['rc_money'],2,'.','');
			if(isset(C('FANLI_BANKS')[$data['rc_bank']])){
				$data['rc_bankstr']=C('FANLI_BANKS')[$data['rc_bank']];
			}else{
				$data['rc_bankstr']='';
			}

			$data['rc_bankcardstr']=\Org\Util\Funcrypt::authcode($data['rc_bankcard'],'DECODE',C('WWW_AUTHKEY'),0);
			
            if(MD5($data['rc_unitcode'].$data['rc_dlid'].number_format($data['rc_money'],2,'.','').$data['rc_bankcard'].$data['rc_addtime'])==$data['rc_verify']){
				if($data['rc_state']==0){
					$data['rc_statestr']='未处理';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败';
				}else{
					$data['rc_statestr']='异常';
				}
            }else{
				if($data['rc_state']==0){
					$data['rc_statestr']='未处理[异常]';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功[异常]';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败[异常]';
				}else{
					$data['rc_statestr']='异常';
				}
			}
			
			//提现代理信息
			if($data['rc_dlid']>0){
				$map2=array();
				$Dealer= M('Dealer');
				$map2['dl_id']=$data['rc_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					if($data2['dl_status']==1){
						$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					}else{
					    $data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')[已禁用]';
					}
				}else{
					$data['dl_name_str']='未知';
				}
			}else{
				$data['dl_name_str']='未知';
			}
			
			//付款代理
			if($data['rc_sdlid']>0){
				$map2=array();
				$map2['dl_id']=$data['rc_sdlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['dl_sendname_str']='未知';
				}
			}else{
				$data['dl_sendname_str']='总公司';
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/orders/';
			//图片
            if(is_not_null($data['rc_pic']) && file_exists($imgpath.$data['rc_pic'])){
                $arr=getimagesize($imgpath.$data['rc_pic']);
                if(false!=$arr){
                    $w=$arr[0];
                    $h=$arr[1];
                    if($h>80){
                       $hh=80;
                       $ww=($w*80)/$h;
                    }else{
                       $hh=$h;
                       $ww=$w;
                    }
                    if($ww>80){
                       $ww=80;
                       $hh=($h*80)/$w;
                    }
                    $data['rc_pic_str']='<img src="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'" width="'.$ww.'"  height="'.$hh.'"  border="0" style="vertical-align:middle"  >';
                }else{
                    $data['rc_pic_str']='';
                }
            }else{
                $data['rc_pic_str']='';
            }
			
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('recashinfo', $data);
		
		
        $this->assign('curr', 'paylist');
        $this->display('recashdeal');
	}

    //处理保存
    public function recashdeal_save(){
        $this->check_qypurview('14003',1);
		//--------------------------------
		$rc_id=intval(I('post.rc_id',0));

		if($rc_id>0){
			$rc_state=intval(I('post.rc_state',0));
			$rc_remark=trim(I('post.rc_remark',''));
			$rc_remark2=trim(I('post.rc_remark2',''));
			if($rc_state<=0){
				$this->error('请选择处理状态','',2);
			}
			if($rc_remark==''){
				$this->error('处理备注必须填写','',2);
			}
			
			$map=array();
			$Recash= M('Recash');
		    $map['rc_id']=$rc_id;
			$map['rc_sdlid']=0;
		    $map['rc_unitcode']=session('unitcode');
			$data=$Recash->where($map)->find();
			if($data){
				$data2=array();
				if($data['rc_dealtime']<=0){
				   $data2['rc_dealtime']=time();
				}
				
				//上传文件 begin
				if($_FILES['pic_file']['name']==''){
					$rc_pic='';
				}else{
					$upload = new \Think\Upload();
					$upload->maxSize = 3145728 ;
					$upload->exts = array('jpg', 'gif', 'png', 'jpeg');
					$upload->rootPath   = './Public/uploads/orders/';
					$upload->subName  = session('unitcode');
					$upload->saveName = time().'_'.mt_rand(1000,9999);
					
					$info   =   $upload->uploadOne($_FILES['pic_file']);

					if(!$info) {
						$this->error($upload->getError(),'',1);
					}else{
						$rc_pic=$info['savepath'].$info['savename'];
					}

					@unlink($upload->rootPath.$old_rc_pic); 
					@unlink($_FILES['pic_file']['tmp_name']); 
				}
				//上传文件 end
				
				if($rc_pic!=''){
				    $data2['rc_pic']=$rc_pic;
				}
                $data2['rc_state']=$rc_state;
				$data2['rc_remark']=$rc_remark;
				$data2['rc_remark2']=$rc_remark2;
				
                $rs=$Recash->where($map)->data($data2)->save();
				if($rs){
					//更改返利明细状态
					$Fanlidetail= M('Fanlidetail');
					$map3=array();
					$map3['fl_dlid']=$data['rc_dlid']; //返利收方
					$map3['fl_senddlid']=$data['rc_sdlid']; //返利发方
					$map3['fl_unitcode']=session('unitcode');
					$map3['fl_rcid']=$data['rc_id'];
					$map3['fl_state']=2;  //0-待收款 1-已收款 2-收款中  9-已取消

					
					
					$data3=array();
					if($rc_state==1){
						$data3['fl_state'] = 1;
					}else if($rc_state==2){
						$data3['fl_state'] = 0;
						$data3['fl_rcid'] = 0;
					}
					$Fanlidetail->where($map3)->data($data3)->save();
					
					
					
					//记录日志 begin
					$log_arr=array();
					$log_arr=array(
								'log_qyid'=>session('qyid'),
								'log_user'=>session('qyuser'),
								'log_qycode'=>session('unitcode'),
								'log_action'=>'处理提现',
								'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
								'log_addtime'=>time(),
								'log_ip'=>real_ip(),
								'log_link'=>__SELF__,
								'log_remark'=>json_encode($data)
								);
					save_log($log_arr);
					//记录日志 end
					$this->success('提交成功',U('Mp/Fanli/recashdetail/rc_id/'.$rc_id.'/back/1'),1);
				}else if($rs==0){
					$this->error('提交数据没改变','',2);
				}else{
					$this->error('提交失败','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
	}
	
	//销售累计奖
    public function salesreward(){
        $this->check_qypurview('14004',1);
		
		$dlusername=trim(I('param.dlusername',''));
		$begintime=I('param.begintime','');
        $endtime=I('param.endtime','');
		$parameter=array();
		
        $Dealer = M('Dealer');
		$Salesreward= M('Salesreward');
		$back=0;
		if($dlusername!='' && $dlusername!='请输入代理账号'){
            if(!preg_match("/[a-zA-Z0-9_-]{4,20}$/",$dlusername)){
                $this->error('代理账号不正确','',1);
            }
			
			$map2=array();
            $map2['dl_username']=$dlusername;
            $map2['dl_unitcode']=session('unitcode');
            $data22=$Dealer->where($map2)->find();
            if($data22){

			}else{
				$this->error('代理账号不正确','',1);
			}
			
            $map['sr_dlid']=$data22['dl_id'];
			$parameter['dlusername']=$dlusername;
			$this->assign('dlusername', $dlusername);
        }else{
			$this->assign('dlusername', '请输入代理账号');
		}
		$this->assign('back', $back);
		
		
		if($begintime!='' && $endtime!=''){
            $begintime=strtotime($begintime);
			$endtime=strtotime($endtime);
			if($begintime===FALSE || $endtime===FALSE){
				$this->error('请选择查询日期','',1);
			}
			$endtime=$endtime+3600*24-1;
			if($begintime>=$endtime){
				$this->error('查询结束日期要大于开始日期','',1);
			}	
			
			$map['sr_addtime']=array('between',array($begintime,$endtime));
			
			$parameter['begintime']=urlencode(date('Y-m-d',$begintime));
			$parameter['endtime']=urlencode(date('Y-m-d',$endtime));
			
			$this->assign('begintime', date('Y-m-d',$begintime));
			$this->assign('endtime', date('Y-m-d',$endtime));
		}else{
            $begintime='';
            $endtime='';
		    $this->assign('begintime', '');
		    $this->assign('endtime', '');
		}
        $map['sr_unitcode']=session('unitcode');


        $count = $Salesreward->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Salesreward->where($map)->order('sr_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			//收款代理信息
			if($v['sr_dlid']>0){
				$map2=array();
				$map2['dl_id']=$v['sr_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					$list[$k]['dl_number']=$data2['dl_number'];
				}else{
					$list[$k]['dl_name_str']='未知';
					$list[$k]['dl_number']='-';
				}
			}else{
				$list[$k]['dl_name_str']='未知';
				$list[$k]['dl_number']='-';
			}
			
			//付款代理信息
			if($v['sr_senddlid']>0){
				$map2=array();
				$map2['dl_id']=$v['sr_senddlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_sendname_str']='未知';
				}
			}else{
				$list[$k]['dl_sendname_str']='总公司';
			}
			

			$list[$k]['sr_totalstr']=number_format($v['sr_total'], 2,'.','');
			$list[$k]['sr_unitrewardstr']=number_format($v['sr_unitreward'], 2,'.','');
			
		    if($v['sr_state']==1){
				$list[$k]['sr_statestr']='有效';
			}else if($v['sr_state']==0){
				$list[$k]['sr_statestr']='无效';
			}else{
				$list[$k]['sr_statestr']='';
			}
		}
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'salesreward');
        $this->display('salesreward');
    }
	
	
	//按月销售奖-列表
    public function salemonthly(){
        $this->check_qypurview('14005',1);
		
		$dlusername=trim(I('param.dlusername',''));
		$year=I('param.year','');
        $month=I('param.month','');
		$parameter=array();
		
        $Dealer = M('Dealer');
		$Salemonthly= M('Salemonthly');
		$back=0;
		if($dlusername!='' && $dlusername!='请输入代理账号'){
            if(!preg_match("/[a-zA-Z0-9_-]{4,20}$/",$dlusername)){
                $this->error('代理账号不正确','',1);
            }
			
			$map2=array();
            $map2['dl_username']=$dlusername;
            $map2['dl_unitcode']=session('unitcode');
            $data22=$Dealer->where($map2)->find();
            if($data22){

			}else{
				$this->error('代理账号不正确','',1);
			}
			
            $map['sm_dlid']=$data22['dl_id'];
			$parameter['dlusername']=$dlusername;
			$this->assign('dlusername', $dlusername);
        }else{
			$this->assign('dlusername', '请输入代理账号');
		}
		$this->assign('back', $back);
		
		
		if($year!='' && $month==''){
            $begintime=strtotime($year.'-01');
			$endtime=strtotime($year.'-12');
			
			$map['sm_date']=array('between',array($begintime,$endtime));
			
			$parameter['year']=$year;
			$parameter['month']=$month;
			
			$this->assign('year', $year);
			$this->assign('month', $month);
		}else if($year!='' && $month!=''){	
            $smtime=strtotime($year.'-'.$month);
			if($smtime===FALSE ){
				$this->error('请选择查询日期','',1);
			}	
			
			$map['sm_date']=$smtime;
			
			$parameter['year']=$year;
			$parameter['month']=$month;
			
			$this->assign('year', $year);
			$this->assign('month', $month);

		}else{
			$this->assign('year', '');
			$this->assign('month', '');
		}
        $map['sm_unitcode']=session('unitcode');


        $count = $Salemonthly->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Salemonthly->where($map)->order('sm_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		foreach($list as $k=>$v){
			//收款代理信息
			if($v['sm_dlid']>0){
				$map2=array();
				$map2['dl_id']=$v['sm_dlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
					$list[$k]['dl_number']=$data2['dl_number'];
				}else{
					$list[$k]['dl_name_str']='未知';
					$list[$k]['dl_number']='-';
				}
			}else{
				$list[$k]['dl_name_str']='未知';
				$list[$k]['dl_number']='-';
			}
			
			//付款代理信息
			if($v['sm_senddlid']>0){
				$map2=array();
				$map2['dl_id']=$v['sm_senddlid'];
				$map2['dl_unitcode']=session('unitcode');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['dl_sendname_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['dl_sendname_str']='未知';
				}
			}else{
				$list[$k]['dl_sendname_str']='总公司';
			}

			if($v['sm_mysale']>0){
				if(ceil($v['sm_mysale'])==$v['sm_mysale']){
					$list[$k]['sm_mysalestr']=number_format($v['sm_mysale'], 0,'.','');
				}else{
					$list[$k]['sm_mysalestr']=number_format($v['sm_mysale'], 2,'.','');
				}
			}else{
				$list[$k]['sm_mysalestr']='';
			}
            
			if($v['sm_teamsale']>0){
				if(ceil($v['sm_teamsale'])==$v['sm_teamsale']){
					$list[$k]['sm_teamsalestr']=number_format($v['sm_teamsale'], 0,'.','');
				}else{
					$list[$k]['sm_teamsalestr']=number_format($v['sm_teamsale'], 2,'.','');
				}
			}else{
				$list[$k]['sm_teamsalestr']='';
			}
			
			$list[$k]['sm_rewardstr']=number_format($v['sm_reward'], 2,'.','');
			
		   
		}
		
		$nyearmonth=date('Y-m',time());
		
		$yearlist[]=strtotime("$nyearmonth +1 month");
		$yearlist[]=strtotime($nyearmonth);
		$yearlist[]=strtotime("$nyearmonth -1 month");
		$yearlist[]=strtotime("$nyearmonth -2 month");
		$yearlist[]=strtotime("$nyearmonth -3 month");
		$this->assign('yearlist', $yearlist);
		
	
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'salemonthly');
        $this->display('salemonthly');
    }
	

	//按月销售奖率设置
	 public function salemonfanlirate(){
		$this->check_qypurview('14005',1);
		
        $map['smfr_unitcode']=session('unitcode');
        $Salemonfanlirate= M('Salemonfanlirate');
        $list = $Salemonfanlirate->where($map)->order('smfr_dltype ASC,smfr_countdate ASC,smfr_minsale ASC')->select();
		$pagecount=count($list);
		$Dltype = M('Dltype');
        foreach($list as $k=>$v){ 
		    $map2=array();
            $map2['dlt_unitcode']=session('unitcode');
            $map2['dlt_id'] = $v['smfr_dltype'];
			$data2=$Dltype->where($map2)->find();
			if($data2){
				$list[$k]['dlt_name']=$data2['dlt_name'];
			}else{
				$list[$k]['dlt_name']='-';
			}
			
			if($v['smfr_fanlieval']==1){
				$list[$k]['smfr_fanlievalstr']='';
				$list[$k]['smfr_fanliratestr']=$v['smfr_fanlirate'];
			}else if($v['smfr_fanlieval']==2){
				$list[$k]['smfr_fanlievalstr']='销量 X ';
				
				//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算
				if($v['smfr_fanlirate']>0 && $v['smfr_fanlirate']<1){
					$list[$k]['smfr_fanliratestr']=($v['smfr_fanlirate']*100).'%';
				}else{
					$list[$k]['smfr_fanliratestr']=$v['smfr_fanlirate'];
				}
			}else{
                $list[$k]['smfr_fanlievalstr']='';
				$list[$k]['smfr_fanliratestr']=$v['smfr_fanlirate'];
			}
			
			
			if($v['smfr_countdate']==1){
				$list[$k]['smfr_countdatestr']='每月 ';
			}else if($v['smfr_countdate']==2){
				$list[$k]['smfr_countdatestr']='每年 ';
			}else{
				$list[$k]['smfr_countdatestr']='';
			}
			
			if($v['smfr_saleunit']==1){
				$list[$k]['smfr_saleunitstr']='订单金额 ';
				
				$list[$k]['smfr_minsalestr']=$v['smfr_minsale'];
				$list[$k]['smfr_maxsalestr']=$v['smfr_maxsale'];
			}else if($v['smfr_saleunit']==2){
				$list[$k]['smfr_saleunitstr']='销售数量 ';
				
				$list[$k]['smfr_minsalestr']=number_format($v['smfr_minsale'], 0,'.','');
				$list[$k]['smfr_maxsalestr']=number_format($v['smfr_maxsale'], 0,'.','');
			}else{
				$list[$k]['smfr_saleunitstr']='';
				
				$list[$k]['smfr_minsalestr']=$v['smfr_minsale'];
				$list[$k]['smfr_maxsalestr']=$v['smfr_maxsale'];
			}
			
			

             
        }
		
		$this->assign('list', $list);
		$this->assign('pagecount', $pagecount);
        $this->assign('curr', 'salemonthly');
        $this->display('salemonfanlirate');
	}
	
	
	//按月销售奖率设置-添加
	 public function salemonfanlirate_add(){
	    $this->check_qypurview('14005',1);
		
		$Dltype = M('Dltype');
		$map3=array();
        $map3['dlt_unitcode']=session('unitcode');
        $list3 = $Dltype->where($map3)->order('dlt_level ASC,dlt_id ASC')->select();
		
		$smfrinfo['smfr_id']=0;
		$this->assign('dltypelist', $list3);
		$this->assign('smfrinfo', $smfrinfo);
		
		$this->assign('atitle', '添加设置');
        $this->assign('curr', 'salemonthly');
        $this->display('salemonfanlirate_add');
	}
	
	//按月销售奖率设置-修改
	public function salemonfanlirate_edit(){
	    $this->check_qypurview('14005',1);
		
		$Dltype = M('Dltype');
		$map3=array();
        $map3['dlt_unitcode']=session('unitcode');
        $list3 = $Dltype->where($map3)->order('dlt_level ASC,dlt_id ASC')->select();
		
		$map=array();
		$map['smfr_id']=intval(I('get.smfr_id',0));
        $map['smfr_unitcode']=session('unitcode');
        $Salemonfanlirate= M('Salemonfanlirate');
		
		$data=$Salemonfanlirate->where($map)->find();
		if($data){
			
		}else{
			$this->error('记录不存在');
		}
		$this->assign('dltypelist', $list3);
		$this->assign('smfrinfo', $data);
		
		$this->assign('atitle', '修改设置');
        $this->assign('curr', 'salemonthly');
        $this->display('salemonfanlirate_add');
	}
	

    //按月销售奖率设置-保存
    public function salemonfanlirate_save(){
        $this->check_qypurview('14005',1);

    	if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }
        $map['smfr_id']=intval(I('post.smfr_id',''));
        
        if($map['smfr_id']>0){
            //修改保存
			
            $smfr_dltype=intval(I('post.smfr_dltype',0));
			$smfr_countdate=intval(I('post.smfr_countdate',0));
            $smfr_minsale=I('post.smfr_minsale','');
            $smfr_maxsale=I('post.smfr_maxsale','');
            $smfr_fanlirate=I('post.smfr_fanlirate','');
			$smfr_remark=I('post.smfr_remark','');
			$smfr_saleunit=intval(I('post.smfr_saleunit',0));
			$smfr_fanlieval=intval(I('post.smfr_fanlieval',0));

			if($smfr_dltype<=0){
                $this->error('请选择代理级别');
            }
			
			if($smfr_countdate<=0){
                $this->error('请选择业绩计算日期');
            }
			
			if($smfr_minsale=='' || $smfr_maxsale==''){
                $this->error('请填写业绩区间');
            }
			
			if($smfr_fanlirate==''){
                $this->error('请填写业绩奖励');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_minsale)){
                $this->error('输入业绩区间必须为数字');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_maxsale)){
                $this->error('输入业绩区间必须为数字');
            }
			
			if($smfr_minsale>$smfr_maxsale){
				$this->error('输入业绩区间大小不正确');
			}
			
			if($smfr_saleunit<=0){
                $this->error('请选择业绩计算方式');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_fanlirate)){
                $this->error('输入业绩奖励必须为数字');
            }
			
			if($smfr_fanlieval<=0){
                $this->error('请选择奖金计算方式');
            }
			
			
			$map2=array();
            $map2['smfr_unitcode']=session('unitcode');
            $map2['smfr_dltype']=$smfr_dltype;
            $map2['smfr_countdate']=$smfr_countdate;
			$map2['smfr_saleunit']=$smfr_saleunit;
			$map2['smfr_minsale']=$smfr_minsale;
			$map2['smfr_maxsale']=$smfr_maxsale;
			$map2['smfr_id'] = array('NEQ',$map['smfr_id']);

            $Salemonfanlirate= M('Salemonfanlirate');
            $data2=$Salemonfanlirate->where($map2)->find();
            if($data2){
                $this->error('该设置已存在');
            }

            $date=array();
            $data['smfr_unitcode']=session('unitcode');
            $data['smfr_dltype']=$smfr_dltype;
            $data['smfr_minsale']=$smfr_minsale;
            $data['smfr_maxsale']=$smfr_maxsale;
            $data['smfr_countdate']=$smfr_countdate;
			$data['smfr_saleunit']=$smfr_saleunit;
			$data['smfr_fanlirate']=$smfr_fanlirate;
            $data['smfr_remark']=$smfr_remark;
			$data['smfr_fanlieval']=$smfr_fanlieval;
            
            
            $map['smfr_unitcode']=session('unitcode');
            $rs=$Salemonfanlirate->where($map)->data($data)->save();
           
            if($rs){
                //记录日志 begin
                $log_arr=array(
                            'log_qyid'=>session('qyid'),
                            'log_user'=>session('qyuser'),
                            'log_qycode'=>session('unitcode'),
                            'log_action'=>'修改销售奖设置',
							'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                            'log_addtime'=>time(),
                            'log_ip'=>real_ip(),
                            'log_link'=>__SELF__,
                            'log_remark'=>json_encode($data)
                            );
                save_log($log_arr);
                //记录日志 end
                $this->success('修改成功',U('Mp/Fanli/salemonfanlirate'),2);
            }elseif($rs===0){
                $this->error('提交数据未改变','',1);
            }else{
                $this->error('修改失败','',1);
            }
        }else{  
            //添加保存
            $smfr_dltype=intval(I('post.smfr_dltype',0));
			$smfr_countdate=intval(I('post.smfr_countdate',0));
            $smfr_minsale=I('post.smfr_minsale','');
            $smfr_maxsale=I('post.smfr_maxsale','');
            $smfr_fanlirate=I('post.smfr_fanlirate','');
			$smfr_remark=I('post.smfr_remark','');
			$smfr_saleunit=intval(I('post.smfr_saleunit',0));
			$smfr_fanlieval=intval(I('post.smfr_fanlieval',0));

			if($smfr_dltype<=0){
                $this->error('请选择代理级别');
            }
			
			if($smfr_countdate<=0){
                $this->error('请选择业绩计算日期');
            }
			
			if($smfr_minsale=='' || $smfr_maxsale==''){
                $this->error('请填写业绩区间');
            }
			
			if($smfr_fanlirate==''){
                $this->error('请填写业绩奖励');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_minsale)){
                $this->error('输入业绩区间必须为数字');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_maxsale)){
                $this->error('输入业绩区间必须为数字');
            }
			
			if($smfr_minsale>$smfr_maxsale){
				$this->error('输入业绩区间大小不正确');
			}
			
			if($smfr_saleunit<=0){
                $this->error('请选择业绩计算方式');
            }
			
			if(!preg_match("/^[0-9.]{1,9}$/",$smfr_fanlirate)){
                $this->error('输入业绩奖励必须为数字');
            }
			
			if($smfr_fanlieval<=0){
                $this->error('请选择奖金计算方式');
            }
			
			
			
            $map=array();
            $map['smfr_unitcode']=session('unitcode');
            $map['smfr_dltype']=$smfr_dltype;
            $map['smfr_countdate']=$smfr_countdate;
			$map['smfr_saleunit']=$smfr_saleunit;
			$map['smfr_minsale']=$smfr_minsale;
			$map['smfr_maxsale']=$smfr_maxsale;

            $Salemonfanlirate= M('Salemonfanlirate');
            $data2=$Salemonfanlirate->where($map)->find();
            if($data2){
                $this->error('该设置已存在');
            }
			
            $date=array();
            $data['smfr_unitcode']=session('unitcode');
            $data['smfr_dltype']=$smfr_dltype;
            $data['smfr_minsale']=$smfr_minsale;
            $data['smfr_maxsale']=$smfr_maxsale;
            $data['smfr_countdate']=$smfr_countdate;
			$data['smfr_saleunit']=$smfr_saleunit;
			$data['smfr_fanlirate']=$smfr_fanlirate;   //奖励 佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
            $data['smfr_remark']=$smfr_remark;
			$data['smfr_fanlieval']=$smfr_fanlieval;

            $rs=$Salemonfanlirate->create($data,1);
            if($rs){
               $result = $Salemonfanlirate->add(); 
               if($result){
                    //记录日志 begin
                    $log_arr=array(
                                'log_qyid'=>session('qyid'),
                                'log_user'=>session('qyuser'),
                                'log_qycode'=>session('unitcode'),
                                'log_action'=>'添加销售奖设置',
								'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                                'log_addtime'=>time(),
                                'log_ip'=>real_ip(),
                                'log_link'=>__SELF__,
                                'log_remark'=>json_encode($data)
                                );
                    save_log($log_arr);
                    //记录日志 end
                   $this->success('添加成功',U('Mp/Fanli/salemonfanlirate'),2);
               }else{
                   $this->error('添加失败');
               }
            }else{
                $this->error('添加失败');
            }
        }
    }
	
	//按月销售奖率设置-删除
    public function salemonfanlirate_del(){
        $this->check_qypurview('14005',1);

        $map['smfr_id']=intval(I('get.smfr_id',0));
        $map['smfr_unitcode']=session('unitcode');
        $Salemonfanlirate= M('Salemonfanlirate');
        $data=$Salemonfanlirate->where($map)->find();

        if($data){
            //验证是否要删除 要保持数据完整性 

            $Salemonfanlirate->where($map)->delete(); 

            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'删除销售奖设置',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $this->success('删除成功','',1);
        }else{
            $this->error('没有该记录');
        }     
    }
    

}