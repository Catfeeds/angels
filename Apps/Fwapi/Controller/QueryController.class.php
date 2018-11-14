<?php
namespace Fwapi\Controller;
use Think\Controller;
class QueryController extends Controller {
    //该页一般是嵌套在客户站点页面内 为了兼容大部分浏览器 不用cookie
    public function index(){
    	$nowtime=get_millisecond();
        $lastrequest=\Org\Util\Funcrypt::authcode($nowtime,'ENCODE',C('WWW_AUTHKEY'),0);
 
        $k=I('get.k','');  //fwkey  风格 语言 其他 如：：query?k=keykeykey_0_0_0_0 说明：key_风格_语言_备用_备用
        if($k==''){
            echo '';
            exit;
        }else{
            $karr=explode('_',$k);
        }

        $fwkey = isset($karr[0])?trim($karr[0]):'';
        $style = isset($karr[1])?intval($karr[1]):0;
        $lang = isset($karr[2])?intval($karr[2]):0;

        $this->assign('fwkey', $k);
        $this->assign('lastrequest', $lastrequest);
        $this->assign('lang', $lang);
		
		$fwcode=trim(I('get.fwcode',''));
		if($fwcode!=''){
            if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                $fwcode='';
            }
        }
		
		$this->assign('fwcode', $fwcode);

        if($style==1){
           $this->display('index2'); 
        }elseif($style==2){
           $this->display('index3');
		}elseif($style==4){
           $this->display('index4');
        }else{
           $this->display('index'); 
        }
    }
    //验证码
    public function verify(){
        header('P3P: CP="CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR"');
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
            $fwkey=trim(I('post.fwkey',''));
            $lastrequest=trim(I('post.lastrequest',''));
            $nowtime=get_millisecond();
        }else{
			$msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码');
			echo json_encode($msg);
			exit;
        }

        if($referer==''){
            $referer=trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
            
        }else{
            $referer=$referer.'_'.trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
        }
        $referer=substr($referer,0,400);

        if($fwcode==''){
			$msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码');
			echo json_encode($msg);
			exit;
        }
		if($fwcode!=''){
			if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
				$msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码');
				echo json_encode($msg);
				exit;
			}
		}
        $qycode=substr($fwcode,0,4);

        $karr=explode('_',$fwkey);
        $fwkey = isset($karr[0])?trim($karr[0]):'';

        if($fwkey==''){
            $msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码.');
            echo json_encode($msg);
            exit;
        }

        $deqycode=\Org\Util\Funcrypt::authcode($fwkey,'DECODE',C('QY_FWDEKEY'),0);


        //安全防御   
        //请求时间不能过短 也不能过长
        if($lastrequest==''){
            $msg=array('fwc'=>'','stat'=>'5','msg'=>'页面已过期，请刷新页面重新查询');
            echo json_encode($msg);
            exit;
        }
        $is_checkcode=0;
        $lastrequest=floor(\Org\Util\Funcrypt::authcode($lastrequest,'DECODE',C('WWW_AUTHKEY'),0));

        if((($nowtime - $lastrequest) < 500) || (($nowtime - $lastrequest) > 1200000)) {
            $msg=array('fwc'=>'','stat'=>'5','msg'=>'页面已过期，请刷新页面重新查询');
            echo json_encode($msg);
            exit;
        }

        //同IP一定时间内访问限制 要输入验证码 30分钟 30次 
        $uip=real_ip();
        $map=array();
        $Templist = M("Templist");
        $map['tmp_ip']=$uip;
        $map['tmp_state']=1;
        $map['tmp_addtime']=array('EGT',time()-1800);
        $count = $Templist->where($map)->count();
        if($count>30){
            $is_checkcode=1;
        }

        //对同一qycode 6小时内调用接口限制  判断是否要输入验证码
        $map=array();
        $map['tmp_unitcode']=$qycode;
        $map['tmp_state']=1;
        $map['tmp_addtime']=array('EGT',time()-3600*6); 
        $tlcount = $Templist->where($map)->count();
        
        $is_localquery=1;
        $map=array();
        $map['qy_code']=$qycode;
        $Qyinfo= M('Qyinfo');
        $data=$Qyinfo->where($map)->find();
        $qy_relation='';
        if($data){
            if($data['qy_querytimes']<$tlcount){
	            $is_checkcode=1;
            }
            $is_localquery=0;
            $qy_relation=$data['qy_relation'];
        }
        
        //检测fwkey和码
        if(substr($qycode,0,3)!='999' ){
            if($deqycode!=$qycode){
				if($deqycode=='zxfw315'){
					//通用
				}else{
					if($qy_relation==''){
						$msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码.');
						echo json_encode($msg);
						exit;
					}else{
						if(strpos($qy_relation,$qycode)===false || strpos($qy_relation,$deqycode)===false ){
							$msg=array('fwc'=>'','stat'=>'5','msg'=>'请重新正确输入防伪码.');
							echo json_encode($msg);
							exit;
						}
					}
				}
            }
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
                $data['tmp_referer']=$referer.'_Local_APIQuery';
                $Templist= M('Templist');
    	        $Templist->create($data,1);
    	        $Templist->add();

                echo json_encode($msg_arr);
    		    exit;
    	    } 
        }else{
            //云服查询
            $uip=real_ip();
            if($fwcode=='1781874041266262'){ //特殊处理
				$msg_arr=array('fwc'=>$fwcode,'stat'=>'1','msg'=>'您好！您所查询的是深圳古圣堂产品，属正品，请放心使用，谢谢您的查询，再见！');
			}else{
				$fwcoders=fwcode_to_result($fwcode,0,$uip,1);
				if($fwcoders===false){
					$msg_arr=array('fwc'=>$fwcode,'stat'=>'5','msg'=>C('SEND_MESSAGE')['msg03']);
				}else{
					$msg_arr=$fwcoders;
				}
			}

            //记录查询 db
            $data=array();
            $data['tmp_unitcode']=$qycode;
            $data['tmp_code']=$msg_arr['fwc'];
            $data['tmp_state']=$msg_arr['stat'];
            $data['tmp_ip']=$uip;
            $data['tmp_addtime']=time();
            $data['tmp_remark']=$msg_arr['msg'];
            $data['tmp_referer']=$referer.'_APIQuery';
            $Templist= M('Templist');
            $Templist->create($data,1);
            $Templist->add();

            echo json_encode($msg_arr);
            exit;
        }
    }

    //直接显示结果
    public function result(){
        if (IS_POST) {
            $fwcode=trim(I('post.fwcode',''));
            $referer=trim(I('post.referer',''));
            $ip=trim(I('post.ip',''));
        }else{
            $msg='请重新正确输入防伪码';
        }

        if($referer==''){
            $referer=trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
            
        }else{
            $referer=$referer.'_'.trim(I('server.HTTP_REFERER','')).'_'.trim(I('server.HTTP_USER_AGENT',''));
        }
        $referer=substr($referer,0,200);

        if($fwcode==''){
            $msg='请重新正确输入防伪码';
        }
        if($fwcode!=''){
            if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                $msg='请重新正确输入防伪码';
                $fwcode='';
            }
        }

        if($fwcode!=''){
            if($ip==''){
                $ip=real_ip();
            }
            $fwkey='8a4bkBOYG8eULTFEqp65vF44IUWiN5VXXoFMi0uzfVX5l2TC22hF';
            $timestamp=time();
            $qy_fwsecret='KdegCH87K7g5Fol0iPk4hrFtpxqD5GuK';
            $signature=MD5($fwkey.$fwcode.$timestamp.$qy_fwsecret);
            
            $url='http://www.cn315fw.com/fwapi/Getres?fwkey='.urlencode($fwkey).'&ip='.urlencode($ip).'&fwcode='.urlencode($fwcode).'&signature='.urlencode($signature).'&timestamp='.urlencode($timestamp).'&referer='.urlencode($referer);  
            
            $data=@file_get_contents($url);

            if($data===FALSE){
                $msg='请正确输入标签上的防伪码';
            }else{

               $data_arr=json_decode($data,true); 
               if(!is_array($data_arr)){
                    $msg='请正确输入标签上的防伪码';
               }else{
                    $msg=$data_arr['msg'];
               }
            }
        }

        $this->assign('fwcode', $fwcode);
        $this->assign('msg', $msg);

        $this->display('result');
    }
}