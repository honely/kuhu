<?php

namespace app\shop\logic\shop\miniapp;

use app\shop\model\shop\UserOpenIdModel;
use BaiduMiniProgram\BaiduClient;
use BaiduMiniProgram\Payment\PaymentClient;
use think\Exception;

class BaiduMiniapp extends MiniappCommon
{
    private $response;

    public function __construct($appId, $device)
    {
        parent::__construct($appId, $device);
        $this->weApp = new BaiduClient($this->appSetting['appkey'], $this->appSetting['appsecret']);

    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($code, $openId = "")
    {
        if (empty($openId) && empty($code)) return false;
        $sessionKey = '';
        if (!empty($code)) {
            $res = $this->weApp->session($code);
            $res = json_decode(json_encode($res));
            if (!empty($res->errcode)) {
                $this->setError($res->errmsg);
                return false;
            }
            $openId = $res->openid;
            $sessionKey = $res->session_key;
        }
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) {
            $UserOpenIdModel->save([
                'app_id' => $this->appId,
                'open_id' => $openId,
                'type' => 4,
                'session_key' => $sessionKey,
            ]);
        } else {
            if (!empty($sessionKey)) {
                $UserOpenIdModel->save(['session_key' => $sessionKey], ['open_user_id' => $userOpen->open_user_id]);
            } else {
                $sessionKey = $userOpen->session_key;
            }
        }
        return [
            'session_key' => $sessionKey,
            'open_id' => $openId,
        ];
    }


    public function createOrder($param)
    {
//        -----BEGIN RSA PRIVATE KEY----- -----END RSA PRIVATE KEY-----
//        -----BEGIN RSA PRIVATE KEY-----   -----END RSA PRIVATE KEY-----
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
                    'order_type' => $param['order_type']  ,//百度专用 1商城 2拼团  3vip  4余额
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


    public function checkCallback($param){
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
                return ['isConsumed'=>2];
            },
            function (\Exception $exception) {
            },
            $param
        );
        $this->response = $response;
        $_ree = json_decode($this->response);
        if($_ree->errno != 0){
            \exception("系统错误");
        }
    }

    public function response(){
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
        try{
            $res = $PaymentClient->orderRefund($param->orderId,$param->userId,$param->tpOrderId,2,'商户主动退款',1);
        }catch (Exception $exception){

            return false;
        }


    }

    /**
     * checkOpenId
     */
    public function checkOpenId($openId)
    {
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("type", 4)
            ->where("app_id", $this->appId)->where("open_id", $openId)->find();
        return !empty($userOpen);
    }

}
