<?php

namespace app\shop\logic\shop\order;

use app\shop\model\shop\VipOrderModel;
use think\Exception;

/**
 * 订单操作基类
 * Class OrderBasic
 * @package app\shop\logic\shop\order
 */
class VipOrderBasic
{

    private   $orderModel;
    private   $order;
    protected $appId;
    /**
     * 将此类 私有化
     * OrderBasic constructor.
     */
    protected function __construct()
    {
        $this->orderModel = new VipOrderModel();
    }

    /**
     * 设置订单
     * @param $orderId
     * @throws Exception
     */
    public function setOrderId($orderId){

        $this->order = $this->orderModel->find($orderId);
        if(empty($this->order)){
            throw new Exception("系统异常");
        }
        return $this;
    }


    /**
     * 获取订单详情
     */
    public function getOrderDetail()
    {
        return $this->order;
    }

    /**
     * 设置支付状态
     */
    protected function setPayStatus($status)
    {
        $this->order->pay_status = $status;
        return $this;
    }

    /**
     * 修改订单信息
     */
    protected function setOrderInfo($key, $value)
    {
        $this->order->setAttr($key,$value);
        return $this;
    }


    /**
     * 如果有修改 则更改
     */
    public function __destruct()
    {
        if(!empty($this->order)){
            $this->order->save();
        }
    }



}
