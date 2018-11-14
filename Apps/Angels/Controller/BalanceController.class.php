<?php
namespace Angels\Controller;
use Think\Controller;
class BalanceController extends CommController {
    //首页
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

		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}

        $balance=$this->mybalance(session('jxuser_id'));
		if ($balance>=0.00)
		{
			$dl_balance=$balance;
		}else
		{
			$dl_balance=0.00;
		}
    	$this->assign('dl_balance',$dl_balance);
	    $this->display('index');
	}

    //余额明细
	public function balancelist(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$ly_status=intval(I('get.ly_status',0));
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
			$this->error('授权已过期，请重新登录',U('Xiaozhu/Index/index'),1);
			exit;
		}

		$Balance=M('Balance');
		$map=array();
		$map['bl_unitcode']=$this->qy_unitcode;
		$wheredl['bl_sendid']=array('EQ',session('jxuser_id'));
		$wheredl['bl_receiveid']=array('EQ',session('jxuser_id'));
        $wheredl['_logic'] = 'or';
        $map['_complex'] = $wheredl;
		$count =$Balance->where($map)->count();
        $parameter=array();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div></div>'){
            $show='';
        }
		$list=$Balance->where($map)->order('bl_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		foreach ($list as $k => $v) {
			if ($v['bl_state']>0)
			{	
				if ($v['bl_state']==2)
					$list[$k]['bl_state_str']='冻结状态，待处理';
				if ($v['bl_state']==1)
					$list[$k]['bl_state_str']='处理成功';
			}else
			{
				$list[$k]['bl_state_str']='无效或已取消';
			}
		}

		$this->assign('list',$list);
		$this->assign('page',$show);
		$this->assign('user_id',session('jxuser_id'));
		$this->display('balancelist');
	}

    //我的充值和下家充值
	public function rechargelist(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		$ly_status=intval(I('get.ly_status',0));
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

		$Payin=M('Payin');
		$Balance=M('Balance');

		//我的充值
		$pimap=array();
		$pimap['pi_unitcode']=$this->qy_unitcode;
		$pimap['pi_dlid']=session('jxuser_id');
		$mydata=$Payin->where($pimap)->select();
		foreach ($mydata as $k => $v) {
			$blmap=array();
			$blmap['bl_unitcode']=$this->qy_unitcode;
			$blmap['bl_piid']=$v['pi_id'];
			$blmap['bl_receiveid']=session('jxuser_id');
			$bl_addtime=$Balance->where($blmap)->getField('bl_addtime');
			$dl_balance=$this->mybalance(session('jxuser_id'),$bl_addtime);
			$mydata[$k]['dl_balance']=$dl_balance;

			switch ($v['pi_state']) {
				case '1':
					$mydata[$k]['pi_state_str']='充值成功';
				break;
				case '0':
					$mydata[$k]['pi_state_str']='待处理';
					break;
				default:
					$mydata[$k]['pi_state_str']='充值失败';
					break;
			}

			if ($v['pi_receiveid']>0)
			{
				$dlrcmap=array();
				$dlrcmap['dl_id']=$v['pi_receiveid'];
				$dlrcmap['dl_unitcode']=$this->qy_unitcode;
				$dlrcmap['dl_status']=1;
				$dlrcdata=$Dealer->where($dlrcmap)->find();
				if($dlrcdata){
					$mydata[$k]['pi_rcdl_str']='收款人：'.$dlrcdata['dl_name'].'('.$dlrcdata['dl_username'].')';
				}else
				{
					$mydata[$k]['pi_rcdl_str']='收款人：未知';
				}
			}else
			{
				$mydata[$k]['pi_rcdl_str']='收款人：总公司';	
			}	
		}

		//下级充值
		$pimap=array();
		$pimap['pi_unitcode']=$this->qy_unitcode;
		$pimap['pi_receiveid']=session('jxuser_id');
		$dldata=$Payin->where($pimap)->select();
		foreach ($dldata as $k=> $v) {
			if ($v['pi_dlid']>0)
			{
				$dlmap=array();
				$dlmap['dl_id']=$v['pi_dlid'];
				$dlmap['dl_unitcode']=$this->qy_unitcode;
				$dlmap['dl_status']=1;
				$dlsdata=$Dealer->where($dlmap)->find();
				if($dlsdata){
					$dldata[$k]['pi_dl_str']='向 代理：'.$dlsdata['dl_name'].'('.$dlsdata['dl_username'].') 支付';
				}else
				{
					$dldata[$k]['pi_dl_str']='向 代理：(未知) 支付';
				}
			}else
			{
				$dldata[$k]['pi_dl_str']='向 总公司 支付';	
			}
		}
		$this->assign('ly_status', $ly_status);
		$this->assign('mydata', $mydata);
		$this->assign('dldata', $dldata);
		//--------------------------------
		$this->display('rechargelist');
	}
	
	//充值申请
	public function recharge(){
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

		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp2=time();
		$sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);	
		$this->assign('ttamp', $ttamp2);
		$this->assign('sture', $sture2);
		//--------------------------------
		$this->display('recharge');
	}

	//充值提交
	public function recharge_submit(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
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
		$amount=I('post.amount',0.00);
		$remark=I('post.remark','');
		if($amount<=0){
			$this->error('充值金额必须大于0',U('Angels/Balance/recharge'),1);
		}

		//当前上家的余额是否充足：
		if ($data['dl_belong']>0)
		{
			$blBalance=$this->mybalance($data['dl_belong']);
			if ($amount-$blBalance>0)
			{
				$this->error('上级余额不足,请联系上级',U('Angels/Balance/recharge'),1);
				exit;
			}
		}

		//保存文件 begin 
		$file_name=I('post.file_name','');

		if($file_name==''){
			$this->error('请上传图片',U('Angels/Balance/recharge'),1);
		}else{
			$imgpath=BASE_PATH.'/Public/uploads/dealer/'.$this->qy_unitcode;
			$temppath=BASE_PATH.'/Public/uploads/temp/';
			$pay_pic='';
			if (!file_exists($imgpath)) {
				mkdir($imgpath);
			}
			if(copy($temppath.$file_name,$imgpath.'/'.$file_name)) {
			    $pay_pic=$this->qy_unitcode.'/'.$file_name;
				@unlink($temppath.$file_name); 
			}else{
                $this->error('上传图片失败',U('Angels/Balance/recharge'),1);
			}
		}
		//保存文件 end
		
		//添加申请
		$Payin=M('Payin');
		$pidata=array();
		$pidata['pi_unitcode'] = $this->qy_unitcode;
		$pidata['pi_dlid'] =session('jxuser_id');
		$pidata['pi_receiveid'] = $data['dl_belong'];//接收充值上家
		$pidata['pi_money'] =$amount;//充值金额
		$pidata['pi_pic'] = $pay_pic;//充值凭证
		$pidata['pi_remark'] =$remark;//充值备注
		$pidata['pi_addtime'] =time();	
		$pidata['pi_state'] = 0;
		$pirs=$Payin->create($pidata,1);
		if($pirs){
			$piID=$Payin->add();
		    if($piID>0){
		        //添加余额申请记录
				$Balance=M('Balance');
				$bldata=array();
				$bldata['bl_unitcode'] = $this->qy_unitcode;
				$bldata['bl_type'] =4;//余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 4-代理充值5-代理提现
				$bldata['bl_sendid'] =$data['dl_belong'];//发款方
				$bldata['bl_receiveid'] =session('jxuser_id');//收款方
				$bldata['bl_money'] =$amount;//充值金额
				$bldata['bl_piid'] =$piID;//对应充值的ID
				$bldata['bl_state'] =2;//0无效1有效2冻结
				$bldata['bl_addtime'] =time();	
				$blrs=$Balance->create($bldata,1);
				if ($blrs)
				{
					$blID=$Balance->add();
		    		if($blID>0){
		    			//代理操作日志 begin
						$odlog_arr=array(
							'dlg_unitcode'=>$this->qy_unitcode,
							'dlg_dlid'=>session('jxuser_id'),
							'dlg_operatid'=>session('jxuser_id'),
							'dlg_dlusername'=>$data['dl_username'],
							'dlg_dlname'=>$data['dl_name'],
							'dlg_action'=>'向上级('.$data['dl_belong'].')充值金额'.$amount.'元',
							'dlg_type'=>1, //0-企业 1-经销商
							'dlg_addtime'=>time(),
							'dlg_ip'=>real_ip(),
							'dlg_link'=>__SELF__
						);
						$Dealerlogs= M('Dealerlogs');
						$rs3=$Dealerlogs->create($odlog_arr,1);
						if($rs3){
							$Dealerlogs->add();
						}
						//代理操作日志 end
			  	 		$this->success('申请提交成功，请等待审核处理',U('Angels/Balance/rechargelist'),1);
			  	 		exit;
			  	 	}else
			  	 	{
			  	 		$Payin->where('pi_id='.$piID)->delete();
			  	 		$this->error('提交失败',U('Angels/Balance/recharge'),1);
			   			exit;
			  	 	}
				}else
				{
					$Payin->where('pi_id='.$piID)->delete();
					$this->error('提交失败',U('Angels/Balance/recharge'),1);
			   		exit;
				}
		    }else{
		    	$Payin->where('pi_id='.$piID)->delete();
			  	$this->error('提交失败',U('Angels/Balance/recharge'),1);
			    exit;
		    }
		}else{
			$this->error('提交失败',U('Angels/Balance/recharge'),1);
			exit;
		}


	}

	//充值详情
	public function rechargedetail(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
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
		$pi_id=I('get.pi_id',0);
		$pi_state=I('get.pi_state',0); //0待处理 1已处理 2取消
		$ly_status=I('get.ly_status',0);
		if ($pi_id>0)
		{	
			$Payin=M('Payin');
			$map=array();
			$map['pi_unitcode']=$this->qy_unitcode;
			$map['pi_id']=$pi_id;
			$data=$Payin->where($map)->find();
			if ($data)
			{
				$dlsmap=array();
				$dlsmap['dl_id']=$data['pi_dlid'];
				$dlsmap['dl_unitcode']=$this->qy_unitcode;
				$dlsmap['dl_status']=1;
				$dlsdata=$Dealer->where($dlsmap)->find();
				if($dlsdata){
					$data['pi_send_name_str']=$dlsdata['dl_name'].'('.$dlsdata['dl_username'].')';
				}
			}
		}else
		{
			$this->error('参数有误','',1);	
		}
		$this->assign('ly_status',$ly_status);
		$this->assign('pi_state',$pi_state);
		$this->assign('rechargeinfo',$data);
		//--------------------------------
		$this->display('rechargedetail');
	}

 	//取消、确认 充值
	public function recharge_save(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
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
		$pi_id=I('post.pi_id',0);
		$pi_state=I('post.pi_state',0); //0待处理 1已处理 2取消
		$ly_status=I('post.ly_status',0);
		$dl_remark=I('post.dl_remark','');

		if ($pi_id>0)
		{
			if ($dl_remark=='')
			{
				$this->error('请填写处理备注','',1);	
			}

			$Payin=M('Payin');
			$map=array();
			$map['pi_unitcode']=$this->qy_unitcode;
			$map['pi_id']=$pi_id;
			$map['pi_receiveid']=session('jxuser_id');
			$pidata=$Payin->where($map)->find();
			if ($pidata)
			{
				//获取下级的openID
				$submap=array();
				$submap['dl_id']=$pidata['pi_dlid'];
				$submap['dl_unitcode']=$this->qy_unitcode;
				$submap['dl_status']=1;
				$subdata=$Dealer->where($submap)->find();
				if ($subdata)
				{
					$openID=$subdata['dl_openid'];
					$dl_username_sub=$subdata['dl_username'];
					$dl_name_sub=$subdata['dl_name'];
				}
				$updata=array();
				$updata['pi_state']=$pi_state;
				$updata['pi_dealremark']=$dl_remark;
				$updata['pi_dealtime']=time();
				$piCount=$Payin->where($map)->save($updata);
				if ($piCount>0)
				{
					$action_str='';
					$Balance=M('Balance');
					$blupmap=array();
					$blupmap['bl_unitcode']=$this->qy_unitcode;
					$blupmap['bl_sendid']=$pidata['pi_receiveid'];
					$blupmap['bl_receiveid']=$pidata['pi_dlid'];
					$blupmap['bl_piid']=$pi_id;

					$blupdata=array();
					if ($pi_state==1)
					{
						$action_str='充值记录ID'.$pi_id.'确认通过';
						$blupdata['bl_state']=1;
					}else if ($pi_state==2)
					{
						$action_str='充值记录ID'.$pi_id.'取消充值';
						$blupdata['bl_state']=0;
					}
					$blupdata['bl_remark']=$dl_remark;
					$blupdata['bl_addtime']=time();
					$blCount=$Balance->where($blupmap)->save($blupdata);
					if ($blCount>0)
					{
					//代理操作日志 begin
						$dllog_arr=array(
							'dlg_unitcode'=>$this->qy_unitcode,
							'dlg_dlid'=>session('jxuser_id'),
							'dlg_operatid'=>session('jxuser_id'),
							'dlg_dlusername'=>$data['dl_username'],
							'dlg_dlname'=>$data['dl_name'],
							'dlg_action'=>$action_str,
							'dlg_type'=>1, //0-企业 1-经销商
							'dlg_addtime'=>time(),
							'dlg_ip'=>real_ip(),
							'dlg_link'=>__SELF__
						);
						$Dealerlogs = M('Dealerlogs');
						$rs3=$Dealerlogs->create($dllog_arr,1);
						if($rs3){
							$Dealerlogs->add();
						}
					}

					if (!empty($openID))
					{
						//向下级发送充值结果模板消息
	                	$url='http://'.$_SERVER['HTTP_HOST'].U('Qywechat/Wcapi/send_tem_msg');
	                	$temMsgArr=C('TEMPLATE_MESSAGE_ID_LIST');
	                	$paramArr=array();
	                	$paramArr['touser']=$openID;
	                	if ($pi_state==1)
						{
	                		$paramArr['temID']=$temMsgArr['recharge_success'];//确定
	                		$dtUrl='http://'.$_SERVER['HTTP_HOST'].U('Angels/Balance/rechargedetail/pi_id/'.$pi_id.'/ly_status/0');//跳转详情地址
		                	$paramArr['url']=base64_encode(urldecode($dtUrl));
		                	$paramArr['first']=date("Y年m月d日 H:i:s",time()).' 您的上级代理：'.session('jxuser_dlname').' '.$action_str;
		                	$paramArr['keyword1']=$dl_username_sub;
		                	$paramArr['keyword2']=$pidata['pi_money'].'元';
		                	$paramArr['keyword3']='0元';
		                	$paramArr['keyword4']=$this->mybalance($pidata['pi_dlid']).'元';
		                	$paramArr['remark']=$dl_name_sub.',感谢您的使用，欢迎再次光临！';
	                	}else if ($pi_state==2)
	                	{
	                		$paramArr['temID']=$temMsgArr['recharge_failed'];//取消
	                		$dtUrl='http://'.$_SERVER['HTTP_HOST'].U('Angels/Balance/rechargedetail/pi_id/'.$pi_id.'/ly_status/0');//跳转详情地址
		                	$paramArr['url']=base64_encode(urldecode($dtUrl));
		                	$paramArr['first']=date("Y年m月d日 H:i:s",time()).' 您的上级代理：'.session('jxuser_id').' '.$action_str;
		                	$paramArr['keyword1']='充值申请';
		                	$paramArr['keyword2']=$dl_remark;
		                	$paramArr['remark']='为了不影响下您的业务操作，请尽快核对查看！';
	                	}
						$result=http_request('post',$url,$paramArr);
					}

					//代理操作日志 end
					$this->success('提交成功',U('Angels/Balance/rechargelist/ly_status/1'),1);
				}
			}else
			{
				$this->error('该充值记录不存在，请刷新重试','',1);	
			}
		}else
		{
			$this->error('参数有误','',1);	
		}
	}

	//余额提现列表
	public function recashlist(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
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

		$Recash=M('Recash');
		$map=array();
		$map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_dlid']=session('jxuser_id');
		$map['rc_type']=1; //1余额提现 0返利提现
		$count =$Recash->where($map)->count();
        $parameter=array();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();
        if($show=='<div></div>'){
            $show='';
        }
		$list=$Recash->where($map)->order('rc_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		foreach ($list as $k => $v) {
			 $list[$k]['rc_moneystr']='<span style="color:#009900">'.number_format($v['rc_money'],2,'.','').'</span>';
			if(isset(C('FANLI_BANKS')[$v['rc_bank']])){
				$list[$k]['rc_str']='申请提现到 '.C('FANLI_BANKS')[$v['rc_bank']];
			}else{
				$list[$k]['rc_str']='申请提现';
			}

			if(MD5($v['rc_unitcode'].$v['rc_dlid'].number_format($v['rc_money'],2,'.','').$v['rc_bankcard'].$v['rc_addtime'])==$v['rc_verify']){
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='处理中';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
            }else{
				if($v['rc_state']==0){
					$list[$k]['rc_statestr']='处理中[异常]';
				}else if($v['rc_state']==1){
					$list[$k]['rc_statestr']='提现成功[异常]';
				}else if($v['rc_state']==2){
					$list[$k]['rc_statestr']='提现失败[异常]';
				}else{
					$list[$k]['rc_statestr']='异常';
				}
			}
			
            //付款方
		    if($v['rc_sdlid']==0){
				$list[$k]['fl_sdl_name']='总公司';
				$list[$k]['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$v['rc_sdlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$list[$k]['fl_sdl_name']=$data3['dl_name'];
					$list[$k]['fl_sdl_username']=$data3['dl_username'];
				}else{
					$list[$k]['fl_sdl_name']='';
					$list[$k]['fl_sdl_username']='';
				}
			}
		}
  		$this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('recashlist');
	}
	//余额提现申请
	public function recash(){
		if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }	
        $Dealer= M('Dealer');
		$map=array();
		$map['dl_id']=session('jxuser_id');
		$map['dl_unitcode']=$this->qy_unitcode;
		$map['dl_status']=1;
		$data=$Dealer->where($map)->find();
		if($data){
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
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

		//付款代理
		$fl_senddlid=0;
		$fl_sdl_name='总公司';
		$Balance= M('Balance');
		//我的余额
		$dl_balance=$this->mybalance(session('jxuser_id'));
		if($dl_balance<=0){
			$this->error('余额为0,暂不能提现','',1);
		}
		
		//统计可提现金额
		$dl_fanli2 =$dl_balance;
		//if($dl_fanli2<=0){
		//	$this->error('可提现金额为0','',2);
		//}
		//
		$bankarr=C('FANLI_BANKS');
		
		$qy_fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$ttamp=time();
		$sture=MD5($qy_fwkey.$ttamp.$qy_fwsecret);
		
		$this->assign('edurecash', C('FANLI_RECASH'));
		$this->assign('jiangetime', C('FANLI_JIANGETIME'));
		$this->assign('fl_senddlid', $fl_senddlid);
		$this->assign('dl_name', $dl_name);
		$this->assign('dl_username', $dl_username);
		$this->assign('fl_sdl_name', $fl_sdl_name);
		$this->assign('fl_sdl_username', $fl_sdl_username);
		$this->assign('dl_fanli', $dl_fanli);
		$this->assign('dl_fanli2', $dl_fanli2);
		$this->assign('ttamp', $ttamp);
		$this->assign('sture', $sture);
		$this->assign('bankarr', $bankarr);
		$this->display('recash');
	}

		//返利提现 保存
    public function recash_save(){	
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
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
			$dl_name=$data['dl_name'];
			$dl_username=$data['dl_username'];
			$dl_number=$data['dl_number'];
			$dl_tel=$data['dl_tel'];
			$dl_lastflid=$data['dl_lastflid'];
			$dl_fanli=$data['dl_fanli'];
			$dl_pwd=$data['dl_pwd'];
		}else{
			session('jxuser_id',null);
			session('jxuser_unitcode',null);
			$this->error('授权已过期，请重新登录',U('Angels/Index/index'),1);
			exit;
		}
		//-------------
		
		$ttamp=trim(I('post.ttamp',''));
		$sture=trim(I('post.sture',''));
		$fwkey=$this->qy_fwkey;
		$qy_fwsecret=$this->qy_fwsecret;
		$nowtime=time();
		if(MD5($fwkey.$ttamp.$qy_fwsecret)!=$sture){
			$this->error('操作超时,请重试',U('Angels/Balance/index'),1);
		}
		if(($nowtime - $ttamp) > 1200) {
			$this->error('操作超时,请重试',U('Angels/Balance/index'),1);
		}
		
		$fl_senddlid=intval(I('post.fl_senddlid',0));  //付款代理
		$rc_amount=trim(I('post.rc_amount',0.00)); //提现金额
		$rc_bank=intval(I('post.rc_bank',0));
		$rc_bankcard=trim(I('post.rc_bankcard',''));
		$rc_pwd=trim(I('post.rc_pwd',''));
		$rc_name=$dl_name;
		
		if($rc_bank<=0){
			$this->error('请选择开户银行','',1);
		}
		if($rc_bankcard==''){
			$this->error('请填写卡号或支付宝账号','',1);
		}
		if($rc_name==''){
			$this->error('请填写卡号/账号对应的姓名','',1);
		}
		if($rc_pwd==''){
			$this->error('请填写密码','',1);
		}

		if($dl_pwd!=MD5(MD5(MD5($rc_pwd)))){
			$this->error('填写密码不正确','',1);
		}
		
		//统计可提现金额
		$dl_balance=$this->mybalance(session('jxuser_id'));
		if($dl_balance<=0){
			$this->error('可提现金额为0',U('Angels/Balance/recash'),1);
		}
		
     if(null !== C('FANLI_RECASH')){
			if($dl_balance<C('FANLI_RECASH')){
			    $this->error('提取金额必须'.C('FANLI_RECASH').'以上',U('Angels/Balance/recash'),1);
		    }
		}else{
			if($dl_balance<100){
			    $this->error('提取金额必须100以上',U('Angels/Balance/recash'),1);
		    }
		}

		$dl_balance=number_format($dl_balance,2,'.','');

		$rc_amount=number_format($rc_amount,2,'.','');
		

        $rc_bankcard_encode=\Org\Util\Funcrypt::authcode($rc_bankcard,'ENCODE',C('WWW_AUTHKEY'),0);

		$data2=array();
		$data2['rc_unitcode']=$this->qy_unitcode;
		$data2['rc_dlid']=session('jxuser_id');  //提现的代理id
		$data2['rc_sdlid']=$fl_senddlid;    //发放提现的代理id 0-公司
		$data2['rc_money']=$rc_amount;
		$data2['rc_bank']=$rc_bank;
		$data2['rc_bankcard']=$rc_bankcard_encode;
		$data2['rc_name']=$rc_name;
		$data2['rc_addtime']=time();
		$data2['rc_dealtime']=0;
		$data2['rc_state']=0;
		$data2['rc_remark']='';
		$data2['rc_ip']=real_ip();
		$data2['rc_type']=1; //0为返利提现，1为余额提现
		$rc_verify=MD5($data2['rc_unitcode'].$data2['rc_dlid'].$data2['rc_money'].$data2['rc_bankcard'].$data2['rc_addtime']); //验证串
		$data2['rc_verify']=$rc_verify;
		
		$Recash= M('Recash');
		$rs=$Recash->create($data2,1);
		$result = $Recash->add();  
		if($result>0){
			//添加余额申请记录
			$Balance=M('Balance');
			$bldata=array();
			$bldata['bl_unitcode'] = $this->qy_unitcode;
			$bldata['bl_type'] =5;//余额分类 1-公司手动增减 2-订单增减  3-提现增减 (对于收方则是增，对于发方则是减) 4-代理充值 5-代理提现
			$bldata['bl_sendid'] =session('jxuser_id');//发款方
			$bldata['bl_receiveid'] =$fl_senddlid;//收款方
			$bldata['bl_money'] =$rc_amount;//提现金额
			$bldata['bl_rcid'] =$result;//对应提现的ID
			$bldata['bl_state'] =2;//0无效1有效2冻结
			$bldata['bl_addtime'] =time();	
			$blrs=$Balance->create($bldata,1);
			$blID=$Balance->add();
    		if($blID>0){
    		// 	//获取公司的绑定的微信openID
    		// 	$Qyinfo=M('Qyinfo');
    		// 	$qymap=array();
    		// 	$qymap['qy_code']=$this->qy_unitcode;
    		// 	$qydata=$Qyinfo->where($qymap)->find();
    		// 	if ($qydata)
    		// 	{
    		// 		$openID=$qydata['qy_openid'];
    		// 		if (!empty($openID))
    		// 		{
    		// 			//向公司发送提现申请模板消息
	     //            	$url='http://'.$_SERVER['HTTP_HOST'].U('Qywechat/Wcapi/send_tem_msg');
	     //            	$temMsgArr=C('TEMPLATE_MESSAGE_ID_LIST');
	     //            	$paramArr=array();
	     //            	$paramArr['touser']=$openID;
	     //            	$paramArr['temID']=$temMsgArr['login'];
	     //            	$dtUrl='http://'.$_SERVER['HTTP_HOST'].'/mp';//跳转后台
	     //            	$paramArr['url']=base64_encode(urldecode($dtUrl));
	     //            	$paramArr['first']='公司的代理：'.session('jxuser_id').'申请提现￥'.$rc_amount.'元';
	     //            	$paramArr['keyword1']=session('jxuser_username');
	     //            	$paramArr['keyword2']=session('jxuser_username');
	     //            	$paramArr['keyword3']=date("Y-m-d H:i:s",time());
	     //            	$paramArr['remark']='为了不影响代理的业务操作，请您尽快处理申请！';
						// $result=http_request('post',$url,$paramArr);
    		// 		}
    		// 	}
    			//代理操作日志 begin
				$odlog_arr=array(
					'dlg_unitcode'=>$this->qy_unitcode,
					'dlg_dlid'=>session('jxuser_id'),
					'dlg_operatid'=>session('jxuser_id'),
					'dlg_dlusername'=>$data['dl_username'],
					'dlg_dlname'=>$data['dl_name'],
					'dlg_action'=>'向公司提现金额'.$rc_amount.'元',
					'dlg_type'=>1, //0-企业 1-经销商
					'dlg_addtime'=>time(),
					'dlg_ip'=>real_ip(),
					'dlg_link'=>__SELF__
				);
				$Dealerlogs= M('Dealerlogs');
				$rs3=$Dealerlogs->create($odlog_arr,1);
				if($rs3){
					$Dealerlogs->add();
				}
				//代理操作日志 end
	  	 		$this->success('提现申请提交成功，请等待审核处理',U('Angels/Balance/recashlist'),1);
	  	 		exit;
	  	 	}else
	  	 	{
	  	 		$Recash->where('rc_id='.$result)->delete();
	  	 		$this->error('提现提交失败',U('Angels/Balance/recash'),1);
	  	 	}
		}else{
			$Recash->where('rc_id='.$result)->delete();
			$this->error('提现提交失败',U('Angels/Balance/recash'),1);
		}
	}

	//余额提现详细
    public function recashdetail(){
        if(!$this->is_jxuser_login()){
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
		    $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
 			$tagpage='http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			$this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
		//--------------------------------
		
        $rc_id=intval(I('get.rc_id',0));
		$map=array();
		$map['rc_id']=$rc_id;
		$map['rc_unitcode']=$this->qy_unitcode;
		$map['rc_dlid']=session('jxuser_id');
		
		$Recash= M('Recash');
		$Dealer= M('Dealer');
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
					$data['rc_statestr']='处理中';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败';
				}else{
					$data['rc_statestr']='异常';
				}
            }else{
				if($data['rc_state']==0){
					$data['rc_statestr']='处理中[异常]';
				}else if($data['rc_state']==1){
					$data['rc_statestr']='提现成功[异常]';
				}else if($data['rc_state']==2){
					$data['rc_statestr']='提现失败[异常]';
				}else{
					$data['rc_statestr']='异常';
				}
			}
			
			//付款代理
			if($data['rc_sdlid']==0){
				$data['fl_sdl_name']='总公司';
				$data['fl_sdl_username']='';
			}else{
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['rc_sdlid'];
				$map3['dl_unitcode']=$this->qy_unitcode;

				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['fl_sdl_name']=$data3['dl_name'];
					$data['fl_sdl_username']=$data3['dl_username'];
				}else{
					$data['fl_sdl_name']='';
					$data['fl_sdl_username']='';
				}
			}
			
			$imgpath = BASE_PATH.'/Public/uploads/orders/';
			//图片
            if(is_not_null($data['rc_pic']) && file_exists($imgpath.$data['rc_pic'])){
                $data['rc_pic_str']='<a href="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  target="_blank" ><img src="'.__ROOT__.'/Public/uploads/orders/'.$data['rc_pic'].'"  border="0" style="vertical-align:middle;width;10%"  ></a>';
            }else{
                $data['rc_pic_str']='';
            }
			
			
			
		}else{
			$this->error('没有该记录','',2);
		}

        $this->assign('recashinfo', $data);
        $this->display('recashdetail');
	}	
}