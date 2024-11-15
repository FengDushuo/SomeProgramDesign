<?php
namespace Common\Lib\Baidu;
/**
 * 百度语音识别
 * 新睿社区
 * http://www.010xr.com/
 */
class Btt {
 /**
 *获取百度token*
 **/
  public function get_token(){
       $url = 'https://openapi.baidu.com/oauth/2.0/token?grant_type=client_credentials&client_id=G8Ubfbo8YVq1VH4CAG9jIVTs&client_secret=FL8ewFlEqbpx1Bf3PGQli15FVottXkay';
        $res = curl_data($url);
        $res = json_decode($res,true);
        S('BD_TOKEN',$res['access_token'],['expire'=>$res['expires_in']]);
        return $res;
    }

  
  /***百度语音转文字**/
  public function WavTotext($baidu_token,$zm_wav_file){
    $totext_url ="http://vop.baidu.com/server_api";
    define('AUDIO_FILE', $zm_wav_file); //语音文件地址，值支持本地
  $content = base64_encode(file_get_contents(AUDIO_FILE));
    $token = S('BD_TOKEN');
        if(!$token){
            $token = $this->get_token()['access_token'];
        }
    //$audio = file_get_contents(AUDIO_FILE);
//$base_data = base64_encode($audio);
   file_put_contents("/www/wwwroot/www.010xr.com/application/Common/Lib/Baidu/data22.txt",serialize($content));
  	$totext_data=array(
      	'cuid'=>'www.010xr.com',
      	'format'=>'wav',
      	'rate'=>'8000',
      	'channel'=>'1',
      	'token'=> $token,
      	'speech'=>$content ,
      	'len'=>filesize(AUDIO_FILE) 
     	);
    $headers = array("Content-type: application/json;charset='utf-8'", "Accept: application/json", "Cache-Control: no-cache", "Pragma: no-cache");
	$ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $totext_url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($totext_data));
        curl_setopt($ch, CURLOPT_TIMEOUT_MS, 6000);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT_MS, 6000);
        $content = curl_exec($ch);
        $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if($code === 0){
            throw new Exception(curl_error($ch));
        }
        curl_close($ch);
    return $content;   
  }

}

