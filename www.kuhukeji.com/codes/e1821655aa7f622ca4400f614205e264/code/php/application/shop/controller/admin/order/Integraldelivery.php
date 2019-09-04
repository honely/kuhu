<?php

namespace app\shop\controller\admin\order;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\order\IntegralOrderAdminLogic;
use app\shop\logic\shop\order\OrderAdminLogic;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\ShippingModel;
use think\Exception;

class Integraldelivery extends Common
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
        //订单SN
        $order_sn = (string) $this->request->param('order_sn','');
        if ($order_sn) {
            $where['order_sn'] = $order_sn;
        }
        //收货人姓名
        $name = (string) $this->request->param('name','');
        if ($name) {
            $where['name'] = $name;
        }
        //收货人联系方式
        $mobile = (string) $this->request->param('mobile','');
        if ($mobile) {
            $where['mobile'] = $mobile;
        }

        $IntegralOrderModel = new IntegralOrderModel();
        $list = $IntegralOrderModel->where($where)->order("order_id desc")->page($this->page, $this->limit)->select();
        $count = $IntegralOrderModel->where($where)->count();

        $datas = [];
        $order_shipping_status_mean = getMean("order_shipping_status");
        foreach ($list as $val) {
            $datas[] = [
                'order_id' => $val->order_id,
                'order_sn' => $val->order_sn,
                'name' => $val->name . ":" . $val->mobile,
                'shipping_price' => moneyFormat($val->shipping_price,true),
                'shop_price' => moneyFormat($val->shop_price,true),
                'integral' => $val->integral,
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
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $detail = $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->getOrderDetail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $order_status_mean = getMean("order_status");
        $order_shipping_status_mean = getMean("order_shipping_status");
        $order_pay_status_mean = getMean("order_pay_status");
        $pay_type_mean = getMean("order_payment_method");

        $orderGoods[] = [
            'order_id' => $detail->order_id,
            'goods_id' => $detail->goods_id,
            'goods_name' => $detail->goods_name,
            'goods_num' => 1,
            'goods_sn' => $detail->goods_sn,
            'shop_price' => moneyFormat($detail->shop_price, true),
            'goods_photo' => $detail->photo,
        ];


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
            'pay_price' => $detail->shop_price,
            'name' => $detail->name,
            'mobile' => $detail->mobile,
            'pay_type' => empty($pay_type_mean[$detail->pay_type]) ? '未知' : $pay_type_mean[$detail->pay_type],
            'order_status_mean' => empty($order_status_mean[$detail->order_status]) ? '未知' : $order_status_mean[$detail->order_status],
            'shipping_status_mean' => empty($order_shipping_status_mean[$detail->shipping_status]) ? '未知' : $order_shipping_status_mean[$detail->shipping_status],
            'pay_status_mean' => empty($order_pay_status_mean[$detail->pay_status]) ? '未知' : $order_pay_status_mean[$detail->pay_status],
            'device' => (string)$detail->device,
            'order_status' => $detail->order_status,
            'shipping_status' => $detail->shipping_status,
            'pay_status' => $detail->pay_status,
            'add_time' => date("Y/m/d H:i:s", $detail->add_time),
            'pay_time' => empty($detail->pay_time) ? '-' : date("Y/m/d H:i:s", $detail->pay_time),
            'shipping_name' => $detail->shipping_name,
            'shipping_code' => $detail->shipping_code,
            'shop_price' => moneyFormat($detail->shop_price, true),
            'shipping_price' => moneyFormat($detail->shipping_price, true),
            'user_money' => moneyFormat($detail->user_money, true),
            'payment_money' => moneyFormat($detail->shop_price + $detail->shipping_price - $detail->user_money,true),
            'shipping_data' => (string)$detail->shipping_data,
            'user_note' => (string)$detail->user_note,
            'admin_note' => (string)$detail->admin_note,
            'address' => (string)$detail->address,
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
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->deliver($shippingId,$shippingNum);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }


}



