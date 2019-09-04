<?php

namespace app\common\logic\miniapp;

use app\sqtuan\model\sqtuan\UserOpenIdModel;
use BaiduMiniProgram\BaiduClient;
use BaiduMiniProgram\Payment\PaymentClient;
use think\Exception;

class BaiduMiniapp extends MiniappBase
{
    private $response;

    public function __construct($appSetting)
    {
        parent::__construct($appSetting);
        $this->weApp = new BaiduClient($this->appSetting['appkey'], $this->appSetting['appsecret']);
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($param)
    {
        $res = $this->weApp->session($param['code']);
        $res = json_decode(json_encode($res));
        if (!empty($res->errcode)) {
            \exception("系统错误");
            return false;
        }
        $openId = $res->openid;
        $sessionKey = $res->session_key;
        return [
            'session_key' => $sessionKey,
            'open_id' => $openId,
        ];
    }

    public function createOrder($param)
    {
        $PaymentClient = new PaymentClient($this->appSetting['dealId'], $this->appSetting['payappkey'],
            "-----BEGIN RSA PRIVATE KEY-----
{$this->appSetting['privatekey']}
-----END RSA PRIVATE KEY-----",
            "-----BEGIN PUBLIC KEY-----
{$this->appSetting['publickey']}
-----END PUBLIC KEY-----"
        );
        $signer = $PaymentClient->signForPolymerPayment($param['order_id'], $param['money']);
        $bizInfo = [
            "tpData" => [
                "appKey" => $this->appSetting['payappkey'],
                "dealId" => $this->appSetting['dealId'],
                "rsaSign" => $signer,
                "tpOrderId" => $param['order_id'],
                "totalAmount" => $param['money'],
                "returnData" => [
                    'app_id' => $this->appId,
                    'order_id' => $param['order_id'],
                    'pay_type' => $param['pay_type'],
                    'order_type' => $param['order_type'],//百度专用 1商城 2拼团  3vip  4余额
                ],
            ]
        ];
        $orderInfo = [
            "dealId" => $this->appSetting['dealId'],
            "appKey" => $this->appSetting['payappkey'],
            "totalAmount" => $param['money'],
            "tpOrderId" => $param['order_id'],
            "signFieldsRange" => 1,
            "dealTitle" => $param['title'],
            "rsaSign" => $signer,
            "bizInfo" => json_encode($bizInfo),
        ];
        return [
            'order_info' => $orderInfo,
            'form_id' => '',
        ];
    }

    public function checkCallback($param)
    {
        $PaymentClient = new PaymentClient($this->appSetting['dealId'], $this->appSetting['payappkey'],
            "-----BEGIN RSA PRIVATE KEY-----
{$this->appSetting['privatekey']}
-----END RSA PRIVATE KEY-----",
            "-----BEGIN PUBLIC KEY-----
{$this->appSetting['publickey']}
-----END PUBLIC KEY-----"
        );
        $response = $PaymentClient->handleNotification(
            function ($parameters) {
                return ['isConsumed' => 2];
            },
            function (\Exception $exception) {
            },
            $param
        );
        $this->response = $response;
        $_ree = json_decode($this->response);
        if ($_ree->errno != 0) {
            \exception("系统错误");
        }
    }

    public function response()
    {
        return $this->response;
    }

    public function refund($param)
    {
        $PaymentClient = new PaymentClient($this->appSetting['dealId'], $this->appSetting['payappkey'],
            "-----BEGIN RSA PRIVATE KEY-----
{$this->appSetting['privatekey']}
-----END RSA PRIVATE KEY-----",
            "-----BEGIN PUBLIC KEY-----
{$this->appSetting['publickey']}
-----END PUBLIC KEY-----"
        );
        try {
            $res = $PaymentClient->orderRefund($param->orderId, $param->userId, $param->tpOrderId, 2, '商户主动退款', 1);
        } catch (Exception $exception) {
            return false;
        }

    }


}
