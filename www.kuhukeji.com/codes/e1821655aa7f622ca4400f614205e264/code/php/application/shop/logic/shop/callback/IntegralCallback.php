<?php

namespace app\shop\logic\shop\callback;


use app\shop\logic\shop\order\IntegralOrderAdminLogic;
use app\shop\model\shop\IntegralGoodsModel;
use think\Exception;

class IntegralCallback
{


    /**
     * 抢购与商城与砍价 调用此回调
     * GoodsCallback constructor.
     * @param $orderId
     * @param $appId
     * @param $payType
     * @param $orderInfo
     * @throws \Exception
     */
    public function __construct($orderId,$appId,$payType,$orderInfo)
    {
        try{
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $order = $IntegralOrderAdminLogic->setOrderId($orderId)
                                      ->setAppId($appId)
                                      ->getOrderDetail();
            $IntegralOrderAdminLogic->payCallback($payType,$orderInfo);
            $IntegralGoodsModel = new IntegralGoodsModel();
            $IntegralGoodsModel->where(['goods_id'=>$order->goods_id])->setInc('sales_sum',1);
            $IntegralGoodsModel->where(['goods_id'=>$order->goods_id])->setDec('goods_num',1);
        }catch (Exception $exception){
            \exception($exception->getMessage());
        }

    }




    /**
     * @return bool
     * @throws Exception
     */
    public function getResult()
    {
        return true;
    }
}
