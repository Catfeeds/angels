<?php
namespace Wxship\Controller;
use Think\Controller;
     
    class CommController extends Controller
    {
        
        public function _initialize()
        {
			if(C('IS_ONLYWEIXIN')==1){
				$user_agent=strtolower(I('server.HTTP_USER_AGENT'));
				if (strpos($user_agent, 'micromessenger') === false){
					$this->error('请在微信客户端打开链接','',-1);
					exit;
				}
			}
			
            if(!$this->is_subuser_wxlogin()){
				//验证是否有效链接
				$ttamp=trim(I('get.ttamp',''));
				$sture=trim(I('get.sture',''));
				$qycode=trim(I('get.qycode',''));
					
				if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
					$this->error('授权已失效,请重新扫描二维码登录','',-1);
				}
				if(MD5($ttamp.$qycode.$ttamp)!=$sture){
					$this->error('授权已失效,请重新扫描二维码登录','',-1);
				}
		
				$ttamp2=time();
				$sture2=MD5($ttamp2.$qycode.$ttamp2);
				$this->redirect('/Wxship/Login/wxlogin/qycode/'.$qycode.'/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
				
            }
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

		
        //验证管理权限 
        public function checksu_qypurview($ac='',$re=0)
        {
            $qysu_purview=session('qysu_purview');

            if(is_array($qysu_purview) && count($qysu_purview)>0 && is_not_null($ac)){
                if(isset($qysu_purview[$ac])){
                    if($re==0){
                        return true;
                    }else{
                    }
                }else{
                    if($re==0){
                        return false;
                    }else{
                        $this->error('对不起，没有该权限！','',1);
                    }
                }
            }else{
                if($re==0){
                    return false;
                }else{
                    $this->error('对不起，没有该权限！','',1);
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