<?php

namespace app\shop\logic\shop\callback;


use app\shop\logic\shop\goods\GroupItemLogic;
use app\shop\model\shop\GroupBuyItemJoinModel;
use app\shop\model\shop\GroupBuyItemModel;
use think\Exception;


class GroupBuyCallback
{

    /**
     * 拼团回调
     * GroupBuyCallback constructor.
     * @param $orderId
     * @param $appId
     * @param $payType
     * @param $orderInfo
     * @throws Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function __construct($orderId, $appId, $payType, $orderInfo)
    {
        $GroupBuyItemJoinModel = new GroupBuyItemJoinModel();
        $join = $GroupBuyItemJoinModel->find($orderId);
        $GroupItemLogic = new GroupItemLogic();
        $GroupItemLogic->setItemId($join->groupbuy_item_id)->checkItem(false);
        $item = $GroupItemLogic->getItem();
        if ($item->is_pay == 1) {
            \exception("已结束");
        }
        $item->is_pay = 1;
        $item->save();
        //是否是开团
        if ($item->user_id != $join->user_id) {
            $GroupItemLogic->setTuanNum();
        }
        $join->is_pay = 1;
        $join->pay_info = json_encode($orderInfo);
        $join->pay_type = $payType;
        $join->save();
    }

    //必有的
    public function getResult()
    {
        return true;
    }


}
