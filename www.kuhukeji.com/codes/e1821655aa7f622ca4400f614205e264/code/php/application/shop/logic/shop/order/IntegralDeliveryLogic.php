<?php

namespace app\shop\logic\shop\order;

use app\shop\model\shop\DeliveryModel;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\ShippingModel;
use think\Exception;

/**
 * 发货处理逻辑
 * Class DeliveryLogic
 * @package app\shop\logic\shop\order
 */
class IntegralDeliveryLogic
{
    //订单ID
    private $orderId;
    //订单
    private $order;

    private $shippingId = 0;

    private $shippingName;

    private $shippingCode;
    //备注
    private $note;
    //发货方式
    private $sendType = 0;

    public function __construct($order_id)
    {
        $IntegralOrderModel = new IntegralOrderModel();
        if (!$order = $IntegralOrderModel->find($order_id)) {
            throw new Exception('参数不正确！');
        }
        if ($order->pay_status == getMean('integral_order_pay_status','key')['wzf'] || $order->pay_status == getMean('order_pay_status','key')['ytk']) {
            throw new Exception('订单状态不支持发货！');
        }
        if ($order->shipping_status == getMean('integral_order_shipping_status','key')['bffh'] || $order->pay_status == getMean('order_shipping_status','key')['wljs']) {
            throw new Exception('订单状态不支持发货！');
        }
        if ($order->order_status > 1) {
            throw new Exception('订单状态不支持发货！');
        }

        $this->orderId = $order->order_id;
        $this->order = $order;

    }

    /**
     * @param $send_type
     */
    public function setSendType($send_type) {
        $this->sendType = $send_type;
        return $this;
    }

    /**
     * @param $order_goods_ids
     */
    public function setOrderGoodsId($rec_ids) {
        $this->recIds = $rec_ids;
        return $this;
    }

    public function setNote($note) {
        $this->note = (string)$note;
        return $this;
    }

    public function setShippingId($shipping_id) {
        $this->shippingId = $shipping_id;
        $ShippingModel = new ShippingModel();
        $this->shippingName = $ShippingModel->where(['shipping_id'=>$shipping_id])->value('shipping_name');
        return $this;
    }


    public function setShippingCode($shipping_code) {
        $this->shippingCode = (string)$shipping_code;
        return $this;
    }


    public function delivery() {
        $delivery_data = [
            'order_id' => $this->orderId,
            'rec_id' => 0,
            'order_sn' => $this->order->order_sn,
            'user_id' => $this->order->user_id,
            'name' => $this->order->name,
            'mobile' => $this->order->mobile,
            'province_id' => $this->order->province_id,
            'city_id' => $this->order->city_id,
            'district_id' => $this->order->district_id,
            'street' => $this->order->street,
            'address' => $this->order->address,
            'shipping_id' => $this->shippingId,
            'shipping_name' => $this->shippingName,
            'shipping_code' => $this->shippingCode,
            'note' => $this->note,
            'send_type' => $this->sendType,
            'order_type' => 2,
        ];

        $DeliveryModel = new DeliveryModel();
        $DeliveryModel->save($delivery_data);
    }


    public function changeOrderShippingState() {
        $IntegralOrderModel = new IntegralOrderModel();
        $order_data = [
            'shipping_time'=>time(),
            'shipping_id' => $this->shippingId,
            'shipping_name' => $this->shippingName,
            'shipping_code' => $this->shippingCode,
        ];
        $order_data['shipping_status'] = getMean('integral_order_shipping_status','key')['yfh'];
        $IntegralOrderModel->save($order_data,['order_id'=>$this->orderId]);
    }



}
