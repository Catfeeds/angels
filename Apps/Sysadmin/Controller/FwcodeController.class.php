<?php
namespace Sysadmin\Controller;
use Think\Controller;
//防伪码管理
class FwcodeController extends CommController {
    public function index(){
        echo '';
        exit;
    }
    //防伪码分批处理
    public function batch(){
        if (IS_POST) {
            $qycode=I('post.qycode','');
        }else{
            $qycode=I('get.qycode','');
        }
        if($qycode!=''){
            if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                $this->error('请正确输入企业码','',1);
            }
        }

        $Batch = M('Batch');
        $parameter=array();
        if($qycode!=''){
            $map['unitcode']=$qycode;
            $parameter['qycode']=urlencode($qycode);
        }
        $count = $Batch->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Batch->where($map)->order('datetime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Qyinfo = M('Qyinfo');
        foreach($list as $k=>$v){
            $map=array();
            $map['qy_code']=$v['unitcode'];
            $data=$Qyinfo->where($map)->find(); 
            if($data){
                $list[$k]['qy_name']=$data['qy_name'];
            }else{
                $list[$k]['qy_name']='-';
            }
            $list[$k]['datetime']=date('Y-m-d H:i:s',$v['datetime']);
        }
        
        $this->assign('curr', 'batch');
        $this->assign('list', $list);
        $this->assign('qycode', $qycode);
        $this->display('batch');
    }
	
    //添加分批处理
    public function addbatch(){
        if (IS_POST){
            $action=I('post.action','');
        }else{
            $action='';
        }
        if($action=='save'){
			$map['id']=intval(I('post.id',0));
			
			if($map['id']>0){
				$map['qycode']=I('post.qycode','');
				
				$Batch = M('Batch');
				$data2=$Batch->where($map)->find();
				if($data2){
				
					$codebegin=I('post.codebegin','');
					$codeend=I('post.codeend','');
					
					if(!preg_match("/^[0-9]{1,20}$/",$codebegin)){
						$this->error('请正确输入起始序号','',1);
					}
					if(!preg_match("/^[0-9]{1,20}$/",$codeend)){
						$this->error('请正确输入终止序号','',1);
					}
					if($codebegin>$codeend){
						$this->error('起始序号不能大于终止序号','',1);
					}
					$data=array();
					$data['codebegin']=$codebegin;
					$data['codeend']=$codeend;
					$data['voice']=I('post.voice','');
					$data['smsnote']=I('post.smsnote','');
					$data['resmsnote']=I('post.resmsnote','');
					$data['errsmsnote']=I('post.errsmsnote','');
					$data['oversmsnote']=I('post.oversmsnote','');
					$data['remark']=I('post.remark','');
					
					$rs=$Batch->where($map)->data($data)->save();
					if($rs){
						//记录日志 begin
						$log_arr=array(
								'log_qyid'=>0,
								'log_user'=>session('admin_name'),
								'log_qycode'=>$map['qycode'],
								'log_action'=>'修改防伪码分批处理',
								'log_addtime'=>time(),
								'log_ip'=>real_ip(),
								'log_link'=>__SELF__,
								'log_remark'=>json_encode($data)
								);
					   save_log($log_arr);
					   //记录日志 end
					   
						$this->success('修改成功',U('Sysadmin/Fwcode/batch'),1);
					}else if($rs==0){
						$this->error('修改成功','',1);
					}else{
						$this->error('修改失败','',1);
					}
				}else{
					$this->error('没有该记录','',1);
				}
			}else{
				$qycode=I('post.qycode','');
				$codebegin=I('post.codebegin','');
				$codeend=I('post.codeend','');

				if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
					$this->error('请正确输入企业码','',1);
				}
				if(!preg_match("/^[0-9]{1,20}$/",$codebegin)){
					$this->error('请正确输入起始序号','',1);
				}
				if(!preg_match("/^[0-9]{1,20}$/",$codeend)){
					$this->error('请正确输入终止序号','',1);
				}
				if($codebegin>$codeend){
					$this->error('起始序号不能大于终止序号','',1);
				}

				//记录
				$data=array();
				$data['unitcode']=$qycode;
				$data['codebegin']=$codebegin;
				$data['codeend']=$codeend;
				$data['voice']=I('post.voice','');
				$data['smsnote']=I('post.smsnote','');
				$data['resmsnote']=I('post.resmsnote','');
				$data['errsmsnote']=I('post.errsmsnote','');
				$data['oversmsnote']=I('post.oversmsnote','');
				$data['datetime']=time();
				$data['remark']=I('post.remark','');


				$Batch= M('Batch');
				$rs=$Batch->create($data,1);
				if($rs){
				   $result = $Batch->add(); 
				   if($result){
						//记录日志 begin
						$log_arr=array(
								'log_qyid'=>0,
								'log_user'=>session('admin_name'),
								'log_qycode'=>$qycode,
								'log_action'=>'添加防伪码分批处理',
								'log_addtime'=>time(),
								'log_ip'=>real_ip(),
								'log_link'=>__SELF__,
								'log_remark'=>json_encode($data)
								);
					   save_log($log_arr);
					   //记录日志 end

					   $this->success('添加成功',U('Sysadmin/Fwcode/batch'),1);
				   }else{
					   $this->error('添加失败','',1);
				   }
				}else{
					$this->error('添加失败','',1);
				}
			}
        }else{
            $data['id']=0;
			$this->assign('curr', 'batch');
			$this->assign('batchinfo', $data);
			$this->display('addbatch');  

        }
    }
	//修改分批处理
	public function editbatch(){
		$map['id']=intval(I('get.id',0));
		$Batch = M('Batch');
		$data=$Batch->where($map)->find();
		if($data){
			
		}else{
			$this->error('没有该记录','',1);
		}
		
        $this->assign('curr', 'batch');
        $this->assign('batchinfo', $data);
        $this->display('addbatch');
	}
    
	//分批处理详细
	public function viewbatch(){
		$map['id']=intval(I('get.id',0));
		$Batch = M('Batch');
		$data=$Batch->where($map)->find();
		if($data){
			
		}else{
			$this->error('没有该记录','',1);
		}
		
        $this->assign('curr', 'batch');
        $this->assign('batchinfo', $data);
        $this->display('viewbatch');
	}
	
    //删除分批处理记录
    public function batchdel(){
        $map['id']=intval(I('get.id',0));
        $Batch= M('Batch');
        $data=$Batch->where($map)->find();
        
        if($data){
            $Batch->where($map)->delete(); 

            //记录日志 begin
            $log_arr=array(
                    'log_qyid'=>0,
                    'log_user'=>session('admin_name'),
                    'log_qycode'=>$data['unitcode'],
                    'log_action'=>'删除防伪码分批处理',
                    'log_addtime'=>time(),
                    'log_ip'=>real_ip(),
                    'log_link'=>__SELF__,
                    'log_remark'=>json_encode($data)
                    );
            save_log($log_arr);
           //记录日志 end
            $this->success('删除成功',U('Sysadmin/Fwcode/batch'),1);
        }else{
            $this->error('没有该记录','',1);
        }     
    
    }
	
    //================================================================

    //防伪码作废
    public function overdue(){
        if (IS_POST) {
            $qycode=I('post.qycode','');
        }else{
            $qycode=I('get.qycode','');
        }
        if($qycode!=''){
            if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                $this->error('请正确输入企业码','',1);
            }
        }

        $Overdue = M('Overdue');
        $parameter=array();
        if($qycode!=''){
            $map['unitcode']=$qycode;
            $parameter['qycode']=urlencode($qycode);
        }
        $count = $Overdue->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Overdue->where($map)->order('datetime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Qyinfo = M('Qyinfo');
        foreach($list as $k=>$v){
            $map=array();
            $map['qy_code']=$v['unitcode'];
            $data=$Qyinfo->where($map)->find(); 
            if($data){
                $list[$k]['qy_name']=$data['qy_name'];
            }else{
                $list[$k]['qy_name']='-';
            }
            $list[$k]['datetime']=date('Y-m-d H:i:s',$v['datetime']);
        }
        
        $this->assign('curr', 'overdue');
        $this->assign('list', $list);
        $this->assign('qycode', $qycode);
        $this->display('overdue');
    }

	//由防伪码找对应序号  由企业码和序号找对应防伪码
    public function findk(){
        if (IS_POST){
            $action=I('post.action','');
            $fwcode=I('post.fwcode','');
            $qycode=I('post.qycode','');
            $myk=I('post.myk','');
        }else{
            $action='';
            $fwcode='';
            $qycode='';
            $myk='';
        }
        $res='';
        $res2='';
        
        if($action=='findk'){
            if($fwcode!=''){
                if(preg_match("/^[0-9]{10,24}$/",$fwcode)){
                    $Cust= M('Cust');
                    $unitcode=substr($fwcode,0,4);
                    $map['unitcode']=$unitcode;
                    $data=$Cust->where($map)->find(); 
                    if($data){
                        $mlength=$data['mlength'];
                    }else{
                        $mlength=0;
                    }

                    $k=fwcode_to_k($fwcode,$unitcode,$mlength);
                    if($k===false){
                        $res='没有该防伪码对应序号';
                    }else{
                        $res=$k;
                    }
                }else{
                    $res='请输入正确防伪码';
                }
            }else{
                $res='请输入防伪码';
            }
        }else if($action=='findcode'){
            if($qycode!='' && $myk!=''){
                if(preg_match("/^[0-9]{4,4}$/",$qycode) && preg_match("/^[0-9]{1,20}$/",$myk)){
                    $Cust= M('Cust');
                    $map['unitcode']=$qycode;
                    $data=$Cust->where($map)->find(); 
                    if($data){
                        $mlength=$data['mlength'];
                    }else{
                        $mlength=0;
                    }

                    $k=k_to_fwcode($myk,$qycode,$mlength);
                    if($k===false){
                        $res2='没有对应防伪码';
                    }else{
                        $res2=$qycode.$k;
                    }
                }else{
                    $res2='请输入企业码或序号';
                }
            }else{
                $res2='请输入企业码或序号';
            }
        }

        $this->assign('res', $res);
        $this->assign('res2', $res2);
        $this->assign('fwcode', $fwcode);
        $this->assign('qycode', $qycode);
        $this->assign('myk', $myk);
        $this->display('findk');
    }
   
    //添加作废码
    public function addoverdue(){
        if (IS_POST){
            $action=I('post.action','');
        }else{
            $action='';
        }
        if($action=='save'){
            $qycode=I('post.qycode','');
            $offbegin=I('post.offbegin','');
            $offend=I('post.offend','');
            $reason=I('post.reason',''); 

            if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                $this->error('请正确输入企业码','',1);
            }
            if(!preg_match("/^[0-9]{1,20}$/",$offbegin)){
                $this->error('请正确输入起始序号','',1);
            }
            if(!preg_match("/^[0-9]{1,20}$/",$offend)){
                $this->error('请正确输入终止序号','',1);
            }
            if($offbegin>$offend){
                $this->error('起始序号不能大于终止序号','',1);
            }

            //记录
            $data=array();
            $data['unitcode']=$qycode;
            $data['offbegin']=$offbegin;
            $data['offend']=$offend;
            $data['reason']=$reason;
            $data['datetime']=time();
            $data['operator']=session('admin_name');
            $data['type']=0;
            $Overdue= M('Overdue');
            $rs=$Overdue->create($data,1);
            if($rs){
               $result = $Overdue->add(); 
               if($result){
                    //记录日志 begin
                    $log_arr=array(
                            'log_qyid'=>0,
                            'log_user'=>session('admin_name'),
                            'log_qycode'=>$qycode,
                            'log_action'=>'添加作废码',
                            'log_addtime'=>time(),
                            'log_ip'=>real_ip(),
                            'log_link'=>__SELF__,
                            'log_remark'=>json_encode($data)
                            );
                   save_log($log_arr);
                   //记录日志 end

                   $this->success('添加成功',U('Sysadmin/Fwcode/overdue'),1);
               }else{
                   $this->error('添加失败','',1);
               }
            }else{
                $this->error('添加失败','',1);
            }
        }else{

        $this->assign('curr', 'overdue');
        $this->display('addoverdue');  

        }
    }
  
    //删除作废记录
    public function delete(){
        $map['id']=intval(I('get.id',0));
        $Overdue= M('Overdue');
        $data=$Overdue->where($map)->find();
        
        if($data){
            $Overdue->where($map)->delete(); 

            //记录日志 begin
            $log_arr=array(
                    'log_qyid'=>0,
                    'log_user'=>session('admin_name'),
                    'log_qycode'=>$data['unitcode'],
                    'log_action'=>'删除作废码记录',
                    'log_addtime'=>time(),
                    'log_ip'=>real_ip(),
                    'log_link'=>__SELF__,
                    'log_remark'=>json_encode($data)
                    );
            save_log($log_arr);
           //记录日志 end
            $this->success('删除成功',U('Sysadmin/Fwcode/overdue'),1);
        }else{
            $this->error('没有该记录','',1);
        }     
    
    }
    
	//=====================================================================================
    //防伪码重置
    public function reset(){

        $begintime=strtotime("24 hours ago");
        $endtime=strtotime("now");

        $this->assign('begintime', date('Y-m-d',$begintime));
        $this->assign('endtime', date('Y-m-d',$endtime));

        $this->assign('curr', 'reset');
        $this->display('reset');  
    }
    //防伪码重置
    public function resetting(){
        
        $action=I('post.action','');
        $qycode=I('post.qycode','');
        $begintime=I('post.begintime','');
        $endtime=I('post.endtime','');
        $fwcode=I('post.fwcode','');

        if($action=='code1'){
            if($fwcode!=''){
                if(!preg_match("/^[0-9]{10,27}$/",$fwcode)){
                    $this->error('请正确输入防伪码','',1);
                }
            }else{
                $this->error('请正确输入防伪码','',1);
            }
			$yok=0;
			$bok=0;
            $Templist = M("Templist");
            $Tellist = M('Tellist');
            $Jfdetail = M('Jfdetail');
            $map=array();
            $map['jf_code']=$fwcode;
            $data=$Jfdetail->where($map)->find();
            //已经积分
            if($data){
                $this->error('该码已积分，不能删除查询记录','',1); 
            }
            //删除查询日志
            $map=array();
            $map['tmp_code']=$fwcode;
            $data=$Templist->where($map)->find();
            if($data){
                $Templist->where($map)->delete(); 
            }

            //删除查询记录
            $map=array();
            $map['fwcode']=$fwcode;
            $data=$Tellist->where($map)->find();
            if($data){
                $Tellist->where($map)->delete(); 
                //记录日志 begin
                $log_arr=array(
                            'log_qyid'=>0,
                            'log_user'=>session('admin_name'),
                            'log_qycode'=>substr($fwcode,0,4),
                            'log_action'=>'删除查询记录',
                            'log_addtime'=>time(),
                            'log_ip'=>real_ip(),
                            'log_link'=>__SELF__,
                            'log_remark'=>json_encode($data)
                            );
                save_log($log_arr);
                //记录日志 end
				
                $yok=1;
            }else{
                $yok=2;
            }
			
			//删除本地服务器记录
			$Sip= M('sip');
			$timestamp=time();
			$check_str=md5(C('API_AUTHKEY').$timestamp);

			//模拟 post 获取数据
			$post_data = array (
				"ac" => 'reset',  
				"ck" => $check_str,   
				"ts" => $timestamp,
			  "data" => $fwcode
			);
		    $data2=$Sip->where('s_id=1')->find();
			if($data2){
				$ip=$data2['s_ip'];
				$url="http://".$ip.":6080/get_fcjf.asp"; 
				$options = array(  
					'http' => array(  
						'method' => 'POST',  
						'header' => "Content-type: application/x-www-form-urlencoded ",
					   'content' => http_build_query($post_data),  
						), 
				); 
			    $output = trim(@file_get_contents($url, false, stream_context_create($options))); 
			    if(is_not_null($output)){
				   
			    }else{
				   $output='';
			    }
			    if($output=='ok1'){
				   $bok=1;
				}else if($output=='ok2'){
				   $bok=2;
			    }else{
				   $bok=0;
				}
			}else{
				$bok=0;
			}
			
			//==========================
			$msg='删除 '.$fwcode.' ';
			if($yok==1){
				$msg=$msg.'(云)成功 ';
			}else if($yok==2){
				$msg=$msg.'(云)没有该记录 ';
			}else{
				$msg=$msg.'(云)失败 ';
			}
			
			if($bok==1){
				$msg=$msg.'(本地)成功 ';
			}else if($bok==2){
				$msg=$msg.'(本地)没有该记录 ';
			}else{
				$msg=$msg.'(本地)失败 ';
			}
			
			$this->success($msg,U('Sysadmin/Fwcode/reset'),5);
			exit;

        }else if($action=='code2'){
            if($qycode!=''){
                if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
                    $this->error('请正确输入企业码','',1);
                }
                if($begintime=='' || $endtime==''){
                    $this->error('请选择日期范围','',1);
                }else{
                    $begintime=strtotime($begintime);
                    $endtime=strtotime($endtime);
                    if($begintime===FALSE || $endtime===FALSE){
                        $this->error('请选择日期范围','',1);
                    }
                    $endtime=$endtime+3600*24-1;
                    if($begintime>=$endtime){
                        $this->error('结束日期要大于开始日期','',1);
                    }
                }
            }else{
                $this->error('请正确输入企业码','',1);
            }

            $Templist = M("Templist");
            $Tellist = M('Tellist');
            $Jfdetail = M('Jfdetail');

            //删除查询记录
            $map=array();
            $msgs=array();
            $map['unitcode']=$qycode;
            $map['querydate']=array('between',array(date('Y-m-d H:i:s',$begintime),date('Y-m-d H:i:s',$endtime)));
            $list=$Tellist->where($map)->group('fwcode')->select();
            if($list){
                foreach($list as $k=>$v){
                    $map=array();
                    $map['jf_code']=$v['fwcode'];
                    $data=$Jfdetail->where($map)->find();
                    //已经积分
                    if($data){
                        $msgs[$k]['msg']='<span style="color:#FF0000">防伪码 '.$v['fwcode'].' 已积分，不能删除查询记录。</span>';
                        continue;
                    }
                    //删除查询日志
                    $map=array();
                    $map['tmp_code']=$v['fwcode'];
                    $data=$Templist->where($map)->find();
                    if($data){
                        $Templist->where($map)->delete(); 
                    }
                    
                    $map=array();
                    $map['fwcode']=$v['fwcode'];
                    $Tellist->where($map)->delete(); 
                    $msgs[$k]['msg']='防伪码 '.$v['fwcode'].' 查询记录删除成功！';

                    //记录日志 begin
                    $log_arr=array(
                                'log_qyid'=>0,
                                'log_user'=>session('admin_name'),
                                'log_qycode'=>$qycode,
                                'log_action'=>'删除查询记录',
                                'log_addtime'=>time(),
                                'log_ip'=>real_ip(),
                                'log_link'=>__SELF__,
                                'log_remark'=>json_encode($v)
                                );
                    save_log($log_arr);
                    //记录日志 end
                }
            }else{
                $this->error('没有查询记录','',1); 
            }

            $this->assign('qycode', $qycode);
            $this->assign('begintime', date('Y-m-d',$begintime));
            $this->assign('endtime', date('Y-m-d',$endtime));
            $this->assign('msgslist', $msgs);
            $this->assign('curr', 'reset');
            $this->display('resetting'); 
        }else{
            $this->error('提交错误','',1);
        }
 
    }
}