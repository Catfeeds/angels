<?php
namespace Mp\Controller;
use Think\Controller;
//积分礼品管理
class JfgiftController extends CommController {
	//积分礼品列表
    public function index(){
        $this->check_qypurview('50003',1);

        $Jfgift = M('Jfgift');
        $map['gif_unitcode']=session('unitcode');
        $count = $Jfgift->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'));
        $show = $Page->show();
        $list = $Jfgift->where($map)->order('gif_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Jfexchdetail = M('Jfexchdetail');
        $imgpath = BASE_PATH.'/Public/uploads/product/';
        foreach($list as $k=>$v){ 
            if(is_not_null($v['gif_pic']) && file_exists($imgpath.$v['gif_pic'])){
                $arr=getimagesize($imgpath.$v['gif_pic']);
                if(false!=$arr){
                    $w=$arr[0];
                    $h=$arr[1];
                    if($h>60){
                       $hh=60;
                       $ww=($w*60)/$h;
                    }else{
                       $hh=$h;
                       $ww=$w;
                    }
                    if($ww>60){
                       $ww=60;
                       $hh=($h*60)/$w;
                    }
                    $list[$k]['gif_pic_str']='<img src="'.__ROOT__.'/Public/uploads/product/'.$v['gif_pic'].'" width="'.$ww.'"  height="'.$hh.'"  border="0">';
                }
                else{
                    $list[$k]['gif_pic_str']='-';
                }
            }else{
                $list[$k]['gif_pic_str']='-';
            }

            if($v['gif_type']==1){
                $list[$k]['gif_type_str']='实物';
            }else{
                $list[$k]['gif_type_str']='虚拟';
            }

            $map2=array();
            $map2['detail_unitcode']=session('unitcode');
            $map2['detail_giftid'] = $v['gif_id'];
            $count2 = $Jfexchdetail->where($map2)->sum('detail_qty');  //已经兑换数量
            $list[$k]['gif_qty2']=$count2;
        }

        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->assign('curr', 'jfgift_list');
        $this->display('list');
    }
    //添加礼品
    public function add(){
        $this->check_qypurview('50003',1);

        $data['gif_id']=0;
        $data['gif_type']=1;
        $this->assign('curr', 'jfgift_list');
        $this->assign('atitle', '添加礼品');
        $this->assign('jfgiftinfo', $data);

        $this->display('add');
    }
    //修改礼品
    public function edit(){
        $this->check_qypurview('50003',1);

        $map['gif_id']=intval(I('get.gif_id',0));
        $map['gif_unitcode']=session('unitcode');
        $Jfgift= M('Jfgift');
        $data=$Jfgift->where($map)->find();
        $imgpath = BASE_PATH.'/Public/uploads/product/';
        if($data){
            if(is_not_null($data['gif_pic']) && file_exists($imgpath.$data['gif_pic'])){
                $arr=getimagesize($imgpath.$data['gif_pic']);
                if(false!=$arr){
                    $w=$arr[0];
                    $h=$arr[1];
                    if($h>60){
                       $hh=60;
                       $ww=($w*60)/$h;
                    }else{
                       $hh=$h;
                       $ww=$w;
                    }
                    if($ww>60){
                       $ww=60;
                       $hh=($h*60)/$w;
                    }
                    $data['gif_pic_str']='<img src="'.__ROOT__.'/Public/uploads/product/'.$data['gif_pic'].'" width="'.$ww.'"  height="'.$hh.'"  border="0" style="vertical-align:middle"  >';
                }
                else{
                    $data['gif_pic_str']='-';
                }
            }else{
                $data['gif_pic_str']='-';
            }
        }else{
            $this->error('没有该记录');
        }

        $this->assign('jfgiftinfo', $data);
        $this->assign('curr', 'jfgift_list');
        $this->assign('atitle', '修改礼品');

        $this->display('add');
    }
    //删除礼品
    public function delete(){
        $this->check_qypurview('50003',1);

        $map['gif_id']=intval(I('get.gif_id',0));
        $map['gif_unitcode']=session('unitcode');
        $Jfgift= M('Jfgift');
        $data=$Jfgift->where($map)->find();

        if($data){
            //验证是否要删除或删除相关信息 要保持数据完整性 

            //该礼品已有兑换
            $map2=array();
            $Jfexchdetail = M('Jfexchdetail');
            $map2['detail_unitcode']=session('unitcode');
            $map2['detail_giftid'] = $data['gif_id'];
            $data2 = $Jfexchdetail->where($map2)->find();
            if($data2){
                $this->error('该礼品已有兑换礼品,暂不能删除','',2);
            }


            @unlink('./Public/uploads/product/'.$data['gif_pic']); 
            $Jfgift->where($map)->delete(); 
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'删除礼品',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
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
        $this->check_qypurview('50003',1);

        $map['gif_id']=intval(I('get.gif_id',0));
        $map['gif_unitcode']=session('unitcode');
        $Jfgift= M('Jfgift');
        $data=$Jfgift->where($map)->find();
        if($data){
            $active=intval(I('get.gif_active',0));

            if($active==1){
                $data2['gif_active'] = 0;
            }else{
                $data2['gif_active'] = 1;
            }
            
            $Jfgift->where($map)->save($data2);
            
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'激活/禁用礼品',
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

    //保存礼品
    public function edit_save(){
        $this->check_qypurview('50003',1);
        if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }
        $map['gif_id']=intval(I('post.gif_id',''));
        
        if($map['gif_id']>0){
            //修改保存

            $gif_jf=I('post.gif_jf','');
            if($gif_jf==''){
                $gif_jf=0;
            }else{
                if(!preg_match("/^[0-9]{1,6}$/",$gif_jf)){
                    $this->error('输入积分必须为数字','',2);
                }
            }
            if($gif_jf<=0){
                $this->error('输入积分必须大于0','',2);
            }

            $gif_qty=I('post.gif_qty','');
            if($gif_qty==''){
                $gif_qty=0;
            }else{
                if(!preg_match("/^[0-9]{1,6}$/",$gif_qty)){
                    $this->error('输入礼品数量必须为数字','',2);
                }
            }    
            $gif_type=intval(I('post.gif_type',1));
            if($gif_type==1){
                $data['gif_qty']=$gif_qty;
            }
            $data['gif_name']=I('post.gif_name','');
            $data['gif_jf']=$gif_jf;
            
            $data['gif_des']=I('post.gif_des','');

            $old_gif_pic=I('post.old_gif_pic','');
      
            if($data['gif_name']==''){
                $this->error('礼品名称不能为空','',2);
            }
            
            //上传文件 begin
            if($_FILES['pic_file']['name']==''){
                $gif_pic='';
            }else{
                $upload = new \Think\Upload();
                $upload->maxSize = 3145728 ;
                $upload->exts = array('jpg', 'gif', 'png', 'jpeg');
                $upload->rootPath   = './Public/uploads/product/';
                $upload->subName  = session('unitcode');
                $upload->saveName = time().'_'.mt_rand(1000,9999);
                
                $info   =   $upload->uploadOne($_FILES['pic_file']);

                if(!$info) {
                    $this->error($upload->getError(),'',1);
                }else{
                    $gif_pic=$info['savepath'].$info['savename'];
                }

                @unlink($upload->rootPath.$old_gif_pic); 
                @unlink($_FILES['pic_file']['tmp_name']); 
            }
            //上传文件 end

            if($gif_pic!=''){
                $data['gif_pic']=$gif_pic;
            }
            
            $map['gif_unitcode']=session('unitcode');
            $Jfgift= M('Jfgift');

            $rs=$Jfgift->where($map)->data($data)->save();
           
            if($rs){
                //记录日志 begin
                $log_arr=array(
                            'log_qyid'=>session('qyid'),
                            'log_user'=>session('qyuser'),
                            'log_qycode'=>session('unitcode'),
                            'log_action'=>'修改礼品',
							'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                            'log_addtime'=>time(),
                            'log_ip'=>real_ip(),
                            'log_link'=>__SELF__,
                            'log_remark'=>json_encode($data)
                            );
                save_log($log_arr);
                //记录日志 end
                $this->success('修改成功',U('Mp/Jfgift/index'),1);
            }else{
                $this->error('修改失败','',1);
            }

        }else{  
            //添加保存
            $map=array();
            $map['gif_unitcode']=session('unitcode');
            $map['gif_name']=I('post.gif_name','');

            $Jfgift= M('Jfgift');
            $data2=$Jfgift->where($map)->find();
            if($data2){
                $this->error('该礼品已存在');
            }

            $gif_type=intval(I('post.gif_type',1));
            $gif_jf=I('post.gif_jf','');
            if($gif_jf==''){
                $gif_jf=0;
            }else{
                if(!preg_match("/^[0-9]{1,6}$/",$gif_jf)){
                    $this->error('输入积分必须为数字','',2);
                }
            }
            if($gif_jf<=0){
                $this->error('输入积分必须大于0','',2);
            }

            $gif_qty=I('post.gif_qty','');
            if($gif_qty==''){
                $gif_qty=0;
            }else{
                if(!preg_match("/^[0-9]{1,6}$/",$gif_qty)){
                    $this->error('输入礼品数量必须为数字','',2);
                }
            }
            if($gif_type==2){
                $gif_qty=0;
            }

            $data['gif_name']=$map['gif_name'];
            $data['gif_unitcode']=session('unitcode');
            $data['gif_jf']=$gif_jf;
            $data['gif_type']=$gif_type;
            $data['gif_qty']=$gif_qty;
            $data['gif_des']=I('post.gif_des','');
            $data['gif_addtime']=time();
            $data['gif_active']=1;
            
            if($data['gif_name']==''){
                $this->error('礼品名称不能为空');
            }
            //上传文件 begin
            if($_FILES['pic_file']['name']==''){
                $gif_pic='';
            }else{
                
                $upload = new \Think\Upload();
                $upload->maxSize = 3145728 ;
                $upload->exts = array('jpg', 'gif', 'png', 'jpeg');
                $upload->rootPath   = './Public/uploads/product/';
                $upload->subName  = session('unitcode');
                $upload->saveName = time().'_'.mt_rand(1000,9999);
                
                $info   =   $upload->uploadOne($_FILES['pic_file']);

                if(!$info) {
                    $this->error($upload->getError());
                }else{
                    $gif_pic=$info['savepath'].$info['savename'];
                }
                @unlink($_FILES['pic_file']['tmp_name']); 
            }
            //上传文件 end
            $data['gif_pic']=$gif_pic;


            $rs=$Jfgift->create($data,1);
            if($rs){
               $result = $Jfgift->add(); 
               if($result){
                    //记录日志 begin
                    $log_arr=array(
                                'log_qyid'=>session('qyid'),
                                'log_user'=>session('qyuser'),
                                'log_qycode'=>session('unitcode'),
                                'log_action'=>'添加礼品',
								'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                                'log_addtime'=>time(),
                                'log_ip'=>real_ip(),
                                'log_link'=>__SELF__,
                                'log_remark'=>json_encode($data)
                                );
                    save_log($log_arr);
                    //记录日志 end
                   $this->success('添加成功',U('Mp/Jfgift/index'),1);
               }else{
                   $this->error('添加失败','',1);
               }
            }else{
                $this->error('添加失败','',1);
            }

        }

    }
    //==========================================================================
    //虚拟礼品数据列表
    public function xunilist(){
        $this->check_qypurview('50005',1);

        $gif_id=intval(I('param.gif_id',0));
        $keyword=trim(strip_tags(htmlspecialchars_decode(I('param.keyword',''))));


        $order=intval(I('param.order',0));

        $map['gif_id']=$gif_id;
        $map['gif_unitcode']=session('unitcode');
        $Jfgift= M('Jfgift');
        $data=$Jfgift->where($map)->find();
        if($data){
             $this->assign('gifinfo', $data);
        }else{
             $this->error('没有该记录','',1);
        }
        
        $map2['xn_giftid']=$gif_id;
        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);

            $keyword=sub_str($keyword,20,false);
            $map2['xn_cardid']=array('LIKE', '%'.$keyword.'%');
        }

        if($order==1){
            $orderby='xn_exchtime DESC';
        }elseif($order==2){
            $orderby='xn_exchtime ASC';
        }else{
            $orderby='xn_id DESC';
        }

        $Jfxngift = M('Jfxngift');
        $map2['xn_unitcode']=session('unitcode');
        $count = $Jfxngift->where($map2)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'));
        $show = $Page->show();
        $list = $Jfxngift->where($map2)->order($orderby)->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){
            $xn_cardpwd=\Org\Util\Funcrypt::authcode($v['xn_cardpwd'],'DECODE',C('WWW_AUTHKEY'),0);
            $list[$k]['xn_cardpwdstr']='*********'.substr($xn_cardpwd,-4);

            if($v['xn_exchtime']>0){
                $list[$k]['xn_exchtime']=date('Y-m-d H:i:s',$v['xn_exchtime']);
            }else{
                $list[$k]['xn_exchtime']='';
            }

            if($v['xn_userid']>0){
                $list[$k]['xn_username']=$v['xn_username'];
            }else{
                $list[$k]['xn_username']='';
            }

        }

        //统计未兑换数
        $map2=array();
        $map2['xn_unitcode']=session('unitcode');
        $map2['xn_giftid']=$gif_id;
        $map2['xn_isexch'] =0;
        $count2 = $Jfxngift->where($map2)->count();
        $data2['gif_qty']=$count2;
        $Jfgift->where($map)->save($data2);

        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->assign('keyword', $keyword);
        $this->assign('order', $order);
        $this->assign('curr', 'jfgift_list');
        $this->display('xnlist');
    }
    //数据导入
    public function addxuni(){
        $this->check_qypurview('50005',1);
        $map['gif_id']=intval(I('param.gif_id',0));
        $map['xn_unitcode']=session('unitcode');
        $Jfgift= M('Jfgift');
        $data=$Jfgift->where($map)->find();
        if($data){
             $this->assign('gifinfo', $data);
        }else{
             $this->error('没有该记录','',1);
        }
        $this->assign('curr', 'jfgift_list');

        $this->display('addxuni');
    }
    //保存导入数据
    public function addxuni_save(){
        $this->check_qypurview('50005',1);

        if (!IS_POST) {
             header('HTTP/1.0 404 Not Found');
             echo'error:404';
             exit;
        }

        $gif_id=intval(I('param.gif_id',0));
        $addtime=time();
        $card_filename='';
        if($gif_id<=0){
             $this->error('没有该记录','',1);
        }

        //上传文件 begin
        if($_FILES['card_file']['name']==''){
            $this->error('请选择文件','',1);
        }else{
            if($_FILES['card_file']['size']==0){
                $this->error('文件为空','',1);
            }
            $upload = new \Think\Upload();
            $upload->maxSize = 1048576 ;
            $upload->exts = array('txt');
            $upload->rootPath   = './Public/uploads/tempfile/';
            $upload->subName  = session('unitcode');
            $upload->saveName = $addtime.'_'.mt_rand(1000,9999);
            
            $info = $upload->uploadOne($_FILES['card_file']);

            if(!$info) {
                $this->error($upload->getError(),'',1);
            }else{
                $card_filename=$info['savepath'].$info['savename'];
            }
            @unlink($_FILES['card_file']['tmp_name']); 
        }
        //上传文件 end
        
        $lines = @file_get_contents('./Public/uploads/tempfile/'.$card_filename);
        @unlink('./Public/uploads/tempfile/'.$card_filename); 
        if($lines){
            $lines=str_replace("\r",'',$lines);
            $lines=str_replace("chr(13)",'',$lines);
            $lines=str_replace("chr(10)",'',$lines);
            $linearr=explode("\n",$lines);
            $msgs=array();

            foreach($linearr as $key =>$li){
                $li=trim($li);
                if($li==''){
                    continue;
                }
                $cardarr=explode(',',$li);
                $cardid=(isset($cardarr[0]) && is_not_null($cardarr[0])) ? $cardarr[0]:'';
                $cardpwd=(isset($cardarr[1]) && is_not_null($cardarr[1])) ? $cardarr[1]:'';
                if($cardid=='' || $cardpwd==''){
                    $msgs[$key]['cardid']=$cardid;
                    $msgs[$key]['error']='<span style="color:#FF0000">该行卡号或卡密为空</span>';
                    continue;
                }
                if(!preg_match("/^[a-zA-Z0-9]{4,64}$/",$cardid)){
                    $msgs[$key]['cardid']=$cardid;
                    $msgs[$key]['error']='<span style="color:#FF0000">添加 '.htmlspecialchars($cardid).' 出错，卡号应由数字字母组成</span>';
                    continue;
                }
                if(!preg_match("/^[a-zA-Z0-9]{4,64}$/",$cardpwd)){
                    $msgs[$key]['cardid']=$cardid;
                    $msgs[$key]['error']='<span style="color:#FF0000">添加 '.htmlspecialchars($cardid).' 出错，卡密应由数字字母组成</span>';
                    continue;
                }

                //检测是否已存在
                $map=array();
                $data=array();
                $map['xn_unitcode']=session('unitcode');
                $map['xn_cardid'] = $cardid;
                $map['xn_giftid'] = $gif_id;
                $Jfxngift= M('Jfxngift');
                $data=$Jfxngift->where($map)->find();
                if(is_not_null($data)){
                    $msgs[$key]['cardid']=$cardid;
                    $msgs[$key]['error']='<span style="color:#FF0000">添加 '.$cardid.' 出错，该数据已存在。</span>';
                    continue;
                }

                $cardpwdmd5=\Org\Util\Funcrypt::authcode($cardpwd,'ENCODE',C('WWW_AUTHKEY'),0);
                //入库 记录
                $insert=array();
                $insert['xn_unitcode']=session('unitcode');
                $insert['xn_giftid']=$gif_id;
                $insert['xn_cardid']=$cardid;
                $insert['xn_cardpwd']=$cardpwdmd5;
                $insert['xn_addtime']=$addtime;
                $insert['xn_exchtime']=0;
                $insert['xn_userid']=0;
                $insert['xn_isexch']=0;


                $rs=$Jfxngift->create($insert,1);
                if($rs){
                   $result = $Jfxngift->add(); 
                   if($result){
                        //记录日志 begin
                        $log_arr=array();
                        $insert['card_filename']=$card_filename;
                        $log_arr=array(
                                    'log_qyid'=>session('qyid'),
                                    'log_user'=>session('qyuser'),
                                    'log_qycode'=>session('unitcode'),
                                    'log_action'=>'导入虚拟礼品数据',
									'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                                    'log_addtime'=>time(),
                                    'log_ip'=>real_ip(),
                                    'log_link'=>__SELF__,
                                    'log_remark'=>json_encode($insert)
                                    );
                        save_log($log_arr);
                        //记录日志 end
                        $msgs[$key]['cardid']=$cardid;
                        $msgs[$key]['error']='添加'.$cardid.'成功。';
                        continue;
                   }else{
                       $msgs[$key]['cardid']=$cardid;
                       $msgs[$key]['error']='<span style="color:#FF0000">添加 '.$cardid.' 出错。</span>';
                       continue;
                   }
                }else{
                    $msgs[$key]['cardid']=$cardid;
                    $msgs[$key]['error']='<span style="color:#FF0000">添加 '.$cardid.' 出错。</span>';
                    continue;
                }
            }

            $this->assign('msgslist', $msgs);
            $this->assign('gif_id', $gif_id);
            $this->assign('curr', 'jfgift_list');
            $this->display('msgs');
        }else{
            $this->error('导入数据出错','',1);
        }
        
    }
    //删除虚拟礼品数据
    public function xunidel(){
        $this->check_qypurview('50005',1);

        $map['xn_id']=intval(I('get.xn_id',0));
        $map['xn_unitcode']=session('unitcode');
        $Jfxngift= M('Jfxngift');
        $data=$Jfxngift->where($map)->find();

        if($data){
            //验证是否要删除或删除相关信息 要保持数据完整性 
            if($data['xn_isexch']>0){
                $this->error('该礼品已兑换,作为记录保存,不能删除','',2);
            }
            $Jfxngift->where($map)->delete(); 
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('qyid'),
                        'log_user'=>session('qyuser'),
                        'log_qycode'=>session('unitcode'),
                        'log_action'=>'删除虚拟礼品数据',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $this->success('删除成功',U('Mp/Jfgift/xunilist?gif_id='.$data['xn_giftid']),1);
        }else{
            $this->error('没有该记录','',1);
        }     
    
    }
    //==========================================================================


}