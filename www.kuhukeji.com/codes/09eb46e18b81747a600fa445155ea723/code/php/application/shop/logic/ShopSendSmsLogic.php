<?php

namespace app\shop\logic;

/**
 * 短信发送逻辑
 * 目前支持支腾讯云短信
 * 后期若支持其他平台短信 只需将此类工厂化即可
 */

use app\common\logic\sms\SendSmsLogic;
use app\common\model\app\AppModel;
use app\shop\model\sms\ShopSmsLogModel;
use think\Exception;

class ShopSendSmsLogic extends SendSmsLogic
{
    protected $app;
    protected $smsNumTimes = 1;

    public function setAppId($appId)
    {
        if (!$this->app = AppModel::find($appId)) {
            throw new Exception("系统错误");
        }
        return $this;
    }

    /**
     * 设置短信单条发送倍数
     */
    public function setSmsNumTimes($num){
        $this->smsNumTimes = $num;
        return $this;
    }

    /**
     * 商城发送短信
     * @param array $params
     * @param string $smsSign
     * @return mixed|void
     * @throws Exception
     */
    public function sendSms($params, $smsSign = '')
    {
        $sendNum = is_array($this->mobile) ? count($this->mobile) : 1;
        $sendNum = $sendNum * $this->smsNumTimes;
        if ($sendNum > $this->app->sms_num) {
            throw new Exception("短信余额不足，请联系客服");
        }
        try {
            $this->app->sms_num -= $sendNum;
            $this->app->save();
            $ShopSmsLogModel = new ShopSmsLogModel();
            $ShopSmsLogModel->save([
                'app_id' => $this->app->app_id,
                'num' => $sendNum,
                'this_num' => $this->app->sms_num,
                'type' => 20,
            ]);
           parent::sendSms($params, $smsSign);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }
}
