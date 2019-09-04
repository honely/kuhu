<?php

namespace app\common\logic\miniapp;
use think\Exception;

 class MiniappBase
{

    protected $weApp;
    protected $appSetting;

    /**
     * 禁用类
     * MiniappBase constructor.
     * @param $appSetting
     */
    protected function __construct($appSetting)
    {
        $this->appSetting = $appSetting;
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($param)
    {
        return [
            'session_key' => '',
            'open_id' => '',
        ];

    }

    /**
     * 解密手机号
     */
    public function getMobile($param)
    {
        return [
            'mobile' => "",
            'open_id' => "",
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
     *      pay_type      h5支付方式
     * ];
     */
    public function createOrder($param)
    {
        return [
            'order_info' => '',
            'form_id' => '',
        ];

    }

    /**
     * 验证Callback
     */
    public function checkCallback($param = null)
    {
        return true;
    }

    /**
     * 应答
     */
    public function response()
    {
        return "SUCCESS";
    }

    /**
     * 获取专属二维码
     */
    public function getQrcode($param)
    {
        return "";
    }

    /**
     * 原路返回
     * @param $param
     * @return bool
     */
    public function refund($param)
    {
        return true;
    }

    public function __call($name, $arguments)
    {
        throw new Exception($name);
    }
}
