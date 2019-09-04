<?php

namespace app\shop\logic\shop\miniapp;

use app\common\model\app\OpenSettingModel;
use think\Exception;

/**
 * 小程序管理抽象类
 * Class MiniappCommon
 * @package app\shop\logic\shop\miniapp
 */
class MiniappCommon
{

    protected $weApp;
    protected $appId;
    protected $device;
    protected $appSetting = [];
    protected $autoGetSetting = true;


    public function __construct($appId, $device)
    {

        $this->appId = $appId;
        $this->device = $device;
        if ($this->autoGetSetting == true) {
            try {
                $this->getSetting();
            } catch (Exception $exception) {
                throw new Exception("系统错误");
            }
        }
    }

    protected function getSetting()
    {
        $OpenSettingModel = new OpenSettingModel();
        $this->appSetting = $OpenSettingModel->setAppId($this->appId)->getSetting($this->device);

        if (empty($this->appSetting)) {
            throw new Exception("系统错误");
        }
    }

    /**
     * 获得登录验证信息
     */
    public function getSessionKey($code, $openId = "")
    {
        return [
            'session_key' => '',
            'open_id' => '',
        ];

    }

    /**
     * checkOpenId
     */
    public function checkOpenId($openId)
    {
        return ['open_id' => ''];
    }

    /**
     * 解密手机号
     */
    public function getMobile($param)
    {
        return [
            'mobile' => '',
            'open_id' => '',
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
        return [
            'order_info' => '',
            'form_id' => '',
        ];

    }

    /**
     * 获取二维码
     */
    public function getQrcode($param){
        return "";
    }

    /**
     * @param $param
     * @return bool
     * 退款
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
