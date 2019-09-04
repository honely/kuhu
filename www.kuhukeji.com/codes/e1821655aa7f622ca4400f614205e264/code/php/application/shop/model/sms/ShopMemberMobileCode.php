<?php

namespace app\shop\model\sms;

use app\common\logic\sms\SendSmsLogic;
use app\shop\logic\ShopSendSmsLogic;
use app\shop\model\CommonModel;
use think\Exception;

class ShopMemberMobileCode extends CommonModel
{
    protected $pk = 'code_id';
    protected $name = 'app_shop_mobile_code';


    /**
     * 发送验证码
     */
    public function sendCode($mobile, $appId)
    {
        if (!isMobile($mobile)) {
            $this->error = "手机号格式错误";
            return false;
        }
        $data = $this->where("app_id", $appId)->where("mobile", $mobile)->find();
        $add = true;
        if (!empty($data)) {
            if ($data['err_num'] >= 5 || $data['send_time'] + 600 < request()->time()) {
                $add = true;
            } else {
                $add = false;
                $code = $data['code'];
                $this->save(['send_time' => request()->time(), 'err_num' => 0], ['code_id' => $data->code_id]);
            }
        }

        try {
            if ($add) {
                $code = rand(100000,999999);
            }
            //短信发送逻辑
            $SendSmsLogic = new ShopSendSmsLogic();
            $SendSmsLogic->setAppId($appId)->setMobile($mobile)->sendSms([$code]);
            if ($add) {
                $datas = [
                    'mobile' => $mobile,
                    'code' => $code,
                    'app_id' => $appId,
                    'err_num' => 0,
                    'send_time' => request()->time(),
                ];
                $this->save($datas);
            }
            return true;
        } catch (Exception $exception) {
            $this->error = $exception->getMessage();
            return false;
        }

    }

    /**
     * 验证验证码
     */
    public function checkCode($mobile, $code, $appId)
    {
        if (!isMobile($mobile)) {
            return false;
        }

        $data = $this->where("mobile", $mobile)
            ->order("code_id","desc")
            ->where("app_id", $appId)
            ->find();
        if (empty($data)) return false;
        if ($data->send_time + 600 < request()->time()) {
            $this->where("mobile", $mobile)->delete();
            return false;
        }
        if ($data->err_num >= 5) {
            $this->where("mobile", $mobile)->delete();
            return false;
        }
        if ($code != $code) {
            $data->err_num += 1;
            $this->save();
            return false;
        }
        $this->where("mobile", $mobile)->delete();
        return true;
    }

}
