<?php
namespace Angels\Controller;
use Think\Controller;
class AgentController extends CommController {
    //代理商查询
    public function index(){
        $action=trim(I('post.action',''));
        
		if ($action=='search') {
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
			
			$keyword=I('post.keyword','');
			
			if($keyword==''){
				$msg=array('stat'=>0,'msg'=>'请输入代理商微信号/手机号');
				echo json_encode($msg);
				exit;
			}
			if(!preg_match("/^[a-zA-Z0-9_-]{4,30}$/",$keyword)){
				$msg=array('stat'=>0,'msg'=>'请正确输入代理商微信号/手机号');
				echo json_encode($msg);
				exit;
			}
			
			$where['dl_tel']=$keyword;
			$where['dl_weixin']=$keyword;
			$where['_logic'] = 'or';
			$map['_complex'] = $where;

			$map['dl_unitcode']=$this->qy_unitcode;
			$map['dl_status']=1;
			$Dealer= M('Dealer');
			$data=$Dealer->where($map)->find();
			if($data){
				$data['dl_weixin_s']='';
				$data['dl_tel_s']='';
				if($data['dl_weixin']!=''){
					$data['dl_weixin_s']=substr($data['dl_weixin'],0,1).'****'.substr($data['dl_weixin'],-4);
				}
				if($data['dl_tel']!=''){
					$data['dl_tel_s']=substr($data['dl_tel'],0,3).'****'.substr($data['dl_tel'],-4);
				}

				$str= '<li class="ui-border-t"><h4>代理商微信：'.$data['dl_weixin_s'].'</h4></li>';
				$str.= '<li class="ui-border-t"><h4>代理商名称：'.$data['dl_name'].'</h4></li>';
				$str.= '<li class="ui-border-t"><h4>代理商电话：'.$data['dl_tel_s'].'</h4></li>';

				
				$Brandattorney = M('Brandattorney');
				$map5=array();
				$map5['ba_unitcode']=$this->qy_unitcode;
				$map5['ba_dealerid']=$data['dl_id'];
				$data5 = $Brandattorney->where($map5)->select();
				
				foreach($data5 as $k=>$v){
                    if($v['ba_pic']!=''){
					    $str.= '<li class="ui-border-t" style="text-align:center" ><p style="text-align:center" ><img src="'.__ROOT__.'/Public/uploads/product/'.$v['ba_pic'].'"  border="0"  style="vertical-align:middle;width:80%" ></p></li>';
			        }
			    }
				
				$msg=array('stat'=>1,'msg'=>$str);
				echo json_encode($msg);
				exit;
			}else{
				$msg=array('stat'=>0,'msg'=>'该代理不存在，请正确输入代理商微信号/手机号');
				echo json_encode($msg);
				exit;
			}
		}else{
			$qy_fwkey=$this->qy_fwkey;
			$qy_fwsecret=$this->qy_fwsecret;
			$ttamp2=time();
			$sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
			
			$this->assign('ttamp', $ttamp2);
			$this->assign('sture', $sture2);

			$this->display('index');
		}
    }
	
}