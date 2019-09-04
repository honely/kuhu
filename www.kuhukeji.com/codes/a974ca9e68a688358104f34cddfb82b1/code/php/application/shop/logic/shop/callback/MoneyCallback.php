<?php

namespace app\shop\logic\shop\callback;


use Alipay\Request\AlipayCommerceAirXfgDsgModifyRequest;
use app\shop\logic\shop\goods\GroupItemLogic;
use app\shop\logic\shop\order\DeliveryLogic;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\RechargeModel;
use app\shop\model\shop\UserModel;
use think\Exception;


class MoneyCallback
{

    /**
     * 充值回调
     */
    public function __construct($orderId, $appId, $payType, $orderInfo)
    {
        $RechargeModel = new RechargeModel();
        $detail =  $RechargeModel->find($orderId);
        if(empty($detail)){
            \exception("失效");
        }
        if($detail->is_pay == 1){
            \exception("已支付");
        }
        $detail->is_pay = 1;
        $detail->save();
        $UserModel = new UserModel();
        $UserModel->userMoney($detail->money,getMean("user_money_type")['cz']);
    }

    //必有的
    public function getResult()
    {
        return true;
    }

}
