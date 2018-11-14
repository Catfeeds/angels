<?php
namespace Mp\Controller;
use Think\Controller;
//积分用户管理
class JfuserController extends CommController {
	//用户列表
    public function index(){
        $this->check_qypurview('40001',1);

        $keyword=trim(strip_tags(htmlspecialchars_decode(I('post.keyword',''))));

        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);
            
            $keyword=sub_str($keyword,20,false);
            $where['jfuser_username']=array('LIKE', '%'.$keyword.'%');
            $where['jfuser_truename']=array('LIKE', '%'.$keyword.'%');
			$where['jfuser_wxnickname']=array('LIKE', '%'.$keyword.'%');
			$where['jfuser_weixin']=array('LIKE', '%'.$keyword.'%');
            $where['jfuser_tel']=array('LIKE', '%'.$keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
        }

        $Jfuser = M('Jfuser');
        $map['jfuser_unitcode']=session('unitcode');
        $count = $Jfuser->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'));
        $show = $Page->show();
        $list = $Jfuser->where($map)->order('jfuser_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){ 
		    $list[$k]['jfuser_wxnickname']=wxuserTextDecode2($v['jfuser_wxnickname']);
        }
        $this->assign('list', $list);

        $this->assign('keyword', $keyword);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'jfuser_list');

        $this->display('list');
    }
    //添加会员
    public function add(){
        $this->check_qypurview('40002',1);
        $data['jfuser_id']=0;
        $this->assign('curr', 'jfuser_list');
        $this->assign('atitle', '添加会员');
        $this->assign('jfuserinfo', $data);

        $this->display('add');
    }
    //修改会员
    public function edit(){
        $this->check_qypurview('40003',1);

        $map['jfuser_id']=intval(I('get.jfuser_id',0));
        $map['jfuser_unitcode']=session('unitcode');
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
             $data['jfuser_wxnickname']=wxuserTextDecode2($data['jfuser_wxnickname']);
        }else{
            $this->error('没有该记录');
        }

        $this->assign('jfuserinfo', $data);
        $this->assign('curr', 'jfuser_list');
        $this->assign('atitle', '修改会员');

        $this->display('add');
    }
    //查看详细会员
    public function view(){
        $this->check_qypurview('40001',1);

        $map['jfuser_id']=intval(I('get.jfuser_id',0));
        $map['jfuser_unitcode']=session('unitcode');
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
             $data['jfuser_wxnickname']=wxuserTextDecode2($data['jfuser_wxnickname']);
        }else{
            $this->error('没有该记录');
        }

        $this->assign('jfuserinfo', $data);
        $this->assign('curr', 'jfuser_list');
        $this->assign('atitle', '会员详细');

        $this->display('view');
    }	
    //删除会员
    public function delete(){
        $this->check_qypurview('40004',1);

        $map['jfuser_id']=intval(I('get.jfuser_id',0));
        $map['jfuser_unitcode']=session('unitcode');
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();

        if($data){
            //验证是否要删除或删除相关信息 要保持数据完整性 
            //该会员已有积分
            $Jfdetail = M('Jfdetail');
            $map2['jf_unitcode']=session('unitcode');
            $map2['jf_userid'] = $data['jfuser_id'];
            $data2 = $Jfdetail->where($map2)->find();
            if($data2){
                $this->error('该会员已有积分,暂不能删除','',2);
            }

            //该会员已有兑换
            $map2=array();
            $Jfexchange = M('Jfexchange');
            $map2['exch_unitcode']=session('unitcode');
            $map2['exch_userid'] = $data['jfuser_id'];
            $data2 = $Jfexchange->where($map2)->find();
            if($data2){
                $this->error('该会员已有兑换礼品,暂不能删除','',2);
            }

            
            $Jfuser->where($map)->delete(); 
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'删除会员',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($map)
                        );
            save_log($log_arr);
            //记录日志 end
            $this->success('删除成功','',1);
        }else{
            $this->error('没有该记录');
        }     
    
    }
    //激活禁用会员
    public function active(){
        $this->check_qypurview('40001',1);

        $map['jfuser_id']=intval(I('get.jfuser_id',0));
        $map['jfuser_unitcode']=session('unitcode');
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
            $active=intval(I('get.jfuser_active',0));

            if($active==1){
                $data2['jfuser_active'] = 0;
            }else{
                $data2['jfuser_active'] = 1;
            }
            
            $Jfuser->where($map)->save($data2);
            
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'激活/禁用会员',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data2)
                        );
            save_log($log_arr);
            //记录日志 end

            $this->success('激活/禁用成功','',1);
        }else{
            $this->error('没有该记录');
        }
    }

    //保存会员
    public function edit_save(){
    	if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }
        $map['jfuser_id']=intval(I('post.jfuser_id',''));
        
        if($map['jfuser_id']>0){
            //修改保存
            $this->check_qypurview('40003',1);

            $data['jfuser_id']=$map['jfuser_id'];
            $data['jfuser_truename']=I('post.jfuser_truename','');
            $data['jfuser_tel']=I('post.jfuser_tel','');
            $data['jfuser_email']=I('post.jfuser_email','');
            $data['jfuser_qq']=I('post.jfuser_qq','');
            $data['jfuser_sheng']=I('post.seachprov','0');
            $data['jfuser_shi']=I('post.seachcity','0');
            $data['jfuser_qu']=I('post.seachdistrict','0');
            $data['jfuser_address']=I('post.jfuser_address','');
            $data['jfuser_remark']=I('post.jfuser_remark','');
			$data['jfuser_diqustr']=I('post.jfuser_diqustr','');
            
            if($data['jfuser_truename']=='' || $data['jfuser_tel']==''){
                $this->error('带"*"不能为空','',2);
            }
			
            if(trim(I('post.jfuser_pwd',''))!=''){
                $data['jfuser_pwd']=MD5(MD5(MD5(trim(I('post.jfuser_pwd','')))));
            }
			
		
            $Jfuser= M('Jfuser');
			
			$map2=array();
			$map2['jfuser_tel']=$data['jfuser_tel'];
			$map2['jfuser_unitcode']=session('unitcode');
			$map2['jfuser_id']=array('neq',intval($map['jfuser_id']));
			$data22=$Jfuser->where($map2)->find();
			if($data22){
				$this->error('你填写的电话已存在','',2);
			}
			
			
            $rs=$Jfuser->create($data,2);
           
            if($rs){
               $result = $Jfuser->save(); 
               if($result){
                    //记录日志 begin
                    $log_arr=array(
                                'log_qyid'=>session('qyid'),
                                'log_user'=>session('qyuser'),
                                'log_qycode'=>session('unitcode'),
                                'log_action'=>'修改会员',
								'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                                'log_addtime'=>time(),
                                'log_ip'=>real_ip(),
                                'log_link'=>__SELF__,
                                'log_remark'=>json_encode($data)
                                );
                    save_log($log_arr);
                    //记录日志 end
                    $this->success('修改成功','',1);
					
			    }elseif($result==0){  
			        $this->error('数据没有改变','',1);
                }else{
                    $this->error('修改失败','',1);
                }
            }else{
                $this->error('修改失败','',1);
            }
        }else{  
            $this->check_qypurview('40002',1);

            //添加保存
            $map=array();
            $map['jfuser_unitcode']=session('unitcode');
            $map['jfuser_username']=I('post.jfuser_username','');

            $Jfuser= M('Jfuser');
            $data2=$Jfuser->where($map)->find();
            if($data2){
                $this->error('该会员已存在');
            }

            $data['jfuser_unitcode']=session('unitcode');
            $data['jfuser_username']=$map['jfuser_username'];
            $data['jfuser_pwd']=trim(I('post.jfuser_pwd',''));
            $data['jfuser_truename']=I('post.jfuser_truename','');
            $data['jfuser_tel']=I('post.jfuser_tel','');
            $data['jfuser_email']=I('post.jfuser_email','');
            $data['jfuser_qq']=I('post.jfuser_qq','');
            $data['jfuser_sheng']=I('post.seachprov','0');
            $data['jfuser_shi']=I('post.seachcity','0');
            $data['jfuser_qu']=I('post.seachdistrict','0');
            $data['jfuser_address']=I('post.jfuser_address','');
            $data['jfuser_remark']=I('post.jfuser_remark','');
            $data['jfuser_addtime']=time();
            $data['jfuser_logintime']=0;
            $data['jfuser_jf']=0;
            $data['jfuser_active']=1;
			$data['jfuser_diqustr']=I('post.jfuser_diqustr','');


            if($data['jfuser_username']=='' || $data['jfuser_pwd']=='' || $data['jfuser_truename']=='' || $data['jfuser_tel']==''){
                $this->error('带"*"不能为空','',2);
            }

             if(!preg_match("/[a-zA-Z0-9_]{6,20}$/",$data['jfuser_username'])){
                $this->error('用户名由 A--Z,a--z,0--9,_ 组成,6-20位','',2);
            }
            $data['jfuser_pwd']=MD5(MD5(MD5($data['jfuser_pwd'])));



            $rs=$Jfuser->create($data,1);
            if($rs){
               $result = $Jfuser->add(); 
               if($result){
                    //记录日志 begin
                    $log_arr=array(
                                'log_qyid'=>session('qyid'),
                                'log_user'=>session('qyuser'),
                                'log_qycode'=>session('unitcode'),
                                'log_action'=>'添加会员',
								'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                                'log_addtime'=>time(),
                                'log_ip'=>real_ip(),
                                'log_link'=>__SELF__,
                                'log_remark'=>json_encode($data)
                                );
                    save_log($log_arr);
                    //记录日志 end
                   $this->success('添加成功',U('Mp/Jfuser/index'),1);
               }else{
                   $this->error('添加失败','',2);
               }
            }else{
                $this->error('添加失败','',2);
            }
        }

    }

    //=====================================================================================
    //增减积分
    public function changedjf(){
        $this->check_qypurview('50006',1);

        $map['jfuser_id']=intval(I('get.jfuser_id',0));
        $map['jfuser_unitcode']=session('unitcode');
        $Jfuser= M('Jfuser');
        $data=$Jfuser->where($map)->find();
        if($data){
             $data['jfuser_wxnickname']=wxuserTextDecode2($data['jfuser_wxnickname']);
        }else{
            $this->error('没有该记录');
        }

        $this->assign('jfuserinfo', $data);
        $this->assign('curr', 'jfuser_list');
        $this->assign('atitle', '增减积分');

        $this->display('changedjf');
    }
	
	//增减积分 保存
    public function changedjf_save(){
    	if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }
		$ip=real_ip();
        $map['jfuser_id']=intval(I('post.jfuser_id',0));
		$map['jfuser_unitcode']=session('unitcode');
		$map['jfuser_active']=1;
		
		$Jfuser= M('Jfuser');
        $jfuserinfo=$Jfuser->where($map)->find();
        if($jfuserinfo){
			
        }else{
            $this->error('该用户不存在或已禁用');
        }
        
        $zengjian=intval(I('post.zengjian',0));
		$jf=intval(I('post.jf',0));
		$remark=I('post.remark','');
		
		if($zengjian==1){
			$jf_type=5;  //手动增加积分
		}else if($zengjian==2){
			$jf_type=9;  //手动减少积分
		}else{
			$this->error('请选择增减积分','',2);
		}
		
		if(!preg_match("/^[0-9]{1,5}$/",$jf)){
			$this->error('请填写积分','',2);
		}
		if($jf<=0){
			$this->error('请填写积分','',2);
		}
		if($remark==''){
			$this->error('请填写备注','',2);
		}
		
		if($zengjian==2 && $jf>0){
			if($jfuserinfo['jfuser_jf']<$jf){
				$this->error('减少的积分大于该用户总积分','',2);
			}
		}
		
		//增减积分

		$data=array();
		$data['jf_unitcode']=session('unitcode');
		$data['jf_userid']=$jfuserinfo['jfuser_id'];
		$data['jf_username']=$jfuserinfo['jfuser_username'];
		$data['jf_type']=$jf_type;
		$data['jf_jf']=$jf;
		$data['jf_addtime']=time();
		$data['jf_ip']=$ip;
		$data['jf_actionuser']=$jfuserinfo['jfuser_id'];
		$data['jf_code']='';
		$data['jf_proid']='';
		$data['jf_proname']='';
		$data['jf_pronumber']='';
		$data['jf_remark']=$remark;
        
		$Jfdetail= M('Jfdetail');
		$rs=$Jfdetail->create($data,1);
		if($rs){
			$result = $Jfdetail->add(); 
			if($result){
				$data2=array();
				if($zengjian==1){
				    $data2['jfuser_jf'] = $jfuserinfo['jfuser_jf']+$jf;
				}else if($zengjian==2){
					$data2['jfuser_jf'] = $jfuserinfo['jfuser_jf']-$jf;
				}
				$Jfuser->where($map)->save($data2);
	
				//记录日志 begin
				$log_arr=array(
							'log_qyid'=>session('qyid'),
							'log_user'=>session('qyuser'),
							'log_qycode'=>session('unitcode'),
							'log_action'=>'手动增减积分',
							'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
							'log_addtime'=>time(),
							'log_ip'=>real_ip(),
							'log_link'=>__SELF__,
							'log_remark'=>json_encode($data)
							);
				save_log($log_arr);
				//记录日志 end
				$this->success('增减积分成功',U('Mp/Jfuser/index'),1);
			}else{
				 $this->error('增减积分失败','',2);
			}
		}else{
			 $this->error('增减积分失败','',2);
		}
	}
}