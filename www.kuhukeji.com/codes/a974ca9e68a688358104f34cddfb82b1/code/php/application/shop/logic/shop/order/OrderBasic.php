<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\KuaidiniaoApi;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use think\Exception;

/**
 * 订单操作基类
 * Class OrderBasic
 * @package app\shop\logic\shop\order
 */
class OrderBasic
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
        $this->orderModel = new OrderModel();
        $this->orderGoodsModel = new OrderGoodsModel();
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
        if($this->order->pay_status == 0 && $this->order->end_time < time()){
            $this->order->order_status = 5;
        }
        $this->appId = $this->order->app_id;
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
     * 设置订单状态
     */
    protected function setOrderStatus($status)
    {

        $this->order->order_status = $status;
    }

    /**
     * 设置发货状态
     */
    protected function setShippingStatus($status)
    {
        $this->order->shipping_status = $status;
        return $this;
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
     * 查询订单轨迹
     */
    public function getOrderTrail(){
        if($this->order->shipping_status <= 0){
            return [];
        }

        if(empty($this->order->shipping_data)){
            $KuaidiniaoApi = new KuaidiniaoApi();
             $data = $KuaidiniaoApi->setAppId($this->appId)
                ->setShippingCode($this->order->shipping_code)
                ->setLogisticCode($this->order->shipping_num)->getTraces();
            if($KuaidiniaoApi->isEnd()){
                $this->order->setAttr("shipping_data",json_encode($data,256));
            }
            return [
                'is_open' =>  (int) $KuaidiniaoApi->getIsOpen(),
                'data' => array_reverse($data),
            ];
        }else{
            return [
                'is_open' => 1,
                'data' => array_reverse(json_decode($this->order->shipping_data,true)),
            ];
        }
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
