<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class IntegralGoodsRepertoryModel extends CommonModel{
    protected $pk = 'repertory_id';
    protected $name = 'app_shop_integral_goods_repertory';

    public function changeStock($repertorys,$repertoryIds,$goods,$goodIds,$type,$number,$order_sn='',$order_id=0) {

        $type = (int)$type;
        $number = (int)$number;

        if ($type <= 10) {   //出库(减库存)操作
            if ($number < 1) {
                $this->error = '出库数量小于1！';
                return false;
            }
            foreach ($repertorys as $v) {
                if ($v->store_count - $number < 0) {
                    $this->error = '出库数量大于库存数量！';
                    return false;
                }
            }
            $this->where(['repertory_id'=>['in',$repertoryIds]])->setDec('store_count',$number);
        } elseif ($type > 10 && $type <= 20) {  //入库(加库存)操作
            $this->where(['repertory_id'=>['in',$repertoryIds]])->setInc('store_count',$number);
        }

        foreach ($repertorys as $v) {
            $logdatas[] = [
                'app_id' => $v->app_id,
                'goods_id' => $v->goods_id,
                'goods_name' => $goods[$v->goods_id]['goods_name'],
                'sku' => $v->sku,
                'sku_type' => $v->sku_type,
                'key' => $v->key,
                'key_name' => $v->key_name,
                'order_sn' => $order_sn,
                'order_id' => $order_id,
                'stock' => $number,
                'change_type' => $type,
            ];
        }
        //写LOG
        $GoodsrepertorylogModel = new GoodsrepertorylogModel();
        $GoodsrepertorylogModel->saveAll($logdatas);
    }





}

