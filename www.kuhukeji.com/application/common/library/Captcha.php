<?php
namespace app\common\library;

use app\common\model\setting\SettingModel;


class Captcha {
    protected $captcha_id;
    protected $private_key;

    public function __construct(){
        $SettingModel = new SettingModel();
        $geetest = $SettingModel->getCache("geetest");
        $this->captcha_id = $geetest->captcha_id;
        $this->private_key = $geetest->private_key;
    }

     public function getConfig(){

     }


    public function getStart() {
        $GtSdk = new \GeetestLib($this->captcha_id, $this->private_key);
        $data = array(
            "user_id" => md5(uniqid(true)), # 网站用户id
            "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            "ip_address" => request()->ip() # 请在此处传输用户请求验证时所携带的IP
        );
        $status = $GtSdk->pre_process($data, 1);
        cookie('gtserver',$status) ;
        cookie('user_id',$data['user_id']);
        return $GtSdk->get_response_str();
    }

    public function getResult(){
        $data = array(
            "user_id" => cookie("user_id"), # 网站用户id
            "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            "ip_address" => request()->ip() # 请在此处传输用户请求验证时所携带的IP
        );
        $result = request();
        $geetest_challenge = $result->param("geetest_challenge");
        $geetest_validate =  $result->param("geetest_validate");
        $geetest_seccode = $result->param("geetest_seccode");
        $GtSdk = new \GeetestLib($this->captcha_id, $this->private_key);
        if (cookie('gtserver') == 1) {   //服务器正常
            $result = $GtSdk->success_validate($geetest_challenge, $geetest_validate, $geetest_seccode,$data);
            if(!$result){
                return  false;
            }
        } else {  //服务器宕机,走failback模式
            if (!$GtSdk->fail_validate($geetest_challenge, $geetest_validate, $geetest_seccode)) {
                return  false;
            }
        }
        return true;
    }
}

 ?>
