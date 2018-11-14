<?php
namespace Sysadmin\Controller;
use Think\Controller;
class SyntellistController extends Controller {
    //同步查询记录
    public function index(){
        set_time_limit(1200);
        $uip=real_ip();
        if($uip!='115.28.94.213'){
            echo 'no login';
            exit;
        }
        $maxFid=0;
        $Sip= M('Sip');
        $data=$Sip->where('s_id=1')->find();
        if($data){
            $ip=$data['s_ip'];
            $maxFid=$data['s_maxfid'];
        }else{
            echo 'error: ip';
            exit;
        }

        $Tellist= M('Tellist');
        if($maxFid==0){
            $maxFid = $Tellist->where('yun=0')->max('fid'); 
            if(!$maxFid){
                $maxFid=0;
            }
        }

        $timestamp=time();
        $check_str=md5(C('API_AUTHKEY').$timestamp);


        //模拟 post 获取数据
        $post_data = array (
            "ac" => 'tellist',  
            "ck" => $check_str,   
            "ts" => $timestamp,
            "data" => $maxFid, 
        );

        

        $url="http://".$ip.":6080/get_fcjf.asp"; 

        $options = array(  
            'http' => array(  
                'method' => 'POST',  
                'header' => "Content-type: application/x-www-form-urlencoded ",
               'content' => http_build_query($post_data),  
                ), 
        ); 

        $output = trim(@file_get_contents($url, false, stream_context_create($options)));  
         
		 
        //模拟 post end
        if(is_not_null($output)){
            $output=get_gb_to_utf8($output);
        }else{
            $output='';
        }


        if($output!=''){
 
            $outputarr=json_decode($output,true);
            if(json_last_error()!=0){
                echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
                echo '<meta http-equiv="refresh" content="30">';
                echo 'json error:'.json_last_error();
                exit; 
            }
            //入库
            $map=array();
            $data=array();
            echo $maxFid.'<br>';

        
            
            foreach($outputarr as $k=>$v){
                if($v['tid']>0){
                    $map['tid']=$v['tid'];
                    $data['fid']=$v['fid'];
                    $Tellist->where($map)->data($data)->save();
                    $maxFid=$v['fid'];
                    echo 'update:'.$v['tid'].'-'.$v['fid'].'<br>';
                }else{
                    //$map['fid']=$v['fid'];
                    //$data=$Tellist->where($map)->field('tid')->find();
                    //if($data){
                    //}else{
                        $Tellist->create($v,1);
                        $Tellist->add(); 
                    //}
                    $maxFid=$v['fid'];
                    echo 'add:'.$v['tid'].'-'.$v['fid'].'<br>';
                }
            }
            echo $maxFid.'<br>';
            if($maxFid>0){
                $ipdata=array();
                $ipdata['s_maxfid']=$maxFid;
                $Sip->where('s_id=1')->data($ipdata)->save();
            }
            
            if(rand(1,10)>=1){  //删除重复记录中一条
                $M = M();
                $sql='delete from fw_tellist where tid in (select * from (select max(tid) from fw_tellist where fid>0 group by fid having count(fid) > 1) as b)';
                $M->execute($sql);
            }


            $this->assign('time', date('Y-m-d H:i:s',time()));
            $this->assign('count', count($outputarr));
            $this->display('index');
        }else{

                
                echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
                echo '<meta http-equiv="refresh" content="30">';
                echo '没有记录更新';
                exit; 
        }
        
    } 
}