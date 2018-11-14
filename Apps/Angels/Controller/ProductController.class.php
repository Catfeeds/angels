<?php
namespace Angels\Controller;
use Think\Controller;
class ProductController extends CommController {
    //产品展示
    public function index(){
        $Jfproduct = M('Jfproduct');
        $map['pro_unitcode']=$this->qy_unitcode;
        $map['pro_active']=1;
        $count = $Jfproduct->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
        if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Jfproduct->where($map)->order('pro_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){
            $list[$k]['pro_pic_str']='<img src="'.__ROOT__.'/Public/uploads/mobi/'.$v['pro_pic'].'"  border="0">';
        }
        $this->assign('list', $list);
        $this->assign('page', $show);

        $this->display('index');
    }

    //产品详情
    public function detail(){
        $map['pro_id']=intval(I('get.proid',0));
        $map['pro_unitcode']=$this->qy_unitcode;
        $map['pro_active']=1;
        $Jfproduct= M('Jfproduct');
        $data=$Jfproduct->where($map)->find();
        if($data){
            $data['pro_pic_str']='<img src="'.__ROOT__.'/Public/uploads/mobi/'.$data['pro_pic'].'"  border="0"   style="width:100%" >';
        }else{
			$this->error('没有该记录','',1);
		}
        $this->assign('proinfo', $data);
        $this->display('detail');
    }
////产品展示
//    public function index(){
//        $product = M('product');
//        $map['pro_unitcode']=$this->qy_unitcode;
//        $map['pro_active']=1;
//        $count = $product->where($map)->count();
//        $Page = new \Think\Page($count, 20);
//        $show = $Page->show();
//        if($show=='<div>    </div>'){
//            $show='';
//        }
//        $list = $product->where($map)->order('pro_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
//
//        foreach($list as $k=>$v){
//            $list[$k]['pro_pic_str']='<img src="'.__ROOT__.'/Public/uploads/product/'.$v['pro_pic'].'"  border="0">';
//        }
//        $this->assign('list', $list);
//        $this->assign('page', $show);
//
//        $this->display('index');
//    }

//    //产品详情
//    public function detail(){
//        $map['pro_id']=intval(I('get.proid',0));
//        $map['pro_unitcode']=$this->qy_unitcode;
//        $map['pro_active']=1;
//        $product= M('product');
//        $data=$product->where($map)->find();
//        if($data){
//            $data['pro_pic_str']='<img src="'.__ROOT__.'/Public/uploads/product/'.$data['pro_pic'].'"  border="0"   style="width:100%" >';
//        }else{
//            $this->error('没有该记录','',1);
//        }
//        $this->assign('proinfo', $data);
//        $this->display('detail');
//    }
}