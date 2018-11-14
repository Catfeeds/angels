<?php
namespace Angels\Controller;
use Think\Controller;
class SucaiController extends CommController {
    //素材中心
    public function index(){
        // if(!$this->is_jxuser_login()){
        //     $qy_fwkey=$this->qy_fwkey;
        //     $qy_fwsecret=$this->qy_fwsecret;
        //     $ttamp2=time();
        //     $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
        //     $this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        // }
        $Jfmonews = M('Jfmonews');
        $map['news_unitcode']=$this->qy_unitcode;
        $map['news_type']=4;
        $count = $Jfmonews->where($map)->count();
        $Page = new \Think\Page($count, 20);
        $show = $Page->show();
         if($show=='<div>    </div>'){
            $show='';
        }
        $list = $Jfmonews->where($map)->order('news_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

        foreach($list as $k=>$v){ 
            if($v['news_pic']!=''){
                $list[$k]['news_pic_str']='<img src="'.__ROOT__.'/Public/uploads/mobi/'.$v['news_pic'].'"  border="0">';
            }else{
                $list[$k]['news_pic_str']='';
            }

            $list[$k]['news_content_s']='　　'.sub_str(str_replace("\s",'',str_replace("\r",'',str_replace(' ','',str_replace("\n",'',str_replace('    ','',str_replace('&nbsp;','',str_replace('　','',strip_tags($v['news_content'])))))))),150);
        

        }
        $this->assign('list', $list);
        $this->assign('page', $show);
        $this->display('index');
    }

    //详情
    public function detail(){
        if(!$this->is_jxuser_login()){
            $qy_fwkey=$this->qy_fwkey;
            $qy_fwsecret=$this->qy_fwsecret;
            $ttamp2=time();
            $sture2=MD5($qy_fwkey.$ttamp2.$qy_fwsecret);
            $this->redirect('Angels/Dealer/login/ttamp/'.$ttamp2.'/sture/'.$sture2.'','' , 0, '');
        }
        $map['news_id']=intval(I('get.news_id',0));
        $map['news_unitcode']=$this->qy_unitcode;
        $Jfmonews= M('Jfmonews');
        $data=$Jfmonews->where($map)->find();
        if($data){
           if($data['news_pic']!=''){
                $data['news_pic_str']='<img src="'.__ROOT__.'/Public/uploads/mobi/'.$data['news_pic'].'"  border="0"  style="width:100%" >';
            }else{
                $data['news_pic_str']='';
            }   
            
        }

        $Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
        $this->assign('signPackage', $signPackage);
        
        
        $http_host=strtolower(htmlspecialchars('http://'.$_SERVER['HTTP_HOST'])).WWW_WEBROOT;

        $shdese=$this->strCut($data['news_content'],25);
        $this->assign('shtitle',$data['news_title']);
        $this->assign('shdesc',$shdese);
        $this->assign('shlink',$http_host.'angels/sucai/detail/news_id/'.$data['news_id']);
        $this->assign('shimgurl', $http_host.'public/uploads/mobi/'.$data['news_pic']);

        $this->assign('newsinfo', $data);
        $this->display('detail');
    }
}