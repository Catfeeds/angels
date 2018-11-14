<?php
namespace Org\Util;
/**
 * 微信红包
 * by aTong
 */
class Wxredpack {
    protected $config =	array(
        'appid'     =>  '',                 //公众号appId
		'appsecret'     =>  '',           // 公众号appSecret
		'mchid'     =>  '',               // 商户号id
        'privatekey'     =>  '',            // 商户密钥
		'iscert'     =>  false,            // 是否需要证书 默认不需要
		'sslcert_path'     =>  '',            // 证书路径 注意应该填写绝对路径(仅退款、撤销订单时需要) apiclient_cert.pem
		'sslkey_path'     =>  '',            // 证书路径  apiclient_key.pem
        );

    private $_parameters   = null;     // 红包参数
	
    /**
     * 架构方法 设置参数
     * @access public     
     * @param  array $config 配置参数
     */    
    public function __construct($config=array()){
        $this->config   =   array_merge($this->config, $config);
    }

    /**
     * 使用 $this->name 获取配置
     * @access public     
     * @param  string $name 配置名称
     * @return multitype    配置值
     */
    public function __get($name) {
        return $this->config[$name];
    }

    /**
     * 设置验证码配置
     * @access public     
     * @param  string $name 配置名称
     * @param  string $value 配置值     
     * @return void
     */
    public function __set($name,$value){
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }

    /**
     * 检查配置
     * @access public     
     * @param  string $name 配置名称
     * @return bool
     */
    public function __isset($name){
        return isset($this->config[$name]);
    }

    /**
     * 发送红包 普通红包
     * @access public     
     * @param  array 红包参数
     * @return array
     */
    public function sendRedpack($param=array()){
		//设置红包参数
		if(isset($param['nonce_str'])) {
			$this->_parameters["nonce_str"]=$param['nonce_str'];
		}else{
			$this->_parameters["nonce_str"]='';
		}
		if(isset($param['mch_billno'])) {
			$this->_parameters["mch_billno"]=$param['mch_billno'];
		}else{
			$this->_parameters["mch_billno"]='';
		}
		
		$this->_parameters["mch_id"]=$this->mchid;

		if(isset($param['wxappid'])) {
			$this->_parameters["wxappid"]=$param['wxappid'];
		}else{
			$this->_parameters["wxappid"]='';
		}
		if(isset($param['send_name'])) {
			$this->_parameters["send_name"]=$param['send_name'];
		}else{
			$this->_parameters["send_name"]='';
		}
		if(isset($param['re_openid'])) {
			$this->_parameters["re_openid"]=$param['re_openid'];
		}else{
			$this->_parameters["re_openid"]='';
		}
		if(isset($param['total_amount'])) {
			$this->_parameters["total_amount"]=$param['total_amount'];
		}else{
			$this->_parameters["total_amount"]='';
		}
		if(isset($param['total_num'])) {
			$this->_parameters["total_num"]=$param['total_num'];
		}else{
			$this->_parameters["total_num"]='';
		}
		if(isset($param['wishing'])) {
			$this->_parameters["wishing"]=$param['wishing'];
		}else{
			$this->_parameters["wishing"]='';
		}
		if(isset($param['client_ip'])) {
			$this->_parameters["client_ip"]=$param['client_ip'];
		}else{
			$this->_parameters["client_ip"]='';
		}
		if(isset($param['act_name'])) {
			$this->_parameters["act_name"]=$param['act_name'];
		}else{
			$this->_parameters["act_name"]='';
		}
		if(isset($param['remark'])) {
			$this->_parameters["remark"]=$param['remark'];
		}else{
			$this->_parameters["remark"]='';
		}
		
		//生成签名
		$sign = $this->getMd5sign();
		if($sign===false){
			//生成签名失败
			return false;
		}
		$this->_parameters["sign"]=$sign;
		
		//生成xml格式
		$xml =$this->arrayToXml();
		if($xml===false){
			//生成xml失败
			return false;
		}
		//模拟post
		$url='https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack'; //发送普通红包
		$data=$this->curlPost($xml,$url,true,15);
		if($data===false){
			//提交数据失败
			return false;
		}else{
			$arr=$this->xmlToArray($data);
			return $arr;
		}
	}
    /**
     * post 数据到微信
     */
	private function curlPost($xml, $url, $iscert = false, $second = 15){
		$ch = curl_init();
		
		curl_setopt($ch,CURLOPT_TIMEOUT,$second); //超时时间
		curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
		//这里设置代理，如果有的话
		//curl_setopt($ch,CURLOPT_PROXY, '10.206.30.98');
		//curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
		curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);

		if($iscert == true){
			//设置证书
			//使用证书：cert 与 key 分别属于两个.pem文件
			curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
			curl_setopt($ch,CURLOPT_SSLCERT, $this->sslcert_path);
			curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
			curl_setopt($ch,CURLOPT_SSLKEY, $this->sslkey_path);
		}

		//设置header
		curl_setopt($ch, CURLOPT_HEADER, FALSE);

		//post提交方式
		curl_setopt($ch, CURLOPT_POST, TRUE);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
		
		$data = curl_exec($ch);
		if($data){
			curl_close($ch);
			return $data;
		}else { 
			//$error = curl_errno($ch);
			//echo "call faild, errorCode:$error\n"; 
			curl_close($ch);
			return false;
		}
	}
	
    /**
     * 构建红包xml 将数组转xml
     */
	private function arrayToXml($parameters = null){
		if(is_null($parameters)){
			$parameters = $this->_parameters;
		}
		 
		if(!is_array($parameters) || empty($parameters)){
			return false;
		}
		 
		$xml = '<xml>';
		foreach ($parameters as $key=>$val)
		{
			if (is_numeric($val)){
				$xml.='<'.$key.'>'.$val.'</'.$key.'>'; 
			}else{
				$xml.='<'.$key.'><![CDATA['.$val.']]></'.$key.'>';  
			}
		}
		$xml.='</xml>';
		return $xml; 
	}

    /**
     * 将XML转为array
     */
    function xmlToArray($xml){    
		$xml_parser = xml_parser_create();   
		if(!xml_parse($xml_parser,$xml,true)){   
		   xml_parser_free($xml_parser);   
		   return false;   
		}else {   
			//禁止引用外部xml实体
			libxml_disable_entity_loader(true);
			$values = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true); 
			return $values;
		}   
    }
	
	
    /**
     * 按照微信签名算法生成MD5签名 
     */
	private function getMd5sign(){
		//检测密钥是否存在
		if($this->privatekey=='' || $this->privatekey==null){
			return false;
		}
		ksort($this->_parameters); //排序参数
		$restr='';
		$signstr='';
        foreach ($this->_parameters as $k => $v){
			if ($v == '' || strtolower($v) == 'null' || $v == null || strlen(trim($v)) <= 0 ) {
				return false;
			}else{
				$restr .= $k . "=" . $v . "&";
			}
		}
		//将最后“&”删除
		if (strlen($restr) > 0) {  
			$restr = substr($restr, 0, strlen($restr)-1);
		}else{
			return false;
		}
		
		$signstr = $restr . "&key=" . $this->privatekey;
		if($signstr=='' || $signstr==null){
			return false;
		}else{
		    return strtoupper(md5($signstr));
		}
	}
	
	/**
	 * 
	 * 产生随机字符串，不长于32位
	 * @param int $length
	 * @return 产生的随机字符串
	 */
	public function getNonceStr($length = 32) 
	{
		$chars = "abcdefghijklmnopqrstuvwxyz0123456789";  
		$str ="";
		for ( $i = 0; $i < $length; $i++ )  {  
			$str .= substr($chars, mt_rand(0, strlen($chars)-1), 1);  
		} 
		return $str;
	}

}
