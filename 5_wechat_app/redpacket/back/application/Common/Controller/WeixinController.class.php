<?php
/**
 * WeixinController 获取微信接口信息控制器
 * 新睿社区
 * http://www.010xr.com/
 */
namespace Common\Controller;

use Think\Controller;

class WeixinController extends Controller{
    protected static $_instance = null;
    //方法静态化
    public function instance(){
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    /**
     * 获取token
     * @return mixed
     */
    public function get_access_token($appid,$appsecret){
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;
        return curl_data($url);
    }

    /**
     * 设置小程序token
     * @return mixed
     */
    public function set_token(){
        $access_token = S('access_token');
        $tokenInfo = json_decode($access_token,true);
        //判断access_token是否失效
        if($tokenInfo['expires_in'] - time() < 2000){
            //重新获取access_token
            $access_token = $this->get_access_token(C('C_APPID'),C('C_APPSECRET'));
            $tokenInfo = json_decode($access_token,true);
            $tokenInfo['expires_in'] = $tokenInfo['expires_in']+time();
            if($tokenInfo['errcode']){
                return $tokenInfo;
            }
            S('access_token',json_encode($tokenInfo,JSON_UNESCAPED_UNICODE));
        }
        return json_decode($access_token,true);

    }

    /**
     * 获取微信小程序oepnid等信息
     * @param array $param
     * @return mixed
     */
	public function send_url($param=[]){
		$url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.C('C_APPID').'&secret='.C('C_APPSECRET').'&js_code='.$param['code'].'&grant_type=authorization_code';
		return curl_data($url,$param);
	}

    /**
     * 获取用户增减数据
     * @param array $param
     * @return mixed
     */
    public function get_user_summary($param){
        $url = 'https://api.weixin.qq.com/datacube/getusersummary?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return curl_data($url,json_encode($param));
    }

    /**
     * 获取累计用户数据
     * @param array $param
     * @return mixed
     */
    public function get_user_cumulate($param){
        $url = 'https://api.weixin.qq.com/datacube/getusercumulate?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return curl_data($url,json_encode($param));
    }

    /**
     * 获取微信用户信息列表包统计(公众号)
     * @param array $param
     * @return mixed
     */
    public function get_user_wx($param=[]){
        $access_token = session('access_token');
        $tokenInfo = json_decode($access_token,true);
        //判断access_token是否失效
        if($tokenInfo['expires_in'] - time() < 600){
            //重新获取access_token
            $access_token = $this->get_access_token(C('G_APPID'),C('G_APPSECRET'));
            $tokenInfo = json_decode($access_token,true);
            $tokenInfo['expires_in'] = $tokenInfo['expires_in']+time();
            if($tokenInfo['errcode']){
                return $tokenInfo;
            }
            session('access_token',json_encode($tokenInfo,JSON_FORCE_OBJECT));
        }

        $tokenInfo = json_decode($access_token,true)['access_token'];
        $param['access_token'] = $tokenInfo;

        //获取用户增减数据
        $summary = json_decode($this->get_user_summary($param),true);
        if(!$summary){
            return [];
        }
        foreach($summary['list'] as $v) {
            $cumulate_arr[$v['ref_date']] = $v;
        }

        //获取累计用户数据
        $cumulate = json_decode($this->get_user_cumulate($param),true);
        foreach($cumulate['list'] as &$vs){
            $vs += $cumulate_arr[$vs['ref_date']]??[];
        }
        return $cumulate;
    }

    /**
     * 小程序获取二维码
     * @param $param
     * @return bool|mixed
     * time 2017.10.26
     */
    public function  get_wxa_code($param){

        $tokenInfo = $this->set_token()['access_token'];
        //获取二维码
//        $url = 'https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token='.$tokenInfo;
        $url = 'https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token='.$tokenInfo;
        $parm['path'] = $param['page'] ?? 'pages/index/index';
        $parm['width'] = $param['width'] ?? 430;
	    if (isset($param['scene'])) {
        		$parm['scene'] = $param['scene'];
        }
//        $parm['auto_color'] =  false;
        if(!$param['path']){
             return false;
        }

//        var_dump(json_encode($parm,JSON_UNESCAPED_SLASHES));

        return curl_data($url,json_encode($parm));
    }


    /**
     * 小程序模板消息推送
     * @param $param
     * @return mixed
     */
    public function send_template($param){
        $tokenInfo = $this->set_token()['access_token'];
        $url='https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$tokenInfo;
        return curl_data($url,json_encode($param));
    }

    public function transfers(){
        $url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';

    }




}