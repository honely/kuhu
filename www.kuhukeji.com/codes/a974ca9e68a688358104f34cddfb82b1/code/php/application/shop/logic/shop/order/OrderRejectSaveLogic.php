<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\goods\GoodsRepertoryLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\CouponLogic;
use app\shop\logic\shop\user\UserMoneyLogic;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\OrderRejectModel;

use think\Exception;


/**
 * 订单退货及取消处理逻辑
 * Class OrderRejectSaveLogic
 * @package app\shop\logic\shop\order
 */
class OrderRejectSaveLogic extends OrderSaveLogic
{

    private $orderId;


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
        return true;
    }


    /**
     * 回退优惠券
     */
    public function returnUserCoupon() {
        if (!$this->order->user_coupon_id) {
            return true;
        }
        $CouponLogic = new CouponLogic();
        $CouponLogic->returnUserCoupon($this->order->user_coupon_id);
        return true;
    }


    /**
     * 回退用户余额
     */
    public function returnUserMoney($money,$type)
    {
//        if ($money == 0) {
//            return true;
//        }
//        try {
////            $UserMoneyLogic = new UserMoneyLogic($this->userId);
////            $res =  $UserMoneyLogic->changeUserMoney($money,$type,$order_id=0);
//        } catch (Exception $exception) {
//            throw new Exception($exception->getMessage());
//        }
//
//        if($res == false){
//            $this->errr = $UserMoneyLogic->getUserMoney();
//        }
//        return true;
    }



    /**
     * 回退在线支付款
     */
    public function returnOnlinePayment($money) {
        if ($money == 0) {
            return true;
        };
        Miniapp::makeModule($this->order->pay_type,$this->order->app_id)->createOrder($money);
        return true;
    }


    /**
     * 同意订单退款
     * @param $money int  同意退款多少钱,优先退还账户余额
     */
    public function agreeRejectOrder($money,$reject_id) {
        //在线支付要退多少
        $tui_payment_money = $money - $this->order->user_money > 0 ? $money - $this->order->user_money : 0;
        //余额要退多少
        $tui_user_money = $this->order->user_money > $money ? $money : $this->order->user_money;
        try {
            $this->returnUserMoney($tui_user_money,getMean('user_money_type','key')['tk']);
            $this->returnOnlinePayment($tui_payment_money,getMean('user_money_type','key')['tk']);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }
//        $this->orderModel->isUpdate(true)->save(['pay_status'=>3,'order_status'=>5],['order_id'=>$this->orderId]);
        $OrderRejectModel = new OrderRejectModel();
        $OrderRejectModel->isUpdate(true)->save(['reject_status'=>1],['reject_id'=>$reject_id]);
    }

//    /**
//     * 拒绝订单退款
//     */
//    public function refuseRejectOrder($reject_id) {
//        $this->orderModel->isUpdate(true)->save(['pay_status'=>4],['reject_id'=>$reject_id]);
//    }

}
