<?php
namespace Angels\Controller;
use Think\Controller;
class ApplyController extends CommController {
    //我要代理
	public function index(){
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
			
			$dl_referee=I('post.dl_referee','');
			
			//判断链接是否失效
			$ttamp=trim(I('post.ttamp',''));
			$sture=trim(I('post.sture',''));
			$fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$nowtime=time();
			if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
                $this->error('该邀请链接已失效,请刷新再提交','',2);
			}
			if(($nowtime - $ttamp) > 1800) {
				$this->error('该邀请链接已失效,请刷新再提交','',2);
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
			
			if($dl_referee==''){
                $this->error('请填写推荐人编号','',2);
			}
			
			if(!preg_match("/^[a-zA-Z0-9_:-]{4,10}$/",$dl_referee)){
				$this->error('请正确填写推荐人编号','',2);
			}
			
			//申请级别1
			$Dltype= M('Dltype');
			$Dlsttype= M('Dlsttype');
			$map3=array();
			$map3['dlt_unitcode']=$this->qy_unitcode;
			$map3['dlt_id']=$dltid;
			$dltypeinfo = $Dltype->where($map3)->find();
			$dlsttypeid=0;
			if($dltypeinfo){
                $apply_level=$dltypeinfo['dlt_level'];  //申请的级别
			}else{
				$this->error('该邀请链接已失效1',U('Angels/Index/index'),2);
			}
			
			
			$Dealer= M('Dealer');
			
            //推荐人是否有效
			$map=array();
			$map['dl_number']=$dl_referee;
			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_status']=1;
			$dlreferee=$Dealer->where($map)->find();
			if($dlreferee){
				$dl_refereeid=$dlreferee['dl_id'];
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
					$this->error('该邀请链接已失效2',U('Angels/Index/index'),2);
				}
			}else{
				$this->error('所填写推荐人还没审核或不存在','',2);
			}
			
		
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
			
			//判断上家
			$dlbelong_id=0;  //上家id
			$dlbelong_name='总公司'; //上家名称
			if($apply_level<=$dlreferee_level){  //如果申请的级别高于推荐人的级别 或 与推荐人同级
                if($dlreferee_belong>0){
					$dlbelong_id=$this->get_dlbelong($dlreferee_belong,$apply_level);
					
					if($dlbelong_id===false){
						$this->error('该邀请链接已失效3',U('Angels/Index/index'),2);
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
								$this->error('该邀请链接已失效4',U('Angels/Index/index'),2);
							}
						}else{
							$dlbelong_id=0;
						}
					}
				}else{
					$dlbelong_id=0;
				}
			}else{   //如果申请的级别低于推荐人的级别 那上家就是推荐人
				$map=array();
				$map['dl_id']=$dl_refereeid;
				$map['dl_unitcode']=$this->qy_unitcode;
				$map['dl_status']=1;
				$dlbelong=$Dealer->where($map)->find();
				if($dlbelong){
					$dlbelong_id=$dlbelong['dl_id'];
					$dlbelong_name=$dlbelong['dl_username'];
				}else{
					$this->error('该邀请链接已失效5',U('Angels/Index/index'),2);
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
			$data2['dl_type']=$dltid;   //代理等级
			$data2['dl_sttype']=$dlsttypeid;   //代理等级2
			$data2['dl_belong']=$dlbelong_id;       //上家
			$data2['dl_referee']=$dl_refereeid;  //推荐人
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
							'dlg_action'=>'代理商注册 自己申请',
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

				//推荐人是否有效
				$map3=array();
				$map3['dl_unitcode']=$this->qy_unitcode;
				$map3['dl_status']=1;
				$dlreferee=$Dealer->where($map3)->find();


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
				// $numberStr=intval($result)+7700;
				// $data['dl_number'] ='No:'.str_pad($numberStr,6,'0',STR_PAD_LEFT);
				
				$data['dl_number'] ='No:'.str_pad($dlNumber,6,'0',STR_PAD_LEFT);
				$Dealer->where($map)->save($data);
				
				$this->success('您的申请提交成功，请等待审核，用户名：'.$dl_weixin.' 密码：'.substr($dl_tel,-6).'',U('Angels/Index/index'),999);
				exit;
			}else{
				$this->error('申请提交失败','',2);
			}
		}
	
		//邀请级别1
		$Dltype = M('Dltype');
		$map3=array();
		$map3['dlt_unitcode']=$this->qy_unitcode;
		$dltypelist = $Dltype->where($map3)->field('dlt_id,dlt_name')->order('dlt_level ASC,dlt_id ASC')->select();

		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		
		$this->assign('dltypelist', $dltypelist);
		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);
		$this->display('index');
	}
    
	
	
}