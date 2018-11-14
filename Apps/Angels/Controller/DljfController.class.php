<?php
namespace Angels\Controller;
use Think\Controller;
class DljfController extends CommController {
    //我的积分
    public function index(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//---------------------------------------------
		
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=wxuserTextDecode2($data['dl_name']);
			$dl_weixin=$data['dl_weixin'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		
		$Dljfdetail= M('Dljfdetail');
        //累计增加积分
		$totaljf=0;
		$map2=array();
		$map2['dljf_dlid']=session('jxuser_id');
		$map2['dljf_unitcode']=$this->qy_unitcode;
		$map2['dljf_type']=array('in','1,2,3,4,5');  //积分分类 1-5增加积分     6-9 消费积分
		$totaljf = $Dljfdetail->where($map2)->sum('dljf_jf'); 
		if($totaljf){
		}else{
			$totaljf=0;
		}
		
		//消费积分
		$decjf=0;
		$map2=array();
		$map2['dljf_dlid']=session('jxuser_id');
		$map2['dljf_unitcode']=$this->qy_unitcode;
		$map2['dljf_type']=array('in','6,7,8,9');
		$decjf = $Dljfdetail->where($map2)->sum('dljf_jf'); 
		
		if($decjf){
		}else{
			$decjf=0;
		}
			
		//剩余积分
		if($totaljf>=$decjf){
			$surplusjf=$totaljf-$decjf;
		}else{
			$surplusjf=0;
		}
        
		$this->assign('surplusjf', $surplusjf);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_weixin', $dl_weixin);
		$this->assign('dl_number', $dl_number);
		
       $this->display('index');
    }
   
    //////////////////////////////////////////////////////////
    //兑换记录
    public function exchlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//---------------------------------------------


        $Dljfexchange = M('Dljfexchange');
        $map['exch_unitcode']=$this->qy_unitcode;
        $map['exch_dlid']=session('jxuser_id');
        $count = $Dljfexchange->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Dljfexchange->where($map)->order('exch_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Dljfexchdetail = M('Dljfexchdetail');

        foreach($list as $k=>$v){

            $map2=array();
            $map2['detail_unitcode']=$this->qy_unitcode;
            $map2['detail_exchid'] = $v['exch_id'];
            $exchdetail = $Dljfexchdetail->where($map2)->select();
            $exchdetail_str='';
            foreach($exchdetail as $kk=>$vv){ 
                $exchdetail_str=$exchdetail_str.''.$vv['detail_giftname'].'<br>';
            }
            $list[$k]['exchdetail']=$exchdetail_str;

            if($v['exch_state']==0){
                $list[$k]['exch_state_str']='待处理';
            }elseif($v['exch_state']==1){
                $list[$k]['exch_state_str']='待发货';
            }elseif($v['exch_state']==2){
                $list[$k]['exch_state_str']='已发货';
            }elseif($v['exch_state']==9){
                $list[$k]['exch_state_str']='无效';
            }

        }
        $this->assign('page', $show);
        $this->assign('list', $list);
        $this->display('exchlist');
    }
    
	//兑换详细
    public function exchdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//---------------------------------------------
		
        $map['exch_id']=intval(I('get.exchid',0));
        $map['exch_unitcode']=$this->qy_unitcode;
        $map['exch_dlid']=session('jxuser_id');
        $Dljfexchange= M('Dljfexchange');
        $data=$Dljfexchange->where($map)->find();
        $Dljfexchdetail = M('Dljfexchdetail');
        $exchdetail=array();

        if($data){
            $map2=array();
            $map2['detail_unitcode']=$this->qy_unitcode;
            $map2['detail_exchid'] = $data['exch_id'];
            $exchdetail = $Dljfexchdetail->where($map2)->select();

            if($data['exch_state']==0){
                $data['exch_state_str']='<span style="color:#FF0000">待处理</span>';
            }elseif($data['exch_state']==1){
                $data['exch_state_str']='待发货';
            }elseif($data['exch_state']==2){
                $data['exch_state_str']='已发货';
            }elseif($data['exch_state']==9){
                $data['exch_state_str']='<span style="color:#00FF00">无效</span>';
            }

            foreach($exchdetail as $kk=>$vv){ 
               
            }

        }
  
        $this->assign('exchdetail', $exchdetail);
        $this->assign('jfexchangeinfo', $data);
        $this->display('exchdetail');
    }
    
    ////////////////////////////////////////////////////////////
    //积分记录
    public function dljflist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//---------------------------------------------


        $Dljfdetail = M('Dljfdetail');
        $map['dljf_unitcode']=$this->qy_unitcode;
        $map['dljf_dlid']=session('jxuser_id');
        $count = $Dljfdetail->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();

        if($show=='<div>    </div>'){
            $show='';
        }
        
        $list = $Dljfdetail->where($map)->order('dljf_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){

            //dljf_type 积分类型 1--5增加积分  6-9消费积分
            if($v['dljf_type']==1){
                $list[$k]['dljf_typestr']='订购产品积分';
                $list[$k]['dljf_jfstr']='+'.$v['dljf_jf'];
			}elseif($v['dljf_type']==2){	
                $list[$k]['dljf_typestr']='手动增加积分';
                $list[$k]['dljf_jfstr']='+'.$v['dljf_jf'];
            }elseif($v['dljf_type']==6){
                $list[$k]['dljf_typestr']='兑换礼品积分';
                $list[$k]['dljf_jfstr']='<span style="color:#009900">-'.$v['dljf_jf'].'</span>';
			}elseif($v['dljf_type']==7){
                $list[$k]['dljf_typestr']='手动减少积分';
                $list[$k]['dljf_jfstr']='<span style="color:#009900">-'.$v['dljf_jf'].'</span>';
            }else{
                $list[$k]['dljf_typestr']='其他';
                $list[$k]['dljf_jfstr']=$v['dljf_jf'];
            }

        }

        $this->assign('page', $show);
        $this->assign('list', $list);
        $this->display('dljflist');
    }

    //积分详细
    public function dljfdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//---------------------------------------------
        
        $map['dljf_id']=intval(I('get.dljf_id',0));
        $map['dljf_unitcode']=$this->qy_unitcode;
		$map['dljf_dlid']=session('jxuser_id');
        $Dljfdetail= M('Dljfdetail');
        $data=$Dljfdetail->where($map)->find();

        if($data){
            //dljf_type 积分类型 1--5增加积分  6-9消费积分
            if($data['dljf_type']==1){
                $data['dljf_typestr']='订购产品积分';
                $data['dljf_jfstr']='+'.$data['dljf_jf'];
			}elseif($data['dljf_type']==2){	
                $data['dljf_typestr']='手动增加积分';
                $data['dljf_jfstr']='+'.$data['dljf_jf'];
            }elseif($data['dljf_type']==6){
                $data['dljf_typestr']='兑换礼品积分';
                $data['dljf_jfstr']='<span style="color:#009900">-'.$data['dljf_jf'].'</span>';
				
			}elseif($data['dljf_type']==7){
                $data['dljf_typestr']='手动减少积分';
                $data['dljf_jfstr']='<span style="color:#009900">-'.$data['dljf_jf'].'</span>';
            }else{
                $data['dljf_typestr']='其他';
                $data['dljf_jfstr']=$data['dljf_jf'];
            }
        }else{
            $this->error('没有该记录');
        }

        $this->assign('dljfinfo', $data);

        $this->display('dljfdetail');
    }
}