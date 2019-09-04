<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\UserMoneyLogic;
use app\shop\model\shop\IntegralGoodsModel;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\UserIntegralModel;
use think\Exception;


/**
 * 订单退货及取消处理逻辑
 * Class OrderRejectSaveLogic
 * @package app\shop\logic\shop\order
 */
class IntegralOrderRejectLogic
{
    private $order;
    //用户ID
    private $userId;
    //订单Model
    private $IntegralOrderModel;
    //
    private $error;

    /**
     * 初始化,查询订单
     */
    public function __construct($orderId,$userId)
    {
        $IntegralOrderModel = new IntegralOrderModel();
        if (!$order = $IntegralOrderModel->find($orderId)) {
            throw new Exception('参数错误，订单不存在！');
        };
        if ($order->user_id != $userId) {

            throw new Exception('参数错误，订单不存在！');
        }
        $this->order = $order;
        $this->orderId = $orderId;
        $this->userId = $userId;
        $this->IntegralOrderModel = $IntegralOrderModel;
    }


    public function getError() {
        return $this->error;
    }


    /**
     * 回退库存
     */
    public function returnRepertory() {
        $IntegralGoodsModel = new IntegralGoodsModel();
        $IntegralGoodsModel->where(['goods_id'=>$this->order->goods_id])->setInc('goods_num');
        $IntegralGoodsModel->where(['goods_id'=>$this->order->goods_id])->setDec('sales_sum');
        return $this;
    }


    /**
     * 回退用户余额
     */
    public function returnUserMoney($money=0,$type)
    {
        if ($money == 0) {
            $money = $this->order->shop_price + $this->order->shipping_price;
        }
        try {
            $UserMoneyLogic = new UserMoneyLogic($this->userId);
            $UserMoneyLogic->changeUserMoney($money,$type,$order_id=0);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
        return $this;
    }



    /**
     * 回退在线支付款
     */
    public function returnOnlinePayment($money) {
        if ($money == 0) {
            return true;
        }

        Miniapp::makeModule($this->order->pay_type,$this->order->app_id)->refund($money);
        return $this;
    }


    /**
     * 回退积分
     */
    public function returnUserIntegral($integral = 0) {
        if ($integral == 0) {
            $integral = $this->order->integral;
        }

        $UserIntegralModel = new UserIntegralModel();
        $expire_time = time();
        if ($time_tmp = $UserIntegralModel->where(['user_id'=>$this->userId,'expire_time'=>['>',time()]])->order('expire_time asc')->find()) {
            $expire_time = $time_tmp['expire_time'];
        }
        $UserIntegralModel->addGold($this->order->app_id,$this->userId,$integral,getMean('integral_log_type','key')['xtth'],$beishu=1,$expire_time);
        return $this;
    }




    /**
     * 取消订单(未确认、未发货)，直接取消订单
     */
    public function cancelOrder($reason) {
        if ($this->order->order_status > 1) {
            throw new Exception('当前订单状态不支持取消！');
        }
        if ($this->order->shipping_status > 0) {
            throw new Exception('当前订单状态不支持取消！');
        }
        if ($this->order->pay_status > 1) {
            throw new Exception('当前订单状态不支持取消！');
        }
        $this->IntegralOrderModel->isUpdate(true)->save(['order_status'=>getMean('integral_order_status','key')['yqx'],'cancel_reason'=>$reason,'cancel_time'=>time()],['order_id'=>$this->orderId]);
        return $this;
    }


}
