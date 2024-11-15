<?php
/**
 * WeixinController 获取微信接口信息控制器
 * 新睿社区
 * http://www.010xr.com/
 */
namespace Common\Controller;

use Think\Controller;

class AdvController extends Controller{
    protected static $_instance = null;
    //方法静态化
    public function instance(){
        if (!self::$_instance) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }

    /*
     * 把平台广告列出来
     */
    public function listAdv($random=FALSE) {
    	$slideModel = M('slide');
    	$slideList = $slideModel->where(array('slide_status'=>1))->limit(0,3)->select();
    	if (empty($slideList)) {
    		return array();
    	}
    	foreach ($slideList as $k => $v){
    		$slideList[$k]['slide_pic'] =  'https://'.$_SERVER['HTTP_HOST'].C("TMPL_PARSE_STRING.__UPLOAD__").$v['slide_pic'];
    	}
    	$len = count($slideList)-1;
    	if ($random) {
    		$index = mt_rand(0,$len);
    		return $slideList[$index];
    	}
    	return $slideList;
    }
    
    /*
     * 获取指定位置广告
     * 传入下标
     */
    public function getAdv($pos) {
    	$slideModel = M('slide');
    	$adv = $slideModel->join('LEFT JOIN '.C('DB_PREFIX').'slide_cat b ON slide_cid=b.cid')->field('*')->where(array('cat_idname'=>$pos, 'cat_status'=>1))->select();
    	
    	if (empty($adv)) {
    		return null;
    	}
    	
    	foreach ($adv as $k => $v){
    		$adv[$k]['slide_pic'] =  'https://'.$_SERVER['HTTP_HOST'].C("TMPL_PARSE_STRING.__UPLOAD__").$v['slide_pic'];
    	}
    	
    	if ($pos != 'index3') {
    		$adv = $adv[0];
    	}
    	return $adv;
    }

}