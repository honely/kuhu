<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\goods\GoodsRepertoryLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\CouponLogic;
use app\shop\logic\shop\user\UserMoneyLogic;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\OrderRejectModel;

use app\shop\model\shop\UserModel;
use think\Exception;


/**
 * 订单退货及取消处理逻辑
 * Class OrderRejectLogic
 * @package app\shop\logic\shop\order
 */
class OrderRejectLogic
{
    private $order;
    //用户ID
    private $userId;
    //订单ID
    private $orderId;
    //订单Model
    private $orderModel;
    //订单总共付款
    private $money;
    //退款申请ID
    private $reject_id;

    /**
     * 初始化,查询订单
     */
    public function __construct($orderId,$userId)
    {
        $OrderModel = new OrderModel();
        if (!$order = $OrderModel->find($orderId)) {
            throw new Exception("参数错误，订单不存在！");
        };
        if ($order->user_id != $userId) {
            throw new Exception("参数错误，订单不存在！");
        }
        $this->order = $order;
        $this->orderId = $orderId;
        $this->userId = $userId;
        $this->orderModel = $OrderModel;
        $this->money = $order->shipping_price + $order->goods_price - $order->coupon_price - $order->youhui_price;
    }


    /**
     * 返回订单信息
     */
    public function getOrder() {
        return $this->order;
    }


    /**
     * 检查是否能退款
     */
    public function checkCanRefund() {
        if ($this->order->pay_status != 2) {
            throw new Exception('订单尚未申请退款!');
        }
        if ($this->order->order_status > 2) {
            throw new Exception('订单状态不支持退款!');
        }
        $array_map = [
            0,
            getMean('order_payment_method','key')['yezf'],
            getMean('order_payment_method','key')['htbjzf'],
        ];
        if ($this->order->pay_info == '' && !in_array($this->order->pay_type,$array_map)) {
            throw new Exception('支付信息不正确!');
        }
        return $this;
    }

    /**
     * 回退库存
     */
    public function returnRepertory() {
        $OrderGoodsModel = new OrderGoodsModel();
        $GoodsRepertoryLogic = new GoodsRepertoryLogic();
        $order_goods_tmp = $OrderGoodsModel->where(['order_id'=>$this->order->order_id])->select();
        foreach ($order_goods_tmp as $v) {
            try {
                $GoodsRepertoryLogic->changeStock($v->goods_id,$v->spec_key,$v->goods_num,getMean('shop_stock_change_type','key')['thrk'],$order_id=0);
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        }
        return $this;
    }


    /**
     * 回退优惠券
     */
    public function returnUserCoupon($is_coupon) {
        if ($is_coupon == 1) {
            if ($this->order->user_coupon_id) {
                $CouponLogic = new CouponLogic();
                $CouponLogic->returnUserCoupon($this->order->user_coupon_id);
            }
        }
        return $this;
    }


    /**
     * 回退用户余额
     */
    public function returnUserMoney($money,$type)
    {
        if ($money > 0) {
            $UserModel = new UserModel();
            $UserModel->findUser($this->userId);
            if (!$UserModel->userMoney($money,$type)) {
                throw new Exception($UserModel->getError());
            }
        }
        return $this;
    }



    /**
     * 回退在线支付款
     */
    public function returnOnlinePayment($money) {
        if ($money == 0) {
            return $this;
        };
        //重置设备  1微信支付 2支付宝支付 3百度支付（聚合） 4.余额支付 5.H5微信支付 6.H5支付宝 7头条支付（支付宝） 8 后台标记支付
        $payTyppe = [
            1 => 'weixin',
            2 => 'ali',
            3 => 'baidu',
            5 => 'weixin',
            6 => 'ali',
            7 => 'ali',
        ];
        if(empty($payTyppe[$this->order->pay_type])){
            return $this;
        }
        $paramObj = \Qiniu\json_decode($this->order->pay_info);
        $paramObj->mobey = $money;
        $res = Miniapp::makeModule($payTyppe[$this->order->pay_type],$this->order->app_id)->refund($money);
        if($res == false){
            $OrderRejectModel = new OrderRejectModel();
            if (false == $OrderRejectModel->isUpdate(true)->save(['refuse_reason'=>'在线支付回退失败','reject_status'=>2], ['reject_id' => $this->reject_id])) {
                throw new Exception('在线支付回退失败!');
            }
        }
        return $this;
    }


    /**
     * 同意订单退款
     * @param $money int  同意退款多少钱,优先退还账户余额
     */
    public function agreeRejectOrder($reject_id,$is_usermoney,$_usermoney,$is_payment_price,$_payment_price) {
        $this->reject_id = $reject_id;
        if ($is_usermoney && $_usermoney > $this->order->user_money) {
            throw new Exception("不得回退超过支付订单时用余额的金额");
        }
        if ($is_payment_price && $_payment_price > $this->order->payment_price) {
            throw new Exception("不得回退超过支付订单时在线支付的金额");
        }
        if ($is_payment_price && $_payment_price < 1) {
            throw new Exception("在线退款至少退款0.01元");
        }
        $usermoney = $payment_price = 0;
        if ($is_usermoney && $_usermoney) {
            $usermoney = $_usermoney;
        }
        if ($is_payment_price && $_payment_price) {
            $payment_price = $_payment_price;
        }
        //在线支付要退多少
        try {
            if ($usermoney) {
                $this->returnUserMoney($usermoney,getMean('user_money_type','key')['tk']);
            }
            if ($payment_price) {
                $this->returnOnlinePayment($payment_price);
            }
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }

        $this->orderModel->isUpdate(true)->save(['pay_status'=>3,'order_status'=>5],['order_id'=>$this->orderId]);
        $OrderRejectModel = new OrderRejectModel();
        $OrderRejectModel->isUpdate(true)->save(['reject_status'=>1],['reject_id'=>$reject_id]);
        return $this;
    }

    /**
     * 拒绝订单退款
     */
    public function  refuseRejectOrder($reject_id,$reason) {
        if (false == $this->orderModel->isUpdate(true)->save(['pay_status'=>getMean('order_pay_status', 'key')['jjtk']],['order_id'=>$this->orderId])) {
            throw new Exception('订单状态更新失败!');
        }
        $OrderRejectModel = new OrderRejectModel();
        if (false == $OrderRejectModel->isUpdate(true)->save(['refuse_reason'=>$reason,'reject_status'=>2], ['reject_id' => $reject_id])) {
            throw new Exception('退款申请状态更新失败!');
        }
        return $this;
    }



    /**
     * 检查是否能退款
     */
    public function cancelReject() {
        if ($this->order->pay_status != 2) {
            throw new Exception('订单尚未申请退款!');
        }
        if ($this->order->order_status > 2) {
            throw new Exception('订单状态不支持退款!');
        }
        if (false == $this->orderModel->isUpdate(true)->save(['pay_status'=>getMean('order_pay_status', 'key')['yzf']],['order_id'=>$this->orderId])) {
            throw new Exception('订单状态更新失败!');
        }
        $OrderRejectModel = new OrderRejectModel();
        if (!$reject = $OrderRejectModel->where(['user_id'=>$this->order->user_id,'reject_status'=>0])->order('reject_id desc')->find()) {
            throw new Exception('没有未处理的退款申请!');
        }
        if (false == $OrderRejectModel->isUpdate(true)->save(['refuse_reason'=>'用户取消申请','reject_status'=>2], ['reject_id' => $reject->reject_id])) {
            throw new Exception('退款申请状态更新失败!');
        }
        return $this;
    }

}
