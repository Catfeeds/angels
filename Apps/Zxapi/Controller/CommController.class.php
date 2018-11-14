<?php
namespace Zxapi\Controller;
use Think\Controller;
    class CommController extends Controller
    {
		protected $qycode='';
		protected $subusername='';
		protected $subuserid='';
		protected $qysu_purview='';
		protected $dltj_arrs=array();
		
        public function _initialize()
        {

            if(!$this->is_user_login()){
				$msg=array('login'=>'0','stat'=>'0','msg'=>'登录已过期');
				echo json_encode($msg);
				exit;
            }

			if($this->qycode=='' || $this->subuserid=='' || $this->subusername==''){
				$msg=array('login'=>'0','stat'=>'0','msg'=>'登录已过期');
				echo json_encode($msg);
				exit;
			}
        }
        //判断登录
        public function is_user_login(){
			$uname=trim(I('post.uname',''));
			$uttamp=trim(I('post.uttamp',''));
			$usture=trim(I('post.usture',''));
			
			if($uname=='' || $uttamp=='' || $usture==''){
				return false;
			}else{
				if((time()-$uttamp)>600){
					return false;
				}
				if(!preg_match("/[a-zA-Z0-9_:]{6,20}$/",$uname)){
                    return false;
                }
                $Qysubuser = M('Qysubuser');
				$Applogin = M('Applogin');
				$map=array();
				$map['lg_username']=$uname;
				$data=$Applogin->where($map)->find();
				if($data){
					if((time()-$data['lg_time'])<172800){
						if($usture==MD5($data['lg_token'].$data['lg_imei'].$uttamp)){
							$this->qycode = $data['lg_unitcode'];
							$this->subuserid = $data['lg_userid'];
							$this->subusername = $data['lg_username'];
							$map2=array();
							$map2['su_unitcode']=$data['lg_unitcode'];
							$map2['su_id']=$data['lg_userid'];
							$data2=$Qysubuser->where($map2)->find(); 
							if($data2){
								$this->qysu_purview=$data2['su_purview'];
							}
							return true;
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}
        }

		//验证管理权限 
        public function checksu_qypurview($ac='',$re=0)
        {
        	$qysu_purview=$this->qysu_purview;
		if(strpos($qysu_purview,',')===false){
		   if($qysu_purview==$ac)
		   {
		   	  if($re==0){
                        return true;
                    }else{
                    }
		   }else
		   {
		   		if($re==0){
                    return false;
                }else{
                    $this->error('对不起，没有该权限！','',1);
                }
		   }
		}else{
			$su_purviewarr=explode($ac, $qysu_purview);
			if(count($su_purviewarr)>0 && is_not_null($ac)){
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
		}
        }
		
	/**
     * getDealerInfo 获取代理信息
     * @param $code
     * @return bool
     */
    public function getDealerInfo($user_id=0,$fieldstr='')
    {
        if ($user_id>0)
        {
            $Dealer=M('Dealer');
            $map=array();
            $map['dl_unitcode']=$this->qy_unitcode;
            $map['dl_id']=$user_id;
            if ($fieldstr)
                $data=$Dealer->where($map)->field($fieldstr)->find();
            else
                $data=$Dealer->where($map)->find();
            if($data){
                return $data;
            }
        }
        return false;   
    }

    /**
     * getDlTypeInfo 获取代理级别的信息
     * @param $code
     * @return bool
     */
    public function getDlTypeInfo($user_id=0,$fieldstr='')
    {
        $dlInfo=$this->getDealerInfo($user_id,'dl_type,dl_level');
        if ($dlInfo)
        {
            $Dltype=M('Dltype');
            $map=array();
            $map['dlt_unitcode']=$this->qy_unitcode;
            $map['dlt_level']=$dlInfo['dl_level'];
            $map['dlt_id']=$dlInfo['dl_type'];
            if ($fieldstr)
                $data=$Dltype->where($map)->field($fieldstr)->find();
            else
                $data=$Dltype->where($map)->find();
            if($data){
                return $data;
            }
        }
        return false;  
    }

    /**
     * getReDealerID 迭代获取所有推荐人(代理)数组
     * @param $code
     * @return bool
     */
    public function getReDealerArr($user_id=0)
    {
       if ($user_id>0)
        {
            $dlInfo=$this->getDealerInfo($user_id,'dl_referee');
            if ($dlInfo&&$dlInfo['dl_referee']>0)
            {
               $redlInfo=$this->getDealerInfo($dlInfo['dl_referee'],'dl_id,dl_name,dl_level,dl_status,dl_type,dl_referee,dl_belong');
               if ($redlInfo)
               {
                    $this->dltj_arrs[]=array('id'=>$redlInfo['dl_id'],'name'=>$redlInfo['dl_name'],'level'=>$redlInfo['dl_level'],'typeid'=>$redlInfo['dl_type'],'belong'=>$redlInfo['dl_belong'],'state'=>$redlInfo['dl_status']);     
                    if ($redlInfo['dl_referee']>0)
                    {
                        $this->getReDealerArr($redlInfo['dl_id']);
                    }
               }
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