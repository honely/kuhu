<?php


namespace app\shop\logic\shop\miniapp;


use app\shop\model\shop\UserOpenIdModel;
use JiaweiXS\WeApp\WeApp;
use think\Exception;
use WeMini\Crypt;

class ToutiaoMini extends MiniappCommon
{
    protected $weApp;
    protected $error;
    protected $appId;

    public function __construct($appId, $device)
    {
        parent::__construct($appId, $device);
        $this->weApp = new \app\common\library\ToutiaoMini($this->appSetting);
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($code, $openId = "")
    {
        if (empty($openId) && empty($code)) return false;
        $sessionKey = '';
        if (!empty($code)) {
            try {
                $res = $this->weApp->getCode($code);
            } catch (Exception $exception) {
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
                'type' => 5,
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


    /**
     * checkOpenId
     */
    public function checkOpenId($openId)
    {
        $UserOpenIdModel = new UserOpenIdModel();
        $userOpen = $UserOpenIdModel->where("type", 5)
            ->where("app_id", $this->appId)->where("open_id", $openId)->find();
        if (empty($userOpen)) return false;

        return ['open_id' => $userOpen->open_id];
    }



    /**
     * 创建支付信息
     * $param
     * $param = [
     *      title         测试商品
     *      subject       副标题
     *      openid        第三方ID
     *      notify_url    支付成功通知地址
     *      return_url    网页支付回跳地址
     *      order_id      订单号
     *      money         支付金额
     * ];
     */
    public function createOrder($param)
    {
        try {
            $orderInfo =  $this->weApp->getOrderSn($param);
            return [
                'order_info' => $orderInfo,
                'form_id' => '',
            ];
        } catch (\Exception $e) {
            //继续向外抛出
            throw  new  Exception($e->getMessage());
        }
    }

    /**
     * 检验数据的真实性，并且获取解密后的明文.
     * @param $encryptedData string 加密的用户数据
     * @param $iv string 与用户数据一同返回的初始向量
     * @param $data string 解密后的原文
     * @return int 成功0，失败返回对应的错误码
     */
    public function decryptData($encryptedData, $iv, $sessionKey)
    {
        if (strlen($sessionKey) != 24) {
            return -4001;
        }
        $aesKey = base64_decode($sessionKey);
        if (strlen($iv) != 24) {
            return -4002;
        }
        $aesIV = base64_decode($iv);
        $aesCipher = base64_decode($encryptedData);
        $result = openssl_decrypt($aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);
        $dataObj = json_decode($result);
        if ($dataObj == NULL) {
            return -4003;
        }
        if ($dataObj->watermark->appid != $this->appSetting['app_id']) {
            return -4003;
        }
        return $dataObj;
    }

    /**
     * 验证Callback
     */
    public function checkCallback()
    {
//        try {
            // 实例支付对象


            $request = request();
            $param = array(
                'gmt_create' => $request->param('gmt_create'),
                'charset' => $request->param('charset'),
                'seller_email' => $request->param('seller_email'),
                'subject' => $request->param('subject'),
                'sign' => $request->param('sign'),
                'body' => $request->param('body'),
                'buyer_id' => $request->param('buyer_id'),
                'invoice_amount' => $request->param('invoice_amount'),
                'notify_id' => $request->param('notify_id'),
                'fund_bill_list' => $request->param('fund_bill_list'),
                'notify_type' => $request->param('notify_type'),
                'trade_status' => $request->param('trade_status'),
                'receipt_amount' => $request->param('receipt_amount'),
                'buyer_pay_amount' => $request->param('buyer_pay_amount'),
                'app_id' => $request->param('app_id'),
                'sign_type' => $request->param('sign_type'),
                'seller_id' => $request->param('seller_id'),
                'gmt_payment' => $request->param('gmt_payment'),
                'notify_time' => $request->param('notify_time'),
                'version' => $request->param('version'),
                'out_trade_no' => $request->param('out_trade_no'),
                'total_amount' => $request->param('total_amount'),
                'trade_no' => $request->param('trade_no'),
                'auth_app_id' => $request->param('auth_app_id'),
                'buyer_logon_id' => $request->param('buyer_logon_id'),
                'point_amount' => $request->param('point_amount'),
            );
            ob_start(); // 启动输出缓冲区
            try {

                $keyPair = \Alipay\Key\AlipayKeyPair::create(
                    "-----BEGIN RSA PRIVATE KEY-----
{$this->appSetting['alipay_private_secret']}
-----END RSA PRIVATE KEY-----",
                    "-----BEGIN PUBLIC KEY-----
 {$this->appSetting['alipay_public_secret']}
-----END PUBLIC KEY-----"
                );
                $weApp = new \Alipay\AopClient($this->appSetting['alipay_app_id'], $keyPair);
                $passed = $weApp->verify($param); // 验证支付宝服务器发来的参数数据签名
            } catch (\Exception $ex) {
                $passed = null;
            }

            if($passed){
                return [
                    'order_info' => $param,

                ];
            }
            ob_get_clean();

    }

    /**
     * 回调相应结果
     */
    public function response()
    {
        return "success";
    }
}