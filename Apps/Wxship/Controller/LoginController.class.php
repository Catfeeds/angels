<?php
namespace Wxship\Controller;
use Think\Controller;
class LoginController extends Controller {
    public function index(){
		echo 'wxlogin';
		exit;
    }

	//微信授权登录 
	public function wxlogin(){	
		if(C('IS_ONLYWEIXIN')==1){
			$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
			if (strpos($user_agent, 'micromessenger') === false){
				$this->error('请在微信客户端打开链接','',-1);
				exit;
			}
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
		if(($nowtime - $ttamp) > 60) {
			$this->error('该链接已失效,请刷新二维码重新扫描','',2);
		}
		
	    //回调URL
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.C('QY_ZXWXAPPID').'&redirect_uri=http%3a%2f%2fwww.cn315fw.com%2fwxship%2flogin%2fwxcallback?qycode='.$qycode.'&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect';  
	    header("Location:".$url);  
    }

	//微信授权回调获取用户信息
	public function wxcallback(){	
	    $code=trim(I('get.code',''));
		$qycode=trim(I('get.qycode',''));

        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
			goto gotoEND;
			exit;
		}
		
		if($code!=''){
			$Qysubuser= M('Qysubuser');
			//用code换取access_token
			$get_token_url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.C('QY_ZXWXAPPID').'&secret='.C('QY_ZXWXAPPSECRET').'&code='.$code.'&grant_type=authorization_code';  
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
											'log_action'=>'企业子用户扫码登录',
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
							$this->redirect('/Wxship/Login/subuseradd/qycode/'.$qycode.'/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
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
						
						$this->redirect('/Wxship/Index/index','' , 0, '');
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
		$this->error('微信授权失败，请扫二维码重新尝试','',-1);
		exit;
	}
	
   	//添加子账户 
    public function subuseradd(){
		if(C('IS_ONLYWEIXIN')==1){
			$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
			if (strpos($user_agent, 'micromessenger') === false){
				$this->error('请在微信客户端打开链接','',-1);
				exit;
			}
		}
		
		$action=trim(I('post.action',''));
		
        //保存提交申请
	    if (IS_POST && $action=='save'){
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
            $this->error('该链接已失效,请刷新二维码重新扫描','',-1);
        }
		if(MD5($ttamp.$qycode.$ttamp)!=$sture){
			$this->error('该链接已失效,请刷新二维码重新扫描','',-1);
		}
        if(($nowtime - $ttamp) > 30) {
            $this->error('该链接已失效,请刷新二维码重新扫描','',-1);
        }
		if(!is_not_null($openid)){
			$this->error('该链接已失效,请刷新二维码重新扫描','',-1);
		}
		
		$Qysubuser= M('Qysubuser');
        $map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		
		$data=$Qysubuser->where($map)->find();
		if($data){
			$this->error('该微信已存在','',-1);
		}
		$ttamp2=time();
		$sture2=MD5($qycode.$openid.$ttamp2);
		
		$this->assign('qycode', $qycode);
		$this->assign('sture', $sture2);
		$this->assign('ttamp', $ttamp2);

		$this->display('subuseradd');	
	}		

	
}