<?php
namespace Angels\Controller;
use Think\Controller;
class IndexController extends CommController {
    //首页
    public function index(){
		//公告
		$map=array();
        $map['news_isgg']=1;
        $map['news_unitcode']=$this->qy_unitcode;
        $Jfmonews= M('Jfmonews');
        $data2=$Jfmonews->where($map)->order('news_addtime DESC')->find();
        if($data2){
            
        }else{
			$data2['news_title']='';
			$data2['news_id']='';
		}
		
		//logo 和 底部图片
		$map=array();
		$Jfmobasic= M('Jfmobasic');
		$map['bas_unitcode']=$this->qy_unitcode;
        $data=$Jfmobasic->where($map)->find();
        if($data){
			$imgpath = BASE_PATH.'/Public/uploads/mobi/';
			if(file_exists($imgpath.$data['bas_logopic'])){
				$bas_logopic='<img src="'.__ROOT__.'/public/uploads/mobi/'.$data['bas_logopic'].'">';
			}else{
				if(strpos($data['bas_logopic'], 'logo')===false && strpos($data['bas_logopic'], '.')===false ){
					$bas_logopic=$data['bas_logopic'];
				}else{
					$bas_logopic='';
				}
			}
			
			if(file_exists($imgpath.$data['bas_footpic'])){
				$bas_footpic='<img src="'.__ROOT__.'/public/uploads/mobi/'.$data['bas_footpic'].'" style="width:100%">';
			}else{

				$bas_footpic='';
			}

			$bas_content=$data['bas_website'];

        }else{

            $bas_footpic='';
			$bas_logopic='';
			$bas_content='';

        }
		
		//海报
		$map=array();
		$map['ad_unitcode']=$this->qy_unitcode;
        $Adinfo= M('Adinfo');
		$adlist = $Adinfo->where($map)->order('ad_addtime DESC')->limit(5)->select();
 
 		$wvsh='100%';//滚图宽高比
		if($adlist){
			$imgpath = BASE_PATH.'/Public/uploads/mobi/';
            if(is_not_null($adlist[0]['ad_pic']) && file_exists($imgpath.$adlist[0]['ad_pic'])){
                $arr=getimagesize($imgpath.$adlist[0]['ad_pic']);
                if(false!=$arr){
                    $w=$arr[0];
                    $h=$arr[1];
                    $wvsh=(($h/$w)*100).'%';
                }
            }
        }
        $dl_level=0;
        //如果登录 代理级别
         if($this->is_jxuser_login()){
	        $Dealer=M('Dealer');
			$dlmap=array();
			$dlmap['dl_unitcode']=$this->qy_unitcode;
			$dlmap['dl_id']=session('jxuser_id');
			$dlmap['dl_status']=1;
			$dlInfo=$Dealer->where($dlmap)->field('dl_level')->find();
			if ($dlInfo)
			{
				$dl_level=$dlInfo['dl_level'];
			}
		}
        $this->assign('wvsh', $wvsh);
        $this->assign('bas_content', $bas_content);
        $this->assign('adlist', $adlist);
	    $this->assign('bas_logopic', $bas_logopic);
		$this->assign('bas_footpic', $bas_footpic);
		$this->assign('dl_level',$dl_level);
	    $this->assign('gonggao', $data2);
		
        $this->display('index');
    }


}