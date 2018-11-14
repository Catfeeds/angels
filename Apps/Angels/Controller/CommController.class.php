<?php
namespace Angels\Controller;
use Think\Controller;
     
    class CommController extends Controller
    {
        protected $qy_unitcode;
        protected $qy_fwkey;
        protected $qy_fwsecret;

        public function _initialize()
        {
           
            $this->qy_unitcode = is_not_null(C('QY_UNITCODE')) ? trim(C('QY_UNITCODE')):'';
            $this->qy_fwkey = is_not_null(C('QY_FWKEY')) ? trim(C('QY_FWKEY')):'';
            $this->qy_fwsecret = is_not_null(C('QY_FWSECRET')) ? trim(C('QY_FWSECRET')):'';

            if($this->qy_unitcode=='' || $this->qy_fwkey=='' || $this->qy_fwsecret==''){
                echo 'error:No record';
                exit;
            }

        }
        //判断登录 消费用户 使用用户账号
        public function is_user_login(){
            $user_check=cookie('user_check');
            $user_name=session('user_name');
            $user_time=session('user_time');
            $user_id=session('user_id');
            $user_unitcode=session('user_unitcode');


            if($user_check=='' || $user_name=='' || $user_time=='' || $user_id=='' || $user_unitcode==''){
                return false;
            }else{
                if($user_unitcode==$this->qy_unitcode){
                    if($user_check==MD5($user_name.$user_time).MD5($user_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
	
	    //判断微信登录 消费用户 微信
        public function is_user_wxlogin(){
            $user_check=cookie('user_check');
            $user_name=session('user_name');
            $user_time=session('user_time');
            $user_id=session('user_id');
            $user_unitcode=session('user_unitcode');
			$user_openid=session('user_openid');

            if($user_check=='' || $user_name=='' || $user_time=='' || $user_id=='' || $user_unitcode==''|| $user_openid==''){
                return false;
            }else{
                if($user_unitcode==$this->qy_unitcode){
                    if($user_check==MD5($user_openid.$user_time).MD5($user_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//判断登录 经销商 用户名登录  
        public function is_jxuser_login(){
            $jxuser_check=cookie('jxuser_check');
            $jxuser_time=session('jxuser_time');
            $jxuser_id=session('jxuser_id');
            $jxuser_unitcode=session('jxuser_unitcode');
            if($jxuser_check=='' || $jxuser_time=='' || $jxuser_id=='' || $jxuser_unitcode==''){
                return false;
            }else{
                if($jxuser_unitcode==$this->qy_unitcode){
                    if($jxuser_check==MD5($jxuser_id.$jxuser_time).MD5($jxuser_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//判断微信登录 经销商 微信
        public function is_jxuser_wxlogin(){
            $jxuser_check=cookie('jxuser_check');
            $jxuser_time=session('jxuser_time');
            $jxuser_id=session('jxuser_id');
            $jxuser_unitcode=session('jxuser_unitcode');
			$jxuser_openid=session('jxuser_openid');
            
			
            if($jxuser_check=='' || $jxuser_time=='' || $jxuser_id=='' || $jxuser_unitcode==''|| $jxuser_openid==''){
                return false;
            }else{
                if($jxuser_unitcode==$this->qy_unitcode){
                    if($jxuser_check==MD5($jxuser_openid.$jxuser_time).MD5($jxuser_time)){
                        return true;
                    }else{
                        return false;
                    }
                }else{
                    return false;
                }
            }
        }
		
		//返回上家ID 根据申请的级别和推荐人的上家 $jxid-推荐人的上家  $apply_level-申请级别 
		public function get_dlbelong($jxid,$apply_level){
			$Dltype = M('Dltype');
			$Dealer = M('Dealer');
			//上家信息-1
			$map=array();
			$data=array();
			$map['dl_id']=intval($jxid);
			$map['dl_unitcode']=$this->qy_unitcode;
			$data=$Dealer->where($map)->find();
			if($data){
				if($data['dl_status']==1){
					//上家的级别-1
					$map2=array();
					$data2=array();
					$map2['dlt_id']=$data['dl_type'];
					$map2['dlt_unitcode']=$this->qy_unitcode;
					$data2=$Dltype->where($map2)->find();
					if($data2){
						if($apply_level<=$data2['dlt_level']){  //如果申请的级别高于 或 同级 
						    if($data['dl_belong']>0){
							    return $this->get_dlbelong($data['dl_belong'],$apply_level);
							}else{
								return 0;
							}
						}else{
							return $data['dl_id'];
						}
					}else{
						return false;
					}
				}else{  //上家的上家
					if($data['dl_belong']>0){
						return $this->get_dlbelong($data['dl_belong'],$apply_level);
					}else{
						return 0;
					}
				}
			}else{
				return false;
			}
		}
		
          //我的余额
        /*@probean  产品信息
          @dl_id    代理id
         */
        public function mybalance($dl_id,$bl_time=0){
            //--------------------------------
            if ($dl_id>0)
            {
                $balanceSum=0.00;
                $balancePaySum=0.00;

                $Balance=M('Balance');
                $map=array();
                $map['bl_unitcode'] =$this->qy_unitcode;
                $map['bl_receiveid'] =$dl_id;
                $map['bl_state'] =1;  //0无效，1有效，2冻结
                if ($bl_time>0)
                $map['bl_addtime'] =array('ELT',$bl_time);//时间范围
                $moneySum=$Balance->where($map)->sum('bl_money'); //总有效余额
                if ($moneySum>0)
                     $balanceSum=$moneySum;
                $map2=array();
                $map2['bl_unitcode'] =$this->qy_unitcode;
                $map2['bl_sendid'] =$dl_id;
                $map2['bl_state'] =array('in','1,2');  //完成的订单 ;  //0无效，1有效，2冻结
                if ($bl_time>0)
                $map2['bl_addtime'] =array('ELT',$bl_time);//时间范围
                $moneyPaySum=$Balance->where($map2)->sum('bl_money'); //总支付的有效余额
                if ($moneySum>0)
                    $balancePaySum=$moneyPaySum;
                $balanceSum-$balancePaySum>0.00?$balanceTotal=$balanceSum-$balancePaySum:$balanceTotal=0.00;
            }else
            {
              $balanceTotal=true; //公司的余额
            }
            return $balanceTotal;
        }

        function strCut($str,$length)//$str为要进行截取的字符串，$length为截取长度（汉字算一个字，字母算半个字）
        {
            $str = trim($str);
            $string = "";
            if(strlen($str) > $length)
            {
                for($i = 0 ; $i<$length ; $i++)
                {
                    if(ord($str) > 127)
                    {
                        $string .= $str[$i] . $str[$i+1] . $str[$i+2];
                        $i = $i + 2;
                    }
                    else
                    {
                        $string .= $str[$i];
                    }
                }
                $string .= "...";
                return $string;
            }
            return $str;
        }

		
        public function _empty()
        {
          header('HTTP/1.0 404 Not Found');
          echo'error:404';
          exit;
        }
}