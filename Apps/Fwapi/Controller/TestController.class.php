<?php
namespace Fwapi\Controller;
use Think\Controller;
class TestController extends Controller {
	//普通接口 返回json格式
    public function index(){
        if (IS_POST) {
            $uip=trim(I('post.ip',''));
            $fwkey=trim(I('post.fwkey',''));
            $fwcode=trim(I('post.fwcode',''));
            $timestamp=trim(I('post.timestamp',''));
            $signature=trim(I('post.signature',''));
            $referer=trim(I('post.referer',''));
        }else{
            $uip=trim(I('get.ip',''));
            $fwkey=trim(I('get.fwkey',''));
            $fwcode=trim(I('get.fwcode',''));
            $timestamp=trim(I('get.timestamp',''));
            $signature=trim(I('get.signature',''));
            $referer=trim(I('get.referer',''));
        }
        if($referer==''){
            $referer=isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:'';
        }
        if($uip==''){
		   $uip=real_ip();
		}
		if(!preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/',$uip)){
		   $uip='';
		}
        echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';

		if($fwcode!=''){
			if(!preg_match("/^[0-9]{10,24}$/",$fwcode)){
                echo '请正确输入防伪码或扫二维码查询1';
				exit;
			}
		}else{
            echo '请正确输入防伪码或扫二维码查询2';
                exit;
        }

		$qycode=substr($fwcode,0,4);


        $is_localquery=1;
        $map=array();
		$map['qy_active']=1;
		$map['qy_code']=$qycode;
        $Qyinfo = M('Qyinfo');
        $data=$Qyinfo->where($map)->find(); 

   
        if($data){
        	$qy_fwsecret=$data['qy_fwsecret'];      //相当密钥
        	$qy_querytimes=$data['qy_querytimes'];  //6小时内调用接口允许次数 超过则隔3分钟允许调用一次
        	$is_localquery=0;
        }else{
            $qy_fwsecret=C('QY_FWSECRET');
            $qy_querytimes='1500';
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

            $url="http://".$ip.":6080/q.asp?t=json&ip=".$uip."&fwcode=".$fwcode; 
            $output=@file_get_contents($url);
            if($output===FALSE){
                $msg=array('fwc'=>'','stat'=>'5','msg'=>'网络繁忙');
                echo json_encode($msg);
                exit;
            }else{
                $msg=trim($output);
                $msg=get_gb_to_utf8(strip_tags($msg));
                echo $msg;

            } 
        }else{
            //云服查询

            $fwcoders=fwcode_to_result($fwcode,0,$uip,1);
            if($fwcoders===false){
                $msg_arr=array('fwc'=>$fwcode,'stat'=>'5','msg'=>C('SEND_MESSAGE')['msg03']);
            }else{
                $msg_arr=$fwcoders;
            }
            var_dump($msg_arr);
            exit;
        }

    }
}