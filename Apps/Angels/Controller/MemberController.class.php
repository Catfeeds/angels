<?php
namespace Angels\Controller;
use Think\Controller;
class MemberController extends CommController {
    //会员中心
    public function index(){
        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }
        $fwcode=trim(I('get.fwcode',''));
        if($fwcode!=''){
            if(!preg_match("/^[a-zA-Z0-9_+\/]{10,200}$/",$fwcode)){
                $fwcode='';
            }
        }
        $msg='';
        $ip=real_ip();
        $user_name=session('user_name');
        $user_id=session('user_id');


        if($fwcode!=''){
            $fwcode_de=\Org\Util\Funcrypt::authcode($fwcode,'DECODE',C('WWW_AUTHKEY'),0);
            $farr=explode('_',$fwcode_de);
            $fwcode = isset($farr[0])?trim($farr[0]):'';
            $ship_id = isset($farr[1])?trim($farr[1]):0;

            if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                $fwcode='';
            }
            if(!preg_match("/^[0-9]{1,10}$/",$ship_id)){
                $ship_id=0;
            }

            if($fwcode=='' || $ship_id<=0){
                $msg='';
            }else{
                $qycode=substr($fwcode,0,4);
                if($this->qy_unitcode!=$qycode){
                    $msg='';
                }else{
                    $map=array();
                    $Shipment= M('Shipment');
                    $map['ship_unitcode']=$qycode;
                    $map['ship_id']=$ship_id;
                    $shdata=$Shipment->where($map)->find();
                    if($shdata){
                        $Product = M('Product');
                        $map2=array();
                        $map2['pro_unitcode']=$qycode;
                        $map2['pro_id'] = $shdata['ship_pro'];
                        $Proinfo = $Product->where($map2)->find();

                        if($Proinfo){
                            $shdata['pro_name']=$Proinfo['pro_name'];
                            $shdata['pro_number']=$Proinfo['pro_number'];
                            $shdata['pro_desc']=$Proinfo['pro_desc'];
                            $shdata['pro_pic']=$Proinfo['pro_pic'];
                            //固定积分还是随机积分
                            if($Proinfo['pro_jftype']==1){
                                $shdata['pro_jf']=$Proinfo['pro_jifen'];
                            }else{
                                $shdata['pro_jf']=get_rand($Proinfo['pro_jifen'],$Proinfo['pro_jfmax'],70); //随机积分 有70%几率是小数
                            }
                        }else{
                            $shdata['pro_name']='';
                            $shdata['pro_number']='';
                            $shdata['pro_jf']=0;
                            $shdata['pro_desc']='';
                            $shdata['pro_pic']='';
                        }



                        if($shdata['pro_jf']>0){
                            $map=array();
                            $Templist = M("Templist");
                            $map['tmp_unitcode']=$qycode;
                            $map['tmp_state']=1;
                            $map['tmp_code']=$fwcode;
                            $data=$Templist->where($map)->order('tmp_addtime ASC')->find(); 


                            if($data){
                                $tmp_addtime=$data['tmp_addtime'];
                                //如果第一次查询时间在30天前 或查询次数超30次 则提示 该码积分已失效

                                if((time()-$tmp_addtime)>3600*24*30){ 
                                    $msg='该积分码已过期或已失效';
                                }else{
                                    $map=array();
                                    $Tellist=M('Tellist');
                                    $map['unitcode']=$qycode;
                                    $map['fwcode']=$fwcode;
                                    $scount = $Tellist->where($map)->count(); //该防伪码查询次数
                                    if($scount>=30){
                                        $msg='该积分码已过期或已失效';
                                    }else{
                                        //是否已积分
                                        $map=array();
                                        $Jfdetail = M('Jfdetail');
                                        $map['jf_unitcode']=$qycode;
                                        $map['jf_code']=$fwcode;
                                        $data=$Jfdetail->where($map)->find();
                                        if($data){
                                            $msg='该积分码已被积分，积分时间：'.date('Y-m-d H:i:s',$data['jf_addtime']);
                                        }else{
                                            $data=array();
                                            $data['jf_unitcode']=$this->qy_unitcode;
                                            $data['jf_userid']=$user_id;
                                            $data['jf_username']=$user_name;
                                            $data['jf_type']=1;
                                            $data['jf_jf']=$shdata['pro_jf'];
                                            $data['jf_addtime']=time();
                                            $data['jf_ip']=$ip;
                                            $data['jf_actionuser']=$user_id;
                                            $data['jf_code']=$fwcode;
                                            $data['jf_proid']=$shdata['ship_pro'];
                                            $data['jf_proname']=$shdata['pro_name'];
                                            $data['jf_pronumber']=$shdata['pro_number'];
                                            $data['jf_remark']='';

                                            $rs=$Jfdetail->create($data,1);
                                            if($rs){
                                                $result = $Jfdetail->add(); 
                                                if($result){
                                                    $map=array();
                                                    $data=array();
                                                    $map['jfuser_id']=$user_id;
                                                    $map['jfuser_unitcode']=$this->qy_unitcode;
                                                    $Jfuser= M('Jfuser');
                                                    $data=$Jfuser->where($map)->find();
                                                    if($data){
                                                        $data2=array();
                                                        $data2['jfuser_jf'] = $data['jfuser_jf']+$shdata['pro_jf'];
                                                        $Jfuser->where($map)->save($data2);
                                                    }

                                                    $msg='恭喜您，获得积分 '.$shdata['pro_jf'].' 分！';
                                                }else{
                                                    $msg='很抱歉，积分失败,请重新尝试!';

                                                }
                                            }else{
                                                $msg='很抱歉，积分失败,请重新尝试!';
                                            }
                                        }
                                    }
                                }
                            }else{
                                $msg='';
                            }
                        }else{
                           $msg=''; 
                        }
                    }else{
                        $msg='';
                    }
                }
            }
        }


        $map=array();
        $map['jfuser_unitcode']=$this->qy_unitcode;
        $map['jfuser_id']=$user_id;
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
        	$jfuser_jf=$data['jfuser_jf'];
        }else{
            $this->redirect('Angels/Member/login','' , 0, '');
        }
     
       $this->assign('userinfo', $data);
       $this->assign('msg', $msg);
       $this->display('index');
    }
   
   //登录
    public function login(){
        $fwcode=trim(I('get.fwcode',''));
		$gifid=intval(I('get.gifid',0));
        if(!preg_match("/^[a-zA-Z0-9_+\/]{10,200}$/",$fwcode)){
            $fwcode='';
        }
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp2=time();
		$sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
		
		$this->assign('ttamp', $ttamp2);
		$this->assign('sture', $sture2);
        $this->assign('gifid', $gifid);
		$this->assign('fwcode', $fwcode);
        $this->display('login');
    }
	
    //登录ing
    public function logining(){
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$msg=array('stat'=>2,'msg'=>'提交超时');
			echo json_encode($msg);
			exit;
		}
		if(($nowtime - $ttamp) > 1200) {
			$msg=array('stat'=>2,'msg'=>'提交超时');
			echo json_encode($msg);
			exit;
		}
		
        $map['jfuser_username']=I('post.username','');
        $map['jfuser_unitcode']=$this->qy_unitcode;

        $user_pwd=I('post.pwd','');


        if($map['jfuser_username']==''){
            $msg=array('stat'=>0,'msg'=>'用户名不能为空');
            echo json_encode($msg);
            exit;
        }

        if($user_pwd==''){
            $msg=array('stat'=>0,'msg'=>'密码不能为空');
            echo json_encode($msg);
            exit;
        }

        if(!preg_match("/^[a-zA-Z0-9_]{6,20}$/",$map['jfuser_username'])){
            $msg=array('stat'=>0,'msg'=>'用户名由字母,数字,_ 组成,6-20位');
            echo json_encode($msg);
            exit;
        }


        $user_time=time();
        $user_check=MD5($map['jfuser_username'].$user_time).MD5($user_time);
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        $md5_user_pwd=MD5(MD5(MD5($user_pwd)));

        if($data){
            if($data['jfuser_pwd']==$md5_user_pwd){
                if($data['jfuser_active']==1){

                    session('user_name',$data['jfuser_username']);
                    session('user_time',$user_time);
                    session('user_id',$data['jfuser_id']);
                    session('user_unitcode',$data['jfuser_unitcode']);

                    cookie('user_check',$user_check,36000);

                    $map2['jfuser_id']=$data['jfuser_id'];
                    $data2['jfuser_logintime']=$user_time;
                    $Jfuser->where($map2)->save($data2);
                    
                    $msg=array('stat'=>1,'msg'=>'登录成功');
                    echo json_encode($msg);
                    exit;

                }else{
                    $msg=array('stat'=>0,'msg'=>'用户名或密码有误！');
                    echo json_encode($msg);
                    exit;
                }
            }else{
                $msg=array('stat'=>0,'msg'=>'用户名或密码有误！');
                echo json_encode($msg);
                exit;
            }
        }else{
            $msg=array('stat'=>0,'msg'=>'用户名或密码有误！');
            echo json_encode($msg);
            exit;
        }
    }

    //注册
    public function reg(){
        $fwcode=trim(I('get.fwcode',''));
        if(!preg_match("/^[a-zA-Z0-9_+\/]{10,200}$/",$fwcode)){
           $fwcode='';
        }
        $this->assign('fwcode', $fwcode);
        $this->display('reg');
    }

    //注册ing
    public function reg_save(){
        $fwcode=trim(I('post.fwcode',''));
        if(!preg_match("/^[a-zA-Z0-9_+\/]{10,200}$/",$fwcode)){
            $fwcode='';
        }

        $map['jfuser_username']=I('post.username','');
        $map['jfuser_unitcode']=$this->qy_unitcode;

        if($map['jfuser_username']==''){
            $msg=array('stat'=>0,'msg'=>'账号不能为空');
            echo json_encode($msg);
            exit;
        }
		if(!preg_match("/^1(3|4|5|7|8)\d{9}$/",$map['jfuser_username'])){
            $msg=array('stat'=>0,'msg'=>'填写账号必须为手机号');
            echo json_encode($msg);
            exit;
        }
		
        //if(!preg_match("/^[a-zA-Z0-9_]{6,20}$/",$map['jfuser_username'])){
        //    $msg=array('stat'=>0,'msg'=>'用户名由字母,数字,_ 组成,6-20位');
         //   echo json_encode($msg);
        //    exit;
        //}

        $Jfuser= M('Jfuser');
        $data2=$Jfuser->where($map)->find();
        if($data2){
            $msg=array('stat'=>0,'msg'=>'该账号已存在');
            echo json_encode($msg);
            exit;
        }

        $jfuser_pwd=I('post.pwd','');
        if($jfuser_pwd==''){
            $msg=array('stat'=>0,'msg'=>'密码不能为空');
            echo json_encode($msg);
            exit;
        }

        $jfuser_truename=I('post.truename','');
        if($jfuser_truename==''){
            $msg=array('stat'=>0,'msg'=>'姓名不能为空');
            echo json_encode($msg);
            exit;
        }
        $jfuser_tel=I('post.tel','');
        if($jfuser_tel==''){
            $msg=array('stat'=>0,'msg'=>'电话不能为空');
            echo json_encode($msg);
            exit;
        }

        $data['jfuser_unitcode']=$this->qy_unitcode;
        $data['jfuser_username']=$map['jfuser_username'];
        $data['jfuser_pwd']=MD5(MD5(MD5($jfuser_pwd)));
        $data['jfuser_truename']=$jfuser_truename;
        $data['jfuser_tel']=$jfuser_tel;
        $data['jfuser_email']=I('post.jfuser_email','');
        $data['jfuser_qq']=I('post.jfuser_qq','');
        $data['jfuser_sheng']=I('post.seachprov','0');
        $data['jfuser_shi']=I('post.seachcity','0');
        $data['jfuser_qu']=I('post.seachdistrict','0');
        $data['jfuser_address']=I('post.jfuser_address','');
        $data['jfuser_remark']=I('post.jfuser_remark','');
        $data['jfuser_addtime']=time();
        $data['jfuser_logintime']=0;
        $data['jfuser_jf']=0;
        $data['jfuser_active']=1;

        $rs=$Jfuser->create($data,1);
        if($rs){
           $result = $Jfuser->add(); 
           if($result){
                $user_time=time();
                $user_check=MD5($data['jfuser_username'].$user_time).MD5($user_time);
                session('user_name',$data['jfuser_username']);
                session('user_time',$user_time);
                session('user_id',$result);
                session('user_unitcode',$data['jfuser_unitcode']);
                cookie('user_check',$user_check,36000);

                $msg=array('stat'=>1,'msg'=>'注册成功');
                echo json_encode($msg);
                exit;
           }else{
                $msg=array('stat'=>0,'msg'=>'提交失败');
                echo json_encode($msg);
                exit;
           }
        }else{
                $msg=array('stat'=>0,'msg'=>'提交失败');
                echo json_encode($msg);
                exit;
        }
    }


    //个人资料
    public function profile(){
        $user_name=session('user_name');
        $user_id=session('user_id');


        if (IS_POST) {
            if(!$this->is_user_login()){
                $msg=array('stat'=>2,'msg'=>'对不起，你还没登录');
                echo json_encode($msg);
                exit;
            }

            $map['jfuser_id']=intval($user_id);
            $map['jfuser_unitcode']=$this->qy_unitcode;
            
            if($map['jfuser_id']>0){
                //修改保存
                $jfuser_truename=I('post.jfuser_truename','');
                $jfuser_tel=I('post.jfuser_tel','');
                
                if($jfuser_truename==''){
                    $msg=array('stat'=>0,'msg'=>'姓名不能为空');
                    echo json_encode($msg);
                    exit;
                }
                if($jfuser_tel==''){
                    $msg=array('stat'=>0,'msg'=>'电话不能为空');
                    echo json_encode($msg);
                    exit;
                }
                $data=array();
                $data['jfuser_truename']=$jfuser_truename;
                $data['jfuser_tel']=$jfuser_tel;
                $data['jfuser_email']=I('post.jfuser_email','');
                $data['jfuser_qq']=I('post.jfuser_qq','');
                $data['jfuser_sheng']=I('post.seachprov','0');
                $data['jfuser_shi']=I('post.seachcity','0');
                $data['jfuser_qu']=I('post.seachdistrict','0');
                $data['jfuser_address']=I('post.jfuser_address','');
                $data['jfuser_diqustr']=I('post.jfuser_diqustr','');
                $Jfuser= M('Jfuser');
                $rs=$Jfuser->where($map)->save($data);

                if($rs){
                    $msg=array('stat'=>1,'msg'=>'资料修改成功');
                    echo json_encode($msg);
                    exit;
                }elseif($rs===0){
                    $msg=array('stat'=>1,'msg'=>'资料修改成功');
                    echo json_encode($msg);
                    exit;
                }else{
                    $msg=array('stat'=>0,'msg'=>'资料修改失败');
                    echo json_encode($msg);
                    exit;
                }
            }
        }


        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }

        $map=array();
        $map['jfuser_unitcode']=$this->qy_unitcode;
        $map['jfuser_id']=$user_id;
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
 
        }else{
            $this->redirect('Angels/Member/login','' , 0, '');
        }
     
        $this->assign('userinfo', $data);
        $this->display('profile');
    }
    //修改密码
    public function updatepwd(){

        if (IS_POST) {
            if(!$this->is_user_login()){
                $msg=array('stat'=>2,'msg'=>'对不起，你还没登录');
                echo json_encode($msg);
                exit;
            }

            $user_name=session('user_name');
            $user_id=session('user_id');
            $map['jfuser_id']=intval($user_id);
            $map['jfuser_unitcode']=$this->qy_unitcode;
            
            if($map['jfuser_id']>0){
                //修改保存
                $oldpwd=I('post.oldpwd','');
                $pwd1=I('post.pwd1','');
                $pwd2=I('post.pwd2','');

                if($oldpwd=='' || $pwd1=='' || $pwd2==''){
                    $msg=array('stat'=>0,'msg'=>'密码不能为空');
                    echo json_encode($msg);
                    exit;
                }
                if($pwd1!=$pwd2){
                    $msg=array('stat'=>0,'msg'=>'两新密码不相同！');
                    echo json_encode($msg);
                    exit;
                }
                $md5_pwd=MD5(MD5(MD5($oldpwd)));
                $Jfuser= M('Jfuser');
                $data=$Jfuser->where($map)->find();

                if($data){
                    if($data['jfuser_pwd']==$md5_pwd){
                        $updata['jfuser_pwd']=MD5(MD5(MD5(trim($pwd1))));
                        $rs=$Jfuser->where($map)->save($updata);
                        if($rs){
                            $msg=array('stat'=>1,'msg'=>'密码修改成功');
                            echo json_encode($msg);
                            exit;
                        }else{
                            $msg=array('stat'=>0,'msg'=>'密码修改失败');
                            echo json_encode($msg);
                            exit;
                        }
                    }else{
                        $msg=array('stat'=>0,'msg'=>'输入旧密码不正确！');
                        echo json_encode($msg);
                        exit;
                    }
                }else{
                    $msg=array('stat'=>2,'msg'=>'对不起，你还没登录');
                    echo json_encode($msg);
                    exit;
                }
            }
        }

        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }


        $this->display('updatepwd');
    }

    //退出
    public function quit(){
        cookie('user_check',null);
        session('user_name',null);
        session('user_time',null);
        session('user_id',null);
        session('user_unitcode',null);

        $this->redirect('Angels/Index/index','' , 0, '');
    }

    //////////////////////////////////////////////////////////
    //兑换记录
    public function exchange(){
        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }

        $user_name=session('user_name');
        $user_id=session('user_id');

        $Jfexchange = M('Jfexchange');
        $map['exch_unitcode']=$this->qy_unitcode;
        $map['exch_userid']=$user_id;
        $count = $Jfexchange->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Jfexchange->where($map)->order('exch_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Jfexchdetail = M('Jfexchdetail');

        foreach($list as $k=>$v){

            $map2=array();
            $map2['detail_unitcode']=$this->qy_unitcode;
            $map2['detail_exchid'] = $v['exch_id'];
            $exchdetail = $Jfexchdetail->where($map2)->select();
            $exchdetail_str='';
            foreach($exchdetail as $kk=>$vv){ 
                $exchdetail_str=$exchdetail_str.''.$vv['detail_giftname'].'<br>';
            }
            $list[$k]['exchdetail']=$exchdetail_str;

            if($v['exch_state']==0){
                $list[$k]['exch_state_str']='<span style="color:#FF0000">待处理</span>';
            }elseif($v['exch_state']==1){
                $list[$k]['exch_state_str']='待发货';
            }elseif($v['exch_state']==2){
                $list[$k]['exch_state_str']='已发货';
            }elseif($v['exch_state']==9){
                $list[$k]['exch_state_str']='<span style="color:#00FF00">无效</span>';
            }

        }
        $this->assign('page', $show);
        $this->assign('list', $list);
        $this->display('exchange');
    }
    //兑换详细
    public function exchdetail(){
        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }

        $user_name=session('user_name');
        $user_id=session('user_id');

        $map['exch_id']=intval(I('get.exchid',0));
        $map['exch_unitcode']=$this->qy_unitcode;
        $map['exch_userid']=$user_id;
        $Jfexchange= M('Jfexchange');
        $data=$Jfexchange->where($map)->find();
        $Jfexchdetail = M('Jfexchdetail');
        $exchdetail=array();

        if($data){
            $map2=array();
            $map2['detail_unitcode']=$this->qy_unitcode;
            $map2['detail_exchid'] = $data['exch_id'];
            $exchdetail = $Jfexchdetail->where($map2)->select();

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
                if($vv['detail_xnid']>0){
                    $exchdetail[$kk]['detail_dexnpwd']=\Org\Util\Funcrypt::authcode($vv['detail_xnpwd'],'DECODE',C('WWW_AUTHKEY'),0);
                }else{
                    $exchdetail[$kk]['detail_dexnpwd']='';
                }

                $exchdetail[$kk]['detail_giftname_str']='<a href="'.U('Angels/Jfmall/detail?gif_id='.$vv['detail_giftid']).'" target="_blank" >'.$vv['detail_giftname'].'</a>';
            }

        }
  
        $this->assign('exchdetail', $exchdetail);
        $this->assign('jfexchangeinfo', $data);
        $this->display('exchdetail');
    }
    
    ////////////////////////////////////////////////////////////-
    //积分记录
    public function jfrecord(){
        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }

        $user_name=session('user_name');
        $user_id=session('user_id');

        $Jfdetail = M('Jfdetail');
        $map['jf_unitcode']=$this->qy_unitcode;
        $map['jf_userid']=$user_id;
        $count = $Jfdetail->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();

        if($show=='<div>    </div>'){
            $show='';
        }
        
        $list = $Jfdetail->where($map)->order('jf_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();



        foreach($list as $k=>$v){

            //jf_type 积分类型 1--5增加积分  6-9消费积分
            if($v['jf_type']==1){
                $list[$k]['jf_detailstr']='购买产品获得'.$v['jf_jf'].'积分<br>购买产品：'.$v['jf_proname'].'<br>积分码：'.$v['jf_code'];
                $list[$k]['jf_jf']='+'.$v['jf_jf'];
            }elseif($v['jf_type']==6){
                $list[$k]['jf_detailstr']='兑换礼品使用'.$v['jf_jf'].'积分<br>兑换礼品：'.$v['jf_proname'];
                $list[$k]['jf_jf']='<span style="color:#FF0000">-'.$v['jf_jf'].'</span>';
            }else{
                $list[$k]['jf_detailstr']='';
                $list[$k]['jf_typestr']='其他';
            }

        }

        $this->assign('page', $show);
        $this->assign('list', $list);
        $this->display('jfrecord');
    }

    //增加积分
    public function addjf(){
        if(!$this->is_user_login()){
            $this->redirect('Angels/Member/login','' , 0, '');
        }
		
		if (IS_POST){
			$fwcode=trim(I('post.fwcode',''));
			if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
				$msg=array('stat'=>0,'msg'=>'请正确输入积分码');
                echo json_encode($msg);
                exit;
			}
			
			if($fwcode!=''){
				$qycode=substr($fwcode,0,4);
				
				if($this->qy_unitcode!=$qycode){
					$msg=array('stat'=>0,'msg'=>'请正确输入积分码');
					echo json_encode($msg);
					exit;
                }
				
                $ip=real_ip();
                $user_name=session('user_name');
                $user_id=session('user_id');
				$is_checkcode=0;
				
				$map=array();
				$Templist = M("Templist");
				$map['tmp_unitcode']=$this->qy_unitcode;
				$map['tmp_state']=1;
				$map['tmp_addtime']=array('EGT',time()-3600*6); 
				$tlcount = $Templist->where($map)->count();

				$map=array();
				$codelen=strlen($fwcode)-4;
				$Model=M();
				$map['a.qy_code']=array('exp','=b.unitcode');
				$map['a.qy_active']=1;
				$map['b.unitcode']=$this->qy_unitcode;
				$map['b.codelen']=$codelen;
				$qydata=$Model->field('a.qy_id,a.qy_code,a.qy_fwkey,a.qy_fwsecret,a.qy_querytimes,b.*')->table('fw_qyinfo a,fw_cust b')->where($map)->find();
				if($qydata){
					$mlength=$qydata['mlength'];
					$msnlength=$qydata['msnlength'];
					$msnlength=$qydata['msnlength'];
					$sntype = substr($qydata['sntype'],0,1);
					$snpr = $qydata['snpr']; //前缀

					if($qydata['qy_querytimes']<$tlcount){
						$is_checkcode=1;
					}
				}else{
					$msg=array('stat'=>0,'msg'=>'请正确输入积分码');
					echo json_encode($msg);
					exit;
				}
				
				 //检测验证码
				if($is_checkcode==1){
					$msg=array('stat'=>9,'msg'=>'请正确输入验证码');
					echo json_encode($msg);
					exit;
					
					$checkcode=trim(I('post.checkcode',''));
					if($checkcode==''){
						$msg=array('stat'=>9,'msg'=>'请正确输入验证码');
						echo json_encode($msg);
						exit;
					}else{
						$verify = new \Think\Verify();
						if(!($verify->check($checkcode))){
							$msg=array('stat'=>9,'msg'=>'请正确输入验证码');
							echo json_encode($msg);
							exit;
						}
					}
				}
				
				//由防伪码找k
				$myk=fwcode_to_k($fwcode,$qycode,$mlength);
				if($myk===false || $myk<=0){
					$msg=array('stat'=>0,'msg'=>'输入积分码有误，请正确输入积分码');
					echo json_encode($msg);
					exit;
				}

				//由防伪码找物流信息
				$wlinfo=fw_to_wlinfo($fwcode,$myk,$sntype,$snpr,$msnlength);
				if($wlinfo===false){
					$msg=array('stat'=>0,'msg'=>'输入积分码有误，请正确输入积分码');
					echo json_encode($msg);
					exit;
				}
				if($wlinfo['qty']<=0){
					$msg=array('stat'=>0,'msg'=>'输入积分码有误，请正确输入积分码');
					echo json_encode($msg);
					exit;
				}
	
				$map=array();
				$where=array();
				$Shipment= M('Shipment');
				
				
				//tcode-  中标    ucode-大标   code--当前条码
				if($wlinfo['code']!=''){
					$where[]=array('EQ',$wlinfo['code']);
				}
				if($wlinfo['tcode']!='' && $wlinfo['ucode']!=$wlinfo['tcode']){
					$where[]=array('EQ',$wlinfo['tcode']);
				}
				if($wlinfo['ucode']!='' &&  $wlinfo['ucode']!=$wlinfo['tcode']){
					$where[]=array('EQ',$wlinfo['ucode']);
				}
				if($wlinfo['ucode']!='' &&  $wlinfo['ucode']==$wlinfo['tcode']){
					$where[]=array('EQ',$wlinfo['ucode']);
				}
                $where[]='or';
                $map['ship_barcode'] = $where;
				$map['ship_unitcode']=$qycode;
			
				$shdata=$Shipment->where($map)->find();
				if($shdata){
					$Product = M('Product');
					$map2=array();
					$map2['pro_unitcode']=$qycode;
					$map2['pro_id'] = $shdata['ship_pro'];
					$Proinfo = $Product->where($map2)->find();

					if($Proinfo){
						$shdata['pro_name']=$Proinfo['pro_name'];
						$shdata['pro_number']=$Proinfo['pro_number'];
						$shdata['pro_desc']=$Proinfo['pro_desc'];
						$shdata['pro_pic']=$Proinfo['pro_pic'];
						//固定积分还是随机积分
						if($Proinfo['pro_jftype']==1){
							$shdata['pro_jf']=$Proinfo['pro_jifen'];
						}else{
							$shdata['pro_jf']=get_rand($Proinfo['pro_jifen'],$Proinfo['pro_jfmax'],70); //随机积分 有70%几率是小数
						}
					}else{
						$shdata['pro_name']='';
						$shdata['pro_number']='';
						$shdata['pro_jf']=0;
						$shdata['pro_desc']='';
						$shdata['pro_pic']='';
					}



					if($shdata['pro_jf']>0){
						$map=array();
						$Templist = M("Templist");
						$map['tmp_unitcode']=$qycode;
						$map['tmp_state']=1;
						$map['tmp_code']=$fwcode;
						$data=$Templist->where($map)->order('tmp_addtime ASC')->find(); 

						if($data){
							$tmp_addtime=$data['tmp_addtime'];
							//如果第一次查询时间在30天前 或查询次数超30次 则提示 该码积分已失效

							if((time()-$tmp_addtime)>3600*24*30){ 
								$msg=array('stat'=>0,'msg'=>'该积分码已过期或已失效');
								echo json_encode($msg);
								exit;
							}
						}
						
						
                        $map=array();
						$Tellist=M('Tellist');
						$map['unitcode']=$qycode;
						$map['fwcode']=$fwcode;
						$scount = $Tellist->where($map)->count(); //该防伪码查询次数
						if($scount>=30){
							$msg=array('stat'=>0,'msg'=>'该积分码已过期或已失效');
							echo json_encode($msg);
							exit;
						}
						
						//是否已积分
						$map=array();
						$Jfdetail = M('Jfdetail');
						$map['jf_unitcode']=$qycode;
						$map['jf_code']=$fwcode;
						$data=$Jfdetail->where($map)->find();
						if($data){
							$msg=array('stat'=>0,'msg'=>'该积分码已被积分，积分时间：'.date('Y-m-d H:i:s',$data['jf_addtime']).'');
							echo json_encode($msg);
							exit;
						}else{
							$data=array();
							$data['jf_unitcode']=$this->qy_unitcode;
							$data['jf_userid']=$user_id;
							$data['jf_username']=$user_name;
							$data['jf_type']=1;
							$data['jf_jf']=$shdata['pro_jf'];
							$data['jf_addtime']=time();
							$data['jf_ip']=$ip;
							$data['jf_actionuser']=$user_id;
							$data['jf_code']=$fwcode;
							$data['jf_proid']=$shdata['ship_pro'];
							$data['jf_proname']=$shdata['pro_name'];
							$data['jf_pronumber']=$shdata['pro_number'];
							$data['jf_remark']='';

							$rs=$Jfdetail->create($data,1);
							if($rs){
								$result = $Jfdetail->add(); 
								if($result){
									$map=array();
									$data=array();
									$map['jfuser_id']=$user_id;
									$map['jfuser_unitcode']=$this->qy_unitcode;
									$Jfuser= M('Jfuser');
									$data=$Jfuser->where($map)->find();
									if($data){
										$data2=array();
										$data2['jfuser_jf'] = $data['jfuser_jf']+$shdata['pro_jf'];
										$Jfuser->where($map)->save($data2);
									}
									
									$msg=array('stat'=>1,'msg'=>'恭喜您，获得积分 '.$shdata['pro_jf'].' 分！，<a href="'.U('Angels/Member/index').'" >查看我的积分</a>');
							        echo json_encode($msg);
							        exit;
								}else{
									$msg=array('stat'=>0,'msg'=>'很抱歉，积分失败,请重新尝试!');
									echo json_encode($msg);
									exit;
								}
							}else{
								$msg=array('stat'=>0,'msg'=>'很抱歉，积分失败,请重新尝试!');
								echo json_encode($msg);
								exit;
							}
						}
					}else{
						$msg=array('stat'=>0,'msg'=>'该积分码没有积分');
						echo json_encode($msg);
						exit;
					}
				}else{
					$msg=array('stat'=>0,'msg'=>'输入积分码有误，请正确输入积分码');
					echo json_encode($msg);
					exit;
				}
	
			}
		}
		
		$is_checkcode=0;
		$this->assign('is_checkcode', $is_checkcode);
        $this->display('addjf');
    }
	
    //验证码
    public function verify(){
        $config = array(
                        'fontSize' =>22, // 验证码字体大小    
                        'length' => 4, // 验证码位数 
                        'useNoise' => true, // 关闭验证码杂点
                        'useImgBg' => false, //是否使用背景图片
                        'imageW' => 170,
                        'imageH' => 45,
                        'useNoise' => true,
                       );
        $verify = new \Think\Verify($config);
        $verify->entry();
        exit;
    }	
	
}