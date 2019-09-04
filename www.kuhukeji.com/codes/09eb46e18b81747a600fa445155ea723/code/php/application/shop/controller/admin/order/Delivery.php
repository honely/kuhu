<?php

namespace app\shop\controller\admin\order;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\order\OrderAdminLogic;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\ShippingModel;
use think\Exception;

class Delivery extends Common
{
    /**
     * 订单列表
     */
    public function index()
    {
        $where['app_id'] = $this->appId;
        $where['admin_delete'] = 0;
        $where['pay_status'] = 1;
        $where['shipping_status'] = 0;
        $where['order_status'] = 1;

        //订单ID
        $order_id = (int) $this->request->param('order_id',0);
        if ($order_id) {
            $where['order_id'] = $order_id;
        }

        //收货人搜索 订单编码
        $keywords = (string)$this->request->param("keywords");
        $keywords_type = (int)$this->request->param("keywords_type", 1);
        if (!empty($keywords)) {
            if ($keywords_type == 1) {
                $where['order_sn'] = ["LIKE", "{$keywords}"];
            } else {
                $where["name|mobile"] = ["LIKE", "{$keywords}"];
            }
        }
        $OrderModel = new OrderModel();
        $list = $OrderModel->where($where)->order("order_id desc")->page($this->page, $this->limit)->select();
        $count = $OrderModel->where($where)->count();
        $datas = [];
        $order_shipping_status_mean = getMean("order_shipping_status");
        $prom_type = getMean('shop_prom_type');
        foreach ($list as $val) {
            $datas[] = [
                'order_id' => $val->order_id,
                'order_sn' => $val->order_sn,
                'name' => $val->name . ":" . $val->mobile,
                'shipping_price' => moneyFormat($val->shipping_price,true),
                'goods_price' => moneyFormat($val->goods_price,true),
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'pay_time' => $val->pay_time ? date("Y/m/d H:i:s", $val->pay_time) : '--',
                'shipping_time' => date("Y/m/d H:i:s", $val->shipping_time),
            ];
        }

        $this->datas = [
            'list' => [
                'list' => $datas,
                'limit' => $this->limit,
                'count' => $count,
            ],
            'status' => [
                'shipping_status_mean' => statusToMap($order_shipping_status_mean),
                'prom_type' => statusToMap($prom_type),
            ],
        ];
    }


    /**
     * 订单详情
     */
    public function detail()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $OrderAdminLogic = new OrderAdminLogic();
            $detail = $OrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->getOrderDetail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $order_status_mean = getMean("order_status");
        $order_shipping_status_mean = getMean("order_shipping_status");
        $order_pay_status_mean = getMean("order_pay_status");
        $pay_type_mean = getMean("order_payment_method");
        $prom_type = getMean('shop_prom_type');
        $orderGoods = [];
        $commission = 0;
        foreach ($detail->orderGoods as $val) {
            $orderGoods[] = [
                'order_id' => $val->order_id,
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'goods_num' => $val->goods_num,
                'bar_code' => $val->bar_code,
                'sku_type' => $val->sku_type,
                'goods_sn' => $val->goods_sn,
                'goods_price' => moneyFormat($val->goods_price, true),
                'vip_price' => moneyFormat($val->vip_price, true),
                'spec_key_name' => specKeyToArray($val->spec_key_name),
                'prom_type' => $val->prom_type,
                'goods_photo' => $val->goods_photo,
                'commission' => moneyFormat($val->commission),
                'count' => moneyFormat($val->goods_price * $val->goods_num, true),
                'vip_count' => moneyFormat($val->vip_price * $val->goods_num, true),
            ];
            $commission += $val->commission;
        }
        $user = [];
        if (!empty($detail->orderUser)) {
            $user = [
                'nickname' => $detail->orderUser->nickname,
                'user_id' => $detail->orderUser->user_id,
                'face' => $detail->orderUser->face,
                'mobile' => $detail->orderUser->mobile,
            ];
        }
        $this->datas['detail'] = [
            'order_id' => $detail->order_id,
            'order_sn' => $detail->order_sn,
            'user' => $user,
            'pay_price' => $detail->goods_price - $detail->coupon_price - $detail->youhui_price,
            'name' => $detail->name,
            'mobile' => $detail->mobile,
            'pay_type' => empty($pay_type_mean[$detail->pay_type]) ? '未知' : $pay_type_mean[$detail->pay_type],
            'order_status_mean' => empty($order_status_mean[$detail->order_status]) ? '未知' : $order_status_mean[$detail->order_status],
            'shipping_status_mean' => empty($order_shipping_status_mean[$detail->shipping_status]) ? '未知' : $order_shipping_status_mean[$detail->shipping_status],
            'pay_status_mean' => empty($order_pay_status_mean[$detail->pay_status]) ? '未知' : $order_pay_status_mean[$detail->pay_status],
            'device' => $detail->device,
            'order_status' => $detail->order_status,
            'shipping_status' => $detail->shipping_status,
            'pay_status' => $detail->pay_status,
            'prom_type_mean' => empty($prom_type[$detail->prom_type]) ? '' : $prom_type[$detail->prom_type],
            'add_time' => date("Y/m/d H:i:s", $detail->add_time),
            'pay_time' => empty($detail->pay_time) ? '-' : date("Y/m/d H:i:s", $detail->pay_time),
            'shipping_name' => $detail->shipping_name,
            'shipping_code' => $detail->shipping_code,
            'goods_price' => moneyFormat($detail->goods_price, true),
            'shipping_price' => moneyFormat($detail->shipping_price, true),
            'coupon_price' => moneyFormat($detail->coupon_price, true),
            'youhui_price' => moneyFormat($detail->youhui_price, true),
            'user_money' => moneyFormat($detail->user_money, true),
            'payment_money' => moneyFormat($detail->goods_price + $detail->shipping_price - $detail->coupon_price - $detail->youhui_price - $detail->user_money,true),
            'shipping_data' => $detail->shipping_data,
            'user_note' => $detail->user_note,
            'buy_role' => $detail->buy_role,
            'admin_note' => $detail->admin_note,
            'is_distribut' => $detail->is_distribut,
            'address' => $detail->address,
        ];
        $this->datas['goods'] = $orderGoods;

        //查询所有快递公司
        $ShippingModel = new ShippingModel();
        $shippingList =  $ShippingModel->where("app_id",$this->appId)->select();
        $shipping = [];
        $shipping_id = 0;
        foreach ($shippingList as $value){
            if($value->is_default == 1){
                $shipping_id = $value->shipping_id;
            }
            $shipping[] = [
                'shipping_id' => $value->shipping_id,
                'shipping_name' => $value->shipping_name,
                'is_default' =>  (int) $value->is_default,
            ];
        }
        $this->datas['shipping'] = $shipping;
        $this->datas['shipping_id'] = $shipping_id;
    }

    /**
     * 订单发货
     */
    public function delivery()
    {
        $orderId = (int)$this->request->param("order_id");
        $shippingId = (int) $this->request->param("shipping_id");
        $shippingNum = (string) $this->request->param("shipping_num");
        if(empty($shippingId) || empty($shippingNum)){
            $this->warning("信息错误");
        }
        try {
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->deliver($shippingId,$shippingNum);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }


}



