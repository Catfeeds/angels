<?php
namespace Wxship\Controller;
use Think\Controller;
class IndexController extends CommController {
    

    public function index(){
		//确保openid存在
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
		if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期','',-1);
		}
		
		//-------------------------------------------
		$map=array();
		$map['su_openid']=$openid;
		$map['su_unitcode']=$qycode;
		$map['su_status']=1;
		$map['su_belong']=0;
		$Qysubuser= M('Qysubuser');
		$sudata=$Qysubuser->where($map)->find();
		if($sudata){
			//判断出入库权限
			$Qyinfo= M('Qyinfo');
			$map2=array();
			$map2['qy_code']=$qycode;
			$map2['qy_active']=1;
            $qydata=$Qyinfo->where($map2)->find();
			if($qydata){
                $qy_purview_arr=array();
				$purview_arr=array();
				$qy_purview=$qydata['qy_purview'];
				if(is_not_null($qy_purview)){
					$qy_purview_arr=explode(",", $qy_purview);
					foreach($qy_purview_arr as $k =>$v){
						$purview_arr[$v]=$v;
					}
				}else{
					$purview_arr=array();
				}
			}else{
			    session(null);
			    $this->error('授权已过期','',-1);
			}
			
			$su_name=$sudata['su_name'];
			
			session('qysu_purview',$purview_arr);
			//----
		}else{
			session(null);
			$su_name='';
			$this->error('授权已过期','',-1);
		}
		//---------------------------------
		
		$this->assign('purview_arr', $purview_arr);
		$this->assign('su_name', $su_name);
		$this->display('index');
    }
	
	

	
	
}