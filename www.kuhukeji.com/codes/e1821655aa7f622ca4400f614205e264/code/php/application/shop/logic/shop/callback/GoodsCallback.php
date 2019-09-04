<?php

namespace app\shop\logic\shop\callback;

use app\shop\logic\shop\goods\RushBuyLogic;
use app\shop\logic\shop\goods\StockLogic;
use app\shop\logic\shop\order\OrderAdminLogic;
use think\Exception;

class GoodsCallback
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
            $OrderAdminLogic = new OrderAdminLogic();
            $order =  $OrderAdminLogic->setOrderId($orderId)
                                      ->setAppId($appId)
                                      ->getOrderDetail();

            $OrderAdminLogic->payCallback($payType,$orderInfo);
            $stockGoods = [];
            if($order->pay_status == 0) {
                foreach ($order->orderGoods as $val) {
                    $stockGoods[] = [
                        'goods_id' => $val['goods_id'],
                        'spec_key' => $val['spec_key'],
                        'sku_type' => $val['sku_type'],
                        'goods_num' => $val['goods_num'],
                    ];
                    if ($order->prom_type == getMean('shop_prom_type','k')['qg']) {
                        $RushBuyLogic = new RushBuyLogic();
                        try {
                            $RushBuyLogic->setRushGoods($val['goods_id'])->setDecGoodsNum($val['goods_num'],$val['goods_id'],$order->prom_id);
                        } catch (Exception $exception) {
                            \exception($exception->getMessage());
                        }
                    }
                }
                (new StockLogic())->StockOut($stockGoods);
            }
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
