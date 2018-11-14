<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

    public function index(){
		
		//是否手机访问
        if(is_mobile()){
           $this->redirect('M/Index/index','' , 0, '');
           exit;
        }
		
    	//防止频繁刷新 1000毫秒
        if(requ_security(1,1000,'','','')){
            $this->error('页面已过期，请刷新页面重新查询',U('/'),3);
        }
        $referer=trim(I('server.HTTP_REFERER',''));
        $this->assign('referer', $referer);
        $this->display('index');
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
   

    //返回查询结果
    public function ajaxres(){
        if (IS_POST) {
            $fwcode=trim(I('post.fwcode',''));
			$referer=trim(I('post.referer',''));
        }else{
			$msg=array('fwc'=>'','stat'=>'5','msg'=>'请正确输入防伪码或扫二维码查询');
			echo json_encode($msg);
			exit;
        }
		
		if($referer==''){
            $referer=trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
            
        }else{
            $referer=$referer.'_'.trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
        }
        
        $referer=substr($referer,0,300);

        if($fwcode==''){
			$msg=array('fwc'=>'','stat'=>'5','msg'=>'请正确输入防伪码或扫二维码查询');
			echo json_encode($msg);
			exit;
        }
		if($fwcode!=''){
			if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
				$msg=array('fwc'=>'','stat'=>'5','msg'=>'请正确输入防伪码或扫二维码查询');
				echo json_encode($msg);
				exit;
			}
		}

        //安全防御
        //防止频繁刷新 1000毫秒 二次请求时间间隔过短 2000毫秒
        if(requ_security('1|2',1000,'2000','','')){
            sleep(1);
            $msg=array('fwc'=>'','stat'=>'5','msg'=>'页面已过期，请刷新页面重新查询');
            echo json_encode($msg);
		    exit;
        }

        
        $is_checkcode=0;
        //查询次数访问限制 判断是否要输入验证码
        if(requ_security('4|8','','',15,20)){
        	$is_checkcode=1;
        }

        //对同一qycode 6小时内调用接口限制  判断是否要输入验证码
        $qycode=substr($fwcode,0,4);
        $map=array();
        $Tellist = M("Tellist");
        $map['unitcode']=$qycode;
        $map['querystatu']='正确';
        $querydate=time()-3600*6;
        $map['querydate']=array('EGT',date('Y-m-d H:i:s',$querydate)); 
        $tlcount = $Tellist->where($map)->count();
        
        $is_localquery=1;
        $map=array();
        $map['qy_code']=$qycode;
        $Qyinfo= M('Qyinfo');
        $data=$Qyinfo->where($map)->find();
        if($data){
            if($data['qy_querytimes']<$tlcount){
	            $is_checkcode=1;
            }
            $is_localquery=0;
        }
        //检测验证码
        if($is_checkcode==1){
	        $checkcode=trim(I('post.checkcode',''));

	    	if($checkcode==''){
	            $msg=array('fwc'=>'','stat'=>'9','msg'=>'请正确输入验证码');
	            echo json_encode($msg);
			    exit;
	        }else{
	            $verify = new \Think\Verify();
	            if(!($verify->check($checkcode))){
		            $msg=array('fwc'=>'','stat'=>'9','msg'=>'请正确输入验证码');
		            echo json_encode($msg);
				    exit;
	            }
	        }
        }
		
		//特殊添加
		if($fwcode=='2811566790782823'){
			$msg=array('fwc'=>'2811566790782823','stat'=>'1','msg'=>'您好，您所查询的产品是雅仕洛官方的正品产品，请放心使用，谢谢！--关注微信公众号可随时查看雅仕洛品牌讯息');
			echo json_encode($msg);
			exit;
		}
			


        if($is_localquery==1){
            //本地服ip 到本服查询
            $Sip= M('sip');
            $data=$Sip->where('s_id=1')->find();
            if($data){
                $ip=$data['s_ip'];
            }else{
                $msg=array('fwc'=>'','stat'=>'5','msg'=>'网络繁忙');
                echo json_encode($msg);
                exit;
            }

            $uip=real_ip();
            $url="http://".$ip.":6080/q.asp?t=json&ip=".$uip."&fwcode=".$fwcode; 
            $output=@file_get_contents($url);
            if($output===FALSE){
                $msg=array('fwc'=>'','stat'=>'5','msg'=>'网络繁忙');
                echo json_encode($msg);
                exit;
            }else{
                $msg=trim($output);
                $msg=get_gb_to_utf8(strip_tags($msg));
                $msg_arr=json_decode($msg, true); 
                

                //记录查询 db
                $data=array();
                $data['tmp_unitcode']=$qycode;
                $data['tmp_code']=$msg_arr['fwc'];
                $data['tmp_state']=$msg_arr['stat'];
                $data['tmp_ip']=$uip;
                $data['tmp_addtime']=time();
                $data['tmp_remark']=$msg_arr['msg'];
                $data['tmp_referer']=$referer.'_Local_index';
                $Templist= M('Templist');
                $Templist->create($data,1);
                $Templist->add();
                //记录查询次数 cookie
                $requesttimes=floor(\Org\Util\Funcrypt::authcode(cookie('requesttimes'),'DECODE',C('WWW_AUTHKEY'),0));
                cookie('requesttimes',\Org\Util\Funcrypt::authcode($requesttimes+1,'ENCODE',C('WWW_AUTHKEY'),0),1800);

                echo json_encode($msg_arr);
                exit;
            } 
        }else{
            //云服查询
            $uip=real_ip();

            $fwcoders=fwcode_to_result($fwcode,0,$uip,1);
            if($fwcoders===false){
                $msg_arr=array('fwc'=>$fwcode,'stat'=>'5','msg'=>C('SEND_MESSAGE')['msg03']);
            }else{
                $msg_arr=$fwcoders;
            }

            //记录查询 db
            $data=array();
            $data['tmp_unitcode']=$qycode;
            $data['tmp_code']=$msg_arr['fwc'];
            $data['tmp_state']=$msg_arr['stat'];
            $data['tmp_ip']=$uip;
            $data['tmp_addtime']=time();
            $data['tmp_remark']=$msg_arr['msg'];
            $data['tmp_referer']=$referer.'_index';
            $Templist= M('Templist');
            $Templist->create($data,1);
            $Templist->add();
            //记录查询次数 cookie
            $requesttimes=floor(\Org\Util\Funcrypt::authcode(cookie('requesttimes'),'DECODE',C('WWW_AUTHKEY'),0));
            cookie('requesttimes',\Org\Util\Funcrypt::authcode($requesttimes+1,'ENCODE',C('WWW_AUTHKEY'),0),1800);

            echo json_encode($msg_arr);
            exit;
        }
    }   
}