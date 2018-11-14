<?php
namespace Mp\Controller;
use Think\Controller;
//积分明细
class JfdetailController extends CommController {
	//积分明细
    public function index(){
        $this->check_qypurview('50001',1);
        
		$jfuser_id=intval(I('get.jfuser_id',0));
		$parameter=array();
		if($jfuser_id>0){
			$map['jf_userid']=$jfuser_id;
			$parameter['jfuser_id']=$jfuser_id;	
		}
		
        $keyword=trim(strip_tags(htmlspecialchars_decode(I('post.keyword',''))));
        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);
            
            $keyword=sub_str($keyword,20,false);
            $where['jf_username']=$keyword;
            $where['jf_code']=array('LIKE', $keyword.'%');
            $where['_logic'] = 'or';
            $map['_complex'] = $where;
			$parameter['keyword']=$keyword;	
        }

        $Jfdetail = M('Jfdetail');
        $map['jf_unitcode']=session('unitcode');
        $count = $Jfdetail->where($map)->count();
        $Page = new \Think\Page($count, C('PAGE_SIZE'),$parameter);
        $show = $Page->show();
        $list = $Jfdetail->where($map)->order('jf_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
        $Jfuser= M('Jfuser');

        foreach($list as $k=>$v){
            $map2=array();
            $map2['jfuser_unitcode']=session('unitcode');
            $map2['jfuser_id'] = $v['jf_userid'];
            $data2 = $Jfuser->where($map2)->find();
            if($data2){
                  $list[$k]['jf_user_truename']=$data2['jfuser_truename'];
            }else{
                  $list[$k]['jf_user_truename']='用户已删';
            }
            //jf_type 积分类型 1--5增加积分  6-9消费积分    5-手动增加积分  9--手动减积分
            if($v['jf_type']==1){
                $list[$k]['jf_detailstr']='购买产品获得'.$v['jf_jf'].'积分<br>购买产品：'.$v['jf_proname'].$v['jf_pronumber'];
                $list[$k]['jf_typestr']='购买产品积分';
                $list[$k]['jf_jf']='+'.$v['jf_jf'];
			}elseif($v['jf_type']==5){	
                $list[$k]['jf_detailstr']='';
                $list[$k]['jf_typestr']='手动增加积分';
                $list[$k]['jf_jf']='+'.$v['jf_jf'];
            }elseif($v['jf_type']==6){
                $list[$k]['jf_detailstr']='兑换礼品使用'.$v['jf_jf'].'积分<br>兑换礼品：'.$v['jf_proname'];
                $list[$k]['jf_typestr']='兑换礼品积分';
                $list[$k]['jf_jf']='<span style="color:#FF0000">-'.$v['jf_jf'].'</span>';
			}elseif($v['jf_type']==9){
                $list[$k]['jf_detailstr']='';
                $list[$k]['jf_typestr']='手动减少积分';
                $list[$k]['jf_jf']='<span style="color:#FF0000">-'.$v['jf_jf'].'</span>';
            }else{
                $list[$k]['jf_typestr']='其他';
                $list[$k]['jf_detailstr']='';
            }

        }
        $this->assign('list', $list);

        $this->assign('keyword', $keyword);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
        $this->assign('curr', 'jfdetail_list');

        $this->display('list');
    }

    //查看详细
    public function view(){
        $this->check_qypurview('50001',1);
        
        $map['jf_id']=intval(I('get.jf_id',0));
        $map['jf_unitcode']=session('unitcode');
        $Jfdetail= M('Jfdetail');
        $data=$Jfdetail->where($map)->find();
        $Jfuser= M('Jfuser');
        if($data){
            $map2['jfuser_unitcode']=session('unitcode');
            $map2['jfuser_id'] = $data['jf_userid'];
            $data2 = $Jfuser->where($map2)->find();
            if($data2){
                  $data['jf_user_truename']=$data2['jfuser_truename'];
            }else{
                  $data['jf_user_truename']='用户已删';
            }
            //jf_type 积分类型 1--5增加积分  6-9消费积分
            if($data['jf_type']==1){
                $data['jf_typestr']='购买产品积分';
                $data['jf_jf']='+'.$data['jf_jf'];
			}elseif($data['jf_type']==5){
                $data['jf_typestr']='手动增加积分';
                $data['jf_jf']='+'.$data['jf_jf'];
            }elseif($data['jf_type']==6){
                $data['jf_typestr']='兑换礼品积分';
                $data['jf_jf']='-'.$data['jf_jf'];
			}elseif($data['jf_type']==9){
                $data['jf_typestr']='手动减少积分';
                $data['jf_jf']='-'.$data['jf_jf'];
            }else{
                $data['jf_typestr']='其他';
            }
        }else{
            $this->error('没有该记录');
        }

        $this->assign('jfdetailinfo', $data);
        $this->assign('curr', 'jfdetail_list');

        $this->display('view');
    }


    //=====================================================================================


}