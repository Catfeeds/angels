<?php
namespace Angels\Controller;
use Think\Controller;
class DealerController extends CommController {
    //经销商管理
    public function index(){

        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
        $Dealer= M('Dealer');
        $Dltype= M('Dltype');
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
			$dl_level=$data['dl_level'];
			$data2=$Dltype->where(['dlt_id'=>$data['dl_type']])->find();
			if($data2){
			    $dltype_name=$data2['dlt_name'];
            }else{
                $dltype_name='';
            }
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		//--------------------------------

		//统计是否有未审核经销商
        $map=array();
		$count1=0;
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=1;
		$count1 = $Dealer->where($map)->count();
		
		$map=array();
		$count2=0;
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=0;
		$count2 = $Dealer->where($map)->count();

		//有多少级别代理
		$Dltype=M('Dltype');
		$dltmap=array();
		$dltmap['dlt_unitcode']=$this->qy_unitcode;
		$dltMax=$Dltype->where($dltmap)->max('dlt_level');
		$isLastLv=false;
		if ($dl_level==$dltMax)
		{
			$isLastLv=true;
		}
		$this->assign('daishen', $count2);
		$this->assign('yishen', $count1);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_weixin', $dl_weixin);
		$this->assign('dl_number', $dl_number);
		$this->assign('dl_level', $dl_level);
		$this->assign('isLastLv',$isLastLv);
		$this->assign('dltype_name',$dltype_name);
		$this->assign('dl_tel',$dl_tel);
        $this->display('index');
    }
	
    //账户登录
	public function login(){
		$action=trim(I('post.action',''));
		if($action=='login'){
			$ttamp=trim(I('post.ttamp',''));
			$sture=trim(I('post.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
				$msg=array('stat'=>'2','msg'=>'操作超时,请重试');
				echo json_encode($msg);
				exit;
			}
			if(($nowtime - $ttamp) > 120) {
				$msg=array('stat'=>'2','msg'=>'操作超时,请重试');
				echo json_encode($msg);
				exit;
			}
			$username=trim(I('post.username',''));
			$pwd=trim(I('post.pwd',''));
			
			if(!preg_match("/^[a-zA-Z0-9_-]{4,20}$/",$username)){
				$msg=array('stat'=>'0','msg'=>'账号有误');
				echo json_encode($msg);
				exit;
			}
			
			$md5_pwd=MD5(MD5(MD5($pwd)));
			$map['dl_username']=$username;
			$map['dl_unitcode']=$this->qy_unitcode;
			$Dealer= M('Dealer');
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_pwd']==$md5_pwd){
					if($data['dl_status']==1){
						$jxuser_time=time();
						$jxuser_check=MD5($data['dl_id'].$jxuser_time).MD5($jxuser_time);
						
						session('jxuser_time',$jxuser_time);
						session('jxuser_id',$data['dl_id']);
						session('jxuser_unitcode',$data['dl_unitcode']);
						session('jxuser_username',$data['dl_username']);
						session('jxuser_dlname',wxuserTextDecode2($data['dl_name']));				
						cookie('jxuser_check',$jxuser_check,72000);
						
						//记录日志 begin
						$log_arr=array(
									'log_qyid'=>session('jxuser_id'),  //操作者 id
									'log_user'=>session('jxuser_username'),
									'log_qycode'=>session('jxuser_unitcode'),
									'log_action'=>'经销商账号登录',
									'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
									'log_addtime'=>time(),
									'log_ip'=>real_ip(),
									'log_link'=>__SELF__,
									'log_remark'=>''
									);
						save_log($log_arr);
						//记录日志 end
						
						//改变登录时间
						$date2=array();
						$date2['dl_logintime']=time();
						$Dealer->where($map)->data($date2)->save();
						
						$msg=array('stat'=>'1','msg'=>'登录成功','dl_level'=>$data['dl_level']);
						echo json_encode($msg);
						exit;
						
					}else{
						$msg=array('stat'=>'0','msg'=>'该账户还没审核或已禁用');
						echo json_encode($msg);
						exit;
					}
				}else{
					$msg=array('stat'=>'0','msg'=>'账号或密码有误');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>'0','msg'=>'账号或密码有误');
				echo json_encode($msg);
				exit;
			}

		}else{

			//验证是否有效链接
			$ttamp=trim(I('get.ttamp',''));
			$sture=trim(I('get.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
				$this->error('请求超时，请重试',U('Angels/Dealer/index'),1);
			}
			if(($nowtime - $ttamp) > 60) {
				$this->error('请求超时，请重试',U('Angels/Dealer/index'),1);
			}
			
			$this->assign('ttamp', $ttamp);
			$this->assign('sture', $sture);
			
			$this->display('login');
		}
	}
	
	//退出
	public function quit(){
		session('jxuser_time','');
		session('jxuser_id','');
		session('jxuser_unitcode','');
		
		cookie('jxuser_check','');
		session(null);
		cookie(null); 
		
		$this->redirect('Angels/Dealer/index'.'','' , 0, '');
	}
	

	//授权证书
	public function authorization(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
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
			//级别1
            $Dltype= M('Dltype');
			$map4=array();
			$map4['dlt_unitcode']=$this->qy_unitcode;
			$map4['dlt_id']=$data['dl_type'];
			$data4 = $Dltype->where($map4)->find();
			if($data4){
				$dlt_level=intval($data4['dlt_level']);
				$dlt_namestr=$data4['dlt_name'];
			}else{
				$dlt_level=0;
			}

			$shouquandate=date("Y-m-d", $data['dl_startdate']).'至'.date("Y-m-d",$data['dl_enddate']);
			$imgpath = BASE_PATH.'/public/uploads/dealer/';
			if($data['dl_pic']!='' && file_exists($imgpath.$data['dl_pic']) && (time()-filemtime($imgpath.$data['dl_pic']))<3600 ){
				$dl_picstr='<img src="'.__ROOT__.'/public/uploads/dealer/'.$data['dl_pic'].'" width="100%"  border="0" style="vertical-align:middle" >';
			}else{
				@unlink($imgpath.$data['dl_pic']); //删除旧的授权证书
				//生成授权书 只支持jpg 根据每个授权证书的图片不同要调整文字坐标位置
				$ttfpath = BASE_PATH.'/public/angels/static/font.ttf'; 
				$temppic = BASE_PATH.'/public/angels/static/shouquantemp.jpg';
				$picfilename = $this->qy_unitcode.'/'.time().'_'.$data['dl_id'].'_'.mt_rand(1000,9999).'.jpg';
				$savepic = BASE_PATH.'/public/uploads/dealer/'.$picfilename;
				if(!is_dir(BASE_PATH.'/public/uploads/dealer/'.$this->qy_unitcode)){
					@mkdir(BASE_PATH.'/public/uploads/dealer/'.$this->qy_unitcode);
				}
				
				$pictext=array();
				$pictext[]=array('txt'=>$data['dl_name'],'x'=>350,'y'=>490,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'20');
				// $pictext[]=array('txt'=>$dl_tel,'x'=>315,'y'=>456,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'14');
				$pictext[]=array('txt'=>$dl_weixin,'x'=>575,'y'=>490,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'20');
				 $pictext[]=array('txt'=>$dl_number,'x'=>600,'y'=>910,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'14');
				$pictext[]=array('txt'=>$shouquandate,'x'=>529,'y'=>835,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'20');
				$pictext[]=array('txt'=>$dlt_namestr,'x'=>575,'y'=>540,'color'=>array('51','51','51'),'font'=>$ttfpath,'fontsize'=>'20');

				make_textpic($pictext,$temppic,$savepic);
				
				$map3=array();
				$map3['dl_unitcode']=$this->qy_unitcode;
				$map3['dl_id']=session('jxuser_id');
				$data3=array();
				$data3['dl_pic']=$picfilename;
				
				$Dealer->where($map3)->save($data3);

				$dl_picstr='<img src="'.__ROOT__.'/public/uploads/dealer/'.$picfilename.'" width="100%"  border="0" style="vertical-align:middle" >';
			}
			
			//当前推荐人
			if($data['dl_referee']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_referee'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_referee_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_referee_str']='';
				}
			}else{
				$data['dl_referee_str']='总公司';
			}
			
			//当前上家
			if($data['dl_belong']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_belong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_belong_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_belong_str']='';
				}
			}else{
				$data['dl_belong_str']='总公司';
			}
			
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		
		$this->assign('dl_referee_str', $data['dl_referee_str']);
		$this->assign('dl_belong_str', $data['dl_belong_str']);
        $this->assign('dlt_namestr', $dlt_namestr);
		// $this->assign('shouquandate', $shouquandate);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_weixin', $dl_weixin);
		$this->assign('dl_number', $dl_number);
		$this->assign('dl_tel', $dl_tel);
		$this->assign('dl_picstr', $dl_picstr);
		
		$this->display('authorization');
	}
	
	
    //下级代理邀请
	public function invite(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$sharelinks = M('sharelinks');
		
		//删除已过期
		$map2=array();
		$map2['sl_unitcode']=$this->qy_unitcode;
		$map2['sl_dealerid']=session('jxuser_id');
		$map2['sl_endtime']=array('ELT',time());
		$sharelinks->where($map2)->delete(); 
		
		
		//邀请链接列表
		$map2=array();
		$map2['sl_unitcode']=$this->qy_unitcode;
		$map2['sl_dealerid']=session('jxuser_id');
		
		$data2 = $sharelinks->where($map2)->order('sl_id ASC')->select();
		$Dltype = M('Dltype');
		
		foreach($data2 as $k=>$v){ 
		    //级别1
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$v['sl_level'];
			$data3 = $Dltype->where($map3)->find();
			if($data3){
				$data2[$k]['dlt_name']=$data3['dlt_name'];
			}else{

				$data2[$k]['dlt_name']='';
			}
			
			if(($v['sl_endtime']-time())>0){
				$data2[$k]['timing']=$v['sl_endtime']-time();
			}else{
				$data2[$k]['timing']=0;
			}
		}
		
		//邀请级别1
		$map3=array();
		$map3['dlt_unitcode']=$this->qy_unitcode;
		$dltypelist = $Dltype->where($map3)->order('dlt_level ASC,dlt_id ASC')->select();
		
		
        $this->assign('dltypelist', $dltypelist);
		$this->assign('sharelinkslist', $data2);
		$this->display('invite');
	}
	
	//生成邀请链接 分享链接
	public function marklinks(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$dltypeid=intval(I('get.dltype',0));
		$slid=intval(I('get.slid',0));
		$Dltype = M('Dltype');
		
		if($slid>0){
			$Sharelinks = M('Sharelinks');
            $map2=array();
			$map2['sl_unitcode']=$this->qy_unitcode;
			$map2['sl_id']=$slid;
			$data2=$Sharelinks->where($map2)->find();
			if($data2){
				if(($data2['sl_endtime']-time())>0){
					$timing=$data2['sl_endtime']-time();
				}else{
					$timing=0;
				}
				
				//级别1
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$data2['sl_level'];
				$data3 = $Dltype->where($map3)->find();
				if($data3){
					$dlt_name=$data3['dlt_name'];
				}else{

					$dlt_name='';
				}

			}else{
				$this->error('链接已过期','',1);
			}
			
		}else{
			if($dltypeid>0){		
				//添加邀请链接 链接有效时间3600秒
				$data2=array();
				$endtime=time()+36000;
				$timing=36000; //计时
				$Sharelinks = M('Sharelinks');
				$data2['sl_unitcode']=$this->qy_unitcode;
				$data2['sl_brid']=0;
				$data2['sl_dealerid']=session('jxuser_id');
				$data2['sl_level']=$dltypeid;
				$data2['sl_endtime']=$endtime;
				$data2['sl_views']=0;
				$data2['sl_applynum']=0;

				$rs=$Sharelinks->create($data2,1);
				$slid = $Sharelinks->add(); 
				
				//------
                //级别1
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$dltypeid;
				$data3 = $Dltype->where($map3)->find();
				if($data3){
					$dlt_name=$data3['dlt_name'];
				}else{

					$dlt_name='';
				}
			}else{
				$this->error('请选择邀请级别',U('Angels/Dealer/invite'),2);
			}
		}
		
		
		$Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();

		if($data['dl_pic']!=''){
			$ba_picstr='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_pic'].'"   border="0" style="vertical-align:middle;width:70%" >';
		}else{
			$ba_picstr='授权书还没生成，请与上级联系';
		}
		
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
		$signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		
		$http_host=strtolower(htmlspecialchars('http://'.$_SERVER['HTTP_HOST'])).WWW_WEBROOT;

		$this->assign('shtitle', C('SHARE_TITLE'));
		$this->assign('shdesc', C('SHARE_DESC'));
		$this->assign('shlink', $http_host.'angels/dealer/apply/slid/'.$slid.'/jxid/'.session('jxuser_id'));
		$this->assign('shimgurl', $http_host.'public/angels/static/fenxiang.jpg');
		$this->assign('ba_picstr', $ba_picstr);
		$this->assign('timing', $timing);
		$this->assign('dlt_name', $dlt_name);
		
		$this->display('sharelinks');
	}
	
	//经销商申请 注意推荐人和上家的区分
	public function apply(){
        if(C('IS_ONLYWEIXIN')==1){
			$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
			if (strpos($user_agent, 'micromessenger') === false){
				$this->error('请在微信客户端打开链接','',-1);
				exit;
			}
		}

		$action=trim(I('post.action',''));
		
		//保存提交申请
	    if ($action=='save') {
			$slid=intval(I('post.slid',0));
			$jxid=intval(I('post.jxid',0));
			$dltypeid=intval(I('post.dltype',0));
		    $dl_name=trim(I('post.dl_name',''));
			$dl_weixin=trim(I('post.dl_weixin',''));
			$dl_tel=trim(I('post.dl_tel',''));
			$dl_idcard=I('post.dl_idcard','');
			$dl_address=I('post.dl_address','');
			
			$seachprov=I('post.seachprov','0');
			$seachcity=I('post.seachcity','0');
			$seachdistrict=I('post.seachdistrict','0');
			$diqustr=I('post.diqustr','');
			
			
			
		    //判断数据是否有效
			if($slid<=0 || $jxid<=0){
				$this->error('该邀请链接已失效','',2);
                exit;
			}
			
			$ttamp=trim(I('post.ttamp',''));
			$sture=trim(I('post.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
				$this->error('请求超时，请重试',U('Angels/Dealer/apply?slid='.$slid.'&jxid='.$jxid.''),2);
			}
			if(($nowtime - $ttamp) > 1200) {
				$this->error('请求超时，请重试',U('Angels/Dealer/apply?slid='.$slid.'&jxid='.$jxid.''),2);
			}
			
			if($dltypeid<=0){
                $this->error('请选择代理级别','',2);
			}
			if($dl_name==''){
                $this->error('请填写你的姓名','',2);
			}
			if($dl_weixin==''){
                $this->error('请填写微信号','',2);
			}
			
			if(!preg_match("/^[a-zA-Z0-9_-]{6,20}$/",$dl_weixin)){
				$this->error('请正确填写微信号，微信号支持6-20个字母、数字、下划线和减号','',2);
			}
			
			if($dl_tel==''){
                $this->error('请填写手机号','',2);
			}
			if(!preg_match("/^[a-zA-Z0-9_-]{10,20}$/",$dl_tel)){
				$this->error('请正确填写手机号','',2);
			}
			
			if($dl_idcard==''){
                $this->error('请填写身份证','',2);
			}
			
			if ($dl_idcard.length==18)
			{
				if(!preg_match("/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/",$dl_idcard)){
					$this->error('请正确填写第二代18位身份证号','',2);
				}
			}else if ($dl_idcard.length<7)
			{
				$this->error('请正确填写身份证号','',2);
			}
			
			if($dl_address==''){
                $this->error('请填写收货地址','',2);
			}
			if($diqustr==''){
                $this->error('请选择城市地区','',2);
			}
			
			
			$Sharelinks = M('Sharelinks');
			$Dealer= M('Dealer');
			$Dltype = M('Dltype');
			
			//判断链接是否失效
			$map2=array();
			$map2['sl_id']=$slid;
			$map2['sl_unitcode']=$this->qy_unitcode;
			$linksinfo=$Sharelinks->where($map2)->find();
			if($linksinfo){
				if(($linksinfo['sl_endtime']-time())<=0){
					$this->error('该邀请链接已失效 2','',2);
				}
			}else{
				$this->error('该邀请链接已失效 3','',2);
			}
			if($linksinfo['sl_dealerid']!=$jxid){
				$this->error('该邀请链接已失效 4','',2);
			}
			
			//确保帐号唯一
			$map=array();
			$map['dl_username']=$dl_weixin;
			$map['dl_unitcode']=$this->qy_unitcode;
			$data=$Dealer->where($map)->find();
			if($data){
                $this->error('对不起，该微信号已存在','',2);
			}
			
			//确保微信号唯一
			$map2=array();
            $map2['dl_weixin']=$dl_weixin;
            $map2['dl_unitcode']=$this->qy_unitcode;
            $data2=$Dealer->where($map2)->find();
			if($data2){
				 $this->error('对不起，该微信号已存在','',2);
			}
			
			//确保电话号唯一
			$map2=array();
            $map2['dl_tel']=$dl_tel;
            $map2['dl_unitcode']=$this->qy_unitcode;
            $data2=$Dealer->where($map2)->find();
			if($data2){
				$this->error('对不起，该手机号已存在','',2);
			}
			
			//推荐人是否有效
			$map=array();
			$map['dl_id']=$jxid;
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_status']=1;
			$dlreferee=$Dealer->where($map)->find();
			if($dlreferee){
				$dlreferee_belong=$dlreferee['dl_belong']; //推荐人的上家
				$dlreferee_username=$dlreferee['dl_username'];  //推荐人
				//推荐人的级别
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$dlreferee['dl_type'];
				
				$data3 = $Dltype->where($map3)->find();
				if($data3){
					$dlreferee_level=$data3['dlt_level']; //推荐人的级别
				}else{
					$this->error('该邀请链接已失效 5',U('Angels/Index/index'),2);
				}
			}else{
				$this->error('推荐人还没审核或已禁用','',2);
			}
			
			//申请的分类 级别 
			$map2=array();
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$dltypeid;
			$dltinfo = $Dltype->where($map2)->find();
			$dlsttypeid=0;
			if($dltinfo){
				$apply_level=$dltinfo['dlt_level'];  //申请的级别
			}else{

				$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
			}
			
			//判断上家
			$dlbelong_id=0;  //上家id
			$dlbelong_name='总公司'; //上家名称
			if($apply_level<=$dlreferee_level){  //如果申请的级别高于推荐人的级别 或 与推荐人同级
                if($dlreferee_belong>0){
					$dlbelong_id=$this->get_dlbelong($dlreferee_belong,$apply_level);
					
					if($dlbelong_id===false){
						$this->error('该邀请链接已失效 8',U('Angels/Index/index'),2);
					}else{
						if($dlbelong_id>0){
							$map=array();
							$map['dl_id']=$dlbelong_id;
							$map['dl_unitcode']=$this->qy_unitcode;
							$map['dl_status']=1;
							$dlbelong=$Dealer->where($map)->find();
							if($dlbelong){
								$dlbelong_id=$dlbelong['dl_id'];
								$dlbelong_name=$dlbelong['dl_username'];
							}else{
								$this->error('该邀请链接已失效 9',U('Angels/Index/index'),2);
							}
						}else{
							$dlbelong_id=0;
						}
					}
				}else{
					$dlbelong_id=0;
				}
			}else{//如果申请的级别低于推荐人的级别 那上家就是推荐人
				$map=array();
				$map['dl_id']=$jxid;
				$map['dl_unitcode']=$this->qy_unitcode;
				$map['dl_status']=1;
				$dlbelong=$Dealer->where($map)->find();
				if($dlbelong){
					$dlbelong_id=$dlbelong['dl_id'];
					$dlbelong_name=$dlbelong['dl_username'];
				}else{
					$this->error('该邀请链接已失效 10',U('Angels/Index/index'),2);
				}
			}
			
			//保存文件 begin  身份证图片
            $file_name=I('post.file_name','');
			$file_name2=I('post.file_name2','');
			$dl_idcardpic='';
			$dl_idcardpic2='';
			
			if($file_name=='' || $file_name2==''){
				//$this->error('上传身份证图片','',2);
			}else{
				$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
				$temppath=BASE_PATH.'/Public/uploads/temp/';
				if(!file_exists($imgpath)) {
					mkdir($imgpath);
				}
				if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
					$dl_idcardpic=$this->qy_unitcode.'/'.$file_name;
					@unlink($temppath.$file_name); 
					
					if(copy($temppath.$file_name2,$imgpath.'/'.$file_name2)) {
						$dl_idcardpic2=$this->qy_unitcode.'/'.$file_name2;
					    @unlink($temppath.$file_name2); 
					}else{
						@unlink($imgpath.'/'.$file_name); 
						$this->error('上传图片失败','',2);
					}
				}else{
					$this->error('上传图片失败','',2);
				}
			}
			
			
			if($dl_idcardpic=='' || $dl_idcardpic2==''){
			    //$this->error('上传身份证图片','',2);
			}
			//保存文件 end
			
			$md5_pwd=MD5(MD5(MD5(substr($dl_tel,-6))));
			
			$data2=array();
			$data2['dl_username']=$dl_weixin;
			$data2['dl_pwd']=$md5_pwd;
			$data2['dl_number']='';
			$data2['dl_unitcode']=$this->qy_unitcode;
			$data2['dl_name']=$dl_name;
			$data2['dl_contact']=$dl_name;
			$data2['dl_tel']=$dl_tel;
			$data2['dl_idcard']=$dl_idcard;
			$data2['dl_idcardpic']=$dl_idcardpic;
			$data2['dl_idcardpic2']=$dl_idcardpic2;
			$data2['dl_tbdian']='';
			$data2['dl_tbzhanggui']='';
			$data2['dl_addtime']=time();
			$data2['dl_status']=0;
			$data2['dl_level']=$apply_level;
			$data2['dl_type']=$dltypeid;   //代理等级
			$data2['dl_sttype']=$dlsttypeid;   //代理等级2
			$data2['dl_belong']=$dlbelong_id;  //上家
			$data2['dl_referee']=$jxid;  //推荐人
			$data2['dl_remark']='';
			$data2['dl_address']=$dl_address;
			$data2['dl_sheng']=$seachprov;
			$data2['dl_shi']=$seachcity;
			$data2['dl_qu']=$seachdistrict;
			$data2['dl_qustr']=$diqustr;
			
			$data2['dl_openid']='';
			$data2['dl_weixin']=$dl_weixin;
			$data2['dl_wxnickname']='';
			$data2['dl_wxsex']=0;
			$data2['dl_wxprovince']='';
			$data2['dl_wxcity']='';
			$data2['dl_wxcountry']='';
			$data2['dl_wxheadimg']='';
			$data2['dl_brand']='';
			$data2['dl_brandlevel']='';
			
			
            $rs=$Dealer->create($data2,1);
			$result = $Dealer->add();  
			if($result){
				//添加地址
				$data3=array();
				$data3['dladd_unitcode'] = $this->qy_unitcode;
				$data3['dladd_dlid'] = $result;
				$data3['dladd_contact'] = $dl_name;
				$data3['dladd_sheng'] = $seachprov;
				$data3['dladd_shi'] = $seachcity;
				$data3['dladd_qu'] = $seachdistrict;
				$data3['dladd_diqustr'] = $diqustr;
				$data3['dladd_address'] = $dl_address;
				$data3['dladd_tel'] = $dl_tel;	
				$data3['dladd_default'] = 1;	
				
                $Dladdress = M('Dladdress');
				$rs3=$Dladdress->create($data3,1);
				if($rs3){
				   $Dladdress->add();
				}
				
				
				$dlg_action='代理商注册';
				if($dlreferee_username!=''){
					$dlg_action=$dlg_action.' 推荐人：'.$dlreferee_username;
					
				}
				if($dlbelong_name!=''){
					$dlg_action=$dlg_action.' 上家：'.$dlbelong_name;
				}
				//代理操作日志 begin
				$odlog_arr=array(
							'dlg_unitcode'=>$this->qy_unitcode,  
							'dlg_dlid'=>$result,
							'dlg_operatid'=>$result,
							'dlg_dlusername'=>$data2['dl_username'],
							'dlg_dlname'=>$data2['dl_name'],
							'dlg_action'=>$dlg_action,
							'dlg_type'=>1, //0-企业 1-经销商
							'dlg_addtime'=>time(),
							'dlg_ip'=>real_ip(),
							'dlg_link'=>__SELF__
							);
				$Dealerlogs = M('Dealerlogs');
				$rs3=$Dealerlogs->create($odlog_arr,1);
				if($rs3){
					$Dealerlogs->add();
				}
				//代理操作日志 end
				
                //记录日志 begin  系统
				$log_arr=array();
				$log_arr=array(
							'log_qyid'=>$result,
							'log_user'=>$dl_weixin,
							'log_qycode'=>$this->qy_unitcode,
							'log_action'=>'代理商注册',
							'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
							'log_addtime'=>time(),
							'log_ip'=>real_ip(),
							'log_link'=>__SELF__,
							'log_remark'=>json_encode($data2)
							);
				save_log($log_arr);
				//记录日志 end
				
				// 计数
				$map=array();
				$map['sl_id']=$slid;
				$map['sl_unitcode']=$this->qy_unitcode;
				$data=array();
				$data['sl_applynum'] = $linksinfo['sl_applynum']+1;
				$Sharelinks->where($map)->save($data);
				
				//获取代理最大编号
				$Dealer=M('Dealer');
				$map=array();
				$map['dl_unitcode']=$this->qy_unitcode;
				// $map['dl_status']=1;
				// $maxDlnum=$Dealer->where($map)->select();
				$maxDlnumStr=$Dealer->field('dl_number')->where($map)->order('dl_number DESC')->find();
				$maxDlnum=preg_replace('/[^\.0123456789]/s', '',$maxDlnumStr['dl_number']);
				$dlNumber=$maxDlnum+1;
				if ($dlNumber>7700)
				{
				}else
				{
					$dlNumber=7700;
				}

				//添加编号
				$map=array();
				$map['dl_id']=$result;
				$map['dl_unitcode']=$this->qy_unitcode;
				$data=array();

				$data['dl_number'] ='No:'.str_pad($dlNumber,6,'0',STR_PAD_LEFT);
				$Dealer->where($map)->save($data);
				
				$this->success('您的申请提交成功，请等待审核，用户名：'.$dl_weixin.' 密码：'.substr($dl_tel,-6).'',U('Angels/Index/index'),999);
				exit;
			}else{
				$this->error('申请提交失败,请重新填写提交',U('Angels/Index/index'),2);
			}
		}
	
        //===========================申请表单
		$slid=intval(I('get.slid',0));
		$jxid=intval(I('get.jxid',0));	
        if($slid>0 && $jxid>0){
			$sharelinks = M('sharelinks');
			$Dealer= M('Dealer');
			
			//判断链接是否失效
			$map2=array();
			$map2['sl_id']=$slid;
			$map2['sl_unitcode']=$this->qy_unitcode;
			$data2=$sharelinks->where($map2)->find();
			if($data2){
				if(($data2['sl_endtime']-time())>0){
					$timing=$data2['sl_endtime']-time();
				}else{
					$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
				}
			}else{
				$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
			}
			
			//申请的分类 级别
			$map2=array();
			$Dltype = M('Dltype');
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$data2['sl_level'];
			$dltinfo = $Dltype->where($map2)->find();
			if($dltinfo){
				$apply_level=$dltinfo['dlt_level'];  //申请的级别
			}else{

				$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
			}
			
			//判断推荐人
			$map=array();
			$map['dl_id']=$jxid;
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_status']=1;
			$dlreferee=$Dealer->where($map)->find();
			if($dlreferee){
                $dlreferee['dl_name']=wxuserTextDecode2($dlreferee['dl_name']);  //推荐人名称
				$dlreferee_belong=$dlreferee['dl_belong']; //推荐人的上家
				//推荐人的级别
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$dlreferee['dl_type'];
				$data3=array();
				$data3 = $Dltype->where($map3)->find();
				if($data3){
					$dlreferee_level=$data3['dlt_level']; //推荐人的级别
				}else{
					$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
				}
			}else{
				$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
			}
			
			if($data2['sl_dealerid']!=$jxid){
				$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
			}

		
			//判断上家
			$dlbelong_id=0;
			$dlbelong_name='总公司';
			if($apply_level<=$dlreferee_level){  //如果申请的级别高于推荐人的级别 或 与推荐人同级
                if($dlreferee_belong>0){
					$dlbelong_id=$this->get_dlbelong($dlreferee_belong,$apply_level);
					
					if($dlbelong_id===false){
						$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
					}else{
						if($dlbelong_id>0){
							$map=array();
							$map['dl_id']=$dlbelong_id;
							$map['dl_unitcode']=$this->qy_unitcode;
							$map['dl_status']=1;
							$dlbelong=$Dealer->where($map)->find();
							if($dlbelong){
								$dlbelong['dl_name']=wxuserTextDecode2($dlbelong['dl_name']);
								
								$dlbelong_name=$dlbelong['dl_name'];
								$dlbelong_id=$dlbelong['dl_id'];
							}else{
								$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
							}
						}else{
							$dlbelong_id=0;
							$dlbelong_name='总公司';
						}
					}
				}else{
					$dlbelong_id=0;
					$dlbelong_name='总公司';
				}
			}else{   //如果申请的级别低于推荐人的级别 那上家就是推荐人
				$map=array();
				$map['dl_id']=$jxid;
				$map['dl_unitcode']=$this->qy_unitcode;
				$map['dl_status']=1;
				$dlbelong=$Dealer->where($map)->find();
				if($dlbelong){
					$dlbelong['dl_name']=wxuserTextDecode2($dlbelong['dl_name']);
					
					$dlbelong_name=$dlbelong['dl_name'];
					$dlbelong_id=$dlbelong['dl_id'];
				}else{
					$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
				}
			}
			
			
			// 计数
			$map=array();
			$map['sl_id']=$slid;
			$map['sl_unitcode']=$this->qy_unitcode;
			$data=array();
			$data['sl_views'] = $data2['sl_views']+1;
			$sharelinks->where($map)->save($data);
			
			
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			
			$this->assign('slid', $slid);
			$this->assign('jxid', $jxid);
			
			$this->assign('ttamp', $ttamp2);
			$this->assign('sture', $sture2);

			$this->assign('timing', $timing);
			$this->assign('dltinfo', $dltinfo);
			$this->assign('dlsttinfo', $dlsttinfo);
			
			$this->assign('dlreferee', $dlreferee);
			$this->assign('dlbelong_id', $dlbelong_id);
			$this->assign('dlbelong_name', $dlbelong_name);

			
			$this->display('apply');
			
		}else{
			$this->error('该邀请链接已失效',U('Angels/Index/index'),2);
		}
        exit;
	}
	
	
	//通过localResizeIMG4压缩上传 临时保存图片文件 统一为jpeg
	public function uploadpic(){
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$msg=array('stat'=>'4','filename'=>'');
			echo json_encode($msg);
			exit;
		}
		if(($nowtime - $ttamp) > 1800) {
			$msg=array('stat'=>'4','filename'=>'');
			echo json_encode($msg);
			exit;
		}
		
		$base64_image_content=$_POST['pic_file'];
		$img='';
		$type='jpeg'; //jpeg
		if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)){
			$img = base64_decode(str_replace($result[1], '', $base64_image_content)); //返回文件流
	    }
        $imgpath=BASE_PATH.'/Public/uploads/temp/';
		$filename=uniqid().mt_rand(1000,9999).'.'.$type;
		$tmp_file=$imgpath.$filename;
		if($img!=''){
			$im = imagecreatefromstring($img); //resource(2) of type (gd) 图像资源
			if($im !== false){
				$rs=imagejpeg ($im, $tmp_file); //图像流（image）以 JPEG 格式输出到标准输出(浏览器或者文件)
				if($rs !== false){
					$msg=array('stat'=>'0','filename'=>$filename);
					echo json_encode($msg);
					exit;
				}else{
					$msg=array('stat'=>'1','filename'=>'');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>'2','filename'=>'');
				echo json_encode($msg);
				exit;	
			}
		}else{
			$msg=array('stat'=>'3','filename'=>'');
			echo json_encode($msg);
			exit;
		}
	}
	
	
	//查看下级代理
    public function brandlevel(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$Dltype = M('Dltype');
		$Dealer = M('Dealer');
	

		$map3=array();
		$data3=array();
		$map3['dlt_unitcode']=$this->qy_unitcode;

		$data3 = $Dltype->where($map3)->order('dlt_level ASC,dlt_id ASC')->select();
		foreach($data3 as $kk=>$vv){
			$map4=array();
			$count4=0;
			$map4['dl_unitcode']=$this->qy_unitcode;
			$map4['dl_belong']=session('jxuser_id');
			$map4['dl_type']=$vv['dlt_id'];
			$map4['dl_status']=1;
			$count4 = $Dealer->where($map4)->count();
			$data3[$kk]['count']=$count4;
		}

		$this->assign('dltypelist', $data3);
		
        $this->display('brandlevel');
	}
	
	//查看下级代理（某级别下的代理）
    public function dealerlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$dltid=intval(I('get.dltid',0));
		
		if($dltid>0){
			
			//分类
			$map2=array();
			$Dltype = M('Dltype');
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$dltid;
			$dltinfo = $Dltype->where($map2)->find();
			if($dltinfo){
			}else{
				$this->error('没有该记录',U('Angels/Dealer/brandlevel'),'',2);
			}
			
			$Dealer = M('Dealer');
            $map=array();
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_belong']=session('jxuser_id');
			$map['dl_type']=$dltid;
			$map['dl_status']=1;
			$dllist = $Dealer->where($map)->order('dl_id DESC')->select();
			foreach($dllist as $k=>$v){
			    $dllist[$k]['dl_name']=wxuserTextDecode2($v['dl_name']);
				
			}

			
			$this->assign('dltinfo', $dltinfo);
			$this->assign('dllist', $dllist);
			$this->display('dealerlist');
			
		}else{
			$this->error('没有该记录',U('Angels/Dealer/brandlevel'),'',2);
		}
	}
	
    //查看下级代理详细
	public function dealerdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$Dealer = M('Dealer');
        $dlid=intval(I('get.dlid',0));
		$map=array();
		$map['dl_id']=$dlid;
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=1;
		$Dltype = M('Dltype');
		
		$data=$Dealer->where($map)->find();
		if($data){
            $imgpath = BASE_PATH.'/Public/uploads/dealer/';
			if(is_not_null($data['dl_idcardpic']) && file_exists($imgpath.$data['dl_idcardpic'])){
				$data['dl_idcardpic_str']='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_idcardpic'].'"   border="0"  style="width:40%;"  >';
			}else{
				$data['dl_idcardpic_str']='';
			}
			
			if(is_not_null($data['dl_idcardpic2']) && file_exists($imgpath.$data['dl_idcardpic2'])){
				$data['dl_idcardpic2_str']='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_idcardpic2'].'"   border="0"  style="width:40%;"  >';
			}else{
				$data['dl_idcardpic2_str']='';
			}
			
			//推荐人
			if($data['dl_referee']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_referee'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_referee_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_referee_str']='';
				}
			}else{
				$data['dl_referee_str']='';
			}
			
			//上家代理
			if($data['dl_belong']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_belong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_belong_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_belong_str']='';
				}
			}else{
				$data['dl_belong_str']='总公司';
			}
			
			//级别1
			$map5=array();
			$map5['dlt_unitcode']=$this->qy_unitcode;
			$map5['dlt_id']=$data['dl_type'];
			$data5 = $Dltype->where($map5)->find();
			if($data5){
				$data['dlt_name']=$data5['dlt_name'];
			}else{
				$data['dlt_name']='';
			}
			
			
		}else{
			$this->error('没有该记录',U('Angels/Dealer/applylist'),1);
		}
		
		$this->assign('dlinfo', $data);
		$this->display('dealerdetail');
	}
	
	//查看推荐代理
    public function referee(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$Dltype = M('Dltype');
		$Dealer = M('Dealer');
	

		$map3=array();
		$data3=array();
		$map3['dlt_unitcode']=$this->qy_unitcode;

		$data3 = $Dltype->where($map3)->order('dlt_level ASC,dlt_id ASC')->select();
		foreach($data3 as $kk=>$vv){
			$map4=array();
			$count4=0;
			$map4['dl_unitcode']=$this->qy_unitcode;
			$map4['dl_referee']=session('jxuser_id');
			$map4['dl_type']=$vv['dlt_id'];
			$map4['dl_status']=array('in','0,1,2');
			$count4 = $Dealer->where($map4)->count();
			$data3[$kk]['count']=$count4;
		}

		$this->assign('dltypelist', $data3);
        $this->display('referee');
	}
	
	//查看推荐代理（某级别下的代理）
    public function refereelist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------

		$dltid=intval(I('get.dltid',0));
		
		if($dltid>0){
			
			//分类
			$map2=array();
			$Dltype = M('Dltype');
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$dltid;
			$dltinfo = $Dltype->where($map2)->find();
			if($dltinfo){
				$dlt_level=$dltinfo['dlt_level']; 
			}else{
				$this->error('没有该记录',U('Angels/Dealer/referee'),'',2);
			}

			$Dealer = M('Dealer');
			
			//我的级别
			$map2=array();
			$map2['dl_id']=session('jxuser_id');
			$map2['dl_unitcode']=$this->qy_unitcode;
			$data2=$Dealer->where($map2)->find();
			if($data2){
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$data2['dl_type'];
				$dltinfo3 = $Dltype->where($map3)->find();
				if($dltinfo3){
					$dlt_level3=$dltinfo3['dlt_level']; //我的级别
				}else{
					$this->error('没有该记录',U('Angels/Dealer/referee'),'',2);
				}
			}else{
				$this->error('没有该记录',U('Angels/Dealer/index'),'',2);
			}
			
            $map=array();
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_referee']=session('jxuser_id');
			$map['dl_type']=$dltid;
			$map['dl_status']=array('in','0,1,2');
			$dllist = $Dealer->where($map)->order('dl_id DESC')->select();

			$Orders = M('Orders');
			
			foreach($dllist as $k=>$v){
			    $dllist[$k]['dl_name']=wxuserTextDecode2($v['dl_name']);
				
				
				//当前上家
				if($v['dl_belong']>0){
					$map2=array();
					$map2['dl_id']=$v['dl_belong'];
					$map2['dl_unitcode']=$this->qy_unitcode;
					$data2 = $Dealer->where($map2)->find();
					if($data2){
						$dllist[$k]['dl_belong_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
					}else{
						$dllist[$k]['dl_belong_str']='';
					}
				}else{
					$dllist[$k]['dl_belong_str']='总公司';
				}
				
				//状态
				if($v['dl_status']==1){
					$dllist[$k]['dl_status_str']='(正常)';
				}else if($v['dl_status']==2){
				    $dllist[$k]['dl_status_str']='(上家已审)';
				}else if($v['dl_status']==0){
					$dllist[$k]['dl_status_str']='(待审核)';
				}else{
					$dllist[$k]['dl_status_str']='';
				}
			}

			
			$this->assign('dltinfo', $dltinfo);
			$this->assign('dllist', $dllist);
			$this->display('refereelist');
			
		}else{
			$this->error('没有该记录',U('Angels/Dealer/referee'),'',2);
		}
	}	

	
	//代理申请管理
    public function applylist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
        //待审核经销商
		$Dealer = M('Dealer');
        $map=array();
        $map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=0;
		$map['dl_logintime']=0;
        $list = $Dealer->where($map)->order('dl_id DESC')->select();
		$Dltype = M('Dltype');
		foreach($list as $k=>$v){
			$list[$k]['dl_name']=wxuserTextDecode2($v['dl_name']);
			//分类
			$map2=array();
			$map2['dlt_unitcode']=$this->qy_unitcode;
			$map2['dlt_id']=$v['dl_type'];
			$dltinfo = $Dltype->where($map2)->find();
			if($dltinfo){
				$list[$k]['level_name']=$dltinfo['dlt_name'];
			}else{
				$list[$k]['level_name']='';
			}
		}
		$this->assign('dllist', $list);
		
        $this->display('applylist');
	}
	
    //代理申请详细
	public function applydetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$Dealer = M('Dealer');
        $dlid=intval(I('get.dlid',0));
		$map=array();
		$map['dl_id']=$dlid;
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=0;
		
		$Dltype = M('Dltype');
		
		$data=$Dealer->where($map)->find();
		if($data){
            $imgpath = BASE_PATH.'/Public/uploads/dealer/';
			if(is_not_null($data['dl_idcardpic']) && file_exists($imgpath.$data['dl_idcardpic'])){
				$data['dl_idcardpic_str']='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_idcardpic'].'"   border="0"  style="width:40%;"  >';
			}else{
				$data['dl_idcardpic_str']='';
			}
			
			if(is_not_null($data['dl_idcardpic2']) && file_exists($imgpath.$data['dl_idcardpic2'])){
				$data['dl_idcardpic2_str']='<img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['dl_idcardpic2'].'"   border="0"  style="width:40%;"  >';
			}else{
				$data['dl_idcardpic2_str']='';
			}
			
			//推荐人
			if($data['dl_referee']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_referee'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_referee_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_referee_str']='';
				}
			}else{
				$data['dl_referee_str']='';
			}
			//上家代理
			if($data['dl_belong']>0){
				$map2=array();
				$map2['dl_id']=$data['dl_belong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2 = $Dealer->where($map2)->find();
				if($data2){
					$data['dl_belong_str']=$data2['dl_name'].' ('.$data2['dl_username'].')';
				}else{
					$data['dl_belong_str']='';
				}
			}else{
				$data['dl_belong_str']='总公司';
			}
			
			//级别1
			$map5=array();
			$map5['dlt_unitcode']=$this->qy_unitcode;
			$map5['dlt_id']=$data['dl_type'];
			$data5 = $Dltype->where($map5)->find();
			if($data5){
				$data['dlt_name']=$data5['dlt_name'];
			}else{
				$data['dlt_name']='';
			}
			
		}else{
			$this->error('没有该记录',U('Angels/Dealer/applylist'),1);
		}
		
		$this->assign('dlinfo', $data);
		$this->display('applydetail');
	}
	
    //经销商审核 并判断推荐返利
	public function applyactive(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
        $Dealer = M('Dealer');
        $dlid=intval(I('get.dlid',0));
		if($dlid>0){
			$map=array();
			$map['dl_id']=$dlid;
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_belong']=session('jxuser_id');
			$data = $Dealer->where($map)->find();
			if($data){
				$map3=array();
				$map3['dlt_unitcode']=$this->qy_unitcode;
				$map3['dlt_id']=$data['dl_type'];
				$Dltype = M('Dltype');
				$data3 = $Dltype->where($map3)->find();
				if($data3){
					$dlt_namestr=$data3['dlt_name'];
					$applydlt_level=$data3['dlt_level']; //申请代理的级别
				}else{
					$this->error('申请代理级别不存在','',2);
				}
				
				//上家代理直接审核通过
				$startdate=time();
				$data4['dl_status']=1;   //0-待审 1-已审 2-代理已审 9-禁用
				$data4['dl_startdate']=$startdate;  //代理开始时间，从审核当天算起
				$data4['dl_enddate']=$startdate+3600*24*365;    //代理结束时间，从审核当天加1年
				$rs=$Dealer->where($map)->data($data4)->save();
				if($rs){
					//推荐返利 begin
					$update_dl_referee=0;
                    //审核通过后 检测是否有推荐返利 级别1 
					//如果有推荐人 并设置了返利
					if($data['dl_referee']>0 && $data3['dlt_fanli1']>0){
						$map4=array();
						$data4=array();
						$map4['dl_id']=$data['dl_referee'];
						$map4['dl_unitcode']=$this->qy_unitcode;
						$map4['dl_status']=1;
						$data4 = $Dealer->where($map4)->find();
						if($data4){
							$map5=array();
							$map5['dlt_unitcode']=$this->qy_unitcode;
							$map5['dlt_id']=$data4['dl_type'];
							$data5 = $Dltype->where($map5)->find();
							if($data5){
								$refedlt_level=$data5['dlt_level']; //推荐人的级别
							}else{
								$this->error('推荐代理级别不存在','',2);
							}
							$dl_referee_name=$data4['dl_username'];
							
							//如果推荐人的级别低于申请人的级别 并且申请人的级别不是特约  则有返利
							if(($refedlt_level>=$applydlt_level) && $applydlt_level<6){
								//返利
								$Fanlidetail = M('Fanlidetail');
								$data5=array();
								$data5['fl_unitcode'] = $this->qy_unitcode;
								$data5['fl_dlid'] = $data4['dl_id']; //获得返利的代理
								$data5['fl_senddlid'] =session('jxuser_id'); //发放返利的代理
								$data5['fl_type'] = 1; // 返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利) 
								$data5['fl_money'] = $data3['dlt_fanli1'];
								$data5['fl_refedlid'] = $data['dl_id']; //推荐返利中被推荐的代理
								$data5['fl_oddlid'] = 0; //订单返利中 下单的代理
								$data5['fl_odid'] = 0;  //订单返利中 订单流水id
								$data5['fl_orderid']  = ''; //订单返利中 订单id
								$data5['fl_proid']  = 0;  //订单返利中 产品id
								$data5['fl_odblid']  = 0;  //订单返利中 订单关系id
								$data5['fl_qty']  = 0;  //订单返利中 产品数量
								$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
								$data5['fl_addtime']  = time();
								$data5['fl_remark'] ='邀请 '.$data['dl_username'].' 成为 '.$data3['dlt_name'].' 一次性返利';
								
								$map5=array();
								$map5['fl_unitcode'] = $this->qy_unitcode;
								$map5['fl_dlid'] = $data4['dl_id'];
								$map5['fl_type'] = 1;
								$map5['fl_refedlid'] = $data['dl_id'];
								$data6 = $Fanlidetail->where($map5)->find();
								if(!$data6){
									$rs5=$Fanlidetail->create($data5,1);
									$rs5id = $Fanlidetail->add();
								}
							}
						}
					}
					//返利 end
					
					//代理操作日志 begin
					$odlog_arr=array(
								'dlg_unitcode'=>$this->qy_unitcode,  
								'dlg_dlid'=>$dlid,
								'dlg_operatid'=>session('jxuser_id'),
								'dlg_dlusername'=>session('jxuser_username'),
								'dlg_dlname'=>session('jxuser_dlname'),
								'dlg_action'=>'审核代理商',
								'dlg_type'=>1, //0-企业 1-经销商
								'dlg_addtime'=>time(),
								'dlg_ip'=>real_ip(),
								'dlg_link'=>__SELF__
								);
					$Dealerlogs = M('Dealerlogs');
					$rs3=$Dealerlogs->create($odlog_arr,1);
					if($rs3){
						$Dealerlogs->add();
					}
					//代理操作日志 end
					
					if($update_dl_referee==1){
						//代理操作日志 begin
						$odlog_arr=array(
									'dlg_unitcode'=>$this->qy_unitcode,  
									'dlg_dlid'=>$dlid,
									'dlg_operatid'=>session('jxuser_id'),
									'dlg_dlusername'=>session('jxuser_username'),
									'dlg_dlname'=>session('jxuser_dlname'),
									'dlg_action'=>'更改代理的推荐人为('.$dl_referee_name2.') 原推荐人('.$dl_referee_name.')',
									'dlg_type'=>1, //0-企业 1-经销商
									'dlg_addtime'=>time(),
									'dlg_ip'=>real_ip(),
									'dlg_link'=>__SELF__
									);
						$Dealerlogs = M('Dealerlogs');
						$rs3=$Dealerlogs->create($odlog_arr,1);
						if($rs3){
							$Dealerlogs->add();
						}
						//代理操作日志 end
					}
					
					
				
					//记录日志 begin
					$log_arr=array();
					$log_arr=array(
								'log_qyid'=>session('jxuser_id'),
								'log_user'=>session('jxuser_username'),
								'log_qycode'=>$this->qy_unitcode,
								'log_action'=>'代理商审核下级',
								'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
								'log_addtime'=>time(),
								'log_ip'=>real_ip(),
								'log_link'=>__SELF__,
								'log_remark'=>json_encode($data)
								);
					save_log($log_arr);
					//记录日志 end
						
					$this->success('审核成功',U('Angels/Dealer/applylist'),1);
				}else{
					$this->error('审核失败',U('Angels/Dealer/applylist'),1);
				}
			}else{
				$this->error('没有该记录',U('Angels/Dealer/applylist'),1);
			}
		}else{
			$this->error('没有该记录',U('Angels/Dealer/applylist'),1);
		}
	}
	
    //经销商删除 申请记录
	public function applydelete(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$Dealer = M('Dealer');
        $dlid=intval(I('get.dlid',0));
		$map=array();
		$map['dl_id']=$dlid;
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_belong']=session('jxuser_id');
		$map['dl_status']=0;
		
		$data=$Dealer->where($map)->find();
		if($data){
			//验证是否要删除 要保持数据完整性 
		
			//是否有下级
			$map2=array();
			$map2['dl_belong']=$data['dl_id'];
			$map2['dl_unitcode']=$this->qy_unitcode;
			$data2 = $Dealer->where($map2)->find();
			if($data2){
				$this->error('该经销商含有下级，暂不能删除','',2);
			}

			//是否有收货
			$Shipment = M('Shipment');
			$map3['ship_unitcode']=$this->qy_unitcode;
			$map3['ship_dealer'] =$data['dl_id'];   //ship_deliver--出货方   ship_dealer--收货方
			$data3=$Shipment->where($map3)->find();
			if($data3){
				$this->error('该经销商含有出货记录，暂不能删除','',2);
			}
			
			//删除申请日志
			$Dealerlogs = M('Dealerlogs');
			$map2=array();
			$map2['dlg_unitcode']=$this->qy_unitcode;
			$map2['dlg_dlid']=$data['dl_id'];
			$Dealerlogs->where($map2)->delete(); 
			
			@unlink('./Public/uploads/dealer/'.$data['dl_pic']);   //删除授权书
			@unlink('./Public/uploads/dealer/'.$data['dl_idcardpic']);  //删除身份证件
			$Dealer->where($map)->delete(); 

			//记录日志 begin
			$log_arr=array();
			$log_arr=array(
						'log_qyid'=>session('jxuser_id'),
						'log_user'=>session('jxuser_username'),
						'log_qycode'=>$this->qy_unitcode,
						'log_action'=>'经销商删除下级',
						'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
						'log_addtime'=>time(),
						'log_ip'=>real_ip(),
						'log_link'=>__SELF__,
						'log_remark'=>json_encode($data)
						);
			save_log($log_arr);
			//记录日志 end
			
            $this->success('删除成功',U('Angels/Dealer/applylist'),1);
		}else{
			$this->error('没有该记录',U('Angels/Dealer/applylist'),'',1);
		}
	}
	
	
	//修改密码
    public function updatepwd(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $action=trim(I('post.action',''));
		
		if($action=='save'){
			$oldpwd=trim(I('post.oldpwd',''));
			$newpwd=trim(I('post.newpwd',''));
			$newpwd2=trim(I('post.newpwd2',''));
			
			if($oldpwd=='' || $newpwd=='' || $newpwd2==''){
				$msg=array('stat'=>'0','msg'=>'请输入密码');
				echo json_encode($msg);
				exit;
			}
			if($newpwd!=$newpwd2){
				$msg=array('stat'=>'0','msg'=>'输入两新密码不一致');
				echo json_encode($msg);
				exit;
			}
	
			$md5_oldpwd=MD5(MD5(MD5($oldpwd)));
			$md5_newpwd=MD5(MD5(MD5($newpwd)));
			
			$map['dl_id']=session('jxuser_id');
			$map['dl_unitcode']=$this->qy_unitcode;
			$Dealer= M('Dealer');
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_pwd']==$md5_oldpwd){
					
					$data2['dl_pwd']=$md5_newpwd;
				    $rs=$Dealer->where($map)->data($data2)->save();
					
					if($rs){
						$msg=array('stat'=>'1','msg'=>'修改密码成功');
						echo json_encode($msg);
						exit;
					}else{
						$msg=array('stat'=>'0','msg'=>'修改密码失败');
						echo json_encode($msg);
						exit;
					}
				}else{
					$msg=array('stat'=>'0','msg'=>'输入旧密码有误');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>'0','msg'=>'输入旧密码有误');
				echo json_encode($msg);
				exit;
			}	
		}
		
        $this->display('updatepwd');
    }

	//出货查询
	public function shipsearch(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$brcode=I('param.brcode','');
		$barr=explode(',',$brcode);
		$brcode=end($barr);
		if ($brcode!='') {
			if(!preg_match("/^[a-zA-Z0-9]{5,20}$/",$brcode)){
				$this->error('条码不正确','',2);
			}

			//检测是否已发行
			$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
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
			if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
				$where[]=array('EQ',$barcode['tcode']);
			}
			if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
				$where[]=array('EQ',$barcode['ucode']);
			}
			if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
				$where[]=array('EQ',$barcode['ucode']);
			}
			
			$where[]='or';
			$map['ship_barcode'] = $where;
			$map['ship_unitcode']=$this->qy_unitcode;
			$map['ship_deliver']=session('jxuser_id');//ship_deliver--出货方   ship_dealer--收货方
			$data=$Shipment->where($map)->find();
			
			if($data){
				$Dealer= M('Dealer');
				$Product = M('Product');
				$Warehouse = M('Warehouse');
				
				//上级经销商信息
				$map2=array();
				$map2['ship_unitcode']=$this->qy_unitcode;
				$map2['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
				$map2['ship_barcode'] = $brcode;
				$data2=$Shipment->where($map2)->find();
				if($data2){
					$barcode['ship_dealer_from']=$data2['ship_deliver'];  
					$barcode['ship_date_from']=$data2['ship_date'];  
				}else{
					$map3=array();
					$where3=array();
					
					if($barcode['code']!=''){
						$where3[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
						$where3[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
						$where3[]=array('EQ',$barcode['ucode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
						$where3[]=array('EQ',$barcode['ucode']);
					}
					
					
					$where3[]='or';
					$map3['ship_barcode'] = $where3;
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$data3=$Shipment->where($map3)->find();
					if(is_not_null($data3)){
						$barcode['ship_dealer_from']=$data3['ship_deliver'];  
						$barcode['ship_date_from']=$data3['ship_date'];
					}else{
						$barcode['ship_dealer_from']='';
						$barcode['ship_date_from']='';
					}
				
				}
				if($barcode['ship_dealer_from']==''){
					$barcode['ship_dealer_from_name']='';
				}else if($barcode['ship_dealer_from']==0){
					$barcode['ship_dealer_from_name']='总公司';
				}else{
					$map2=array();
					$map2['dl_id']=$barcode['ship_dealer_from'];
					$map2['dl_unitcode']=$this->qy_unitcode;
					$data2=$Dealer->where($map2)->find();
					if($data2){
						$barcode['ship_dealer_from_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
					}else{
						$barcode['ship_dealer_from_name']='';
					}
				}
				
				//对应发给的经销商
				$map2=array();
				$map2['dl_id']=$data['ship_dealer'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$map2['dl_belong']=session('jxuser_id');
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$barcode['ship_dealer_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
				}else{
					$barcode['ship_dealer_name']='';
				}
				
				//对应的产品
				$map2=array();
				$map2['pro_unitcode']=$this->qy_unitcode;
				$map2['pro_id'] = $data['ship_pro'];
				$Proinfo = $Product->where($map2)->find();
				if($Proinfo){
					$barcode['ship_pro_name']=$Proinfo['pro_name'];
					$barcode['ship_pro_number']=$Proinfo['pro_number'];
				}else{
					$barcode['ship_pro_name']='';
					$barcode['ship_pro_number']='';
				}
				
				//仓库
				$map2=array();
				$map2['wh_unitcode']=$this->qy_unitcode;
				$map2['wh_id'] = $data['ship_whid'];
				$warehouseinfo = $Warehouse->where($map2)->find();
				
				if($warehouseinfo){
					$barcode['ship_wh_name']=$warehouseinfo['wh_name'];
				}else{
					$barcode['ship_wh_name']='';
				}
				
			}else{
				//检测是否拆箱
				$map2=array();
				$Chaibox= M('Chaibox');
				$map2['chai_unitcode']=$this->qy_unitcode;
				$map2['chai_barcode'] = $brcode;
				$map2['chai_deliver'] = session('jxuser_id');
				$data2=$Chaibox->where($map2)->find();

				if($data2){
					$this->error('该条码已经拆箱出货','',2);
				}
				
				$this->error('该条码你没有操作权限或还没出货','',2);
			}
			
			$barcode['ship_date']=$data['ship_date'];
			$barcode['ship_number']=$data['ship_number'];
			
			
            $this->assign('shipinfo', $barcode);
			
			$this->display('shipsearchres');	
			exit;
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
        $this->display('shipsearch');	
	}
	
	
//	扫码出货
    public function shipadd(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

            $this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
        //--------------------------------

//        $this->check_qypurview('30002',1);
        $Dealer = M('Dealer');
        $map['dl_unitcode']=$this->qy_unitcode;
        $map['dl_status'] = 1;
        $map['dl_belong'] = session('jxuser_id');
        $list = $Dealer->where($map)->order('dl_number ASC')->select();
        foreach($list as $k=>$v){
            //直接下线数
            $map3=array();
            $map3['dl_belong']=$v['dl_id'];
            $map3['dl_unitcode']=$this->qy_unitcode;
            $count3 = $Dealer->where($map3)->count();
            $list[$k]['dl_subcount']=$count3;
            $list[$k]['dl_wxnickname']=wxuserTextDecode2($v['dl_wxnickname']);
        }
        $this->assign('dealerlist', $list);

        //产品
        $map2['pro_unitcode']=$this->qy_unitcode;
        $map2['pro_active'] = 1;
        $Product = M('Product');
        $list2 = $Product->where($map2)->order('pro_number ASC')->select();
        $this->assign('productlist', $list2);
        //仓库
        $map2=array();
        $map2['wh_unitcode']=$this->qy_unitcode;
        $Warehouse = M('Warehouse');
        $list3 = $Warehouse->where($map2)->order('wh_id ASC')->select();
        $this->assign('warehouselist', $list3);

        $data['ship_datestr']='';
        $data['ship_id']=0;
        $this->assign('shipmentinfo', $data);

        $this->assign('mtitle', '添加出货');
        $this->assign('curr', 'shipment_list');

        $this->display('shipadd');

    }
    //保存出货扫描
    public function shipadd_save(){

        if (!IS_POST) {
            header('HTTP/1.0 404 Not Found');
            echo'error:404';
            exit;
        }
        $map['ship_id']=intval(I('post.ship_id',0));


        if($map['ship_id']>0){
            $this->check_qypurview('30005',1);

            $map['ship_unitcode']=session('unitcode');
            $Shipment= M('Shipment');
            $data=$Shipment->where($map)->find();
            if($data){
                $ship_date=I('post.ship_date','');
                $ship_number=I('post.ship_number','');
                $ship_dealer=intval(I('post.ship_dealer',0));
                $ship_dealer2=intval(I('post.ship_dealer2',0));
                $ship_dealer3=intval(I('post.ship_dealer3',0));
                $ship_pro=intval(I('post.ship_pro',0));
                $ship_remark=I('post.ship_remark','');
                $ship_whid=intval(I('post.ship_whid',0));

                if($ship_date==''){
                    $this->error('请填写出货日期','',2);
                }
                $ship_date=strtotime($ship_date);
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

                //入库 记录拆箱 tcode-中    ucode-大
                $insert['ship_number']=$ship_number;
                $insert['ship_dealer']=$ship_dealer;
                $insert['ship_pro']=$ship_pro;
                $insert['ship_whid']=$ship_whid;
                $insert['ship_date']=$ship_date;
                $insert['ship_remark']=$ship_remark;
                $insert['ship_cztype']=0;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
                $insert['ship_czid']=session('qyid');
                $insert['ship_czuser']=session('qyuser');

                $rs=$Shipment->where($map)->data($insert)->save();

                if($rs){
                    //记录日志 begin
                    $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'修改出货',
                        'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($insert)
                    );
                    save_log($log_arr);
                    //记录日志 end

                    $this->success('修改成功',U('Mp/Shipment/index'),1);
                }elseif($rs===0){
                    $this->success('修改成功',U('Mp/Shipment/index'),1);
                }else{
                    $this->error('修改失败','',1);
                }
            }else{
                $this->error('没有该记录','',2);
            }
        }else{
//            $this->check_qypurview('30002',1);

//
            $ship_year=I('post.year','');
            $ship_month=I('post.month','');
            $ship_day=I('post.day','');
            $ship_date=$ship_year.'-'.$ship_month.'-'.$ship_day;
            $ship_date=strtotime($ship_date);
//            dump($ship_date);die();
            $ship_number=I('post.ship_number','');
            $ship_dealer=intval(I('post.ship_dealer',0));
            $ship_dealer2=intval(I('post.ship_dealer2',0));
            $ship_dealer3=intval(I('post.ship_dealer3',0));
            $ship_pro=intval(I('post.ship_pro',0));
            $ship_barcode=trim(I('post.ship_barcode',''));
            $ship_remark=I('post.ship_remark','');
            $ship_whid=intval(I('post.ship_whid',0));
            $ship_time=time();

//die();
            if($ship_date==''){
                $this->error('请填写出货日期','',2);
            }

            if($ship_number==''){
                $this->error('请填写出货单号','',2);
            }
            if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$ship_number)){
                $this->error('出货单号由数字字母组成','',2);
            }
            if($ship_dealer3>0){
                $ship_dealer=$ship_dealer3;
            }else if($ship_dealer2>0){
                $ship_dealer=$ship_dealer2;
            }

            if($ship_whid<=0){
                $this->error('请选择出货仓库','',2);
            }
            if($ship_dealer<=0){
                $this->error('请选择出货经销商客户','',2);
            }
            if($ship_pro<=0){
                $this->error('请选择出货产品','',2);
            }

            if($ship_barcode==''){
                $this->error('请扫描或填写条码','',2);
            }
//            if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$ship_barcode)){
//                $this->error('条码由数字字母组成','',2);
//            }

            $ship_barcode=str_replace("，",",",$ship_barcode);
            $ship_barcode=str_replace(".",",",$ship_barcode);
            $ship_barcode=str_replace("。",",",$ship_barcode);
            $linearr=explode(",",$ship_barcode);
//            dump($linearr);die();
            foreach($linearr as $key =>$li) {
                $ship_barcode = trim($li);
                if ($ship_barcode == '') {
                    continue;
                }
                $msgs[$key]['barcode'] = $ship_barcode;
                //检测该条码是否已存在
                $map['ship_unitcode'] = $this->qy_unitcode;
                $map['ship_barcode'] = $ship_barcode;
                $map['ship_deliver'] = session('jxuser_id');
                $Shipment = M('Shipment');
                $data = $Shipment->where($map)->find();
                if (is_not_null($data)) {
                    $this->error('该码已存在', '', 2);
                }

                //检测是否已发行
                $barcode = wlcode_to_packinfo($ship_barcode, $this->qy_unitcode);

                if (!is_not_null($barcode)) {
                    $this->error('条码还没发行', '', 2);
                }

                //是否出货
                $map = array();
                $where = array();
                if ($barcode['code'] != '') {
                    $where[] = array('EQ', $barcode['code']);
                }
                if ($barcode['tcode'] != '' && $barcode['tcode'] != $barcode['code']) {
                    $where[] = array('EQ', $barcode['tcode']);
                }
                if ($barcode['ucode'] != '' && $barcode['ucode'] != $barcode['code'] && $barcode['ucode'] != $barcode['tcode']) {
                    $where[] = array('EQ', $barcode['ucode']);
                }
                $where[] = 'or';
                $map['ship_barcode'] = $where;
                $map['ship_unitcode'] = $this->qy_unitcode;
                $map['ship_deliver'] = session('jxuser_id');
                $data = $Shipment->where($map)->find();
                if (is_not_null($data)) {
                    $this->error('该码已存在', '', 2);
                }

                //检测是否拆箱
                $map2['chai_unitcode'] = $this->qy_unitcode;
                $map2['chai_barcode'] = $ship_barcode;
                $map2['chai_deliver'] = session('jxuser_id');
                $Chaibox = M('Chaibox');
                $data2 = $Chaibox->where($map2)->find();

                if (is_not_null($data2)) {
                    $this->error('该码已经拆箱，不能再使用', '', 2);
                }

                $ship_proqty = $barcode['qty'];


                //入库 记录拆箱 tcode-大    ucode-中
                $insert['ship_unitcode'] = $this->qy_unitcode;
                $insert['ship_number'] = $ship_number;
                $insert['ship_deliver'] = session('jxuser_id');
                $insert['ship_dealer'] = $ship_dealer;
                $insert['ship_pro'] = $ship_pro;
                $insert['ship_whid'] = $ship_whid;
                $insert['ship_proqty'] = $ship_proqty;
                $insert['ship_barcode'] = $ship_barcode;
                $insert['ship_date'] = $ship_date;
                $insert['ship_ucode'] = $barcode['ucode'];
                $insert['ship_tcode'] = $barcode['tcode'];
                $insert['ship_remark'] = $ship_remark;
                $insert['ship_cztype'] = 2;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
                $insert['ship_czid'] = session('jxuser_id');
                $insert['ship_czuser'] = session('jxuser_username');

                $rs = $Shipment->create($insert, 1);
                if ($rs) {
                    $result = $Shipment->add();
                    if ($result) {
                        //记录拆箱
                        if ($barcode['tcode'] != '' && $barcode['tcode'] != $barcode['code']) {

                            $insert2['chai_unitcode'] = $this->qy_unitcode;
                            $insert2['chai_barcode'] = $barcode['tcode'];
                            $insert2['chai_deliver'] = session('jxuser_id');
                            $data3 = $Chaibox->where($insert2)->find();
                            if (!$data3) {
                                $insert2['chai_addtime'] = $ship_time;
                                $Chaibox->create($insert2, 1);
                                $Chaibox->add();

                            }
                        }
                        if ($barcode['ucode'] != '' && $barcode['ucode'] != $barcode['code'] && $barcode['ucode'] != $barcode['tcode']) {

                            $insert3['chai_unitcode'] = $this->qy_unitcode;
                            $insert3['chai_barcode'] = $barcode['ucode'];
                            $insert3['chai_deliver'] = session('jxuser_id');
                            $data4 = $Chaibox->where($insert3)->find();
                            if (!$data4) {
                                $insert3['chai_addtime'] = $ship_time;
                                $Chaibox->create($insert3, 1);
                                $Chaibox->add();

                            }
                        }

                        //记录日志 begin
                        $log_arr = array(
                            'log_qyid' => session('jxuser_id'),
                            'log_user' => session('jxuser_username'),
                            'log_qycode' => $this->qy_unitcode,
                            'log_action' => '出货扫描',
                            'log_type' => 1, //0-系统 1-企业 2-经销商 3-消费者
                            'log_addtime' => time(),
                            'log_ip' => real_ip(),
                            'log_link' => __SELF__,
                            'log_remark' => json_encode($insert)
                        );
                        save_log($log_arr);
                        //记录日志 end

                    } else {
                        $this->error('添加失败', '', 2);
                    }
                } else {
                    $this->error('添加失败', '', 2);
                }
            }
            $this->success('出货成功', U('Angels/Dealer/shipadd'), 1);
        }

    }
    //修改出货扫描
    public function shipedit(){
        $this->check_qypurview('30005',1);
        $map['ship_id']=intval(I('get.ship_id',0));
        $map['ship_unitcode']=session('unitcode');
        $Shipment= M('Shipment');
        $Chaibox= M('Chaibox');
        $data=$Shipment->where($map)->find();
        if($data){
            //在还没有向下级出货时可以修改
            $map2=array();
            $map2['ship_unitcode']=session('unitcode');
            $map2['ship_deliver']=array('gt',0);
            $map2['ship_id'] = array('NEQ',$data['ship_id']);

            $where=array();
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);
            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data2=$Shipment->where($map2)->find();
            if($data2){
                $this->error('该出货记录已被下级经销商重新出货，不能修改','',3);
            }
            $map2=array();
            $map2['dl_unitcode']=session('unitcode');
            $map2['dl_status'] = 1;
            $map2['dl_belong'] = 0;
            $Dealer = M('Dealer');
            $list = $Dealer->where($map2)->order('dl_number ASC')->select();
            foreach($list as $k=>$v){
                //直接下线数
                $map3=array();
                $map3['dl_belong']=$v['dl_id'];
                $map3['dl_unitcode']=session('unitcode');
                $count3 = $Dealer->where($map3)->count();
                $list[$k]['dl_subcount']=$count3;
                $list[$k]['dl_wxnickname']=wxuserTextDecode2($v['dl_wxnickname']);
            }
            $this->assign('dealerlist', $list);

            //产品
            $map2=array();
            $map2['pro_unitcode']=session('unitcode');
            $map2['pro_active'] = 1;
            $Product = M('Product');
            $list2 = $Product->where($map2)->order('pro_number ASC')->select();
            $this->assign('productlist', $list2);

            //仓库
            $map2=array();
            $map2['wh_unitcode']=session('unitcode');
            $Warehouse = M('Warehouse');
            $list3 = $Warehouse->where($map2)->order('wh_id ASC')->select();
            $this->assign('warehouselist', $list3);

            //原经销商
            $map2=array();
            $map2['dl_unitcode']=session('unitcode');
            $map2['dl_id'] = $data['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                $data['old_dl_name']=$Dealerinfo['dl_contact'].'('.$Dealerinfo['dl_name'].')';
            }else{
                $data['old_dl_name']='';
            }

            $data['ship_datestr']=date('Y-m-d',$data['ship_date']);
            $this->assign('shipmentinfo', $data);

        }else{
            $this->error('没有该记录','',2);
        }

        $this->assign('mtitle', '修改出货');
        $this->assign('action', 'update');
        $this->assign('curr', 'shipment_list');

        $this->display('add');
    }
    //经销商出货记录
    public function shiplist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$Shipment= M('Shipment');
		$Dealer= M('Dealer');
		$Product= M('Product');

        //出货记录
        $map=array();
		$parameter=array();
        $map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方

        $count = $Shipment->where($map)->count();
        $Page = new \Think\Page($count,50,$parameter);
        $show = $Page->show();
		if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Shipment->where($map)->order('ship_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		$Dealer = M('Dealer');
		foreach($list as $k=>$v){ 
		    //经销商
            $map2=array();
            $map2['dl_unitcode']=$this->qy_unitcode;
            $map2['dl_id'] = $v['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $list[$k]['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $list[$k]['dl_name']='-';
            }

			//对应的产品
			$map2=array();
			$map2['pro_unitcode']=$this->qy_unitcode;
			$map2['pro_id'] = $v['ship_pro'];
			$Proinfo = $Product->where($map2)->find();
			if($Proinfo){
				$list[$k]['ship_proname']=$Proinfo['pro_name'];
			}else{
				$list[$k]['ship_proname']='';
			}
		}
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('shiplist');
		
	}	
    
	//出货详细
    public function shipdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $shid=intval(I('get.shid',0));
		$map=array();
		$map['ship_id']=$shid;
		$map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_deliver']=session('jxuser_id');
		$Shipment= M('Shipment');
		$data=$Shipment->where($map)->find();
		if($data){
			$Dealer= M('Dealer');
			$Product = M('Product');
			//上级经销商信息
			$brcode=$data['ship_barcode'];
            $map2=array();
			$map2['ship_unitcode']=$this->qy_unitcode;
			$map2['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
			$map2['ship_barcode'] = $brcode;
			$data2=$Shipment->where($map2)->find();
		    if($data2){
                $data['ship_dealer_from']=$data2['ship_deliver'];  
				$data['ship_date_from']=$data2['ship_date'];  
		    }else{
				//检测是否已发行
				$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
				
				if(!is_not_null($barcode)){
					$data['ship_dealer_from']='';
					$data['ship_date_from']='';
				}else{
					$map3=array();
					$where3=array();
					if($barcode['code']!=''){
						$where3[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
						$where3[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
						$where3[]=array('EQ',$barcode['ucode']);
					}
					$where3[]='or';
					$map3['ship_barcode'] = $where3;
					$map3['ship_unitcode']=$this->qy_unitcode;
					$map3['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$data3=$Shipment->where($map3)->find();
					if(is_not_null($data3)){
                        $data['ship_dealer_from']=$data3['ship_deliver'];  
				        $data['ship_date_from']=$data3['ship_date'];
					}else{
					    $data['ship_dealer_from']='';
					    $data['ship_date_from']='';
					}
				}
		    }
			if($data['ship_dealer_from']==''){
				$data['ship_dealer_from_name']='';
			}else if($data['ship_dealer_from']==0){
				$data['ship_dealer_from_name']='总公司';
			}else{
				$map2=array();
				$map2['dl_id']=$data['ship_dealer_from'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['ship_dealer_from_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
				}else{
					$data['ship_dealer_from_name']='';
				}
			}
			
			//对应发给的经销商
		    $map2=array();
		    $map2['dl_id']=$data['ship_dealer'];
		    $map2['dl_unitcode']=$this->qy_unitcode;
		    $map2['dl_belong']=session('jxuser_id');
		    $data2=$Dealer->where($map2)->find();
			if($data2){
				$data['ship_dealer_name']=wxuserTextDecode2($data2['dl_name']).'('.$data2['dl_weixin'].')';
			}else{
			    $data['ship_dealer_name']='';
			}
			//对应的产品
            $map2=array();
            $map2['pro_unitcode']=$this->qy_unitcode;
            $map2['pro_id'] = $data['ship_pro'];
            $Proinfo = $Product->where($map2)->find();
            if($Proinfo){
                $data['ship_pro_name']=$Proinfo['pro_name'];
				$data['ship_pro_number']=$Proinfo['pro_number'];
            }else{
                $data['ship_pro_name']='';
				$data['ship_pro_number']='';
            }
		}else{
			$this->error('没有该记录','',2);
		}
        $this->assign('shipinfo', $data);

        $this->display('shipdetail');
	}	
	
    //经销商删除出货记录 只有下级经销商没有处理的条码才可以删除
    public function shdelete(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $shid=intval(I('get.shid',0));
		$map=array();
		$map['ship_id']=$shid;
		$map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
		$Shipment= M('Shipment');
		$data=$Shipment->where($map)->find();
        //判断是否可删 保持数据完整性

        if($data){
			
			//如果是按订单出货 并且已确认收货 
			if($data['ship_odid']>0 && $data['ship_odblid']>0){
				$Model=M();
				$map2=array();
				$order=array();
				$map2['a.od_unitcode']=$this->qy_unitcode;
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
			
            //如果下级经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$this->qy_unitcode;
            $map2['ship_deliver']=$date['ship_dealer'];

            $where=array();
			
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);

            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
               $this->error('该出货记录已被下级经销商重新出货，暂不能删除','',2);
            }
			
            $Chaibox= M('Chaibox');
            //判断处理拆箱记录
            if($data['ship_tcode']!='' || $data['ship_ucode']!=''){

				if($data['ship_ucode']!='' &&  $data['ship_tcode']==$data['ship_ucode']){	
                    $map2=array();
                    $map2['ship_ucode']=$data['ship_ucode'];
                    $map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_deliver']=session('jxuser_id');  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_ucode'];
                        $map3['chai_unitcode']=$this->qy_unitcode;
						$map3['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['ship_ucode']!=''  &&  $data['ship_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['ship_tcode']=$data['ship_tcode'];
                    $map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_deliver']=session('jxuser_id');  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_tcode'];
                        $map3['chai_unitcode']=$this->qy_unitcode;
						$map3['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['ship_ucode']=$data['ship_ucode'];
                    $map22['ship_unitcode']=$this->qy_unitcode;
					$map22['ship_deliver']=session('jxuser_id');  
                    $map22['ship_id'] = array('NEQ',$data['ship_id']);
                    $data22=$Shipment->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['ship_ucode'];
                        $map33['chai_unitcode']=$this->qy_unitcode;
						$map33['chai_deliver'] = session('jxuser_id');
                        $Chaibox->where($map33)->delete(); 
                    }
                }
            }
            $Shipment->where($map)->delete(); 
			
			
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('jxuser_id'),
						'log_user'=>session('jxuser_username'),
                        'log_qycode'=>$this->qy_unitcode,
                        'log_action'=>'经销商删除出货记录',
						'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            

			$this->success('删除成功',U('Angels/Dealer/shiplist'),2);
        }else{
            $this->error('没有该记录','',2);
        }     
    }
  
	
    //企业向直属经销商发申请链接
	public function qyshare(){
        if(C('IS_ONLYWEIXIN')==1){
			$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
			if (strpos($user_agent, 'micromessenger') === false){
				$this->error('请在微信客户端打开链接','',-1);
				exit;
			}
		}

		//验证是否有效链接
		$ttamp=trim(I('get.ttamp',''));
        $sture=trim(I('get.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
        if(($nowtime - $ttamp) > 3600) {
            $this->error('该链接已失效,请刷新二维码重新扫描','',2);
        }
		
		$dltid=intval(I('get.dltid',0));
		
		if($dltid>0){

			$Dltype = M('Dltype');
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$dltid;
			$dltypeinfo = $Dltype->where($map3)->find();
			$dlsttinfo=array();
			if($dltypeinfo){

			}else{

				$this->error('该链接已失效,请刷新二维码重新扫描','',2);

			}
		
		
			$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
			$signPackage = $Jssdk->GetSignPackage();
			$this->assign('signPackage', $signPackage);	
			
			$ttamp2=time();
			$sture2=MD5($fwkey.$ttamp2.$qy_fwsecret);
			$http_host=strtolower(htmlspecialchars('http://'.$_SERVER['HTTP_HOST'])).WWW_WEBROOT;
			$shlink=$http_host.'angels/dealer/qyjxapply/dltid/'.$dltid.'/ttamp/'.$ttamp2.'/sture/'.$sture2;
			
			$this->assign('shtitle', C('SHARE_TITLE'));
			$this->assign('shdesc', C('SHARE_DESC'));
			$this->assign('shlink', $shlink);
			$this->assign('shimgurl', $http_host.'public/angels/static/fenxiang.jpg');
			
			$this->assign('ttamp', $ttamp);
			$this->assign('sture', $sture);
			$this->assign('dltypeinfo', $dltypeinfo);
			$this->assign('dlsttinfo', $dlsttinfo);
			$this->display('qyshare');
			
		}else{
			//邀请级别1
			$Dltype = M('Dltype');
			$map=array();
			$map['dlt_unitcode']=$this->qy_unitcode;
			$dltypelist = $Dltype->where($map)->order('dlt_level ASC,dlt_id ASC')->select();
			
			$this->assign('dltypelist', $dltypelist);
			$this->assign('ttamp', $ttamp);
			$this->assign('sture', $sture);
			
			$this->display('qyinvite');
			
		}
	}
	
	//直属经销商申请
	public function qyjxapply(){
        if(C('IS_ONLYWEIXIN')==1){
			$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
			if (strpos($user_agent, 'micromessenger') === false){
				$this->error('请在微信客户端打开链接','',-1);
				exit;
			}
		}

		$action=trim(I('post.action',''));
		
		//保存提交申请
	    if ($action=='save') {
			
			$dltid=intval(I('post.dltype',0));
		    $dl_name=trim(I('post.dl_name',''));
			$dl_weixin=trim(I('post.dl_weixin',''));
			$dl_tel=trim(I('post.dl_tel',''));
			$dl_idcard=I('post.dl_idcard','');
			$dl_address=I('post.dl_address','');
			$seachprov=I('post.seachprov','0');
			$seachcity=I('post.seachcity','0');
			$seachdistrict=I('post.seachdistrict','0');
			$diqustr=I('post.diqustr','');
			
			//判断链接是否失效
			$ttamp=trim(I('post.ttamp',''));
			$sture=trim(I('post.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
                $this->error('该邀请链接已失效','',2);
			}
			if(($nowtime - $ttamp) >3600) {
				$this->error('该邀请链接已失效','',2);
			}
			
			if($dltid<=0){
                $this->error('请选择代理级别','',2);
			}
			if($dl_name==''){
				$this->error('请填写你的姓名','',2);
			}
			if($dl_weixin==''){
                $this->error('请填写微信号','',2);
			}
			
			if(!preg_match("/^[a-zA-Z0-9_-]{6,20}$/",$dl_weixin)){
				$this->error('请正确填写微信号，微信号支持6-20个字母、数字、下划线和减号','',2);
			}
			
			if($dl_tel==''){
                $this->error('请填写手机号','',2);
			}
			if(!preg_match("/^[a-zA-Z0-9_-]{10,20}$/",$dl_tel)){
				$this->error('请正确填写手机号','',2);
			}
			
			if($dl_idcard==''){
                $this->error('请填写身份证','',2);
			}
			if($dl_address==''){
                $this->error('请填写收货地址','',2);
			}
			if($diqustr==''){
                $this->error('请选择城市地区','',2);
			}
			
			$Dltype= M('Dltype');
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$dltid;
			$dltypeinfo = $Dltype->where($map3)->find();
			
			$dlsttypeid=0;
			if($dltypeinfo){
                $apply_level=$dltypeinfo['dlt_level'];  //申请的级别
			}else{

				$this->error('该邀请链接已失效','',2);

			}
			
			
			$Dealer= M('Dealer');
		
			//确保账户名唯一
			$map=array();
			$map['dl_username']=$dl_weixin;
			$map['dl_unitcode']=$this->qy_unitcode;
			$data=$Dealer->where($map)->find();
			if($data){
                $this->error('对不起，该微信号已存在','',2);
			}
			
			//确保微信号唯一
			$map2=array();
            $map2['dl_weixin']=$dl_weixin;
            $map2['dl_unitcode']=$this->qy_unitcode;
            $data2=$Dealer->where($map2)->find();
			if($data2){
				$this->error('对不起，该微信号已存在','',2);
			}
			
			//确保电话号唯一
			$map2=array();
            $map2['dl_tel']=$dl_tel;
            $map2['dl_unitcode']=$this->qy_unitcode;
            $data2=$Dealer->where($map2)->find();
			if($data2){
				$this->error('对不起，该手机号已存在','',2);
			}
			
			//保存文件 begin  身份证图片
            $file_name=I('post.file_name','');
			$file_name2=I('post.file_name2','');
			$dl_idcardpic='';
			$dl_idcardpic2='';
			if($file_name=='' || $file_name2==''){
				//$this->error('上传身份证图片','',2);
			}else{
				$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
				$temppath=BASE_PATH.'/Public/uploads/temp/';
				if(!file_exists($imgpath)) {
					mkdir($imgpath);
				}
				if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
					$dl_idcardpic=$this->qy_unitcode.'/'.$file_name;
					@unlink($temppath.$file_name); 
					
					if(copy($temppath.$file_name2,$imgpath.'/'.$file_name2)) {
						$dl_idcardpic2=$this->qy_unitcode.'/'.$file_name2;
					    @unlink($temppath.$file_name2); 
					}else{
						@unlink($imgpath.'/'.$file_name); 
						$this->error('上传图片失败','',2);
					}
				}else{
					$this->error('上传图片失败','',2);
				}
			}
			
			
			if($dl_idcardpic=='' || $dl_idcardpic2==''){
			    //$this->error('上传身份证图片','',2);
			}
			//保存文件 end
			
			//推荐人直属公司
			//上家直属公司
			
			$md5_pwd=MD5(MD5(MD5(substr($dl_tel,-6))));
			
			$data2=array();
			$data2['dl_username']=$dl_weixin;
			$data2['dl_pwd']=$md5_pwd;
			$data2['dl_number']='';
			$data2['dl_unitcode']=$this->qy_unitcode;
			$data2['dl_name']=$dl_name;
			$data2['dl_contact']=$dl_name;
			$data2['dl_tel']=$dl_tel;
			$data2['dl_idcard']=$dl_idcard;
			$data2['dl_idcardpic']=$dl_idcardpic;
			$data2['dl_idcardpic2']=$dl_idcardpic2;
			$data2['dl_tbdian']='';
			$data2['dl_tbzhanggui']='';
			$data2['dl_addtime']=time();
			$data2['dl_status']=0;
			$data2['dl_level']=$apply_level;
			$data2['dl_type']=$dltid;   //代理等级
			$data2['dl_sttype']=$dlsttypeid;   //代理等级2
			$data2['dl_belong']=0;       //上家直属公司
			$data2['dl_referee']=0;  //推荐人直属公司
			$data2['dl_remark']='';
			$data2['dl_address']=$dl_address;
			$data2['dl_sheng']=$seachprov;
			$data2['dl_shi']=$seachcity;
			$data2['dl_qu']=$seachdistrict;
			$data2['dl_qustr']=$diqustr;
			
			$data2['dl_openid']='';
			$data2['dl_weixin']=$dl_weixin;
			$data2['dl_wxnickname']='';
			$data2['dl_wxsex']=0;
			$data2['dl_wxprovince']='';
			$data2['dl_wxcity']='';
			$data2['dl_wxcountry']='';
			$data2['dl_wxheadimg']='';
			$data2['dl_brand']='';
			$data2['dl_brandlevel']='';
			
			
            $rs=$Dealer->create($data2,1);
			$result = $Dealer->add(); 
			if($result){
				//添加地址
				$data3=array();
				$data3['dladd_unitcode'] = $this->qy_unitcode;
				$data3['dladd_dlid'] = $result;
				$data3['dladd_contact'] = $dl_name;
				$data3['dladd_sheng'] = $seachprov;
				$data3['dladd_shi'] = $seachcity;
				$data3['dladd_qu'] = $seachdistrict;
				$data3['dladd_diqustr'] = $diqustr;
				$data3['dladd_address'] = $dl_address;
				$data3['dladd_tel'] = $dl_tel;	
				$data3['dladd_default'] = 1;	
				
                $Dladdress = M('Dladdress');
				$rs3=$Dladdress->create($data3,1);
				if($rs3){
				   $Dladdress->add();
				}

				//代理操作日志 begin
				$odlog_arr=array(
							'dlg_unitcode'=>$this->qy_unitcode,  
							'dlg_dlid'=>$result,
							'dlg_operatid'=>$result,
							'dlg_dlusername'=>$data2['dl_username'],
							'dlg_dlname'=>$data2['dl_name'],
							'dlg_action'=>'代理商注册 公司邀请',
							'dlg_type'=>1, //0-企业 1-经销商
							'dlg_addtime'=>time(),
							'dlg_ip'=>real_ip(),
							'dlg_link'=>__SELF__
							);
				$Dealerlogs = M('Dealerlogs');
				$rs3=$Dealerlogs->create($odlog_arr,1);
				if($rs3){
					$Dealerlogs->add();
				}
				//代理操作日志 end
				
                //记录日志 begin  系统
				$log_arr=array();
				$log_arr=array(
							'log_qyid'=>$result,
							'log_user'=>$dl_weixin,
							'log_qycode'=>$this->qy_unitcode,
							'log_action'=>'代理商注册',
							'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
							'log_addtime'=>time(),
							'log_ip'=>real_ip(),
							'log_link'=>__SELF__,
							'log_remark'=>json_encode($data2)
							);
				save_log($log_arr);
				//记录日志 end

				//获取代理最大编号
				$Dealer=M('Dealer');
				$map=array();
				$map['dl_unitcode']=$this->qy_unitcode;
				// $map['dl_status']=1;
				// $maxDlnum=$Dealer->where($map)->select();
				$maxDlnumStr=$Dealer->field('dl_number')->where($map)->order('dl_number DESC')->find();
				$maxDlnum=preg_replace('/[^\.0123456789]/s', '',$maxDlnumStr['dl_number']);
				$dlNumber=$maxDlnum+1;
				if ($dlNumber>7700)
				{
				}else
				{
					$dlNumber=7700;
				}

				//添加编号
				$map=array();
				$map['dl_id']=$result;
				$map['dl_unitcode']=$this->qy_unitcode;
				$data=array();
				$data['dl_number'] ='N'.str_pad($dlNumber,6,'0',STR_PAD_LEFT);
				$Dealer->where($map)->save($data);
				
				$this->success('您的申请提交成功，请等待审核，用户名：'.$dl_weixin.' 密码：'.substr($dl_tel,-6).'',U('Angels/Index/index'),999);
				exit;
			}else{
				$this->error('申请提交失败','',2);
			}
		}
	
		//验证是否有效链接
		$ttamp=trim(I('get.ttamp',''));
        $sture=trim(I('get.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('该邀请链接已失效,','',2);
		}
        if(($nowtime - $ttamp) > 3600) {
            $this->error('该邀请链接已失效','',2);
        }
	
		$dltid=intval(I('get.dltid',0));
		
		$Dltype = M('Dltype');
		
		if($dltid>0){
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$dltid;
			$dltypeinfo = $Dltype->where($map3)->find();
			$dlsttinfo=array();
			if($dltypeinfo){

			}else{

				$this->error('该邀请链接已失效,','',2);
			}
		
		}else{
			$this->error('该邀请链接已失效,','',2);
		}
		
		$this->assign('dlsttinfo', $dlsttinfo);
		$this->assign('dltypeinfo', $dltypeinfo);
		$this->assign('dltid', $dltid);
		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);
		$this->display('qyjxapply');
	}
    

   //经销商出货扫描
    public function shipscan(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$jxoddcount=session('jxoddcount'); 
		if(is_not_null($jxoddcount)){
			
		}else{
			$this->redirect('Angels/Dealer/makeshipodd','' , 0, ''); //创建出货单号
		}
		
	    //统计扫描纪录
		$brcodestr=session('jxbrcode');

		$scancount=0;
		$scanprocount=0; //已扫产品数
		if(is_not_null($brcodestr)){
			$brcodearr=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
			foreach($brcodearr as $k=>$v){
				if(intval($v['qty'])>0){
					$scancount=$scancount+1;
					$scanprocount=$scanprocount+intval($v['qty']);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		$this->assign('jxoddcount', $jxoddcount);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		
        $this->display('shipscan');
	}	
	
    //创建出货单号
    public function makeshipodd(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$action=trim(I('get.action',''));
		
		if($action=='save'){
			$Dealer= M('Dealer');
			$map=array();
			$map['dl_id']=session('jxuser_id');
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_status']=1;
			$data=$Dealer->where($map)->find();
			if($data){
				$dl_oddtime=$data['dl_oddtime'];
				$dl_oddcount=$data['dl_oddcount'];
                
				$nowoddtime=strtotime(date('Y-m-d'));
				if($dl_oddtime!=$nowoddtime){
					$nowoddcount=1;
				}else{
					$nowoddcount=$dl_oddcount+1;
				}
				$map2=array();
			    $map2['dl_id']=session('jxuser_id');
			    $map2['dl_unitcode']=$this->qy_unitcode;
				$map2['dl_oddtime']=$nowoddtime;
				$map2['dl_oddcount']=$nowoddcount;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$this->redirect('Angels/Dealer/makeshipodd','' , 0, '');
				}else{
					$data3=array();
					$data3['dl_oddtime']=$nowoddtime;
					$data3['dl_oddcount']=$nowoddcount;
					$rs=$Dealer->where($map)->data($data3)->save();
					if($rs){
						if(strlen($nowoddcount)>4){
							$jxoddcount=date('Ymd',$nowoddtime).$nowoddcount;
						}else{
							$jxoddcount=date('Ymd',$nowoddtime).str_pad($nowoddcount,4,'0',STR_PAD_LEFT);
						}
						
						session('jxoddcount',$jxoddcount); 
						
						$this->redirect('Angels/Dealer/shipscan','' , 0, '');
					}else{
						$this->error('创建出货单号失败',U('Angels/Dealer/index'),2);
					}
				}
			}else{
				$this->error('授权已过期，请重新登录',U('Angels/Dealer/index'),1);
				exit;
			}
		}
        $this->display('makeshipodd');
	}
	

	//经销商出货扫描结果
    public function shipscanres(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $jxoddcount=session('jxoddcount'); 
		if(is_not_null($jxoddcount)){
			
		}else{
			$this->redirect('Angels/Dealer/makeshipodd','' , 0, ''); //创建出货单号
		}
		
		$brcode=I('get.brcode','');
		$msg='';
		$success=0;
		if($brcode==''){
			$msg='条码不能为空';
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
		
		//检测该条码是否属于该经销商1
		$map=array();
		$data=array();
		$Shipment= M('Shipment');
		$Chaibox= M('Chaibox');
        $barcode=array();
		
		$map['ship_unitcode']=$this->qy_unitcode;
		$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
		$map['ship_barcode'] = $brcode;
		$data=$Shipment->where($map)->find();
		if($data){
			//检测该条码是否已被使用1
			$map2=array();
			$map2['ship_unitcode']=$this->qy_unitcode;
			$map2['ship_barcode'] = $brcode;
			$map2['ship_deliver']=session('jxuser_id');
			
			$data2=$Shipment->where($map2)->find();
			if($data2){
				$msg='条码 <b>'.$brcode.'</b> 已出货';
				goto gotoEND;
				exit;
			}else{
				$barcode['code']=$data['ship_barcode'];
				$barcode['tcode']=$data['ship_tcode'];
				$barcode['ucode']=$data['ship_ucode'];
				$barcode['qty']=$data['ship_proqty'];
				$barcode['pro']=$data['ship_pro'];
				$barcode['shipnumber']=$data['ship_number'];
			}
		}else{
			//检测是否已发行
            $barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
			
			if(!is_not_null($barcode)){
				$msg='条码 <b>'.$brcode.'</b> 不存在或还没发行';
				goto gotoEND;
				exit;
			}

            //检测该条码是否属于该经销商2
			$map=array();
			$where=array();
			
			//tcode-  中标    ucode-大标   code--当前条码
			if($barcode['code']!=''){
				$where[]=array('EQ',$barcode['code']);
			}
			if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
				$where[]=array('EQ',$barcode['tcode']);
			}
			if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
				$where[]=array('EQ',$barcode['ucode']);
			}
			if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
				$where[]=array('EQ',$barcode['ucode']);
			}
			
			
			$where[]='or';
			$map['ship_barcode'] = $where;
			$map['ship_unitcode']=$this->qy_unitcode;
			$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
			$data=$Shipment->where($map)->find();
			if(is_not_null($data)){
				//检测该条码是否已被使用2
				$map2=array();
				$where2=array();

				if($barcode['code']!=''){
					$where2[]=array('EQ',$barcode['code']);
				}
				if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
					$where2[]=array('EQ',$barcode['tcode']);
				}
				if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
					$where2[]=array('EQ',$barcode['ucode']);
				}
				if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
					$where2[]=array('EQ',$barcode['ucode']);
				}
				
				
				$where2[]='or';
				$map2['ship_barcode'] = $where2;
				$map2['ship_unitcode']=$this->qy_unitcode;
				$map2['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
				$data2=$Shipment->where($map2)->find();
                if($data2){
					$msg='条码 <b>'.$brcode.'</b> 已出货';
					goto gotoEND;
					exit;
			    }	
				$barcode['pro']=$data['ship_pro'];
				$barcode['shipnumber']=$data['ship_number'];
			}else{
				$msg='对不起，你没有条码 <b>'.$brcode.'</b> 操作权限';
				$barcode=array();
				goto gotoEND;
				exit;
			}
		}
		
		//检测是否拆箱
		$map2=array();
		$map2['chai_unitcode']=$this->qy_unitcode;
		$map2['chai_barcode'] = $brcode;
		$map2['chai_deliver'] = session('jxuser_id');
		$data2=$Chaibox->where($map2)->find();
		if($data2){
			$msg='条码 <b>'.$brcode.'</b> 已经拆箱，不能再使用';
			$barcode=array();
			goto gotoEND;
			exit;
		}
		
		if(is_not_null($barcode)){
			$Product = M('Product');
            $map2=array();
            $map2['pro_unitcode']=$this->qy_unitcode;
            $map2['pro_id'] = $barcode['pro'];
            $Proinfo = $Product->where($map2)->find();
            if($Proinfo){
                $barcode['pro_name']=$Proinfo['pro_name'];
            }else{
                $barcode['pro_name']='';
            }
			//暂存session
			$brcodestr=session('jxbrcode');
			$brcodearr=array();
			
			if(is_not_null($brcodestr)){
				$brcodearr=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
								
				if(array_key_exists(strval($brcode),$brcodearr)===false){
					
					if($barcode['tcode']=='' && $barcode['ucode']==''){
						if(array_key_exists(strval($brcode),$brcodearr)===false){
							$brcodearr[strval($brcode)]=array('pro'=>$barcode['pro'],'qty'=>$barcode['qty']);;
						}else{
							$msg='条码 <b>'.$brcode.'</b> 的小标条码已在扫描记录里';
							$barcode=array();
							goto gotoEND;
							exit;
						}
					}else{
						if($barcode['ucode']==$barcode['tcode']){
							if(array_key_exists(strval($barcode['tcode']),$brcodearr)===false){	
							    if(array_key_exists(strval($brcode),$brcodearr)===false){
									$brcodearr[strval($brcode)]=array('pro'=>$barcode['pro'],'qty'=>$barcode['qty']);;
								}else{
									$msg='条码 <b>'.$brcode.'</b> 的小标条码已在扫描记录里';
									$barcode=array();
									goto gotoEND;
									exit;
								}
								
							}else{
								$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}else{
							if(array_key_exists(strval($barcode['ucode']),$brcodearr)===false  && array_key_exists(strval($barcode['tcode']),$brcodearr)===false){
							    $brcodearr[strval($brcode)]=array('pro'=>$barcode['pro'],'qty'=>$barcode['qty']);;
							}else{
								$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
								$barcode=array();
								goto gotoEND;
								exit;
							}
						}
					}
				}else{
					$msg='条码 <b>'.$brcode.'</b> 已在扫描记录里';
					$barcode=array();
					goto gotoEND;
					exit;
				}
			}else{
				
				$brcodearr[strval($brcode)]=array('pro'=>$barcode['pro'],'qty'=>$barcode['qty']);
			}
			
			$brcodestr=json_encode($brcodearr);
			session('jxbrcode',$brcodestr); 
			
			$msg='条码 <b>'.$brcode.'</b> 扫描成功!';
			$success=1;
		}else{
			$msg='对不起，你没有条码 <b>'.$brcode.'</b> 操作权限';
			$barcode=array();
			goto gotoEND;
			exit;
		}

		/////////////
		gotoEND:
		
	    //统计扫描纪录
		$brcodestr=session('jxbrcode');

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
					$scancount=$scancount+1;
					$scanprocount=$scanprocount+intval($v['qty']);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		$this->assign('jxoddcount', $jxoddcount);
		
		$this->assign('msg', $msg);
		$this->assign('barinfo', $barcode);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		$this->assign('success', $success);
        $this->display('shipscanres');
		
	}	
	
    //经销商出货扫描记录
    public function shipscanlist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
        $jxoddcount=session('jxoddcount'); 
		if(is_not_null($jxoddcount)){
			
		}else{
			$this->redirect('Angels/Dealer/makeshipodd','' , 0, ''); //创建出货单号
		}
		
	    $brcodestr=session('jxbrcode');
		$brcodearr=array();

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
					$scancount=$scancount+1;
					$scanprocount=$scanprocount+intval($v['qty']);
					
					$map2=array();
					$map2['pro_unitcode']=$this->qy_unitcode;
					$map2['pro_id'] = $v['pro'];
					$Proinfo = $Product->where($map2)->find();
					if($Proinfo){
						$brcodearr[$k]['pro_name']=$Proinfo['pro_name'];
					}else{
						$brcodearr[$k]['pro_name']='';
					}
				}else{
					unset($brcodearr[$k]);
				}
			}
		}

		if(count($brcodearr)<=0){
			$this->error('没有扫描纪录',U('Angels/Dealer/shipscan'),2);
		}
		
		$this->assign('jxoddcount', $jxoddcount);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		$this->assign('jishu', 1);
	    $this->assign('list', $brcodearr);
        $this->display('shipscanlist');
	}	
	
   //经销商出货扫描记录-移除
    public function shipremove(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
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
		
		$brcodestr=session('jxbrcode');
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
		session('jxbrcode',$brcodestr); 
		
        $this->success('移除成功',U('Angels/Dealer/shipscanlist'),1);
	}
	
    //经销商出货-确认出货
    public function shipping(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
        $jxoddcount=session('jxoddcount'); 
		if(is_not_null($jxoddcount)){
			
		}else{
			$this->redirect('Angels/Dealer/makeshipodd','' , 0, ''); //创建出货单号
		}

		$step=intval(I('get.step',0));
		if($step==1){  //确认出货
			$ship_dealer=intval(I('get.ship_dealer',0));
			if($ship_dealer<=0){
				$this->error('请选择下级经销商','',2);
			}
			$brcodestr=session('jxbrcode');
			$brcodearr=array();
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
						$scancount=$scancount+1;
						$scanprocount=$scanprocount+intval($v['qty']);
					}else{
						unset($brcodearr[$k]);
					}
				}
			}
			
			if(count($brcodearr)<=0){
				$this->error('没有扫描纪录',U('Angels/Dealer/shipscan'),2);
			}
			
			//验证经销商
			$Dealer = M('Dealer');
			$map2=array();
			$map2['dl_id']=$ship_dealer;
			$map2['dl_belong']=session('jxuser_id');
			$map2['dl_status']=1;
			$dealerinfo=$Dealer->where($map2)->find();
			if($dealerinfo){
				$dealerinfo['dl_name']=wxuserTextDecode2($dealerinfo['dl_name']);
			}else{
				$this->error('该经销商还没审核或已禁用','',2);
			}
			
			
			$Shipment= M('Shipment');
			$Chaibox= M('Chaibox');
			$ship_time=time();
			$brcarr=array();
			$kk=0;
			$success=0;
			$fail=0;
			foreach($brcodearr as $key=>$v){ 

				$brcode=$key;
				if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
					$brcarr[$kk]['barcode']=$brcode;
					$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
					$brcarr[$kk]['qty']=0;
					$kk=$kk+1;
					$fail=$fail+1;
					continue;
				}
						
				//检测该条码是否属于该经销商1
				$map=array();
				$data=array();
				$barcode=array();
				$map['ship_unitcode']=$this->qy_unitcode;
				$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
				$map['ship_barcode'] = $brcode;
				$data=$Shipment->where($map)->find();
				if($data){
					//检测该条码是否已被使用1
					$map2=array();
					$data2=array();
					$map2['ship_unitcode']=$this->qy_unitcode;
					$map2['ship_barcode'] = $brcode;
					$map2['ship_deliver']=session('jxuser_id');
							
					$data2=$Shipment->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}else{
						$barcode['code']=$data['ship_barcode'];
						$barcode['tcode']=$data['ship_tcode'];
						$barcode['ucode']=$data['ship_ucode'];
						$barcode['qty']=$data['ship_proqty'];
						$barcode['pro']=$data['ship_pro'];
						$barcode['shipnumber']=$data['ship_number'];
					}
				}else{
					//检测是否已发行
					$barcode=wlcode_to_packinfo($brcode,$this->qy_unitcode);
							
					if(!is_not_null($barcode)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码不存在或还没发行</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
							
					//检测该条码是否属于该经销商2
					$map=array();
					$where=array();
					$data=array();
					
					if($barcode['code']!=''){
						$where[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
						$where[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
						$where[]=array('EQ',$barcode['ucode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
						$where[]=array('EQ',$barcode['ucode']);
					}
					
					
					$where[]='or';
					$map['ship_barcode'] = $where;
					$map['ship_unitcode']=$this->qy_unitcode;
					$map['ship_dealer']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
					$data=$Shipment->where($map)->find();
					if(is_not_null($data)){
						//检测该条码是否已被使用2
						$map2=array();
						$where2=array();
						$data2=array();
						
						if($barcode['code']!=''){
							$where2[]=array('EQ',$barcode['code']);
						}
						if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
							$where2[]=array('EQ',$barcode['tcode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
							$where2[]=array('EQ',$barcode['ucode']);
						}
						if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
							$where2[]=array('EQ',$barcode['ucode']);
						}
						
						
						$where2[]='or';
						$map2['ship_barcode'] = $where2;
						$map2['ship_unitcode']=$this->qy_unitcode;
						$map2['ship_deliver']=session('jxuser_id');   //ship_deliver--出货方   ship_dealer--收货方
						$data2=$Shipment->where($map2)->find();
						if($data2){
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
							$brcarr[$kk]['qty']=$barcode['qty'];
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}
						$barcode['pro']=$data['ship_pro'];
						$barcode['whid']=$data['ship_whid'];
						$barcode['shipnumber']=$data['ship_number'];
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
						$brcarr[$kk]['qty']=$barcode['qty'];
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
				}
				//检测是否拆箱
				$map2=array();
				$data2=array();
				$map2['chai_unitcode']=$this->qy_unitcode;
				$map2['chai_barcode'] = $brcode;
				$map2['chai_deliver'] = session('jxuser_id');
				$data2=$Chaibox->where($map2)->find();
				if($data2){
					$brcarr[$kk]['barcode']=$brcode;
					$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已经拆箱，不能再使用</span>';
					$brcarr[$kk]['qty']=$barcode['qty'];
					$kk=$kk+1;
					$fail=$fail+1;
					continue;
				}
				//保存记录
				if(is_not_null($barcode)){
					$insert=array();
					$insert['ship_unitcode']=$this->qy_unitcode;
					$insert['ship_number']=$jxoddcount;  //如果按订单发货 这里放订单号 不是 就放发货单号
					$insert['ship_deliver']=session('jxuser_id');
					$insert['ship_dealer']=$ship_dealer;   //ship_dealer--收货方
					$insert['ship_pro']=$barcode['pro'];
					$insert['ship_odid']=0;
					$insert['ship_odblid']=0;
					$insert['ship_whid']=$barcode['whid'];
					$insert['ship_proqty']=$barcode['qty'];
					$insert['ship_barcode']=$brcode;
					$insert['ship_date']=$ship_time;
					$insert['ship_ucode']=$barcode['ucode'];
					$insert['ship_tcode']=$barcode['tcode'];
					$insert['ship_remark']='';
					$insert['ship_cztype']=2;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
					$insert['ship_czid']=session('jxuser_id');
					$insert['ship_czuser']=session('jxuser_username');

					$rs=$Shipment->create($insert,1);
					if($rs){
					   $result = $Shipment->add(); 
					   if($result){
							//记录拆箱
							if($barcode['ucode']!='' && $barcode['tcode']==$barcode['ucode']){
								$insert2=array();
								$data3=array();
								$insert2['chai_unitcode']=$this->qy_unitcode;
								$insert2['chai_barcode']=$barcode['ucode'];
								$insert2['chai_deliver']=session('jxuser_id');
								$data3=$Chaibox->where($insert2)->find();
								if(!$data3){
									$insert2['chai_addtime']=$ship_time;
									$Chaibox->create($insert2,1);
									$Chaibox->add(); 
								}
							}
							
							if($barcode['ucode']!='' && $barcode['tcode']!=$barcode['ucode']){
								$insert3=array();
								$data4=array();
								$insert3['chai_unitcode']=$this->qy_unitcode;
								$insert3['chai_barcode']=$barcode['tcode'];
								$insert3['chai_deliver']=session('jxuser_id');
								$data4=$Chaibox->where($insert3)->find();
								if(!$data4){
									$insert3['chai_addtime']=$ship_time;
									$Chaibox->create($insert3,1);
									$Chaibox->add(); 
								}	
								
								$insert3=array();
								$data4=array();
								$insert3['chai_unitcode']=$this->qy_unitcode;
								$insert3['chai_barcode']=$barcode['ucode'];
								$insert3['chai_deliver']=session('jxuser_id');
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
										'log_qyid'=>session('jxuser_id'),
										'log_user'=>session('jxuser_username'),
										'log_qycode'=>$this->qy_unitcode,
										'log_action'=>'经销商出货',
										'log_type'=>2, //0-系统 1-企业 2-经销商 3-消费者
										'log_addtime'=>time(),
										'log_ip'=>real_ip(),
										'log_link'=>__SELF__,
										'log_remark'=>json_encode($insert)
										);
							save_log($log_arr);
							//记录日志 end
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='添加条码 <b>'.$brcode.' </b> 成功。';
							$brcarr[$kk]['qty']=$barcode['qty'];
							$kk=$kk+1;
							$success=$success+1;
							continue;
						}else{
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
							$brcarr[$kk]['qty']=0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}	
				}else{
					$brcarr[$kk]['barcode']=$brcode;
					$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
					$brcarr[$kk]['qty']=0;
					$kk=$kk+1;
					$fail=$fail+1;
					continue;
				}
			}
			session('jxbrcode',null);
			session('jxoddcount',null);
			
			$this->assign('fail', $fail);
			$this->assign('success', $success);
			$this->assign('list', $brcarr);
			$this->assign('dealerinfo', $dealerinfo);
			$this->assign('jxoddcount', $jxoddcount);
			$this->display('shipping2');
			
		}else{         
		    //确认出货下级经销商
			$Dealer= M('Dealer');

			$map=array();
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_belong']=session('jxuser_id');
			$map['dl_status']=1;

			$list = $Dealer->where($map)->order('dl_name DESC')->limit(1000)->select();
			foreach($list as $k=>$v){
			    $dllist[$k]['dl_name']=wxuserTextDecode2($v['dl_name']);
			}
			
			//统计扫描纪录
			$brcodestr=session('jxbrcode');

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
						$scancount=$scancount+1;
						$scanprocount=$scanprocount+intval($v['qty']);
					}else{
						unset($brcodearr[$k]);
					}
				}
			}
			
			if($scancount<=0){
				$this->error('没有扫描纪录','',2);
			}
			
			$this->assign('scancount', $scancount);
			$this->assign('scanprocount', $scanprocount);
			$this->assign('jxoddcount', $jxoddcount);
			$this->assign('list', $list);
			$this->display('shipping1');
		}
	}	
	
	
	//代理调级
    public function updatedltypeindex(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$this->display('updatedltypeindex');
    }
	
	//我的申请调级
    public function myupdatedltypelist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$Dealer = M('Dealer');
        $Dltype = M('Dltype');
		$Applydltype = M('Applydltype');
		
        $map=array();
        $map['apply_unitcode']=$this->qy_unitcode;
		$map['apply_dlid']=session('jxuser_id');

        $list = $Applydltype->where($map)->order('apply_id DESC')->select();
		
		foreach($list as $k=>$v){

			//申请后上家
			if($v['apply_afterbelong']>0){
				$map2=array();
				$map2['dl_id']=$v['apply_afterbelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['apply_afterbelong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['apply_afterbelong_str']='未知';
				}
			}else{
				$list[$k]['apply_afterbelong_str']=' 总公司';
			}
			
			//申请后级别
			if($v['apply_afterdltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$v['apply_afterdltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$list[$k]['apply_afterdltype_str']='申请调级到：'.$dltinfo['dlt_name'];
				}else{
					$list[$k]['apply_afterdltype_str']='';
				}
			}else{
				$list[$k]['apply_afterdltype_str']='';
			}
			
            if($v['apply_state']==0){
                $list[$k]['apply_state_str']='待处理';
            }elseif($v['apply_state']==1){
                $list[$k]['apply_state_str']='已调整级别';
            }elseif($v['apply_state']==2){
                $list[$k]['apply_state_str']='申请无效';
            }
			
		}
		$this->assign('applydltypelist', $list);
		
		$this->display('myupdatedltypelist');
    }
	
	//下级申请调级
    public function dlupdatedltypelist(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$Dealer = M('Dealer');
        $Dltype = M('Dltype');
		$Applydltype = M('Applydltype');
		
        $map=array();
        $map['apply_unitcode']=$this->qy_unitcode;
		$map['apply_afterbelong']=session('jxuser_id');

        $list = $Applydltype->where($map)->order('apply_id DESC')->select();
		
		foreach($list as $k=>$v){

			//申请后上家
			if($v['apply_afterbelong']>0){
				$map2=array();
				$map2['dl_id']=$v['apply_afterbelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$list[$k]['apply_afterbelong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$list[$k]['apply_afterbelong_str']='未知';
				}
			}else{
				$list[$k]['apply_afterbelong_str']=' 总公司';
			}
			
			//申请后级别
			if($v['apply_afterdltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$v['apply_afterdltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$list[$k]['apply_afterdltype_str']='申请调级到：'.$dltinfo['dlt_name'];
				}else{
					$list[$k]['apply_afterdltype_str']='';
				}
			}else{
				$list[$k]['apply_afterdltype_str']='';
			}
			
            if($v['apply_state']==0){
                $list[$k]['apply_state_str']='待处理';
            }elseif($v['apply_state']==1){
                $list[$k]['apply_state_str']='已调整级别';
            }elseif($v['apply_state']==2){
                $list[$k]['apply_state_str']='申请无效';
            }
			
		}
		$this->assign('applydltypelist', $list);
		
		$this->display('dlupdatedltypelist');
    }
	
	//申请调级详细
	public function updatedltypedetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$map['apply_id']=intval(I('get.apply_id',0));
		$map['apply_unitcode']=$this->qy_unitcode;
		$map['apply_dlid']=session('jxuser_id');
		$Applydltype= M('Applydltype');
		$data=$Applydltype->where($map)->find();
		$Dealer= M('Dealer');
		$Dltype= M('Dltype');
		if($data){
			//申请代理
			if($data['apply_dlid']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_dlid'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].') ('.$data2['dl_tel'].')';
				}else{
					$data['dl_name_str']='未知';
				}
			}else{
				$data['dl_name_str']='未知';
			}
			
			//申请前上家
			if($data['apply_agobelong']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_agobelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['apply_agobelong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['apply_agobelong_str']='未知';
				}
			}else{
				$data['apply_agobelong_str']=' 总公司';
			}
			
			//申请前级别
			if($data['apply_agodltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['apply_agodltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$data['apply_agodltype_str']=$dltinfo['dlt_name'];
				}else{
					$data['apply_agodltype_str']='类型不存在';
				}
			}else{
				$data['apply_agodltype_str']='类型不存在';
			}
			
			//申请后上家
			if($data['apply_afterbelong']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_afterbelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['apply_afterbelong_str']=$data2['dl_name'].'('.$data2['dl_username'].') ('.$data2['dl_tel'].')';
				}else{
					$data['apply_afterbelong_str']='未知';
				}
			}else{
				$data['apply_afterbelong_str']=' 总公司';
			}
			
			//申请后级别
			if($data['apply_afterdltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['apply_afterdltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$data['apply_afterdltype_str']=$dltinfo['dlt_name'];
				}else{
					$data['apply_afterdltype_str']='类型不存在';
				}
			}else{
				$data['apply_afterdltype_str']='类型不存在';
			}
			
			//状态
			if($data['apply_state']==0){
				$data['apply_state_str']='待处理';
			}elseif($data['apply_state']==1){
				$data['apply_state_str']='已调整级别';
			}elseif($data['apply_state']==2){
				$data['apply_state_str']='申请无效';
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/dealer/';
			//凭证
			if(is_not_null($data['apply_pic']) && file_exists($imgpath.$data['apply_pic'])){
				$data['apply_pic_str']='<a href="'.__ROOT__.'/Public/uploads/dealer/'.$data['apply_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['apply_pic'].'"   border="0" style="vertical-align:middle;width:20%"  ></a>';

			}else{
				$data['apply_pic_str']='';
			}
			
		}else{
			$this->error('没有该记录','',1);
		}
		
		$this->assign('updateinfo', $data);
		
		$this->display('updatedltypedetail');
	}
	
	//申请调级详细2
	public function updatedltypedetail2(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
		$map['apply_id']=intval(I('get.apply_id',0));
		$map['apply_unitcode']=$this->qy_unitcode;
		$map['apply_afterbelong']=session('jxuser_id');
		$Applydltype= M('Applydltype');
		$data=$Applydltype->where($map)->find();
		$Dealer= M('Dealer');
		$Dltype= M('Dltype');
		if($data){
			//申请代理
			if($data['apply_dlid']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_dlid'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['dl_name_str']=$data2['dl_name'].'('.$data2['dl_username'].') ('.$data2['dl_tel'].')';
				}else{
					$data['dl_name_str']='未知';
				}
			}else{
				$data['dl_name_str']='未知';
			}
			
			//申请前上家
			if($data['apply_agobelong']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_agobelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['apply_agobelong_str']=$data2['dl_name'].'('.$data2['dl_username'].')';
				}else{
					$data['apply_agobelong_str']='未知';
				}
			}else{
				$data['apply_agobelong_str']=' 总公司';
			}
			
			//申请前级别
			if($data['apply_agodltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['apply_agodltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$data['apply_agodltype_str']=$dltinfo['dlt_name'];
				}else{
					$data['apply_agodltype_str']='类型不存在';
				}
			}else{
				$data['apply_agodltype_str']='类型不存在';
			}
			
			//申请后上家
			if($data['apply_afterbelong']>0){
				$map2=array();
				$map2['dl_id']=$data['apply_afterbelong'];
				$map2['dl_unitcode']=$this->qy_unitcode;
				$data2=$Dealer->where($map2)->find();
				if($data2){
					$data['apply_afterbelong_str']=$data2['dl_name'].'('.$data2['dl_username'].') ('.$data2['dl_tel'].')';
				}else{
					$data['apply_afterbelong_str']='未知';
				}
			}else{
				$data['apply_afterbelong_str']=' 总公司';
			}
			
			//申请后级别
			if($data['apply_afterdltype']>0){
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['apply_afterdltype'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$data['apply_afterdltype_str']=$dltinfo['dlt_name'];
				}else{
					$data['apply_afterdltype_str']='类型不存在';
				}
			}else{
				$data['apply_afterdltype_str']='类型不存在';
			}
			
			//状态
			if($data['apply_state']==0){
				$data['apply_state_str']='待处理';
			}elseif($data['apply_state']==1){
				$data['apply_state_str']='已调整级别';
			}elseif($data['apply_state']==2){
				$data['apply_state_str']='申请无效';
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/dealer/';
			//凭证
			if(is_not_null($data['apply_pic']) && file_exists($imgpath.$data['apply_pic'])){
				$data['apply_pic_str']='<a href="'.__ROOT__.'/Public/uploads/dealer/'.$data['apply_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/dealer/'.$data['apply_pic'].'"   border="0" style="vertical-align:middle;width:20%"  ></a>';

			}else{
				$data['apply_pic_str']='';
			}
			
		}else{
			$this->error('没有该记录','',1);
		}
		
		$this->assign('updateinfo', $data);
		
		$this->display('updatedltypedetail');
	}
	
	
	//申请调级
	public function updatedltype(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){

		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		//--------------------------------
		
		//当前级别
		$Dltype= M('Dltype');
		$map2=array();
		$map2['dlt_unitcode']=$this->qy_unitcode;
		$map2['dlt_id']=$data['dl_type'];
		$dltinfo = $Dltype->where($map2)->find();
		if($dltinfo){
			$data['original_name']=$dltinfo['dlt_name'];
			$data['original_level']=$dltinfo['dlt_level'];
		}else{
			$this->error('原级别记录不存在','',2);
		}
		
		//当前上家
		if($data['dl_belong']>0){
			$map2=array();
			$map2['dl_id'] =  $data['dl_belong'];
			$map2['dl_unitcode']=$this->qy_unitcode;
			$data2 = $Dealer->where($map2)->find();
			if($data2){
				$data['dl_belong_name']=$data2['dl_name'].' ('.$data2['dl_username'].')';
			}else{
				$data['dl_belong_name']='-';
			}
		}else{
			$data['dl_belong_name']='总公司';
		}
		//当前推荐人
		if($data['dl_referee']>0){
			$map2=array();
			$map2['dl_id'] =  $data['dl_referee'];
			$map2['dl_unitcode']=$this->qy_unitcode;
			$data2 = $Dealer->where($map2)->find();
			if($data2){
				$data['dl_referee_name']=$data2['dl_name'].' ('.$data2['dl_username'].')';
			}else{
				$data['dl_referee_name']='-';
			}
		}else{
			$data['dl_referee_name']='总公司';
		}
		//分类列表
		$map2=array();
        $map2['dlt_unitcode']=$this->qy_unitcode;
		$map2['dlt_level']=array('lt',$data['original_level']);
        $dltypelist = $Dltype->where($map2)->order('dlt_level ASC,dlt_id ASC')->select();
//		dump($dltypelist);die();
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp2=time();
		$sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			
		$this->assign('ttamp', $ttamp2);
		$this->assign('sture', $sture2);
		
		$this->assign('dltypelist', $dltypelist);
		$this->assign('dealerinfo', $data);
		
		$this->display('updatedltype');
	}
	
	public function updatedltype_save(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){

		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		//--------------------------------
		
		$dltypeid=intval(I('post.dltype',0));
		$okk=intval(I('post.okk',0));

		//判断数据是否有效
		if($dltypeid<=0 || $okk<=0){
			$this->error('请选择调整级别','',1);
			exit;
		}
		
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('请求超时，请重试',U('Angels/Dealer/updatedltype'),2);
		}
		if(($nowtime - $ttamp) > 1200) {
			$this->error('请求超时，请重试',U('Angels/Dealer/updatedltype'),2);
		}
		
		if($dltypeid>0){
			    $Dltype= M('Dltype');
				
				//原来级别
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['dl_type'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$original_level=$dltinfo['dlt_level'];  //原来的级别
				}else{
					$original_level=$data['dl_level'];  //原来的级别
				}
				
				//修改的分类/级别
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$dltypeid;
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$apply_level=$dltinfo['dlt_level'];  //修改的级别
				}else{
					$this->error('请选择调整级别','',1);
					exit;
				}
                $dlbelong_id=0;
				//如果修改的级别高于原来的级别
				if($apply_level<$original_level){
					//判断是否修改新的上家
					if($data['dl_belong']>0){
						$map2=array();
						$map2['dl_id']=$data['dl_belong'];
						$map2['dl_unitcode']=$this->qy_unitcode;
						$dlbelong=$Dealer->where($map2)->find();
						if($dlbelong){
							//上家的级别
							$map3=array();
							$map3['dlt_unitcode']=$this->qy_unitcode;
							$map3['dlt_id']=$dlbelong['dl_type'];
							$data3 = $Dltype->where($map3)->find();
							
							if($data3){
								$dlbelong_level=$data3['dlt_level']; //上家的级别
							}else{
								$dlbelong_level=$dlbelong['dl_level'];
							}
							
							if($apply_level<=$dlbelong_level){
								$dlbelong_id=$this->get_dlbelong($dlbelong['dl_id'],$apply_level);
								if($dlbelong_id===false){
									$this->error('上家级别已不存在，请与公司联系','',1);
									exit;
								}
							}else{
								$dlbelong_id=$dlbelong['dl_id'];
							}
						}else{
							$this->error('上家已不存在，请与公司联系','',1);
							exit;
						}
					}else{
						$dlbelong_id=0;
					}
				}else{
					$this->error('申请调整的级别要高于原来的级别','',1);
					exit;
				}
				
				//保存文件 begin 
				$file_name=I('post.file_name','');
				
				if($file_name==''){
					$this->error('请上传图片','',2);
				}else{
					$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
					$temppath=BASE_PATH.'/Public/uploads/temp/';
					$apply_pic='';
					if (!file_exists($imgpath)) {
						mkdir($imgpath);
					}
					if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
					    $apply_pic=$this->qy_unitcode.'/'.$file_name;
						@unlink($temppath.$file_name); 
					}else{
                        $this->error('上传图片失败','',2);
					}
				}
				//保存文件 end
				
				
				//添加申请
				$data3=array();
				$data3['apply_unitcode'] = $this->qy_unitcode;
				$data3['apply_dlid'] = session('jxuser_id');
				$data3['apply_agobelong'] = $data['dl_belong'];   //原上家
				$data3['apply_agodltype'] = $data['dl_type'];  //原级别
				$data3['apply_afterbelong'] = $dlbelong_id; //申请后上家
				$data3['apply_afterdltype'] = $dltypeid;  //申请后级别
				$data3['apply_pic'] = $apply_pic;
				$data3['apply_addtime'] = time();
				$data3['apply_dealtime'] = 0;	
				$data3['apply_remark'] = '';	
				$data3['apply_state'] = 0;	
				
                $Applydltype = M('Applydltype');
				$rs3=$Applydltype->create($data3,1);
				if($rs3){
				    $rs4=$Applydltype->add();
				    if($rs4){
					   $this->success('申请提交成功，请等待审核处理','',2);
					   exit;
				    }else{
					   $this->error('提交失败','',1);
					   exit;
				    }
				}else{
					$this->error('提交失败','',1);
					exit;
				}	
		}
	}
	
	
	//申请调级 改级别后，返回上家基本信息 返回json格式 
	public function belongjson(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);

			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){

		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);

			$msg=array('stat'=>'2','msg'=>'授权已过期，请重新登录');
            echo json_encode($msg);
            exit;
		}
		//--------------------------------
		
		$dltypeid=intval(I('post.dltype',0));
		if($dltypeid>0){
			    $Dltype= M('Dltype');
				
				//原来级别
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$data['dl_type'];
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$original_level=$dltinfo['dlt_level'];  //原来的级别
				}else{
					$original_level=$data['dl_level'];  //原来的级别
				}
				
				//修改的分类/级别
				$map2=array();
				$map2['dlt_unitcode']=$this->qy_unitcode;
				$map2['dlt_id']=$dltypeid;
				$dltinfo = $Dltype->where($map2)->find();
				if($dltinfo){
					$apply_level=$dltinfo['dlt_level'];  //修改的级别
				}else{
					$msg=array('stat'=>'0','msg'=>'请选择调整级别');
					echo json_encode($msg);
					exit;
				}
			
				
				//如果修改的级别高于原来的级别
				if($apply_level<$original_level){
					//判断是否修改新的上家
					if($data['dl_belong']>0){
						$map2=array();
						$map2['dl_id']=$data['dl_belong'];
						$map2['dl_unitcode']=$this->qy_unitcode;
						$dlbelong=$Dealer->where($map2)->find();
						if($dlbelong){
							//上家的级别
							$map3=array();
							$map3['dlt_unitcode']=$this->qy_unitcode;
							$map3['dlt_id']=$dlbelong['dl_type'];
							$data3 = $Dltype->where($map3)->find();
							
							if($data3){
								$dlbelong_level=$data3['dlt_level']; //上家的级别
							}else{
								$dlbelong_level=$dlbelong['dl_level'];
							}
							
							if($apply_level<=$dlbelong_level){
								$dlbelong_id=$this->get_dlbelong($dlbelong['dl_id'],$apply_level);
								if($dlbelong_id===false){
									$msg=array('stat'=>'0','msg'=>'上家级别已不存在，请与公司联系');
									echo json_encode($msg);
									exit;
								}
								
								if($dlbelong_id>0){
									$map2=array();
									$map2['dl_id']=$dlbelong_id;
									$map2['dl_unitcode']=$this->qy_unitcode;
									$dlbelong2=$Dealer->where($map2)->find();
									if($dlbelong2){
										$msg=array('stat'=>'1','msg'=>'调整后上家：'.$dlbelong2['dl_name'].' ('.$dlbelong2['dl_username'].') '.$dlbelong2['dl_tel'].'，请联系协商后再提交申请');
										echo json_encode($msg);
										exit;
									}else{
										$msg=array('stat'=>'0','msg'=>'上家已不存在，请与公司联系');
										echo json_encode($msg);
										exit;
									}
								}else{
									$msg=array('stat'=>'1','msg'=>'调整后上家：总公司，请与公司联系');
									echo json_encode($msg);
									exit;
								}
							}else{
								$msg=array('stat'=>'1','msg'=>'调整后上家：'.$dlbelong['dl_name'].' 上家没有改变，请先与你的上家联系协商后再提交申请');
								echo json_encode($msg);
								exit;
							}
						}else{
							$msg=array('stat'=>'0','msg'=>'上家已不存在，请与公司联系');
					        echo json_encode($msg);
					        exit;
						}
					}else{
						$msg=array('stat'=>'1','msg'=>'调整后上家：总公司，请与公司联系');
						echo json_encode($msg);
						exit;
					}
				}else{
					$msg=array('stat'=>'0','msg'=>'申请调整的级别要高于原来的级别');
					echo json_encode($msg);
					exit;
				}
		}else{
            $msg=array('stat'=>'0','msg'=>'请选择调整级别');
            echo json_encode($msg);
            exit;
		}
	}
	
}