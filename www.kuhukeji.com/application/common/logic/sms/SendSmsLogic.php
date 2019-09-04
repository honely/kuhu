<?php

namespace app\common\logic\sms;

/**
 * 短信发送逻辑
 * 目前支持支腾讯云短信
 * 后期若支持其他平台短信 只需将此类工厂化即可
 */

use app\common\model\setting\SettingModel;
use Qcloud\Sms\SmsSingleSender;
use Qcloud\Sms\SmsMultiSender;
use think\Exception;

class SendSmsLogic
{
    protected $appid;
    protected $appkey;
    protected $mobile;
    protected $tmpId;
    protected $errMsg;

    /**
     * 初始化配置
     */
    public function __construct()
    {
        $SettingModel = new SettingModel();
        $res = $SettingModel->getCache("tx_sms");
        if (empty($res) || empty($res->appid) || empty($res->appkey) || empty($res->regtemplateid)) {
            throw  new Exception("短信发送失败");
        }
        $this->appid = $res->appid;
        $this->tmpId = $res->regtemplateid;
        $this->appkey = $res->appkey;
    }

    /**
     * 设置手机号
     * @param $mobile string|array  单发传字符串  多发传数组
     */
    public function setMobile($mobile)
    {
        $this->mobile = $mobile;
        return $this;
    }

    /**
     * 设置模板ID 默认为短信验证码ID
     */
    public function setTmpId($tmpId)
    {
        !empty($tmpId) && $this->tmpId = $tmpId;
        return $this;
    }

    /**
     * 验证手机号
     * @return bool
     */
    private function checkMoble()
    {
        if (empty($this->mobile)) throw new Exception("请输入手机号");
        if (is_array($this->mobile)) {
            if (count($this->mobile) > 100) throw new Exception("您单次最多发送100条");
            foreach ($this->mobile as $val) {
                if (isMobile($val) == false) throw new Exception("存在不合法的手机号：{$val}");
            }
            return true;
        }
        if (isMobile($this->mobile) == false) {
            throw new Exception("存在不合法的手机号：{$this->mobile}");
        }
        return true;
    }

    /**
     * 短信发送
     * @param array $params 参数 请与 模板ID参数匹配
     * @param string $smsSign 默认空 短信签名
     */
    public function sendSms($params, $smsSign = '')
    {
        try {
            $this->checkMoble();
            if (is_array($this->mobile)) {
                return $this->SmsMultiSender($params, $smsSign);
            } else {
                return $this->SmsSingleSender($params, $smsSign);
            }
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
    }

    /**
     * 单发短信指定模板
     * @param string $tel 手机号
     * @param int $templateId 模板ID
     * @param array $params 参数 请与 模板ID参数匹配
     * @param string $smsSign 默认空 短信签名
     */
    private function SmsSingleSender($params, $smsSign = '')
    {
        $ssender = new SmsSingleSender($this->appid, $this->appkey);
        $result = $ssender->sendWithParam("86", $this->mobile, $this->tmpId,
            $params, $smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
        $rsp = json_decode($result);
        if ($rsp->result != 0) {
            throw new Exception($rsp->errmsg);
        }
        return $rsp;
    }

    /**
     * 指定模板群发
     * @param array $tels 手机号
     * @param int $templateId 模板ID
     * @param array $params 参数请与模板ID参数匹配
     * @param string $smsSign 默认空 短信签名
     */
    private function SmsMultiSender($params, $smsSign = '')
    {
        $msender = new SmsMultiSender($this->appid, $this->appkey);
        $result = $msender->sendWithParam("86", $this->mobile,
            $this->tmpId, $params, $smsSign, "", "");
        $rsp = json_decode($result);
        if ($rsp->result != 0) {
            throw new Exception($rsp->errmsg);
        }
        return $rsp;
    }

}
