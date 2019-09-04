<?php

namespace app\common\model\sms;

use app\common\logic\sms\SendSmsLogic;
use app\common\model\CommonModel;
use think\Exception;

class MemberMobileCode extends CommonModel
{
    protected $pk = 'code_id';
    protected $name = 'member_mobile_code';




    /**
     * 发送验证码
     */
    public function sendCode($mobile){
        if (!isMobile($mobile)) {
            $this->error = "手机号格式错误";
            return false;
        }
        $data = $this->where("mobile", $mobile)->find();
        
        $add = true;
        
        if (!empty($data)) {
            if($data['err_num'] >=5 || $data['send_time']+600 < request()->time()){
                $add = true;
            }else{
                $add = false;
                $code =  $data['code'];
                $this->save(['send_time'=>request()->time(),'err_num'=>0], ['code_id' => $data->code_id]);
            }           
        } 
        if($add){
            $code = rand(100000, 999999);
            $datas = [
                'mobile' => $mobile,
                'code' => $code,
                'err_num' => 0,
                'send_time' => request()->time(),
            ];
            $this->save($datas);
        }
        try {
            //短信发送逻辑
            $SendSmsLogic = new SendSmsLogic();
            $SendSmsLogic->setMobile($mobile)->sendSms([$code]);
            return true;
        } catch (Exception $exception) {
            $this->error = $exception->getMessage();
            return false;
        }
    }

    /**
     * 验证验证码
     */
    public function checkCode($mobile,$code)
    {
        if (!isMobile($mobile)) {
            return false;
        }
        $data = $this->where("mobile", $mobile)->find();
        if(empty($data)) return false;
        if($data->send_time + 600 < request()->time()) {
            $this->where("mobile", $mobile)->delete();
            return false;
        }
        if($data->err_num >= 5){
            $this->where("mobile", $mobile)->delete();
            return false;
        }
        if($code != $code){
            $data->err_num += 1;
            $this->save();
            return false;
        }
        $this->where("mobile", $mobile)->delete();
        return true;
    }

}
