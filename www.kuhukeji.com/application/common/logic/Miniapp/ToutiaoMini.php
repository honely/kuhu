<?php

namespace app\common\logic\miniapp;

use think\Exception;

class ToutiaoMini extends MiniappBase
{


    public function __construct($appSetting)
    {
        parent::__construct($appSetting);
        $this->weApp = new \app\common\library\ToutiaoMini($this->appSetting);
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($param)
    {
        try {
            $res = $this->weApp->getCode($param['code']);
        } catch (Exception $exception) {
            \exception($exception->getMessage());
        }
        $openId = $res->openid;
        $sessionKey = $res->session_key;
        return [
            'session_key' => $sessionKey,
            'open_id' => $openId,
        ];

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
            $orderInfo = $this->weApp->getOrderSn($param);
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
     * 验证Callback
     */
    public function checkCallback()
    {
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

        if ($passed) {
            return [
                'order_info' => $param,
            ];
        }
        ob_get_clean();

    }

    /**
     * 回调应答
     */
    public function response()
    {
        return "success";
    }
}