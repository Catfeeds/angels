<?php
namespace Sysadmin\Controller;
use Think\Controller;
//查询
class QueryrecordController extends CommController {
    public function index(){
        exit;
    }

	//防伪码查询记录
    public function record(){
        if (IS_POST) {
            $qycode=I('post.qycode','');
            $begintime=I('post.begintime','');
            $endtime=I('post.endtime','');
            $fwcode=I('post.fwcode','');
        }else{
            $qycode=I('get.qycode','');
            $begintime=I('get.begintime','');
            $endtime=I('get.endtime','');
            $fwcode=I('get.fwcode','');
        }
        $parameter=array();
        if($fwcode!=''){
            $qycode='';
            if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                $this->error('请正确输入防伪码','',1);
            }
        }else{
            if($qycode!=''){
                if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                    $this->error('请正确输入企业码','',1);
                }
                $begintime=strtotime($begintime);
                $endtime=strtotime($endtime);
                if($begintime===FALSE || $endtime===FALSE){
                    $this->error('请选择查询日期','',1);
                }
                $endtime=$endtime+3600*24-1;
                if($begintime>=$endtime){
                    $this->error('查询结束日期要大于开始日期','',1);
                }
            }else{
                $begintime=strtotime("24 hours ago");
                $endtime=strtotime("now");
            }
        }


        $Tellist = M('Tellist');
        if($fwcode!=''){
            $map['fwcode']=$fwcode;
            $parameter['fwcode']=urlencode($fwcode);
        }
        if($qycode!=''){
            $map['unitcode']=$qycode;
            $map['querydate']=array('between',array(date('Y-m-d H:i:s',$begintime),date('Y-m-d H:i:s',$endtime)));
            $parameter['qycode']=urlencode($qycode);
            $parameter['begintime']=urlencode(date('Y-m-d',$begintime));
            $parameter['endtime']=urlencode(date('Y-m-d',$endtime));
        }
        
        $count = $Tellist->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Tellist->where($map)->order('querydate DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){

            if($v['qutype']==1){
                $list[$k]['qutypestr']='电话';
            }elseif($v['qutype']==2){
                $list[$k]['qutypestr']='短信';
            }elseif($v['qutype']==3){
                $list[$k]['qutypestr']='网络';  
            }else{
                $list[$k]['qutypestr']='';
            }
            if($v['querystatu']=='正确' || $v['querystatu']=='合法'){
                $list[$k]['querystatu']='正确'; 
            }else{
                $list[$k]['querystatu']='重复'; 
            }

        }
        $this->assign('list', $list);

        $this->assign('qycode', $qycode);
        $this->assign('begintime', date('Y-m-d',$begintime));
        $this->assign('endtime', date('Y-m-d',$endtime));
        $this->assign('fwcode', $fwcode);

        $this->assign('page', $show);
        $this->assign('curr', 'record');
		$this->assign('pagecount', $count);

        $this->display('record');
    }

    //防伪防窜查询 只显示信息 不做登记
    public function chaxun(){
 
        $this->assign('curr', 'fangcuan');

        $this->display('fangcuan');
    }

    public function chaxunres(){

        if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }
        $ship_barcode=I('post.wlcode','');
        if($ship_barcode==''){
            $this->error('请输入物流码','',2);
        }

         //检测是否已发行
        $barcode=wlcode_to_packinfo($ship_barcode,session('unitcode'));
        
        if(!is_not_null($barcode)){
            $this->error('条码还没发行','',2);
        }

        //是否出货
        $map=array();
        $where=array();
        $Shipment= M('Shipment');
        if($barcode['code']!=''){
            $where[]=array('EQ',$barcode['code']);
        }
        if($barcode['tcode']!='' && $barcode['tcode']!=$barcode['code']){
            $where[]=array('EQ',$barcode['tcode']);
        }
        if($barcode['ucode']!='' && $barcode['ucode']!=$barcode['code'] && $barcode['ucode']!=$barcode['tcode']){
            $where[]=array('EQ',$barcode['ucode']);
        }
        $where[]='or';
        $map['ship_barcode'] = $where;
        $map['ship_unitcode']=session('unitcode');
        $data=$Shipment->where($map)->find();
        if(is_not_null($data)){
            $Product = M('Product');
            $Dealer = M('Dealer');

            $map2=array();
            $map2['pro_unitcode']=session('unitcode');
            $map2['pro_id'] = $data['ship_pro'];
            $Proinfo = $Product->where($map2)->find();

            if($Proinfo){
                  $data['pro_name']=$Proinfo['pro_name'];
                  $data['pro_number']=$Proinfo['pro_number'];
            }else{
                  $data['pro_name']='';
                  $data['pro_number']='';
            }
            $map2=array();
            $map2['dl_unitcode']=session('unitcode');
            $map2['dl_id'] = $data['ship_dealer'];
            $Dealerinfo = $Dealer->where($map2)->find();
            if($Dealerinfo){
                  $data['dl_name']=$Dealerinfo['dl_name'];
            }else{
                  $data['dl_name']='';
            }
            $barcode['shangjistr']='';
            $barcode['shangji']='';
            if($barcode['tcode']!='' || $barcode['ucode']!=''){
                if($barcode['tcode']!=$barcode['ucode']){
                    $barcode['shangjistr']=$barcode['tcode'].'/'.$barcode['ucode'];
                    $barcode['shangji']='上级物流码：';
                }else{
                    $barcode['shangjistr']=$barcode['tcode'];
                    $barcode['shangji']='上级物流码：';
                }
            }else{
                $barcode['shangjistr']='大箱物流码或单个包装';
                $barcode['shangji']='物流码信息：';
            }
        }else{
            $this->error('条码还没出货','',2);
        }


        $this->assign('shipmentinfo', $data);
        $this->assign('barcode', $barcode);
        $this->assign('curr', 'fangcuan');

        $this->display('fangcuan_res');
    }

    //通过网络查询的日志 保留180天
    public function recordlog(){
        if (IS_POST) {
            $qycode=I('post.qycode','');
            $begintime=I('post.begintime','');
            $endtime=I('post.endtime','');
            $fwcode=I('post.fwcode','');
            $referer=trim(strip_tags(htmlspecialchars_decode(I('post.referer',''))));
			$fip=I('post.fip','');
			
			//根据ip统计数量
			$byip=I('post.byip','');
			if($byip=='查询2'){
				$map2=array();
				
				if($qycode!=''){
					if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
						$this->error('请正确输入企业码','',1);
					}
					$begintime=strtotime($begintime);
					$endtime=strtotime($endtime);
					if($begintime===FALSE || $endtime===FALSE){
						$this->error('请选择查询日期','',1);
					}
					$endtime=$endtime+3600*24-1;
					if($begintime>=$endtime){
						$this->error('查询结束日期要大于开始日期','',1);
					}
					
                    $map2['tmp_unitcode']=$qycode;
                    
				}else{
					if($begintime=='' || $endtime==''){
						$begintime=strtotime("24 hours ago");
						$endtime=strtotime("now");
				    }else{
						$begintime=strtotime($begintime);
						$endtime=strtotime($endtime);
						if($begintime===FALSE || $endtime===FALSE){
							$this->error('请选择查询日期','',1);
						}
						$endtime=$endtime+3600*24-1;
						if($begintime>=$endtime){
							$this->error('查询结束日期要大于开始日期','',1);
						}
					}
					$map2['tmp_addtime']=array('between',array($begintime,$endtime));
				}
			
				$Templist = M('Templist');
				$data2=$Templist->field('tmp_ip,count(tmp_ip) as countip')->where($map2)->group('tmp_ip')->order('countip DESC')->limit(50)->select();
				foreach($data2 as $k=>$v){
					 $map3=array();
					 $map3['tmp_ip']=$v['tmp_ip'];
					 $map3['tmp_addtime']=array('between',array($begintime,$endtime));
                     $count = $Templist->where($map3)->count('DISTINCT tmp_unitcode');
					 $data2[$k]['countqy']=$count;
				}
				$this->assign('list', $data2);
				$this->assign('qycode', $qycode);
				$this->assign('begintime', date('Y-m-d',$begintime));
				$this->assign('endtime', date('Y-m-d',$endtime));
				$this->assign('curr', 'recordlog');

				$this->display('recordlogbyip');
				exit;
			}
			
			

            //删除180天前临时查询记录
            $Templist= M('Templist');
            $map['tmp_addtime']=array('ELT',time()-3600*24*180);
            $Templist->where($map)->delete(); 
            $map=array();
            
        }else{
            $qycode=I('get.qycode','');
            $begintime=I('get.begintime','');
            $endtime=I('get.endtime','');
            $fwcode=I('get.fwcode','');
            $referer=trim(strip_tags(htmlspecialchars_decode(I('get.referer',''))));
			$fip=I('get.fip','');
        }
		
        $parameter=array();
        if($referer!=''){
            $referer=sub_str($referer,50,false);
            $map['tmp_referer']=array('like','%'.$referer.'%');
            $parameter['referer']=urlencode($referer);
            $fwcode='';
            $qycode='';
			$fip='';
        }
		
		if($fip!=''){
			$fip=sub_str($fip,20,false);
            $map['tmp_ip']=$fip;
			$map['tmp_ip']=array('like',$fip.'%');
            $parameter['fip']=$fip;;
            $fwcode='';
            $qycode='';
			$referer='';
		}

       if($fwcode!=''){
            $qycode='';
            if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                $this->error('请正确输入防伪码','',1);
            }
        }else{
            if($qycode!=''){
                if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                    $this->error('请正确输入企业码','',1);
                }
                $begintime=strtotime($begintime);
                $endtime=strtotime($endtime);
                if($begintime===FALSE || $endtime===FALSE){
                    $this->error('请选择查询日期','',1);
                }
                $endtime=$endtime+3600*24-1;
                if($begintime>=$endtime){
                    $this->error('查询结束日期要大于开始日期','',1);
                }
            }else{
                $begintime=strtotime("24 hours ago");
                $endtime=strtotime("now");
            }
        }



        $Templist = M('Templist');
        if($fwcode!=''){
            $map['tmp_code']=$fwcode;
            $parameter['fwcode']=urlencode($fwcode);
        }
        if($qycode!=''){
            $map['tmp_unitcode']=$qycode;
            $map['tmp_addtime']=array('between',array($begintime,$endtime));
            $parameter['qycode']=urlencode($qycode);
            $parameter['begintime']=urlencode(date('Y-m-d',$begintime));
            $parameter['endtime']=urlencode(date('Y-m-d',$endtime));
        }
		
        
        $count = $Templist->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Templist->where($map)->order('tmp_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){
            $list[$k]['tmp_addtime']=date('Y-m-d H:i:s',$v['tmp_addtime']); 
        }
        $this->assign('list', $list);

        $this->assign('qycode', $qycode);
        $this->assign('begintime', date('Y-m-d',$begintime));
        $this->assign('endtime', date('Y-m-d',$endtime));
        $this->assign('fwcode', $fwcode);
        $this->assign('referer', $referer);

        $this->assign('page', $show);
        $this->assign('curr', 'recordlog');

        $this->display('recordlog');
    }
   
  
   
   //=====================================================================================

}