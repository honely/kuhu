<?php

namespace app\shop\logic\shop\callback;


use app\shop\logic\shop\goods\GroupItemLogic;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\VipOrderModel;
use think\Exception;


class VipCallback
{

    /**
     * 会员购买回调
     * GroupBuyCallback constructor.
     */
    public function __construct($orderId, $appId, $payType, $orderInfo)
    {
        $VipOrderModel = new VipOrderModel();
        $detail = $VipOrderModel->find($orderId);
        if(empty($detail) || $detail->is_pay == 1){
            \exception("已失效");
        }
        $detail->is_pay = 1;
        $detail->save();
        $detail->pay_type = $payType;
        $detail->pay_info = json_encode($orderInfo);
        $UserModel = new UserModel();
        $UserModel->findUser($detail->user_id);
        $user = $UserModel->getUser();
        $user->plus_vip_time = $UserModel->checkVip() ? $user->plus_vip_time + $detail->pay_time : $detail->pay_time + time();
        $user->save();
    }

    //必有的
    public function getResult()
    {
        return true;
    }


}
