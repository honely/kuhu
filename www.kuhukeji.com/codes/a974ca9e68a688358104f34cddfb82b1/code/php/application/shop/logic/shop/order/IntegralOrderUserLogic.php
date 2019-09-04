<?php

namespace app\shop\logic\shop\order;

use think\Exception;

/**
 * 管理员订单处理逻辑
 * Class OrderAdminLogic
 * @package app\shop\logic\shop\order
 */
class IntegralOrderUserLogic extends IntegralOrderBasic
{


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
        $is_pay = (int)($order->payment_money > 0);
        $order_info = "";

        if ($is_pay == 1) {
            $param = [
                'title' => '积分商品',
                'subject' => $order->goods_name,
                'openid' => $openId,
                'notify_url' => request()->domain() . config('callbackUrl.integral_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderId,
                'return_url' => request()->domain() .config('callbackUrl.integral_payment_return_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderId,
                'order_id' => $order->order_id,
                'money' => $order->payment_money,
                'pay_type' => $payType,
                'goods_id' => $order->goods_id,
                'order_type' => 5,
            ];
            try {
                $res = Miniapp::makeModule($device, $this->appId)->createOrder($param);
                $order_info = $res['order_info'];
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        }
        return [
            'is_pay' => $is_pay,
            'order_info' => $order_info,
        ];
    }



}
