<?php

namespace app\shop\logic\shop\order;

use app\shop\model\shop\DeliveryModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\ShippingModel;
use think\Exception;

/**
 * 发货处理逻辑 通用计算
 * Class DeliveryLogic
 * @package app\shop\logic\shop\order
 */
class DeliveryLogic
{
    //订单ID
    private $orderId;
    //子订单ID
    private $recIds;
    //订单
    private $order;

    private $shippingId = 0;

    private $shippingName;

    private $shippingCode;

    //联系方式
    private $mobile;
    //详细地址
    private $street;
    //完整地址
    private $address;
    //备注
    private $note;
    //发货方式
    private $sendType = 0;

    private $orderGoodsData;

    public function __construct($order_id)
    {
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find($order_id)) {
            throw new Exception('参数不正确！');
        }
        if ($order->pay_status == getMean('order_pay_status','key')['wzf'] || $order->pay_status == getMean('order_pay_status','key')['ytk']) {
            throw new Exception('订单状态不支持发货！');
        }
        if ($order->shipping_status == getMean('order_shipping_status','key')['bffh'] || $order->pay_status == getMean('order_shipping_status','key')['wljs']) {
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
    }

    /**
     * @param $order_goods_ids
     */
    public function setOrderGoodsId($rec_ids) {
        if (!is_array($rec_ids)) {
            $rec_ids[] = $rec_ids;
        }
        $this->recIds = $rec_ids;
    }

    public function setNote($note) {
        $this->note = (string)$note;
    }

    public function setShippingId($shipping_id) {
        $this->shippingId = $shipping_id;
        $ShippingModel = new ShippingModel();
        $this->shippingName = $ShippingModel->where(['shipping_id'=>$shipping_id])->value('shipping_name');
    }


    public function setShippingCode($shipping_code) {
        $this->shippingCode = (string)$shipping_code;
    }



    public function delivery() {
        $delivery_data = [];
        foreach ($this->recIds as $v) {
            $delivery_data[] = [
                'order_id' => $this->orderId,
                'rec_id' => $v,
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
                'order_type' => 1,
            ];
        }
        $DeliveryModel = new DeliveryModel();
        $DeliveryModel->saveAll($delivery_data);
    }


    public function changeOrderGoodsShippingState() {
        $OrderGoodsModel = new OrderGoodsModel();

        $DeliveryModel = new DeliveryModel();
        $delivery_tmp = $DeliveryModel->where(['order_id'=>$this->orderId,'order_type'=>1])->select();
        $delivery_relation = [];
        $data = [];
        foreach ($delivery_tmp as $v) {
            $delivery_relation['rec_id'] = $v->delivery_doc_id;
        }
        foreach ($delivery_tmp as $v) {
            $data[] = [
                'rec_id' => $v->rec_id,
                'is_send' => 1,
                'delivery_id' => $delivery_relation[$v->rec_id],
            ];
        }
        $OrderGoodsModel->saveAll($data);

        $this->orderGoodsData = $data;
    }

    public function changeOrderShippingState() {
        $OrderModel = new OrderModel();
        $OrderGoodsModel = new OrderGoodsModel();
        $order_data = [
            'shipping_time'=>time(),
            'shipping_id' => $this->shippingId,
            'shipping_name' => $this->shippingName,
            'shipping_code' => $this->shippingCode,
        ];
        $sub_order_count = $OrderGoodsModel->where(['order_id'=>$this->orderId])->count();
        if ($sub_order_count == count($this->orderGoodsData)) {
            $order_data['shipping_status'] = getMean('order_shipping_status','key')['yfh'];
            $OrderModel->save($order_data,['order_id'=>$this->orderId]);
        } else {
            $order_data['shipping_status'] = getMean('order_shipping_status','key')['bffh'];
            $OrderModel->save($order_data,['order_id'=>$this->orderId]);
        }
    }



}
