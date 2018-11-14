<?php
namespace Wxship\Controller;
use Think\Controller;
class OrdersController extends CommController {
    //处理公司订单
    public function index(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		//待审核数

		$Model=M();
		$map=array();
		$map['a.od_unitcode']=$qycode;
		$map['a.od_state']=0;
		$map['a.od_id']=array('exp','=b.odbl_odid');
		$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
		$map['b.odbl_rcdlid']=0;//下给公司的订单
		
		$count1 = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->count();
		
		//代发货数
		$map=array();
		$map['a.od_unitcode']=$qycode;
		$map['a.od_id']=array('exp','=b.odbl_odid');
		$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
		$map['b.odbl_rcdlid']=0;//下给公司的订单
		$map['a.od_state']=array('in','1,2');
		$count2 = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->count();
		
		
		$this->assign('count1', $count1);
		$this->assign('count2', $count2);
		$this->display('index');
    }
	
	//订单记录
    public function orderslist(){
        $this->checksu_qypurview('13001',1);
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
        //-------------------------------
		$parameter=array();
        $od_state=intval(I('get.od_state',0));
		$keyword=trim(strip_tags(htmlspecialchars_decode(I('get.keyword',''))));
		
		$Model=M();
		$map=array();
		$map['a.od_unitcode']=$qycode;


		if($od_state==1 || $od_state==2){
			$map['a.od_state']=array('in','1,2');
		}else{
			$map['a.od_state']=$od_state;
		}	
		$parameter['od_state']=$od_state;
		
		//状态
		if($od_state==0){
			$title='待确认';
		}else if($od_state==1){
			$title='待发货';
		}else if($od_state==2){
			$title='部分发货';
		}else if($od_state==3){
			$title='已发货';
		}else if($od_state==8){
			$title='已完成';
		}else if($od_state==9){
			$title='已取消';
		}else{
			$title='未定义';
		}


        if($keyword!=''){
            $keyword=str_replace('[','',$keyword);
            $keyword=str_replace(']','',$keyword);
            $keyword=str_replace('%','',$keyword);
            $keyword=str_replace('_','',$keyword);

            $keyword=sub_str($keyword,25,false);
            $map['od_orderid']=$keyword;
			$map['a.od_state']=array('in','0,1,2,3,8,9');
			$title='搜索结果';
			$parameter['keyword']=$keyword;
        }
		
		$map['b.odbl_rcdlid']=0;//下给公司的订单
		$map['a.od_id']=array('exp','=b.odbl_odid');
		$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
		
		$count = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->count();
		$Page = new \Think\Page($count, 20,$parameter);
        $show = $Page->show();

		$list = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->order('a.od_addtime DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();
		
		$Product = M('Product');
		$Orderdetail = M('Orderdetail');
		$Shipment = M('Shipment');
		$Dealer = M('Dealer');
		$imgpath = BASE_PATH.'/Public/uploads/product/';
		
        foreach($list as $k=>$v){
			//订单详细
			$map2=array();
			$data2=array();
			$map2['oddt_unitcode']=$qycode;
			$map2['oddt_odid']=$v['od_id'];
			$map2['oddt_odblid']=$v['odbl_id'];
			$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
			foreach($data2 as $kk=>$vv){
				//产品
				$map3=array();
				$data3=array();
				$map3['pro_id']=$vv['oddt_proid'];
				$map3['pro_unitcode']=$qycode;
				$data3=$Product->where($map3)->find();
				if($data3){
					if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
						$data2[$kk]['oddt_propic']=$data3['pro_pic'];
					}else{
						$data2[$kk]['oddt_propic']='';
					}
				}else{
					$data2[$kk]['oddt_propic']='';
				}
				
				//订购数 
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($vv['oddt_prodbiao']>0){
					$oddt_unitsqty=$vv['oddt_prodbiao'];
					
					if($vv['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
					}
					
					if($vv['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
				}else{
					$oddt_totalqty=$vv['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
					$data2[$kk]['oddt_totalqty']='';
				}else{
					$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				//发货数
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$vv['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$vv['oddt_odid'];
				$map3['ship_dealer']=$v['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
					}
				}else{
					$data2[$kk]['oddt_shipqty']=0;
				}
				
				
				//出货按钮
				if($v['odbl_state']==1 || $v['odbl_state']==2 || $v['odbl_state']==3){
					if($oddt_totalqty>0){
						if($oddt_totalqty>$data3){
							$data2[$kk]['oddt_shipment']='<button class="ui-btn-s ui-btn-primary"   data-href="'.U('./Wxship/Orders/odshipscan?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&oddt_id='.$vv['oddt_id'].'').'" >出货</button>';
						}else{
							$data2[$kk]['oddt_shipment']='';
						}
					}else{
						if($vv['oddt_qty']>$data3){
							$data2[$kk]['oddt_shipment']='<button class="ui-btn-s ui-btn-primary" data-href="'.U('./Wxship/Orders/odshipscan?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&oddt_id='.$vv['oddt_id'].'').'" >出货</button>';
						}else{
							$data2[$kk]['oddt_shipment']='';
						}
					}
				}else{
					$data2[$kk]['oddt_shipment']='';
				}
				
				
				
			}
			$list[$k]['orderdetail']=$data2;
			
			//状态 下家订单状态 以fw_orderbelong表为主 
			if($v['odbl_state']==0){
				$list[$k]['od_state_str']='待确认';
			}else if($v['odbl_state']==1){
				$list[$k]['od_state_str']='待发货';
			}else if($v['odbl_state']==2){
				$list[$k]['od_state_str']='部分发货';
			}else if($v['odbl_state']==3){
				$list[$k]['od_state_str']='已发货';
			}else if($v['odbl_state']==8){
			    $list[$k]['od_state_str']='已完成';
			}else if($v['odbl_state']==9){
				$list[$k]['od_state_str']='已取消';
			}else{
				$list[$k]['od_state_str']='未知';
			}
			
			//下单代理信息
			$map3=array();
			$data3=array();
			$map3['dl_id']=$v['odbl_oddlid'];
			$map3['dl_unitcode']=$qycode;
			$data3=$Dealer->where($map3)->find();
			if($data3){
				$list[$k]['od_dl_name']=$data3['dl_name'];
				$list[$k]['od_dl_tel']=$data3['dl_tel'];
			}else{
				$list[$k]['od_dl_name']='';
				$list[$k]['od_dl_tel']='';
			}
			 
			//允许操作
			$caozuostr='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/orderdetail?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >订单详细</div> ';
			
			//确认订单
			if($v['odbl_state']==0){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/canceldlorder?state=1&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >确认订单</div> ';
			}
		    //取消订单
 			if($v['odbl_state']==0 || $v['odbl_state']==1 ){
				$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/canceldlorder?state=9&od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >取消订单</div> ';
			}
			
			//删除订单 只有已取消的才能删除
			if($v['od_state']==9 ){
				//$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/deleteorder?od_id='.$v['od_id'].'&odbl_id='.$v['odbl_id'].'&od_state='.$od_state.'').'"  >删除</div> ';
			}
			
			$list[$k]['caozuostr']=$caozuostr;	
			
		}
		
		
		$this->assign('page', $show);
		$this->assign('orderlist', $list);
        $this->assign('od_state', $od_state);

        $this->assign('keyword', $keyword);
        $this->assign('page', $show);
		$this->assign('title', $title);


        $this->display('orderslist');
		
    }
	
   //取消、确认订单
	public function canceldlorder(){
		$this->checksu_qypurview('13001',1);
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
        //-------------------------------
		
		$odbl_id=intval(I('get.odbl_id',0));
		$od_id=intval(I('get.od_id',0));
		$state=intval(I('get.state',0));
		$od_state=intval(I('get.od_state',0));
		
		if($state==1){
			$state=1;
			$odlg_action='确认订单';
		}else if($state==9){
			$state=9;
			$odlg_action='取消订单';
		}else{
			$this->error('无该操作权限','',2);
		}
		
		$Orders= M('Orders');
		$Orderbelong= M('Orderbelong');
		$Orderlogs= M('Orderlogs');
		$Shipment= M('Shipment');
		
		if($od_id>0 && $odbl_id>0){
			//修改订单关系表状态
            $Model=M();
			$map=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$data = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($data){
				//只有待确认才可以 确认
				if($state==1){
					if($data['odbl_state']!=0){
					    $this->error('该订单已确认','',2);
				    }
				}
				
				//只有待确认、待发货的订单才能取消 确认
				if($data['odbl_state']==0 || $data['odbl_state']==1){
					//是否有出货记录 如有则不能取消
                    $map3=array();
					$data3=array();
					$map3['ship_unitcode']=$qycode;
					$map3['ship_odid']=$od_id;
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->find();
					if($data3){
						 $this->error('该订单已有出货记录，不能取消','',2);
					}

					$map2=array();
					$updata2=array();
					$map2['odbl_unitcode']=$qycode;
					$map2['odbl_odid']=$od_id;
					$map2['odbl_id']=$odbl_id;
					
					$updata2['odbl_state']=$state;
					$Orderbelong->where($map2)->save($updata2);
					
					//修改原始订单状态
					if($data['od_oddlid']==$data['odbl_oddlid']){
						$map2=array();
						$updata2=array();
						$map2['od_unitcode']=$qycode;
						$map2['od_id']=$od_id;
						$updata2['od_state']=$state;
						$Orders->where($map2)->save($updata2);
					}
					
					 //取消下家订单
					if($state==9){
						//预付款 余额 设 无效
						$Yufukuan= M('Yufukuan');
						$Balance= M('Balance');
						
						//取消返利
						$map2=array();
						$updata2=array();
						$map2['yfk_unitcode']=$qycode;
						$map2['yfk_type']=2;
						$map2['yfk_oddlid']=$data['od_oddlid'];
						$map2['yfk_odid']=$od_id;
						$updata2['yfk_state']=0;
						$Yufukuan->where($map2)->save($updata2);
						
						//取消订单款项
						$map2=array();
						$updata2=array();
						$map2['bl_unitcode']=$qycode;
						$map2['bl_type']=2;
						$map2['bl_sendid']=$data['od_oddlid'];
						$map2['bl_odid']=$od_id;
						$updata2['bl_state']=0;
						$Balance->where($map2)->save($updata2);

						//预付款 余额 设 无效 end
					}
					
					
					
					//订单操作日志 begin
					$odlog_arr=array(
								'odlg_unitcode'=>$qycode,  
								'odlg_odid'=>$od_id,
								'odlg_orderid'=>$data['od_orderid'],
								'odlg_dlid'=>session('subuser_id'),
								'odlg_dlusername'=>session('subuser_name'),
								'odlg_dlname'=>session('subuser_name'),
								'odlg_action'=>$odlg_action,
								'odlg_type'=>0, //0-企业 1-经销商
								'odlg_addtime'=>time(),
								'odlg_ip'=>real_ip(),
								'odlg_link'=>__SELF__
								);
					$Orderlogs = M('Orderlogs');
					$rs3=$Orderlogs->create($odlog_arr,1);
					if($rs3){
						$Orderlogs->add();
					}
					//订单操作日志 end
					
					$this->redirect('Wxship/Orders/orderslist/od_state/'.$od_state.'','' , 0, '');
					
				}else{
				    $this->error('该订单已处理，不能取消','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
		}else{
			$this->error('没有该记录','',2);
		}
	}
	
	//订单详细
	public function orderdetail(){
		$this->checksu_qypurview('13001',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
        //-------------------------------
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$od_state=intval(I('get.od_state',0));
		
		if($od_id>0 && $odbl_id>0){
			$Model=M();
			$map=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$map['b.odbl_rcdlid']=0;
			$data = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($data){
				//订单产品详细
				$Orderdetail= M('Orderdetail');
				$Product= M('Product');
				$Shipment= M('Shipment');
				$Dealer= M('Dealer');
				
				$map2=array();
				$data2=array();
				$map2['oddt_unitcode']=$qycode;
				$map2['oddt_odid']=$data['od_id'];
				$map2['oddt_odblid']=$data['odbl_id'];
				$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
				$imgpath = BASE_PATH.'/Public/uploads/product/';
				foreach($data2 as $kk=>$vv){
					//产品
					$map3=array();
					$data3=array();
					$map3['pro_id']=$vv['oddt_proid'];
					$map3['pro_unitcode']=$qycode;
					$data3=$Product->where($map3)->find();
					if($data3){
						if(is_not_null($data3['pro_pic']) && file_exists($imgpath.$data3['pro_pic'])){
							$data2[$kk]['oddt_propic']=$data3['pro_pic'];
						}else{
							$data2[$kk]['oddt_propic']='';
						}
					}else{
						$data2[$kk]['oddt_propic']='';
					}
					
					//订购数 发货数
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($vv['oddt_prodbiao']>0){
						$oddt_unitsqty=$vv['oddt_prodbiao'];
						
						if($vv['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
						}
						
						if($vv['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
					}else{
						$oddt_totalqty=$vv['oddt_qty'];
					}
					
					if($oddt_totalqty==0 || $oddt_totalqty==$vv['oddt_qty']){
						$data2[$kk]['oddt_totalqty']='';
					}else{
						$data2[$kk]['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$vv['oddt_proid'];
					$map3['ship_unitcode']=$qycode;
					$map3['ship_odid']=$vv['oddt_odid'];
					$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
			
					if($data3){
						if($oddt_unitsqty>0){
							$data2[$kk]['oddt_shipqty']=floor($data3/$oddt_unitsqty).$vv['oddt_prounits'].'('.$data3.'件)';
						}else{
							$data2[$kk]['oddt_shipqty']=$data3.$vv['oddt_prounits'];
						}
					}else{
						$data2[$kk]['oddt_shipqty']=0;
					}
	
					
					//出货按钮
					if($data['odbl_state']==1 || $data['odbl_state']==2 || $data['odbl_state']==3){
						if($oddt_totalqty>0){
							if($oddt_totalqty>$data3){
								$data2[$kk]['oddt_shipment']='<button class="ui-btn-s ui-btn-primary"  data-href="'.U('./Wxship/Orders/odshipscan?od_id='.$data['od_id'].'&odbl_id='.$data['odbl_id'].'&oddt_id='.$vv['oddt_id'].'').'"   >出货</button>';
							}else{
								$data2[$kk]['oddt_shipment']='';
							}
						}else{
							if($vv['oddt_qty']>$data3){
								$data2[$kk]['oddt_shipment']='<button class="ui-btn-s ui-btn-primary"   data-href="'.U('./Wxship/Orders/odshipscan?od_id='.$data['od_id'].'&odbl_id='.$data['odbl_id'].'&oddt_id='.$vv['oddt_id'].'').'" >出货</button>';
							}else{
								$data2[$kk]['oddt_shipment']='';
							}
						}
					}else{
						$data2[$kk]['oddt_shipment']='';
					}
					
				}
				$data['orderdetail']=$data2;
				
				//下单代理信息
				$map3=array();
				$data3=array();
				$map3['dl_id']=$data['odbl_oddlid'];
				$map3['dl_unitcode']=$qycode;
				$data3=$Dealer->where($map3)->find();
				if($data3){
					$data['od_dl_name']=$data3['dl_name'];
					$data['od_dl_tel']=$data3['dl_tel'];
					$data['od_dl_weixin']=$data3['dl_weixin'];
				}else{
					$data['od_dl_name']='';
					$data['od_dl_tel']='';
					$data['od_dl_weixin']='';
				}
				
				//快递物流
				if($data['od_express']>0){
				    $map3=array();
					$data3=array();
					$Express= M('Express');
					$map3['exp_id']=$data['od_express'];
					$data3=$Express->where($map3)->find();
					if($data3){
						$data['od_expressname']=$data3['exp_name'];
						//可以从快递100接口获取数据
						
						
					}else{
						$data['od_expressname']='';
					}
				}else{
					$data['od_expressname']='';
				}
				
				//状态
				if($data['odbl_state']==0){
					$data['od_state_str']='待确认';
				}else if($data['odbl_state']==1){
					$data['od_state_str']='待发货';
				}else if($data['odbl_state']==2){
					$data['od_state_str']='部分发货';
				}else if($data['odbl_state']==3){
					$data['od_state_str']='已发货';
				}else if($data['odbl_state']==8){
					$data['od_state_str']='已完成';
				}else if($data['odbl_state']==9){
					$data['od_state_str']='已取消';
				}else{
					$data['od_state_str']='未知';
				}
				
				$imgpath2 = BASE_PATH.'/Public/uploads/orders/';
				
				if(is_not_null($data['odbl_paypic']) && file_exists($imgpath2.$data['odbl_paypic'])){
					$data['odbl_paypic_str']='<img src="'.__ROOT__.'/Public/uploads/orders/'.$data['odbl_paypic'].'"   border="0"  style="width:30%;"  >';
				}else{
					$data['odbl_paypic_str']='';
				}
				
				
				//允许操作
				$caozuostr='';
				if($data['odbl_state']==1 || $data['odbl_state']==2 || $data['odbl_state']==3 ){
					if($data['od_express']>0){
						$caozuostr='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/odfinishship?od_id='.$data['od_id'].'&odbl_id='.$data['odbl_id'].'&od_state='.$od_state.'&isok=1').'"  >修改物流</div> ';
					}else{
						$caozuostr='<div class="ui-btn ui-btn-primary"   data-href="odfinishship1"  >完成发货</div> ';
					}
				}
				//取消订单
				if($data['odbl_state']==0 || $data['odbl_state']==1 ){
					$caozuostr.='<div class="ui-btn ui-btn-primary"   data-href="'.U('./Wxship/Orders/canceldlorder?state=9&od_id='.$data['od_id'].'&odbl_id='.$data['odbl_id'].'&od_state='.$od_state.'').'"  >取消订单</div> ';
				}
				
				$data['caozuostr']=$caozuostr;	
				
				//操作日志
				$Orderlogs= M('Orderlogs');
				$map2=array();
				$map2['odlg_unitcode']=$qycode;
				$map2['odlg_odid']=$od_id;

				$logs = $Orderlogs->where($map2)->order('odlg_addtime DESC')->limit(50)->select();
				foreach($logs as $kkk=>$vvv){
					if($vvv['odlg_type']==0){
						 $logs[$kkk]['odlg_dlname']='总公司';
					}
				}
			
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('orderlogs', $logs);
		$this->assign('od_state', $data['odbl_state']);
		$this->assign('ordersinfo', $data);
		$this->assign('od_id', $od_id);
		$this->assign('odbl_id', $odbl_id);
		
		$this->display('orderdetail');
	}
	
	
	//完成发货
	public function odfinishship(){
		$this->checksu_qypurview('13001',1);
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		
        //-------------------------------
		
		$action=I('post.action','');
		
		
		if($action=='save'){
			$od_id=intval(I('post.od_id',0));
			$odbl_id=intval(I('post.odbl_id',0));
			$od_state=intval(I('post.od_state',0));
			
			if($od_id>0 && $odbl_id>0){
				$od_express=intval(I('post.od_express',0));
				$od_expressnum=I('post.od_expressnum','');
				$od_remark=I('post.od_remark','');
			    if($od_express<=0){
					$msg=array('stat'=>0,'msg'=>'请选择物流快递');
					echo json_encode($msg);
					exit;
				}
				
				$Model=M();
				$map=array();
				$map['a.od_unitcode']=$qycode;
				$map['a.od_id']=array('exp','=b.odbl_odid');
				$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map['b.odbl_id']=$odbl_id;
				$map['b.odbl_odid']=$od_id;
				$map['b.odbl_rcdlid']=0;
				$data = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
				if($data){	
					//检测是否能发货 //订购数 发货数
					$Orderdetail = M('Orderdetail');
					$Shipment = M('Shipment');
					$map2=array();
					$oddetail=array();
					$map2['oddt_unitcode']=$qycode;
					$map2['oddt_odid']=$od_id;
					$map2['oddt_odblid']=$odbl_id;  //订单关系id
					$oddetail = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
					$proids=array();
					foreach($oddetail as $kk=>$vv){

						$proids[]=$vv['oddt_proid'];

						//订购数 
						$oddt_totalqty=0;
						$oddt_unitsqty=0;
						if($vv['oddt_prodbiao']>0){
							$oddt_unitsqty=$vv['oddt_prodbiao'];
							
							if($vv['oddt_prozbiao']>0){
								$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
							}
							
							if($vv['oddt_proxbiao']>0){
								$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
							}
							
							$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
						}else{
							$oddt_totalqty=$vv['oddt_qty'];
						}
						
						//发货数
						$map3=array();
						$data3=array();
						$map3['ship_pro']=$vv['oddt_proid'];
						$map3['ship_unitcode']=$qycode;
						$map3['ship_odid']=$vv['oddt_odid'];
						$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
						$data3=$Shipment->where($map3)->sum('ship_proqty');
						if($data3){
							if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
								if($this->checksu_qypurview('13004',0)){
								//完成订单不以完成出货为条件
								}else{
									$this->error('该订单还没完成出货','',2);
									exit;
								}
							}	
							
                            if( $oddt_totalqty<$data3){
								$msg=array('stat'=>0,'msg'=>'该订单出货的数量大于订购数量');
								echo json_encode($msg);
								exit;
							}
						}else{
							if($this->checksu_qypurview('13004',0)){
							//完成订单不以完成出货为条件
							}else{
								$this->error('该订单还没完成出货','',2);
								exit;
							}
						}
					}
				}else{
					$msg=array('stat'=>0,'msg'=>'该订单记录不存在');
					echo json_encode($msg);
					exit;
				}
				
                $Orders= M('Orders');
				$Orderbelong= M('Orderbelong');
				
				//写入物流信息
				$map2=array();
				$updata2=array();
				$map2['od_unitcode']=$qycode;
				$map2['od_id']=$od_id;
				
				$updata2['od_express']=$od_express;
				$updata2['od_expressnum']=$od_expressnum;
				$updata2['od_remark']=$od_remark;
				if($data['od_express']<=0){
				    $updata2['od_expressdate']=time();
				}
				$Orders->where($map2)->save($updata2);
				
				//订单关系状态更改
				$map2=array();
				$updata2=array();
				$map2['odbl_unitcode']=$qycode;
				$map2['odbl_id']=$odbl_id;
				$updata2['odbl_state']=3; //0--待确认  1--代发货 2--部分发货 3-已发货 8-已完成 9-已取消
				$Orderbelong->where($map2)->save($updata2);
				
				//修改原始订单状态
				if($data['od_oddlid']==$data['odbl_oddlid']){
					$map2=array();
					$updata2=array();
					$map2['od_unitcode']=$qycode;
					$map2['od_id']=$od_id;
					$updata2['od_state']=3;
					$Orders->where($map2)->save($updata2);
				}
				
				if($data['od_express']<=0){

					//订单返利 begin
					$fanli_dlid1=0; //返利给的代理商1
					$fanli_dlid2=0; //返利给的代理商2
					$fanli_dlid3=0; //返利给的代理商3
					$ismaiduan=0;
					$fanli_dlname1='';
					$fanli_dlname2='';
					$fanli_dlname3='';
					$Dealer = M('Dealer');
					//下单人
					$map3=array();
					$orderdealer=array();
					$map3['dl_unitcode'] = $qycode;
					$map3['dl_id'] = $data['od_oddlid'];  //下单的代理
					$orderdealer=$Dealer->where($map3)->find();
					if($orderdealer){
						$Profanli= M('Profanli');
						$map2=array();
						$map2['pfl_unitcode'] = $qycode;
						$map2['pfl_dltype'] = $orderdealer['dl_type'];
						$where=array();
						$where['pfl_fanli1'] = array('GT',0);
						$where['pfl_maiduan'] = array('GT',0);  //是否设置卖断返利
						$where['_logic'] = 'or';
						$map2['_complex'] = $where;
						
						if($proids){
							$map2['pfl_proid'] = array('IN',$proids);
						}
						$data2=$Profanli->where($map2)->find(); //是否有设置返利
						
						//明臣眼科-返利
						if($qycode=='2891'){
							if($data2){
								if($orderdealer['dl_referee']>0){

									//下单代理的推荐人 如果正常并与发货人不同 则返利
									$map4=array();
									$data4=array();
									$map4['dl_unitcode'] = $qycode;
									$map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人
									$map4['dl_status'] = 1;
									
									$data4=$Dealer->where($map4)->find();
									if($data4){
										//如果推荐人和发货人不相同 则都返利给推荐人
										if($data4['dl_id']>0){
											//如果下单人级别比推荐人级别高或相同
											if($orderdealer['dl_level']<=$data4['dl_level']){
												//如果省级市级 判断是否一次返利买断
												if($orderdealer['dl_level']==3 || $orderdealer['dl_level']==4 ){
													if($orderdealer['dl_flmodel']==1){
														//是否是第一次完成的单
														$map5=array();
														$map5['od_state']=array('in','3,8'); 
														$map5['od_unitcode']=$qycode;
														$map5['od_oddlid']=$orderdealer['dl_id'];
														$data5 = $Orders->where($map5)->order('od_id ASC')->find();
														if($data5){
															if($data5['od_id']==$od_id){
																$fanli_dlid1=$data4['dl_id']; //返利给的代理商1  一次买断
																$fanli_dlname1=$data4['dl_username'];
																$ismaiduan=1;
															}
														}
													}
												}
												
												//如果总代级别 
												if($orderdealer['dl_level']==2){
													//判断是否一次返利买断
													if($orderdealer['dl_level']<$data4['dl_level']){
														if($orderdealer['dl_flmodel']==1){
															//是否是第一次完成的单
															$map5=array();
															$map5['od_state']=array('in','3,8'); 
															$map5['od_unitcode']=$qycode;
															$map5['od_oddlid']=$orderdealer['dl_id'];
															$data5 = $Orders->where($map5)->order('od_id ASC')->find();
															if($data5){
																if($data5['od_id']==$od_id){
																	$fanli_dlid1=$data4['dl_id']; //返利给的代理商1  一次买断
																	$fanli_dlname1=$data4['dl_username'];
																	$ismaiduan=1;
																}
															}
														}	
													}
													
													//如果同级
													if($orderdealer['dl_level']==$data4['dl_level']){
														if($orderdealer['dl_type']==$data4['dl_type']){
															$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
															$fanli_dlname1=$data4['dl_username'];
															//推荐人的推荐人
															if($data4['dl_referee']>0){
																$map6=array();
																$data6=array();
																$map6['dl_unitcode'] = $qycode;
																$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
																$map6['dl_status'] = 1;
																$data6=$Dealer->where($map6)->find();
																if($data6){
																	//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 并同级
																	if($data6['dl_id']>0){
																		if($data4['dl_type']==$data6['dl_type']){
																			$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
																			$fanli_dlname2=$data6['dl_username'];
																		}
																	}
																}
															}
														}
													}
												}
												
												//如果董事级别 并同级
												if($orderdealer['dl_level']==1){
													if($orderdealer['dl_type']==$data4['dl_type']){
														$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
														$fanli_dlname1=$data4['dl_username'];
														//推荐人的推荐人
														if($data4['dl_referee']>0){
															$map6=array();
															$data6=array();
															$map6['dl_unitcode'] = $qycode;
															$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
															$map6['dl_status'] = 1;
															$data6=$Dealer->where($map6)->find();
															if($data6){
																//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 并同级
																if($data6['dl_id']>0){
																	if($data4['dl_type']==$data6['dl_type']){
																		$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
																		$fanli_dlname2=$data6['dl_username'];
																	}
																}
															}
														}
													}
												}
												
											}
										}
									}
									
									//写入返利数据
									if($fanli_dlid1>0){
										$Fanlidetail = M('Fanlidetail');
										foreach($oddetail as $kk=>$vv){
											//如果一次买断
											if($ismaiduan==1){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_maiduan'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												

												//如果订单产品有设置买断返利
												if($data7){
													if($data7['pfl_maiduan']>0){
														$map8=array();
														$data8=array();
														$map8['fl_unitcode'] = $qycode;
														$map8['fl_type'] = 2;
														$map8['fl_odid'] = $vv['oddt_odid'];
														$map8['fl_proid'] = $vv['oddt_proid'];
														$map8['fl_oddlid'] = $orderdealer['dl_id'];
														$map8['fl_level'] = 1;
														$data8 = $Fanlidetail->where($map8)->find();
							
														if(!$data8){

															$pfl_maiduansum=$data7['pfl_maiduan']*$vv['oddt_qty'];

															$data5=array();
															$data5['fl_unitcode'] = $qycode;
															$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
															$data5['fl_senddlid'] = 0; //发放返利的代理
															$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['fl_money'] = $pfl_maiduansum;
															$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['fl_addtime']  = time();
															$data5['fl_remark'] ='代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'].' 一次性返利' ;

															$rs5=$Fanlidetail->create($data5,1);
															if($rs5){
																$Fanlidetail->add();
															}
														}
													}
												}
											}else{
											
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli1'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												//如果订单产品有设置返利 1层
												if($data7){
													if($data7['pfl_fanli1']>0){
														$map8=array();
														$data8=array();
														$map8['fl_unitcode'] = $qycode;
														$map8['fl_type'] = 2;
														$map8['fl_odid'] = $vv['oddt_odid'];
														$map8['fl_proid'] = $vv['oddt_proid'];
														$map8['fl_oddlid'] = $orderdealer['dl_id'];
														$map8['fl_level'] = 1;
														$data8 = $Fanlidetail->where($map8)->find();
														if(!$data8){
															//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
															if($data7['pfl_fanli1']>0 && $data7['pfl_fanli1']<1){
																$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_dlprice']*$vv['oddt_qty'];
															}else{
																$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
															}
															
															$data5=array();
															$data5['fl_unitcode'] = $qycode;
															$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
															$data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
															$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['fl_money'] = $pfl_fanli1sum;
															$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['fl_addtime']  = time();
															$data5['fl_remark'] ='代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$rs5=$Fanlidetail->create($data5,1);
															if($rs5){
																$Fanlidetail->add();
															}
														}
													}
												}
												
												//如果有设置2层返利
												if($fanli_dlid2>0){
													$map7=array();
													$data7=array();
													$map7['pfl_unitcode'] = $qycode;
													$map7['pfl_proid'] = $vv['oddt_proid'];
													$map7['pfl_dltype'] = $orderdealer['dl_type'];
													$map7['pfl_fanli2'] = array('GT',0);
													$data7=$Profanli->where($map7)->find();
													if($data7){
														if($data7['pfl_fanli2']>0){
															$map8=array();
															$data8=array();
															$map8['fl_unitcode'] = $qycode;
															$map8['fl_type'] = 2;
															$map8['fl_odid'] = $vv['oddt_odid'];
															$map8['fl_proid'] = $vv['oddt_proid'];
															$map8['fl_oddlid'] = $orderdealer['dl_id'];
															$map8['fl_level'] = 2;
															$data8 = $Fanlidetail->where($map8)->find();
															if(!$data8){
																//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
																if($data7['pfl_fanli2']>0 && $data7['pfl_fanli2']<1){
																	$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_dlprice']*$vv['oddt_qty'];
																}else{
																	$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
																}
																
																$data5=array();
																$data5['fl_unitcode'] = $qycode;
																$data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
																$data5['fl_senddlid'] = 0; //发放返利的代理
																$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
																$data5['fl_money'] = $pfl_fanli2sum;
																$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
																$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
																$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
																$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
																$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
																$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
																$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
																$data5['fl_level']  = 2;  //返利的层次，1-第一层返利 2-第二层返利
																$data5['fl_addtime']  = time();
																$data5['fl_remark'] ='代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
																$rs5=$Fanlidetail->create($data5,1);
																if($rs5){
																	$Fanlidetail->add();
																}
															}
														}
													}
												}
											}
										}
										
										//如果一次性返利完成后，更改下单代理推荐人
										if($ismaiduan==1){
											$data6=array();
											$data6['dl_flmodel']=0;
											$data6['dl_referee']=0;
											$map6=array();
											$map6['dl_id']=$orderdealer['dl_id'];
											$map6['dl_unitcode']=$qycode;
											$map6['dl_referee']=$fanli_dlid1;
											$Dealer->where($map6)->save($data6);
											
											//代理操作日志 begin
											$odlog_arr=array(
														'dlg_unitcode'=>$qycode,  
														'dlg_dlid'=>$orderdealer['dl_id'],
														'dlg_operatid'=>session('subuser_id'),
														'dlg_dlusername'=>session('subuser_name'),
														'dlg_dlname'=>session('subuser_name'),
														'dlg_action'=>'买断后推荐人更改为(公司) 原推荐人('.$fanli_dlname1.')',
														'dlg_type'=>0, //0-企业 1-经销商
														'dlg_addtime'=>time(),
														'dlg_ip'=>real_ip(),
														'dlg_link'=>__SELF__
														);
											$Dealerlogs = M('Dealerlogs');
											$rs3=$Dealerlogs->create($odlog_arr,1);
											if($rs3){
												$Dealerlogs->add();
											}
											//代理操作日志 end
										}
										
									}	
								}
							}
						}else if($qycode=='2832'){
							//明星主角-类型返利
							if($data2){
								if($orderdealer['dl_referee']>0){

									//下单代理的推荐人 如果正常并与发货人不同 则返利
									$map4=array();
									$data4=array();
									$map4['dl_unitcode'] = $qycode;
									$map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人
									$map4['dl_status'] = 1;
									
									$data4=$Dealer->where($map4)->find();
									if($data4){
										//如果推荐人和发货人不相同 则都返利给推荐人
										if($data4['dl_id']>0){
											
											$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
											$fanli_dlname1=$data4['dl_username'];
											//推荐人的推荐人
											if($data4['dl_referee']>0){
												$map6=array();
												$data6=array();
												$map6['dl_unitcode'] = $qycode;
												$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
												$map6['dl_status'] = 1;
												$data6=$Dealer->where($map6)->find();
												if($data6){
													//如果推荐人的推荐人和发货人不相同 则都返利给推荐人
													if($data6['dl_id']>0){
														$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
														$fanli_dlname2=$data6['dl_username'];
													}
												}
											}
										}
									}
									
									//写入返利数据
									if($fanli_dlid1>0){
										$Fanlidetail = M('Fanlidetail');
										foreach($oddetail as $kk=>$vv){
											$map7=array();
											$data7=array();
											$map7['pfl_unitcode'] = $qycode;
											$map7['pfl_proid'] = $vv['oddt_proid'];
											$map7['pfl_dltype'] = $orderdealer['dl_type'];
											$map7['pfl_fanli1'] = array('GT',0);
											$data7=$Profanli->where($map7)->find();
											//如果订单产品有设置返利 1层
											if($data7){
												if($data7['pfl_fanli1']>0){
													$map8=array();
													$data8=array();
													$map8['fl_unitcode'] = $qycode;
													$map8['fl_type'] = 2;
													$map8['fl_odid'] = $vv['oddt_odid'];
													$map8['fl_proid'] = $vv['oddt_proid'];
													$map8['fl_oddlid'] = $orderdealer['dl_id'];
													$map8['fl_level'] = 1;
													$data8 = $Fanlidetail->where($map8)->find();
													if(!$data8){
														//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
														if($data7['pfl_fanli1']>0 && $data7['pfl_fanli1']<1){
															$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_dlprice']*$vv['oddt_qty'];
														}else{
															$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
														}
														
														$data5=array();
														$data5['fl_unitcode'] = $qycode;
														$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
														$data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
														$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
														$data5['fl_money'] = $pfl_fanli1sum;
														$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
														$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
														$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
														$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
														$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
														$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
														$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
														$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
														$data5['fl_addtime']  = time();
														$data5['fl_remark'] ='代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
														$rs5=$Fanlidetail->create($data5,1);
														if($rs5){
															$Fanlidetail->add();
														}
													}
												}
											}
											
											//如果有设置2层返利
											if($fanli_dlid2>0){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli2'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												if($data7){
													if($data7['pfl_fanli2']>0){
														$map8=array();
														$data8=array();
														$map8['fl_unitcode'] = $qycode;
														$map8['fl_type'] = 2;
														$map8['fl_odid'] = $vv['oddt_odid'];
														$map8['fl_proid'] = $vv['oddt_proid'];
														$map8['fl_oddlid'] = $orderdealer['dl_id'];
														$map8['fl_level'] = 2;
														$data8 = $Fanlidetail->where($map8)->find();
														if(!$data8){
															//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
															if($data7['pfl_fanli2']>0 && $data7['pfl_fanli2']<1){
																$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_dlprice']*$vv['oddt_qty'];
															}else{
																$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
															}
															
															$data5=array();
															$data5['fl_unitcode'] = $qycode;
															$data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
															$data5['fl_senddlid'] = 0; //发放返利的代理
															$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['fl_money'] = $pfl_fanli2sum;
															$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['fl_level']  = 2;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['fl_addtime']  = time();
															$data5['fl_remark'] ='代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$rs5=$Fanlidetail->create($data5,1);
															if($rs5){
																$Fanlidetail->add();
															}
														}
													}
												}
											}
										}
									}	
								}
							}
						}else if($qycode=='2897'){
							//极限动力 预付款 余额 仅平级返利
							if($data2){
								if($orderdealer['dl_referee']>0){

									//下单代理的推荐人 如果正常并与发货人不同 则返利
									$map4=array();
									$data4=array();
									$map4['dl_unitcode'] = $qycode;
									$map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人
									$map4['dl_status'] = 1;
									
									$data4=$Dealer->where($map4)->find();
									if($data4){
										//如果推荐人和发货人不相同  则都返利给推荐人
										if($data4['dl_id']>0){
											//如果下单人与推荐人同级
											if($orderdealer['dl_type']==$data4['dl_type']){
												$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
												$fanli_dlname1=$data4['dl_username'];
												//推荐人的推荐人
												if($data4['dl_referee']>0){
													$map6=array();
													$data6=array();
													$map6['dl_unitcode'] = $qycode;
													$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
													$map6['dl_status'] = 1;
													$data6=$Dealer->where($map6)->find();
													if($data6){
														//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 且同级
														if($data6['dl_id']>0){
															if($orderdealer['dl_type']==$data6['dl_type']){
																$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
																$fanli_dlname2=$data6['dl_username'];
																
																//推荐人的推荐人的推荐人
																if($data6['dl_referee']>0){
																	$map7=array();
																	$data7=array();
																	$map7['dl_unitcode'] = $qycode;
																	$map7['dl_id'] = $data6['dl_referee'];  //推荐人的推荐人
																	$map7['dl_status'] = 1;
																	$data7=$Dealer->where($map7)->find();
																	if($data7){
																		//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 且同级
																		if($data7['dl_id']>0){
																			if($orderdealer['dl_type']==$data7['dl_type']){
																				$fanli_dlid3=$data7['dl_id']; //返利给的代理商3
																				$fanli_dlname3=$data7['dl_username'];
																			}
																		}
																	}
																}
															}
														}
													}
												}
											
											}
										}
									}
									
									//写入返利数据
									if($fanli_dlid1>0){
										$Yufukuan = M('Yufukuan');
										foreach($oddetail as $kk=>$vv){
											$map7=array();
											$data7=array();
											$map7['pfl_unitcode'] = $qycode;
											$map7['pfl_proid'] = $vv['oddt_proid'];
											$map7['pfl_dltype'] = $orderdealer['dl_type'];
											$map7['pfl_fanli1'] = array('GT',0);
											$data7=$Profanli->where($map7)->find();
											//如果订单产品有设置返利 1层
											if($data7){
												if($data7['pfl_fanli1']>0){
													$map8=array();
													$data8=array();
													$map8['yfk_unitcode'] = $qycode;
													$map8['yfk_type'] = 2;
													$map8['yfk_odid'] = $vv['oddt_odid'];
													$map8['yfk_proid'] = $vv['oddt_proid'];
													$map8['yfk_oddlid'] = $orderdealer['dl_id'];
													$map8['yfk_level'] = 1;
													$data8 = $Yufukuan->where($map8)->find();
													if(!$data8){
														//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
														if($data7['pfl_fanli1']>0 && $data7['pfl_fanli1']<1){
															$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_dlprice']*$vv['oddt_qty'];
														}else{
															$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
														}
														
														$data5=array();
														$data5['yfk_unitcode'] = $qycode;
														$data5['yfk_receiveid'] = $fanli_dlid1; //获得返利的代理
														$data5['yfk_sendid'] = 0; //发放返利的代理 0为公司发放
														$data5['yfk_type'] = 2; //返利预付款分类 1-公司手动增减 2-订单返利增减  3-推荐返利增减 (对于收方则是增，对于发方则是减) 
														$data5['yfk_money'] = $pfl_fanli1sum;
														$data5['yfk_refedlid'] = 0; //推荐返利中被推荐的代理
														$data5['yfk_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
														$data5['yfk_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
														$data5['yfk_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
														$data5['yfk_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
														$data5['yfk_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
														$data5['yfk_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
														$data5['yfk_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
														$data5['yfk_addtime']  = time();
														$data5['yfk_remark'] ='代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
														$data5['yfk_state']  = 2; //状态 1-有效 0-无效 2-冻结
														$rs5=$Yufukuan->create($data5,1);
														if($rs5){
															$Yufukuan->add();
														}
													}
												}
											}
											
											//如果有设置2层返利
											if($fanli_dlid2>0){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli2'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												if($data7){
													if($data7['pfl_fanli2']>0){
														$map8=array();
														$data8=array();
														$map8['yfk_unitcode'] = $qycode;
														$map8['yfk_type'] = 2;
														$map8['yfk_odid'] = $vv['oddt_odid'];
														$map8['yfk_proid'] = $vv['oddt_proid'];
														$map8['yfk_oddlid'] = $orderdealer['dl_id'];
														$map8['yfk_level'] = 2;
														$data8 = $Yufukuan->where($map8)->find();
														if(!$data8){
															//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
															if($data7['pfl_fanli2']>0 && $data7['pfl_fanli2']<1){
																$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_dlprice']*$vv['oddt_qty'];
															}else{
																$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
															}
															
															$data5=array();
															$data5['yfk_unitcode'] = $qycode;
															$data5['yfk_receiveid'] = $fanli_dlid2; //获得返利的代理
															$data5['yfk_sendid'] = 0; //发放返利的代理
															$data5['yfk_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['yfk_money'] = $pfl_fanli2sum;
															$data5['yfk_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['yfk_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['yfk_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['yfk_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['yfk_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['yfk_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['yfk_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['yfk_level']  = 2;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['yfk_addtime']  = time();
															$data5['yfk_remark'] ='代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$data5['yfk_state']  = 2; //状态 1-有效 0-无效 2-冻结
															$rs5=$Yufukuan->create($data5,1);
															if($rs5){
																$Yufukuan->add();
															}
														}
													}
												}
											}
											
											//如果有设置3层返利
											if($fanli_dlid3>0){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli3'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												if($data7){
													if($data7['pfl_fanli3']>0){
														$map8=array();
														$data8=array();
														$map8['yfk_unitcode'] = $qycode;
														$map8['yfk_type'] = 2;
														$map8['yfk_odid'] = $vv['oddt_odid'];
														$map8['yfk_proid'] = $vv['oddt_proid'];
														$map8['yfk_oddlid'] = $orderdealer['dl_id'];
														$map8['yfk_level'] = 3;
														$data8 = $Yufukuan->where($map8)->find();
														if(!$data8){
															//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
															if($data7['pfl_fanli3']>0 && $data7['pfl_fanli3']<1){
																$pfl_fanli3sum=$data7['pfl_fanli3']*$vv['oddt_dlprice']*$vv['oddt_qty'];
															}else{
																$pfl_fanli3sum=$data7['pfl_fanli3']*$vv['oddt_qty'];
															}
															
															$data5=array();
															$data5['yfk_unitcode'] = $qycode;
															$data5['yfk_receiveid'] = $fanli_dlid3; //获得返利的代理
															$data5['yfk_sendid'] = 0; //发放返利的代理
															$data5['yfk_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['yfk_money'] = $pfl_fanli3sum;
															$data5['yfk_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['yfk_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['yfk_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['yfk_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['yfk_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['yfk_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['yfk_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['yfk_level']  = 3;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['yfk_addtime']  = time();
															$data5['yfk_remark'] ='代理 '.$fanli_dlname2.' 的邀请代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$data5['yfk_state']  = 2; //状态 1-有效 0-无效 2-冻结
															$rs5=$Yufukuan->create($data5,1);
															if($rs5){
																$Yufukuan->add();
															}
														}
													}
												}
											}
											
										}
									}	
								}
							}
						
							
						}else{
							//返利默认 仅平级返利 
							if($data2){
								if($orderdealer['dl_referee']>0){

									//下单代理的推荐人 如果正常并与发货人不同 则返利
									$map4=array();
									$data4=array();
									$map4['dl_unitcode'] = $qycode;
									$map4['dl_id'] = $orderdealer['dl_referee'];  //推荐人
									$map4['dl_status'] = 1;
									
									$data4=$Dealer->where($map4)->find();
									if($data4){
										//如果推荐人和发货人不相同  则都返利给推荐人
										if($data4['dl_id']>0){
											//如果下单人与推荐人同级
											if($orderdealer['dl_type']==$data4['dl_type']){
												$fanli_dlid1=$data4['dl_id']; //返利给的代理商1
												$fanli_dlname1=$data4['dl_username'];
												//推荐人的推荐人
												if($data4['dl_referee']>0){
													$map6=array();
													$data6=array();
													$map6['dl_unitcode'] = $qycode;
													$map6['dl_id'] = $data4['dl_referee'];  //推荐人的推荐人
													$map6['dl_status'] = 1;
													$data6=$Dealer->where($map6)->find();
													if($data6){
														//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 且同级
														if($data6['dl_id']>0){
															if($orderdealer['dl_type']==$data6['dl_type']){
																$fanli_dlid2=$data6['dl_id']; //返利给的代理商2
																$fanli_dlname2=$data6['dl_username'];
																
																//推荐人的推荐人的推荐人
																if($data6['dl_referee']>0){
																	$map7=array();
																	$data7=array();
																	$map7['dl_unitcode'] = $qycode;
																	$map7['dl_id'] = $data6['dl_referee'];  //推荐人的推荐人
																	$map7['dl_status'] = 1;
																	$data7=$Dealer->where($map7)->find();
																	if($data7){
																		//如果推荐人的推荐人和发货人不相同 则都返利给推荐人 且同级
																		if($data7['dl_id']>0){
																			if($orderdealer['dl_type']==$data7['dl_type']){
																				$fanli_dlid3=$data7['dl_id']; //返利给的代理商3
																				$fanli_dlname3=$data7['dl_username'];
																			}
																		}
																	}
																}
															}
														}
													}
												}
											
											}
										}
									}
									
									//写入返利数据
									if($fanli_dlid1>0){
										$Fanlidetail = M('Fanlidetail');
										foreach($oddetail as $kk=>$vv){
											$map7=array();
											$data7=array();
											$map7['pfl_unitcode'] = $qycode;
											$map7['pfl_proid'] = $vv['oddt_proid'];
											$map7['pfl_dltype'] = $orderdealer['dl_type'];
											$map7['pfl_fanli1'] = array('GT',0);
											$data7=$Profanli->where($map7)->find();
											//如果订单产品有设置返利 1层
											if($data7){
												if($data7['pfl_fanli1']>0){
													$map8=array();
													$data8=array();
													$map8['fl_unitcode'] = $qycode;
													$map8['fl_type'] = 2;
													$map8['fl_odid'] = $vv['oddt_odid'];
													$map8['fl_proid'] = $vv['oddt_proid'];
													$map8['fl_oddlid'] = $orderdealer['dl_id'];
													$map8['fl_level'] = 1;
													$data8 = $Fanlidetail->where($map8)->find();
													if(!$data8){
														if($qycode=='2910'){ //宝鼎红微商
															$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
														}else{
															//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
															if($data7['pfl_fanli1']>0 && $data7['pfl_fanli1']<1){
																$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_dlprice']*$vv['oddt_qty'];
															}else{
																$pfl_fanli1sum=$data7['pfl_fanli1']*$vv['oddt_qty'];
															}
														}
														
														$data5=array();
														$data5['fl_unitcode'] = $qycode;
														$data5['fl_dlid'] = $fanli_dlid1; //获得返利的代理
														$data5['fl_senddlid'] = 0; //发放返利的代理 0为公司发放
														$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
														$data5['fl_money'] = $pfl_fanli1sum;
														$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
														$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
														$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
														$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
														$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
														$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
														$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
														$data5['fl_level']  = 1;  //返利的层次，1-第一层返利 2-第二层返利
														$data5['fl_addtime']  = time();
														$data5['fl_remark'] ='代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
														$rs5=$Fanlidetail->create($data5,1);
														if($rs5){
															$Fanlidetail->add();
														}
													}
												}
											}
											
											//如果有设置2层返利
											if($fanli_dlid2>0){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli2'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												if($data7){
													if($data7['pfl_fanli2']>0){
														$map8=array();
														$data8=array();
														$map8['fl_unitcode'] = $qycode;
														$map8['fl_type'] = 2;
														$map8['fl_odid'] = $vv['oddt_odid'];
														$map8['fl_proid'] = $vv['oddt_proid'];
														$map8['fl_oddlid'] = $orderdealer['dl_id'];
														$map8['fl_level'] = 2;
														$data8 = $Fanlidetail->where($map8)->find();
														if(!$data8){
															if($qycode=='2910'){ //宝鼎红微商
																$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
															}else{
																//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
																if($data7['pfl_fanli2']>0 && $data7['pfl_fanli2']<1){
																	$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_dlprice']*$vv['oddt_qty'];
																}else{
																	$pfl_fanli2sum=$data7['pfl_fanli2']*$vv['oddt_qty'];
																}
															}
															
															$data5=array();
															$data5['fl_unitcode'] = $qycode;
															$data5['fl_dlid'] = $fanli_dlid2; //获得返利的代理
															$data5['fl_senddlid'] = 0; //发放返利的代理
															$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['fl_money'] = $pfl_fanli2sum;
															$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['fl_level']  = 2;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['fl_addtime']  = time();
															$data5['fl_remark'] ='代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$rs5=$Fanlidetail->create($data5,1);
															if($rs5){
																$Fanlidetail->add();
															}
														}
													}
												}
											}
											
											//如果有设置3层返利
											if($fanli_dlid3>0){
												$map7=array();
												$data7=array();
												$map7['pfl_unitcode'] = $qycode;
												$map7['pfl_proid'] = $vv['oddt_proid'];
												$map7['pfl_dltype'] = $orderdealer['dl_type'];
												$map7['pfl_fanli3'] = array('GT',0);
												$data7=$Profanli->where($map7)->find();
												if($data7){
													if($data7['pfl_fanli3']>0){
														$map8=array();
														$data8=array();
														$map8['fl_unitcode'] = $qycode;
														$map8['fl_type'] = 2;
														$map8['fl_odid'] = $vv['oddt_odid'];
														$map8['fl_proid'] = $vv['oddt_proid'];
														$map8['fl_oddlid'] = $orderdealer['dl_id'];
														$map8['fl_level'] = 3;
														$data8 = $Fanlidetail->where($map8)->find();
														if(!$data8){
															if($qycode=='2910'){ //宝鼎红微商
																$pfl_fanli3sum=$data7['pfl_fanli3']*$vv['oddt_qty'];
															}else{
																//佣金数字在1-0间，则以下单价的百分比计算，如0.03代表以下单价的3%计算，如果大于1，则以具体多少元计算
																if($data7['pfl_fanli3']>0 && $data7['pfl_fanli3']<1){
																	$pfl_fanli3sum=$data7['pfl_fanli3']*$vv['oddt_dlprice']*$vv['oddt_qty'];
																}else{
																	$pfl_fanli3sum=$data7['pfl_fanli3']*$vv['oddt_qty'];
																}
															}
															
															$data5=array();
															$data5['fl_unitcode'] = $qycode;
															$data5['fl_dlid'] = $fanli_dlid3; //获得返利的代理
															$data5['fl_senddlid'] = 0; //发放返利的代理
															$data5['fl_type'] = 2; //返利分类 1-推荐返利 2-订单返利  11-提现减少返利 (1-10 增加返利 11-20 减少返利)  
															$data5['fl_money'] = $pfl_fanli3sum;
															$data5['fl_refedlid'] = 0; //推荐返利中被推荐的代理
															$data5['fl_oddlid'] = $orderdealer['dl_id']; //订单返利中 下单的代理
															$data5['fl_odid'] = $vv['oddt_odid'];  //订单返利中 订单流水id
															$data5['fl_orderid']  = $vv['oddt_orderid']; //订单返利中 订单id
															$data5['fl_proid']  = $vv['oddt_proid'];  //订单返利中 产品id
															$data5['fl_odblid']  = $vv['oddt_odblid'];  //订单返利中 订单关系id
															$data5['fl_qty']  = $vv['oddt_qty'];  //订单返利中 产品数量
															$data5['fl_level']  = 3;  //返利的层次，1-第一层返利 2-第二层返利
															$data5['fl_addtime']  = time();
															$data5['fl_remark'] ='代理 '.$fanli_dlname2.' 的邀请代理 '.$fanli_dlname1.' 的邀请代理 '.$orderdealer['dl_username'].' 订购 '.$vv['oddt_proname'].' 数量 '.$vv['oddt_qty'] ;
															$rs5=$Fanlidetail->create($data5,1);
															if($rs5){
																$Fanlidetail->add();
															}
														}
													}
												}
											}
											
										}
									}	
								}
							}
						
						}
						
						//积分 begin
						$Proprice= M('Proprice');
						$Dljfdetail= M('Dljfdetail');
						foreach($oddetail as $kk=>$vv){
							//如果有积分
							$map7=array();
							$data7=array();
							$map7['pri_unitcode'] = $qycode;
							$map7['pri_dltype'] = $orderdealer['dl_type'];
							$map7['pri_jifen'] = array('GT',0);
							$map7['pri_proid'] = $vv['oddt_proid'];
							$data7=$Proprice->where($map7)->find(); //是否有设置积分
								
							if($data7){
								//如果有积分
								if($data7['pri_jifen']>0){
									$map8=array();
									$data8=array();
									$map8['dljf_unitcode'] = $qycode;
									$map8['dljf_type'] = 1;  //积分分类 1-5增加积分     6-9 消费积分
									$map8['dljf_odid'] = $vv['oddt_odid'];
									$map8['dljf_odblid'] = $vv['oddt_odblid'];
									$map8['dljf_proid'] = $vv['oddt_proid'];
									$map8['dljf_dlid'] = $orderdealer['dl_id'];
									$data8 = $Dljfdetail->where($map8)->find();
									
									if(!$data8){
										$data5=array();
										$data5['dljf_unitcode'] = $qycode;
										$data5['dljf_dlid'] = $orderdealer['dl_id']; //获得积分的代理
										$data5['dljf_username'] = $orderdealer['dl_username']; //获得积分的代理
										$data5['dljf_type'] = 1; //积分分类 1-订购产品积分 积分分类 1-5增加积分  6-9 消费积分
										$data5['dljf_jf'] = $data7['pri_jifen']*$vv['oddt_qty'];
										$data5['dljf_addtime'] = time(); 
										$data5['dljf_ip'] = real_ip(); 
										$data5['dljf_actionuser'] = session('qyuser');  
										$data5['dljf_odid']  = $vv['oddt_odid']; 
										$data5['dljf_orderid']  = $vv['oddt_orderid']; 
										$data5['dljf_odblid']  = $vv['oddt_odblid'];  
										$data5['dljf_proid']  = $vv['oddt_proid'];  
										$data5['dljf_qty']  = $vv['oddt_qty'];  
										$data5['dljf_remark'] ='订购产品 '.$vv['oddt_proname'].' 获得积分,数量 '.$vv['oddt_qty'] ;
										$rs5=$Dljfdetail->create($data5,1);
										if($rs5){
											$Dljfdetail->add();
										}
									}
								}
							}
						}
						//积分 end
						
					}
					//返利 end
					
					//订单操作日志 begin
					$odlog_arr=array(
								'odlg_unitcode'=>$qycode,  
								'odlg_odid'=>$od_id,
								'odlg_orderid'=>$data['od_orderid'],
								'odlg_dlid'=>session('subuser_id'),
								'odlg_dlusername'=>session('subuser_name'),
								'odlg_dlname'=>session('subuser_name'),
								'odlg_action'=>'完成发货',
								'odlg_type'=>0, //0-企业 1-经销商
								'odlg_addtime'=>time(),
								'odlg_ip'=>real_ip(),
								'odlg_link'=>__SELF__
								);
					$Orderlogs = M('Orderlogs');
					$rs3=$Orderlogs->create($odlog_arr,1);
					if($rs3){
						$Orderlogs->add();
					}
					//订单操作日志 end
				}
				
				$msg=array('stat'=>1,'msg'=>'物流信息提交成功');
				echo json_encode($msg);
				exit;
			}else{
				$msg=array('stat'=>0,'msg'=>'该订单记录不存在');
				echo json_encode($msg);
				exit;
			}
		}else{
			$od_id=intval(I('get.od_id',0));
			$odbl_id=intval(I('get.odbl_id',0));
			$od_state=intval(I('get.od_state',0));
			$isok=intval(I('get.isok',0));
			
			if($od_id>0 && $odbl_id>0){
				$Model=M();
				$map=array();
				$map['a.od_unitcode']=$qycode;
				$map['a.od_id']=array('exp','=b.odbl_odid');
				$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map['b.odbl_id']=$odbl_id;
				$map['b.odbl_odid']=$od_id;
				$map['b.odbl_rcdlid']=0;
				$data = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
				if($data){
					//检测是否能发货 //订购数 发货数
					$Orderdetail = M('Orderdetail');
					$Shipment = M('Shipment');
					$map2=array();
					$data2=array();
					$map2['oddt_unitcode']=$qycode;
					$map2['oddt_odid']=$od_id;
					$map2['oddt_odblid']=$odbl_id;
					$data2 = $Orderdetail->where($map2)->order('oddt_id DESC')->limit(100)->select();
					
					foreach($data2 as $kk=>$vv){
						//订购数 
						$oddt_totalqty=0;
						$oddt_unitsqty=0;
						if($vv['oddt_prodbiao']>0){
							$oddt_unitsqty=$vv['oddt_prodbiao'];
							
							if($vv['oddt_prozbiao']>0){
								$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_prozbiao'];
							}
							
							if($vv['oddt_proxbiao']>0){
								$oddt_unitsqty=$oddt_unitsqty*$vv['oddt_proxbiao'];
							}
							
							$oddt_totalqty=$oddt_unitsqty*$vv['oddt_qty'];
						}else{
							$oddt_totalqty=$vv['oddt_qty'];
						}

						
						//发货数
						$map3=array();
						$data3=array();
						$map3['ship_pro']=$vv['oddt_proid'];
						$map3['ship_unitcode']=$qycode;
						$map3['ship_odid']=$vv['oddt_odid'];
						$map3['ship_dealer']=$data['od_oddlid']; //出货接收方
						$data3=$Shipment->where($map3)->sum('ship_proqty');
						if($data3){
							if($oddt_totalqty==0 || $oddt_totalqty>$data3 ){
								if($this->checksu_qypurview('13004',0)){
									//完成订单不以完成出货为条件
									if($isok==0){
										$msg=array('stat'=>'2','msg'=>'');
										echo json_encode($msg);
										exit;
									}
								}else{

									$msg=array('stat'=>'0','msg'=>'该订单还没完成出货');
									echo json_encode($msg);
									exit;
								}
							}	
							if( $oddt_totalqty<$data3){
								$msg=array('stat'=>0,'msg'=>'该订单出货的数量大于订购数量');
								echo json_encode($msg);
								exit;
							}
						}else{
							if($this->checksu_qypurview('13004',0)){
								//完成订单不以完成出货为条件
								if($isok==0){
									$msg=array('stat'=>'2','msg'=>'');
									echo json_encode($msg);
									exit;
								}
							}else{
								$msg=array('stat'=>'0','msg'=>'该订单还没完成出货');
								echo json_encode($msg);
								exit;
							}
						}
					}
					
                    if($data['od_express']<=0){
						$title='确认完成发货';
					}else{
						$title='确认修改物流';
					}
					
				}else{
					$msg=array('stat'=>0,'msg'=>'没有该记录');
					echo json_encode($msg);
					exit;
				}
			}else{
				$msg=array('stat'=>0,'msg'=>'没有该记录');
				echo json_encode($msg);
				exit;
			}
			
			if($isok==0){
				$msg=array('stat'=>1,'msg'=>'');
				echo json_encode($msg);
				exit;
		    }
			
			//物流快递
			$Express = M('Express');
			$map=array();
			$expresslist = $Express->where($map)->order('exp_addtime DESC')->select();
			
			
			$this->assign('title', $title);
			$this->assign('expresslist', $expresslist);
			$this->assign('ordersinfo', $data);
			$this->assign('od_id', $od_id);
			$this->assign('odbl_id', $odbl_id);
			$this->assign('od_state', $od_state);
			
			$this->display('odfinishship');
		}
	}
	
	
	//按订单出货扫码 
	public function odshipscan(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){
            //对应订单
			$Model=M();
			$map=array();
			$order=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($order){
				if($order['odbl_state']!=1 && $order['odbl_state']!=2 && $order['odbl_state']!=3){
					$this->error('该订单暂不能出货','',2);
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$map['oddt_odblid']=$odbl_id;
			$data = $Orderdetail->where($map)->find();
			if($data){
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($data['oddt_prodbiao']>0){
					$oddt_unitsqty=$data['oddt_prodbiao'];
					
					if($data['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_prozbiao'];
					}
					
					if($data['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$data['oddt_qty'];
				}else{
					$oddt_totalqty=$data['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$data['oddt_qty']){
					$data['oddt_totalqty']='';
				}else{
					$data['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$data['oddt_odid'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$data['oddt_shipqty']=floor($data3/$oddt_unitsqty).$data['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data['oddt_shipqty']=$data3.$data['oddt_prounits'];
					}
				}else{
					$data['oddt_shipqty']=0;
				}

					
				//统计扫描纪录 已扫产品数量 session 保存json数据
				$brcodestr=session('odsubbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					
					if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
					}

					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
				}
			}else{
				$this->error('没有该记录','',2);
			}
		}else{
			$this->error('没有该记录','',2);
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('odbl_id', $odbl_id);
		$this->assign('oddt_id', $oddt_id);
		
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
		$this->assign('ordersinfo', $data);
		$this->display('odshipscan');
	}
	
	
	//按订单出货扫描结果
    public function odshipscanres(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$brcode=I('get.brcode','');
		
		$msg='';
		$success=0;
		if($brcode==''){
			$msg='条码不能为空';
			goto gotoEND;
            exit;
		}
		$barr=explode(',',$brcode);
		$brcode=end($barr);
        if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
			$msg='条码信息不正确';
			goto gotoEND;
            exit;
        }
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){
            //对应订单
			$Model=M();
			$map=array();
			$order=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($order){
				if($order['odbl_state']!=1 && $order['odbl_state']!=2 && $order['odbl_state']!=3){
					$this->error('该订单暂不能出货','',2);
				}
			}else{
				$this->error('该订单记录不存在','',2);
			}
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$oddetail=array();
			$map['oddt_unitcode']=$qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$map['oddt_odblid']=$odbl_id;
			$oddetail = $Orderdetail->where($map)->find();
			if($oddetail){
				//订购数 
				$oddt_totalqty=0;  //要发的总数
				$oddt_unitsqty=0;  //一个包装里的产品数
				if($oddetail['oddt_prodbiao']>0){
					$oddt_unitsqty=$oddetail['oddt_prodbiao'];
					
					if($oddetail['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
					}
					
					if($oddetail['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
				}else{
					$oddt_totalqty=$oddetail['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
					$oddetail['oddt_totalqty']='';
				}else{
					$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				//发货数
				$Shipment= M('Shipment');
				$map3=array();
				$shipproqty=0;
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
				if($shipproqty){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
					}else{
						$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
				
				//统计扫描纪录 已扫产品数量 session 保存json数据
				$brcodestr=session('odsubbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
					}
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
				}
				//判断出货的数量是否等于订购数量
				if($oddt_totalqty<=($scanprocount+$shipproqty)){
					$msg='已扫产品数量已够';
					goto gotoEND;
					exit;
				}
				
				//检测该条码是否已使用1
				$map=array();
				$data=array();
				$Chaibox= M('Chaibox');
				$barcode=array();
				
				$map['ship_unitcode']=$qycode;
				$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
				$map['ship_barcode'] = $brcode;
				$data=$Shipment->where($map)->find();
				if($data){
					$msg='条码 <b>'.$brcode.'</b> 已出货';
					goto gotoEND;
					exit;
				}
				//检测是否已发行
				$barcode=wlcode_to_packinfo($brcode,$qycode);
				
				if(!is_not_null($barcode)){
					$msg='条码 <b>'.$brcode.'</b> 不存在或还没发行';
					$barcode=array();
					goto gotoEND;
					exit;
				}
				
				$barcode['pro_name']=$oddetail['oddt_proname'];
				
				//判断出货的数量是否等于订购数量 加上正在扫的
				if($oddt_totalqty<($scanprocount+$shipproqty+$barcode['qty'])){
					$msg='扫码产品数量超出订购数';
					$barcode=array();
					goto gotoEND;
					exit;
				}
					

				//检测该条码是否已使用2
				$map=array();
				$where=array();
				//tcode-  中标    ucode-大标   code--当前条码
				if($barcode['code']!=''){
					$where[]=array('EQ',$barcode['code']);
				}
				if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
					$where[]=array('EQ',$barcode['tcode']);
				}
				if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
					$where[]=array('EQ',$barcode['ucode']);
				}
				if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
					$where[]=array('EQ',$barcode['ucode']);
				}
					
				$where[]='or';
				$map['ship_barcode'] = $where;
				$map['ship_unitcode']=$qycode;
				$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
				$data=$Shipment->where($map)->find();
				if(is_not_null($data)){
					$msg='条码 <b>'.$brcode.'</b> 已出货';
					$barcode=array();
					goto gotoEND;
					exit;
				}
				
				//检测是否拆箱
				$map2=array();
				$map2['chai_unitcode']=$qycode;
				$map2['chai_barcode'] = $brcode;
				$map2['chai_deliver'] = 0; //ship_deliver--出货方   ship_dealer--收货方
				$data2=$Chaibox->where($map2)->find();
				if($data2){
					$msg='条码 <b>'.$brcode.'</b> 已经拆箱，不能再使用';
					$barcode=array();
					goto gotoEND;
					exit;
				}
				
				if(is_not_null($barcode)){
					
					//暂存session
					$brcodestr=session('odsubbrcode');
					$brcodearrall=array();
					if(is_not_null($brcodestr)){
						$brcodearrall=json_decode($brcodestr,true);
						if(json_last_error()!=0){
							$this->error('JSON ERROR','',2);
							exit; 
						}
						if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
							$brcodearr=array();
						}else{
							$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
						}
						if(array_key_exists(strval($brcode),$brcodearr)===false){
							
							if($barcode['tcode']=='' && $barcode['ucode']==''){
								
								$brcodearr[strval($brcode)]=$barcode['qty'];
				
							}else{
								if($barcode['ucode']==$barcode['tcode']){
									if(array_key_exists(strval($barcode['tcode']),$brcodearr)===false){	
									    $brcodearr[strval($brcode)]=$barcode['qty'];
									}else{
										$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
										$barcode=array();
										goto gotoEND;
										exit;
									}
								}else{
									if(array_key_exists(strval($barcode['ucode']),$brcodearr)===false  && array_key_exists(strval($barcode['tcode']),$brcodearr)===false){
										$brcodearr[strval($brcode)]=$barcode['qty'];
									}else{
										$msg='条码 <b>'.$brcode.'</b> 的大标条码已在扫描记录里';
										$barcode=array();
										goto gotoEND;
										exit;
									}
								}
							}
							
						}else{
							$msg='条码 <b>'.$brcode.'</b> 已在扫描记录里';
							$barcode=array();
							goto gotoEND;
							exit;
						}
					}else{
						$brcodearr[strval($brcode)]=$barcode['qty'];
					}
					$brcodearrall[strval($od_id.$odbl_id.$oddt_id)]=$brcodearr;
					$brcodestr=json_encode($brcodearrall);
					session('odsubbrcode',$brcodestr); 
					
					$msg='条码 <b>'.$brcode.'</b> 扫描成功!';
					$success=1;
				}else{
					$msg='对不起，你没有条码 <b>'.$brcode.'</b> 操作权限';
					$barcode=array();
					goto gotoEND;
					exit;
				}

			}else{
				$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
                exit;
			}
		}else{
			$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
            exit;
		}

		/////////////
		gotoEND:
		
	    //统计扫描纪录
		$brcodestr=session('odsubbrcode');

		$scancount=0; //已扫标签数
		$scanprocount=0; //已扫产品数
		if(is_not_null($brcodestr)){
			$brcodearrall=json_decode($brcodestr,true);
			if(json_last_error()!=0){
				$this->error('JSON ERROR','',2);
				exit; 
			}
			if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
				$brcodearr=array();
			}else{
				$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
			}
			foreach($brcodearr as $k=>$v){
				if(intval($v)>0){
					$scancount=$scancount+1;
					$scanprocount=$scanprocount+intval($v);
				}else{
					unset($brcodearr[$k]);
				}
			}
		}
		
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('odbl_id', $odbl_id);
		$this->assign('oddt_id', $oddt_id);
		
		$this->assign('ordersinfo', $oddetail);
		$this->assign('msg', $msg);
		$this->assign('brcode', $brcode);
		$this->assign('success', $success);
		$this->assign('barinfo', $barcode);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
        $this->display('odshipscanres');
	}
	
	//扫描记录
	public function odshipscanlist(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){
			
			//统计扫描纪录
			$brcodestr=session('odsubbrcode');

			$scancount=0; //已扫标签数
			$scanprocount=0; //已扫产品数
			if(is_not_null($brcodestr)){
				$brcodearrall=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
				if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
					$brcodearr=array();
				}else{
					$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
				}
				
				foreach($brcodearr as $k=>$v){
					if(intval($v)>0){
						$scancount=$scancount+1;
						$scanprocount=$scanprocount+intval($v);
					}else{
						unset($brcodearr[$k]);
					}
				}
				
				if(count($brcodearr)<=0){
					$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
				}
			}else{
				$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
				
			}
			
            //对应订单
			$Model=M();
			$map=array();
			$order=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($order){
				if($order['odbl_state']!=1 && $order['odbl_state']!=2 && $order['odbl_state']!=3){
					$this->error('该订单暂不能出货',U('Wxship/Orders/orderslist/od_state/1'),2);
				}
			}else{
				$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$map=array();
			$data=array();
			$map['oddt_unitcode']=$qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$map['oddt_odblid']=$odbl_id;
			$data = $Orderdetail->where($map)->find();
			if($data){
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($data['oddt_prodbiao']>0){
					$oddt_unitsqty=$data['oddt_prodbiao'];
					
					if($data['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_prozbiao'];
					}
					
					if($data['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$data['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$data['oddt_qty'];
				}else{
					$oddt_totalqty=$data['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$data['oddt_qty']){
					$data['oddt_totalqty']='';
				}else{
					$data['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				$Shipment= M('Shipment');
				$map3=array();
				$data3=array();
				$map3['ship_pro']=$data['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$data['oddt_odid'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$data['oddt_shipqty']=floor($data3/$oddt_unitsqty).$data['oddt_prounits'].'('.$data3.'件)';
					}else{
						$data['oddt_shipqty']=$data3.$data['oddt_prounits'];
					}
				}else{
					$data['oddt_shipqty']=0;
				}
			}else{
				$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
			}
		}else{
			$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
		}
		
		
			
		$Jssdk = new \Org\Util\Jssdk(C('QY_ZXWXAPPID'), C('QY_ZXWXAPPSECRET'),'zxfw');
        $signPackage = $Jssdk->GetSignPackage();
		$this->assign('signPackage', $signPackage);
		
		$this->assign('od_id', $od_id);
		$this->assign('odbl_id', $odbl_id);
		$this->assign('oddt_id', $oddt_id);
		
		$this->assign('ordersinfo', $data);
		$this->assign('jishu', 1);
        $this->assign('list', $brcodearr);
		$this->assign('scancount', $scancount);
		$this->assign('scanprocount', $scanprocount);
        $this->display('odshipscanlist');
	}
	
   //扫描记录-移除
    public function odshipremove(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		
		$brcode=I('get.brcode','');
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){
			$msg='';
			if($brcode==''){
				$this->error('没有该扫描纪录','',2);
			}

			if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
				$this->error('没有该扫描纪录','',2);
			}
			
			$brcodestr=session('odsubbrcode');

			if(is_not_null($brcodestr)){
				$brcodearrall=json_decode($brcodestr,true);
				if(json_last_error()!=0){
					$this->error('JSON ERROR','',2);
					exit; 
				}
				if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
					$brcodearr=array();
				}else{
					$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
				}
				
				foreach($brcodearr as $k=>$v){
					if(intval($v)>0){
					}else{
						unset($brcodearr[$k]);
					}
				}
				unset($brcodearr[strval($brcode)]);
				
				$brcodearrall[strval($od_id.$odbl_id.$oddt_id)]=$brcodearr;
				$brcodestr=json_encode($brcodearrall);
				session('odsubbrcode',$brcodestr); 
			}
			
			$this->success('移除成功',U('Wxship/Orders/odshipscanlist/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),1);
			
		}else{
			$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
		}
	}
	
	
    //确认出货
    public function odshipping(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$step=intval(I('get.step',0));
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){

			if($step==1){  //确认出货

				//统计扫描纪录
				$brcodestr=session('odsubbrcode');
				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
					}
					
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
					
					if(count($brcodearr)<=0){
						$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
				}
				
				//对应订单
				$Model=M();
				$map=array();
				$order=array();
				$map['a.od_unitcode']=$qycode;
				$map['a.od_id']=array('exp','=b.odbl_odid');
				$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map['b.odbl_id']=$odbl_id;
				$map['b.odbl_odid']=$od_id;
				$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
				if($order){
					if($order['odbl_state']!=1 && $order['odbl_state']!=2 && $order['odbl_state']!=3){
						$this->error('该订单暂不能出货',U('Wxship/Orders/orderslist/od_state/1'),2);
					}
				}else{
					$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
				}
				$ship_dealer=$order['od_oddlid']; //收货的经销商
				$od_orderid=$order['od_orderid'];
				unset($order);
				
				//对应产品
				$Orderdetail= M('Orderdetail');
				$Shipment= M('Shipment');
				$Chaibox= M('Chaibox');
				
				$map=array();
				$oddetail=array();
				$map['oddt_unitcode']=$qycode;
				$map['oddt_id']=$oddt_id;
				$map['oddt_odid']=$od_id;
				$map['oddt_odblid']=$odbl_id;
				$oddetail = $Orderdetail->where($map)->find();
				if($oddetail){
					//订购数 发货数
					$oddt_totalqty=0;  //要发的总数
					$oddt_unitsqty=0;  //一个包装里的产品数
					if($oddetail['oddt_prodbiao']>0){
						$oddt_unitsqty=$oddetail['oddt_prodbiao'];
						
						if($oddetail['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
						}
						
						if($oddetail['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
					}else{
						$oddt_totalqty=$oddetail['oddt_qty'];
					}
					
					if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
						$oddetail['oddt_totalqty']='';
					}else{
						$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}

					$map3=array();
					$shipproqty=0;  //已发的产品数
					$map3['ship_pro']=$oddetail['oddt_proid'];
					$map3['ship_unitcode']=$qycode;
					$map3['ship_odid']=$oddetail['oddt_odid'];
					$map3['ship_dealer']=$ship_dealer; //出货接收方
					$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
					if($shipproqty){
						if($oddt_unitsqty>0){
							$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
						}else{
							$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
						}
					}else{
						$oddetail['oddt_shipqty']=0;
					}
					
					//判断出货的数量是否等于订购数量
					if($oddt_totalqty<($scanprocount+$shipproqty)){
						$this->error('扫码产品数量超出订购数',U('Wxship/Orders/odshipscanlist/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
				}
				
				//验证经销商
				$Dealer = M('Dealer');
				$map2=array();
				$map2['dl_id']=$ship_dealer;
				$map2['dl_status']=1;
				$dealerinfo=$Dealer->where($map2)->find();
				if($dealerinfo){
					$dealerinfo['dl_name']=wxuserTextDecode2($dealerinfo['dl_name']);
					
				}else{
					$this->error('下单代理商已被停用','',2);
				}
				
				$ship_whid=intval(I('post.ship_whid',0));
				$ship_prodate=I('post.ship_prodate','');
				$ship_batchnum=I('post.ship_batchnum','');
				$ship_remark=I('post.ship_remark','');
				
				$this->assign('ship_prodate', $ship_prodate);
				$this->assign('ship_batchnum', $ship_batchnum);
				$this->assign('ship_remark', $ship_remark);
				
				if($ship_whid<=0){
			        $this->error('请选择出货仓库','',2);
		        }
				
				//仓库
				$map2=array();
				$map2['wh_unitcode']=$qycode;
				$map2['wh_id']=$ship_whid;
				$Warehouse = M('Warehouse');
				$whinfo = $Warehouse->where($map2)->find();
				if($whinfo){
					$whname=$whinfo['wh_name'];
				}else{
					$this->error('请选择仓库','',2);
				}
				$this->assign('whname', $whname);
				
				//保存出货记录
				$ship_time=time();
				$ship_date=$ship_time;
				$brcarr=array();
				$kk=0;
				$success=0;
				$fail=0;
				foreach($brcodearr as $key=>$v){ 
				
					$brcode=$key;
					if(!preg_match("/^[a-zA-Z0-9]{4,30}$/",$brcode)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，条码应由数字字母组成</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
							

					//检测该条码是否已被使用1
					$map2=array();
					$data2=array();
					$map2['ship_unitcode']=$qycode;
					$map2['ship_barcode'] = $brcode;
					$map2['ship_deliver']=0;
							
					$data2=$Shipment->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}

					//检测是否已发行
					$barcode=wlcode_to_packinfo($brcode,$qycode);
							
					if(!is_not_null($barcode)){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码不存在或还没发行</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}


					//检测该条码是否已被使用2
					$map2=array();
					$where2=array();
					$data2=array();
					
					if($barcode['code']!=''){
						$where2[]=array('EQ',$barcode['code']);
					}
					if($barcode['tcode']!='' && $barcode['ucode']!=$barcode['tcode']){
						$where2[]=array('EQ',$barcode['tcode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']!=$barcode['tcode']){
						$where2[]=array('EQ',$barcode['ucode']);
					}
					if($barcode['ucode']!='' &&  $barcode['ucode']==$barcode['tcode']){
						$where2[]=array('EQ',$barcode['ucode']);
					}
					
					
					$where2[]='or';
					$map2['ship_barcode'] = $where2;
					$map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
					$map2['ship_pro'] = $oddetail['oddt_proid'];  //对应产品id
					$data2=$Shipment->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已出货</span>';
						$brcarr[$kk]['qty']=$barcode['qty'];
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}	
		
					//检测是否拆箱
					$map2=array();
					$data2=array();
					$map2['chai_unitcode']=$qycode;
					$map2['chai_barcode'] = $brcode;
					$map2['chai_deliver'] = 0;
					$data2=$Chaibox->where($map2)->find();
					if($data2){
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，该条码已经拆箱，不能再使用</span>';
						$brcarr[$kk]['qty']=$barcode['qty'];
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
					
					
					//保存记录
					if(is_not_null($barcode)){
						$insert=array();
						$insert['ship_unitcode']=$qycode;
						$insert['ship_number']=$od_orderid;  //如果按订单发货 这里放订单号
						$insert['ship_deliver']=0;  //ship_deliver--出货方
						$insert['ship_dealer']=$ship_dealer;   //ship_dealer--收货方
						$insert['ship_pro']=$oddetail['oddt_proid'];
						$insert['ship_odid']=$od_id;  //订单id
						$insert['ship_odblid']=$odbl_id; //订单关系id
						$insert['ship_whid']=$ship_whid;
						$insert['ship_proqty']=$barcode['qty'];
						$insert['ship_barcode']=$brcode;
						$insert['ship_date']=$ship_time;
						$insert['ship_ucode']=$barcode['ucode'];
						$insert['ship_tcode']=$barcode['tcode'];
						$insert['ship_remark']=$ship_remark;
						$insert['ship_prodate']=$ship_prodate;
						$insert['ship_batchnum']=$ship_batchnum;
						$insert['ship_cztype']=1;//操作类型 0-企业主账户  1-企业子管理用户  2-经销商
						$insert['ship_czid']=session('subuser_id');
						$insert['ship_czuser']=session('subuser_name');

						$rs=$Shipment->create($insert,1);
						if($rs){
						   $result = $Shipment->add(); 
						   if($result){
								//记录拆箱
								if($barcode['ucode']!='' && $barcode['tcode']==$barcode['ucode']){
									$insert2=array();
									$data3=array();
									$insert2['chai_unitcode']=$qycode;
									$insert2['chai_barcode']=$barcode['ucode'];
									$insert2['chai_deliver']=0;
									$data3=$Chaibox->where($insert2)->find();
									if(!$data3){
										$insert2['chai_addtime']=$ship_time;
										$Chaibox->create($insert2,1);
										$Chaibox->add(); 
									}
								}
								
								if($barcode['ucode']!='' && $barcode['tcode']!=$barcode['ucode']){
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$qycode;
									$insert3['chai_barcode']=$barcode['tcode'];
									$insert3['chai_deliver']=0;
									$data4=$Chaibox->where($insert3)->find();
									if(!$data4){
										$insert3['chai_addtime']=$ship_time;
										$Chaibox->create($insert3,1);
										$Chaibox->add(); 
									}	
									
									$insert3=array();
									$data4=array();
									$insert3['chai_unitcode']=$qycode;
									$insert3['chai_barcode']=$barcode['ucode'];
									$insert3['chai_deliver']=0;
									$data4=$Chaibox->where($insert3)->find();
									if(!$data4){
										$insert3['chai_addtime']=$ship_time;
										$Chaibox->create($insert3,1);
										$Chaibox->add(); 
									}
									
								}

								//记录日志 begin
								$log_arr=array();
								$log_arr=array(
											'log_qyid'=>session('subuser_id'),
											'log_user'=>session('subuser_name'),
											'log_qycode'=>$qycode,
											'log_action'=>'经销商出货',
											'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
											'log_addtime'=>time(),
											'log_ip'=>real_ip(),
											'log_link'=>__SELF__,
											'log_remark'=>json_encode($insert)
											);
								save_log($log_arr);
								//记录日志 end
								
								
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='添加条码 <b>'.$brcode.' </b> 成功。';
								$brcarr[$kk]['qty']=$barcode['qty'];
								$kk=$kk+1;
								$success=$success+1;
								continue;
							}else{
								$brcarr[$kk]['barcode']=$brcode;
								$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
								$brcarr[$kk]['qty']=0;
								$kk=$kk+1;
								$fail=$fail+1;
								continue;
							}
						}else{
							$brcarr[$kk]['barcode']=$brcode;
							$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.$brcode.'出错。条码不正确</span>';
							$brcarr[$kk]['qty']=0;
							$kk=$kk+1;
							$fail=$fail+1;
							continue;
						}	
					}else{
						$brcarr[$kk]['barcode']=$brcode;
						$brcarr[$kk]['error']='<span style="color:#FF0000">添加条码 '.htmlspecialchars($brcode).' 出错，你没有该条码操作权限</span>';
						$brcarr[$kk]['qty']=0;
						$kk=$kk+1;
						$fail=$fail+1;
						continue;
					}
				}
				session('odsubbrcode',null);
				
				//重新计算已发的产品数
				$map3=array();
				$shipproqty=0;  //已发的产品数
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_dealer']=$ship_dealer; //出货接收方
				$shipproqty=$Shipment->where($map3)->sum('ship_proqty');  //已发的产品数
				if($shipproqty){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($shipproqty/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$shipproqty.'件)';
					}else{
						$oddetail['oddt_shipqty']=$shipproqty.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
				
				$this->assign('od_id', $od_id);
				$this->assign('odbl_id', $odbl_id);
				$this->assign('oddt_id', $oddt_id);
				$this->assign('fail', $fail);
				$this->assign('success', $success);
				
				$this->assign('ordersinfo', $oddetail);
				$this->assign('list', $brcarr);
				$this->assign('dealerinfo', $dealerinfo);
				
				$this->display('odshipping2');
				
			}else{ 
				//是否显示生产日期 生产批号		
				//生产日期
				if($this->checksu_qypurview('20010',0)){
					$isshipprodate=1;
				}else{
					$isshipprodate=0;
				}
				$this->assign('isshipprodate', $isshipprodate);
				//生产批号
				if($this->checksu_qypurview('20011',0)){
					$isshipbatchnum=1;
				}else{
					$isshipbatchnum=0;
				}
				$this->assign('isshipbatchnum', $isshipbatchnum);
				
				//仓库
				$map2=array();
				$map2['wh_unitcode']=$qycode;
				$Warehouse = M('Warehouse');
				$list3 = $Warehouse->where($map2)->order('wh_id ASC')->select();
				$this->assign('warehouselist', $list3);

				
				//统计扫描纪录
				$brcodestr=session('odsubbrcode');

				$scancount=0; //已扫标签数
				$scanprocount=0; //已扫产品数
				if(is_not_null($brcodestr)){
					$brcodearrall=json_decode($brcodestr,true);
					if(json_last_error()!=0){
						$this->error('JSON ERROR','',2);
						exit; 
					}
					if(array_key_exists(strval($od_id.$odbl_id.$oddt_id),$brcodearrall)===false){
						$brcodearr=array();
					}else{
						$brcodearr=$brcodearrall[strval($od_id.$odbl_id.$oddt_id)];
					}
					
					foreach($brcodearr as $k=>$v){
						if(intval($v)>0){
							$scancount=$scancount+1;
							$scanprocount=$scanprocount+intval($v);
						}else{
							unset($brcodearr[$k]);
						}
					}
					
					if(count($brcodearr)<=0){
						$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
					}
				}else{
					$this->error('没有扫描纪录',U('Wxship/Orders/odshipscan/od_id/'.$od_id.'/odbl_id/'.$odbl_id.'/oddt_id/'.$oddt_id.''),2);
				}
				
				//对应订单
				$Model=M();
				$map=array();
				$order=array();
				$map['a.od_unitcode']=$qycode;
				$map['a.od_id']=array('exp','=b.odbl_odid');
				$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map['b.odbl_id']=$odbl_id;
				$map['b.odbl_odid']=$od_id;
				$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
				if($order){
					if($order['odbl_state']!=1 && $order['odbl_state']!=2 && $order['odbl_state']!=3){
						$this->error('该订单暂不能出货',U('Wxship/Orders/orderslist/od_state/1'),2);
					}
				}else{
					$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
				}
				
				//对应经销商
				$Dealer= M('Dealer');
				$map2=array();
				$map2['dl_unitcode']=$qycode;
				$map2['dl_belong']=0;
				$map2['dl_status']=1;
				$map2['dl_id']=$order['odbl_oddlid'];
				$dlinfo = $Dealer->where($map2)->find();
				if($dlinfo){
					$dlname=$dlinfo['dl_number'].' '.$dlinfo['dl_name'];
				}else{
					$dlname='';
				}
				$this->assign('dlname', $dlname);
				
				
				//对应产品
				$Orderdetail= M('Orderdetail');
				$map=array();
				$data=array();
				$map['oddt_unitcode']=$qycode;
				$map['oddt_id']=$oddt_id;
				$map['oddt_odid']=$od_id;
				$map['oddt_odblid']=$odbl_id;
				$data = $Orderdetail->where($map)->find();
				if($data){
					//订购数 发货数
					$oddt_totalqty=0;
					$oddt_unitsqty=0;
					if($data['oddt_prodbiao']>0){
						$oddt_unitsqty=$data['oddt_prodbiao'];
						
						if($data['oddt_prozbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$data['oddt_prozbiao'];
						}
						
						if($data['oddt_proxbiao']>0){
							$oddt_unitsqty=$oddt_unitsqty*$data['oddt_proxbiao'];
						}
						
						$oddt_totalqty=$oddt_unitsqty*$data['oddt_qty'];
					}else{
						$oddt_totalqty=$data['oddt_qty'];
					}
					
					if($oddt_totalqty==0 || $oddt_totalqty==$data['oddt_qty']){
						$data['oddt_totalqty']='';
					}else{
						$data['oddt_totalqty']='('.$oddt_totalqty.'件)';
					}
					
					$Shipment= M('Shipment');
					$map3=array();
					$data3=array();
					$map3['ship_pro']=$data['oddt_proid'];
					$map3['ship_unitcode']=$qycode;
					$map3['ship_odid']=$data['oddt_odid'];
					$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
					$data3=$Shipment->where($map3)->sum('ship_proqty');
					if($data3){
						if($oddt_unitsqty>0){
							$data['oddt_shipqty']=floor($data3/$oddt_unitsqty).$data['oddt_prounits'].'('.$data3.'件)';
						}else{
							$data['oddt_shipqty']=$data3.$data['oddt_prounits'];
						}
					}else{
						$data['oddt_shipqty']=0;
					}
				}else{
					$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
				}
				
				$this->assign('od_id', $od_id);
				$this->assign('odbl_id', $odbl_id);
				$this->assign('oddt_id', $oddt_id);
				
				$this->assign('ordersinfo', $data);
				$this->assign('jishu', 1);
				$this->assign('list', $brcodearr);
				$this->assign('scancount', $scancount);
				$this->assign('scanprocount', $scanprocount);
				$this->display('odshipping1');
			}
		}else{
			$this->error('该订单记录不存在',U('Wxship/Orders/orderslist/od_state/1'),2);
		}
	}	
	
	//某订单产品出货记录
    public function odshiplist(){
		$this->checksu_qypurview('13001',1);
		
        $openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-----------------------------
		$od_id=intval(I('get.od_id',0));
		$odbl_id=intval(I('get.odbl_id',0));
		$oddt_id=intval(I('get.oddt_id',0));
		$back=intval(I('get.back',0));
		$od_state=intval(I('get.od_state',0));
		
		if($od_id>0 && $odbl_id>0 && $oddt_id>0){
            //对应订单
			$Model=M();
			$map=array();
			$order=array();
			$map['a.od_unitcode']=$qycode;
			$map['a.od_id']=array('exp','=b.odbl_odid');
			$map['a.od_oddlid']=array('exp','=b.odbl_oddlid');
			$map['b.odbl_id']=$odbl_id;
			$map['b.odbl_odid']=$od_id;
			$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map)->find();
			if($order){
				
			}else{
				$this->error('没有该记录','',2);
			}
			
			
			//对应产品
			$Orderdetail= M('Orderdetail');
			$Shipment= M('Shipment');
			$oddetail=array();
			$map=array();
			$map['oddt_unitcode']=$qycode;
			$map['oddt_id']=$oddt_id;
			$map['oddt_odid']=$od_id;
			$map['oddt_odblid']=$odbl_id;
			$oddetail = $Orderdetail->where($map)->find();
			if($oddetail){
				//订购数 发货数
				$oddt_totalqty=0;
				$oddt_unitsqty=0;
				if($oddetail['oddt_prodbiao']>0){
					$oddt_unitsqty=$oddetail['oddt_prodbiao'];
					
					if($oddetail['oddt_prozbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_prozbiao'];
					}
					
					if($oddetail['oddt_proxbiao']>0){
						$oddt_unitsqty=$oddt_unitsqty*$oddetail['oddt_proxbiao'];
					}
					
					$oddt_totalqty=$oddt_unitsqty*$oddetail['oddt_qty'];
				}else{
					$oddt_totalqty=$oddetail['oddt_qty'];
				}
				
				if($oddt_totalqty==0 || $oddt_totalqty==$oddetail['oddt_qty']){
					$oddetail['oddt_totalqty']='';
				}else{
					$oddetail['oddt_totalqty']='('.$oddt_totalqty.'件)';
				}
				
				$map3=array();
				$data3=0;
				$map3['ship_pro']=$oddetail['oddt_proid'];
				$map3['ship_unitcode']=$qycode;
				$map3['ship_odid']=$oddetail['oddt_odid'];
				$map3['ship_dealer']=$order['od_oddlid']; //出货接收方
				$data3=$Shipment->where($map3)->sum('ship_proqty');
				if($data3){
					if($oddt_unitsqty>0){
						$oddetail['oddt_shipqty']=floor($data3/$oddt_unitsqty).$oddetail['oddt_prounits'].'('.$data3.'件)';
					}else{
						$oddetail['oddt_shipqty']=$data3.$oddetail['oddt_prounits'];
					}
				}else{
					$oddetail['oddt_shipqty']=0;
				}
			}else{
				$this->error('没有该记录','',2);
			}
			
			//对应订单的出货记录
			$Dealer= M('Dealer');
			$Product= M('Product');

			//出货记录
			$map=array();
			$parameter=array();
			$map['ship_unitcode']=$qycode;
			$map['ship_deliver']=0;   //ship_deliver--出货方   ship_dealer--收货方
			$map['ship_odid']=$od_id;
			$map['ship_odblid']=$odbl_id;
			$map['ship_pro']=$oddetail['oddt_proid'];

			$count = $Shipment->where($map)->count();
			$Page = new \Think\Page($count,50,$parameter);
			$show = $Page->show();
			if($show=='<div>    </div>'){
				$show='';
			}
			$list = $Shipment->where($map)->order('ship_id DESC')->limit(($Page->firstRow . ',') . $Page->listRows)->select();

			foreach($list as $k=>$v){ 
				//经销商
				$map2=array();
				$map2['dl_unitcode']=$qycode;
				$map2['dl_id'] = $v['ship_dealer'];
				$Dealerinfo = $Dealer->where($map2)->find();
				if($Dealerinfo){
					  $list[$k]['dl_name']=$Dealerinfo['dl_name'];
				}else{
					  $list[$k]['dl_name']='';
				}

				//对应的产品
				if($oddetail['oddt_proname']!=''){
					if($oddetail['oddt_pronumber']!=''){
						$list[$k]['ship_proname']=$oddetail['oddt_proname'].'('.$oddetail['oddt_pronumber'].')';
					}else{
						$list[$k]['ship_proname']=$oddetail['oddt_proname'];
					}
				}else{
					$list[$k]['ship_proname']='';
				}
				
				
				//操作
				if(($order['od_state']==1 || $order['od_state']==2) && $v['ship_deliver']==0){
					$list[$k]['ship_deletestr']='<button class="ui-btn-s ui-btn-primary"   data-href="'.U('./Wxship/Orders/odshipdel?ship_id='.$v['ship_id'].'').'" >移除</button>';
				}else{
					$list[$k]['ship_deletestr']='';
				}
			}
			
			
		}else{
			$this->error('没有该记录','',2);
		}
		
		$this->assign('od_id', $od_id);
		$this->assign('odbl_id', $odbl_id);
		$this->assign('oddt_id', $oddt_id);
		$this->assign('back', $back);
		$this->assign('od_state', $od_state);
        $this->assign('ordersinfo', $oddetail);
        $this->assign('list', $list);
        $this->assign('page', $show);
		$this->assign('pagecount', $count);
		
        $this->display('odshiplist');
		
	}	
    
	//出货记录-删除
    public function odshipdel(){
        $this->checksu_qypurview('13001',1);
		
		$openid=session('subuser_openid');
		$qycode=session('subuser_unitcode');
        if(!preg_match("/^[0-9]{4,4}$/",$qycode)){
				$this->error('授权已过期,请刷新二维码重新扫描','',2);
		}
		//-------------------------------
		$map=array();
        $map['ship_id']=intval(I('get.ship_id',0));
        $map['ship_unitcode']=$qycode;

        $Chaibox= M('Chaibox');
		$Shipment= M('Shipment');
        //判断是否可删 保持数据完整性 待完善
        $data=$Shipment->where($map)->find();
        if($data){
			//如果是按订单出货 并且已确认收货 
			if($data['ship_odid']>0 && $data['ship_odblid']>0){
				$Model=M();
				$map2=array();
				$order=array();
				$map2['a.od_unitcode']=$qycode;
				$map2['a.od_id']=array('exp','=b.odbl_odid');
				$map2['a.od_oddlid']=array('exp','=b.odbl_oddlid');
				$map2['b.odbl_id']=$data['ship_odblid'];
				$map2['b.odbl_odid']=$data['ship_odid'];
				$order = $Model->table('fw_orders a,fw_orderbelong b')->where($map2)->find();
				if($order){
					if($order['odbl_state']==3){
					    $this->error('该出货记录对应订单已发货，暂不能删除','',2);
				    }
					if($order['odbl_state']==8){
						$this->error('该出货记录对应订单已确认收货，暂不能删除','',2);
					}
				}else{
					$this->error('该出货记录对应订单记录不存在，暂不能删除','',2);
				}
			}
			
            //如果经销商已处理出货
            $map2=array();
            $map2['ship_unitcode']=$qycode;
            $map2['ship_deliver']=array('gt',0);
            $map2['ship_id'] = array('NEQ',$data['ship_id']);

            $where=array();
            $where['ship_barcode']=array('EQ',$data['ship_barcode']);
            $where['ship_tcode']=array('EQ',$data['ship_barcode']);
            $where['ship_ucode']=array('EQ',$data['ship_barcode']);
            $where['_logic'] = 'or';
            $map2['_complex'] = $where;
            $data1=$Shipment->where($map2)->find();
            if($data1){
               $this->error('该出货记录已被下级经销商重新出货，暂不能删除','',3);
            }

           //判断处理拆箱记录
            if($data['ship_tcode']!='' || $data['ship_ucode']!=''){

				if($data['ship_tcode']!='' &&  $data['ship_tcode']!=$data['ship_barcode']){	
                    $map2=array();
                    $map2['ship_tcode']=$data['ship_tcode'];
                    $map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_tcode'];
                        $map3['chai_unitcode']=$qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }
                }
				
				if($data['ship_ucode']!='' && $data['ship_ucode']!=$data['ship_barcode'] && $data['ship_ucode']!=$data['ship_tcode']){
                    $map2=array();
                    $map2['ship_ucode']=$data['ship_ucode'];
                    $map2['ship_unitcode']=$qycode;
					$map2['ship_deliver']=0;  
                    $map2['ship_id'] = array('NEQ',$data['ship_id']);
                    $data2=$Shipment->where($map2)->find();
                    if(is_not_null($data2)){

                    }else{
                        $map3=array();
                        $map3['chai_barcode']=$data['ship_ucode'];
                        $map3['chai_unitcode']=$qycode;
						$map3['chai_deliver'] = 0;
                        $Chaibox->where($map3)->delete(); 
                    }

                    $map22=array();
                    $map22['ship_tcode']=$data['ship_tcode'];
                    $map22['ship_unitcode']=$qycode;
					$map22['ship_deliver']=0;  
                    $map22['ship_id'] = array('NEQ',$data['ship_id']);
                    $data22=$Shipment->where($map22)->find();
                    if(is_not_null($data22)){

                    }else{
                        $map33=array();
                        $map33['chai_barcode']=$data['ship_tcode'];
                        $map33['chai_unitcode']=$qycode;
						$map33['chai_deliver'] = 0;
                        $Chaibox->where($map33)->delete(); 
                    }
                }
            }
             
            //记录日志 begin
            $log_arr=array(
                        'log_qyid'=>session('subuser_id'),
                        'log_user'=>session('subuser_name'),
                        'log_qycode'=>$qycode,
                        'log_action'=>'删除出货记录',
						'log_type'=>1, //0-系统 1-企业 2-经销商 3-消费者
                        'log_addtime'=>time(),
                        'log_ip'=>real_ip(),
                        'log_link'=>__SELF__,
                        'log_remark'=>json_encode($data)
                        );
            save_log($log_arr);
            //记录日志 end
            $Shipment->where($map)->delete(); 
            $this->success('删除成功','',2);
        }else{
            $this->error('没有该记录','',2);
        } 
	}
	

}