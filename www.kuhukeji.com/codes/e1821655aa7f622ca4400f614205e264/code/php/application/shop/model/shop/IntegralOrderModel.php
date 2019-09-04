<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class IntegralOrderModel extends CommonModel
{
    protected $pk = 'order_id';
    protected $name = 'app_shop_integral_order';
    protected $insert = ["add_time", "add_ip"];



    /**
     * IntegralOrderModel
     * @return \think\model\relation\HasMany
     */
    public function orderGoods()
    {
        return $this->hasMany('IntegralOrderModel', 'order_id', 'order_id');
    }

    /**
     * 获取用户信息
     * @return \think\model\relation\HasMany
     */
    public function orderUser()
    {
        return $this->belongsTo('UserModel', 'user_id', 'user_id')->field("*");
    }


    /**
     * 获取订单发货单
     * @return
     */
    public function DeliveryDoc()
    {
        return $this->hasMany('DeliveryModel', 'order_id', 'order_id');
    }


    public function getOrderStatusDetailAttr($value, $data)
    {
        $order_status_map = [
            "DFK" =>  ['order_type' => 0, 'order_type_mean' => '待付款'],
            "DFH" =>  ['order_type' => 1, 'order_type_mean' => '待发货'],
            "DSH" =>  ['order_type' => 2, 'order_type_mean' => '待收货'],
            "YQX" =>  ['order_type' => 3, 'order_type_mean' => '已取消'],
            "YWC" =>  ['order_type' => 4, 'order_type_mean' => '已完成'],
            "YZF" =>  ['order_type' => 5, 'order_type_mean' => '已关闭'],
            "SQTK" => ['order_type' => 6, 'order_type_mean' => '申请退款中'],
            "JJTK" => ['order_type' => 7, 'order_type_mean' => '商家拒绝退款'],
            "YTK" =>  ['order_type' => 8, 'order_type_mean' => '已退款'],
            "WZ" =>   ['order_type' => -1, 'order_type_mean' => '未知状态'],
        ];
        $time = request()->time();
        //待支付
        if ($data['pay_status'] == 0  && $data['order_status'] == 0 && $data['end_time'] > $time) {
            return $order_status_map['DFK']; //'待支付',
        }
        //已作废
        if(($data['pay_status'] == 0   && $data['end_time'] < $time) || $data['order_status'] == 5){
            return $order_status_map['YZF'];
        }
        //待发货
        if ($data['pay_status'] == 1 &&  ($data['shipping_status'] == 0) && ($data['order_status'] == 0)) {
            return $order_status_map['DFH'];
        }
        //待收货
        if ( $data['pay_status'] == 1 && ($data['shipping_status'] == 1) && ($data['order_status'] == 1)) {
            return $order_status_map['DSH'];
        }
        //已完成
        if ($data['pay_status'] == 1 && $data['order_status'] == 2){
            return $order_status_map["YWC"];
        }

        //申请退款
        if($data['pay_status'] == 2){
            return $order_status_map["SQTK"];
        }
        //已退款
        if($data['pay_status'] == 3){
            return $order_status_map["YTK"];
        }
        //拒绝退款
        if($data['pay_status'] == 4){
            return $order_status_map["JJTK"];
        }
        //未知状态
        return $order_status_map["WZ"];
    }


    /**
     * 获取物流单号
     * @param $orderId int 订单
     * @return string 订单号
     * todo：未完成
     */
    public function getShippingNum($orderId){
        return "75135418624016";
    }

}
