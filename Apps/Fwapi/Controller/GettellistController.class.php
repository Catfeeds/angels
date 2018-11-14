<?php
namespace Fwapi\Controller;
use Think\Controller;
class GettellistController extends Controller {
	//获取查询记录接口 返回json格式
    public function index(){
        
        $timestamp=trim(I('get.ts',''));
        $signature=trim(I('get.st',''));

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
        
        $Tellist= M('Tellist');
        $data = $Tellist->where('fid=0')->order('tid ASC')->limit(50)->select();
        if($data){
            echo json_encode($data);
        }else{
            echo '';
        }
        exit;      
    }
}