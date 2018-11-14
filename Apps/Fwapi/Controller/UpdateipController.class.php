<?php
namespace Fwapi\Controller;
use Think\Controller;
class UpdateipController extends Controller {
    public function index(){
        $timestamp=trim(I('get.ts',''));
        $signature=trim(I('get.st',''));
        $get_ip=trim(I('get.ip',''));

        $check_str=MD5(C('API_AUTHKEY').$timestamp);

        if($timestamp=='' || $signature==''){
            echo '';
            exit;
        }
        if((time()-floor($timestamp))>90 || (time()-floor($timestamp))<-90){
            echo '';
            exit;
        }
        if($signature!=$check_str){
            echo '';
            exit;
        }
		
		if (preg_match('/^(([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/',$get_ip)) {

		} else {
            echo '';
            exit;
		}
		

        $Sip= M('Sip');
        $ipmap['s_id']=1;
        $ipdata['s_ip']=$get_ip;
        $Sip->where($ipmap)->data($ipdata)->save();
        echo 'ok';
        exit;
    }

    public function _empty()
    {
      header('HTTP/1.0 404 Not Found');
      echo'error:404';
      exit;
    }
}