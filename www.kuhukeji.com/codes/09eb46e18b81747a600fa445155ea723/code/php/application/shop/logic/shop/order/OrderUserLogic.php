<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\ShippingModel;
use think\Exception;

/**
 * 管理员订单处理逻辑
 * Class OrderAdminLogic
 * @package app\shop\logic\shop\order
 */
class OrderUserLogic extends OrderBasic
{
    protected $userId;

    //开放类
    public function __construct()
    {
        parent::__construct();
    }

    public function setUserId($userId)
    {
        $this->userId = $userId;
        if ($this->getOrderDetail()->user_id != $this->userId) {
            throw new Exception("系统异常");
        }
        if ($this->getOrderDetail()->admin_delete == 1) {
            throw new Exception("系统异常");
        }
        return $this;
    }



    /**
     * 获取订单支付的订单信息
     */
    public function getPayOrderInfo($order,$openId, $device, $payType = 'wyu')
    {
        if($this->getOrderDetail()->end_time  < time()){
                \exception("订单已失效");
        }
        $is_pay = (int)($order->payment_price > 0);
        $order_info = "";
        if ($is_pay == 1) {
            $param = [
                'title' => '商品购买',
                'subject' => "商品购买",
                'openid' => $openId,
                'notify_url' => request()->domain() . config('callbackUrl.shop_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $order->order_id,
                'return_url' => request()->domain() .config('callbackUrl.shop_payment_return_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $order->order_id,
                'order_id' => $order->order_id,
                'money' => $order->payment_price,
                'pay_type' => $payType,
                'goods_id' => $order->order_id,
                'order_type' => 1,
            ];
            try {
                $res = Miniapp::makeModule($device, $this->appId)->createOrder($param);
                $order_info = $res['order_info'];
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        }
        return [
            'order_id' => $order->order_id,
            'is_pay' => $is_pay,
            'order_info' => $order_info,
        ];
    }







}
