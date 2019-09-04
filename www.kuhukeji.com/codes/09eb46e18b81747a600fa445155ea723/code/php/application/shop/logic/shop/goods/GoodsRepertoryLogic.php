<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsrepertorylogModel;
use app\shop\model\shop\GoodsRepertoryModel;
use think\Exception;


/**
 * 商品逻辑定义 独立逻辑定义
 * Class CalculateModel
 * @package app\shop\model\shop
 */
class GoodsRepertoryLogic
{

    public function changeStock($goods_id,$spec_key,$goods_num,$type,$order_id=0,$order_sn='') {

        $type = (int)$type;
        $number = (int)$goods_num;

        $GoodsModel = new GoodsModel();
        if (!$goods = $GoodsModel->find($goods_id)) {
            throw new Exception("参数不正确！");
        }
        $GoodsrepertoryModel = new GoodsRepertoryModel();
        if (!$repertory = $GoodsrepertoryModel->where(['goods_id'=>$goods_id,'spec_key'=>$spec_key])->find()) {
            throw new Exception("库存不存在！");
        }

        if ($type <= 10) {   //出库(减库存)操作
            if ($number < 1) {
                throw new Exception("出库数量小于1！");
            }
            if ($repertory->goods_num - $number < 0) {
                throw new Exception("出库数量大于库存数量！");
            }

            $GoodsrepertoryModel->where(['repertory_id'=>$repertory->repertory_id])->setDec('goods_num',$number);
            $goods_num = $repertory->goods_num  - $number;
        } elseif ($type > 10 && $type <= 20) {  //入库(加库存)操作
            $GoodsrepertoryModel->where(['repertory_id'=>$repertory->repertory_id])->setInc('goods_num',$number);
            $goods_num = $repertory->goods_num  + $number;
        }

        $logdatas[] = [
            'app_id' => $repertory->app_id,
            'goods_id' => $repertory->goods_id,
            'goods_name' => $goods['goods_name'],
            'sku_type' => $repertory->sku_type,
            'spec_key' => $repertory->spec_key,
            'key_name' => $repertory->key_name,
            'order_sn' => $order_sn,
            'order_id' => $order_id,
            'stock' => $number,
            'change_type' => $type,
            'photo' => $goods['photo'],
            'goods_sn' => $goods['goods_sn'],
            'bar_code' => $goods['bar_code'],
            'this_stock' => $goods_num,
        ];
        //写LOG
        $GoodsrepertorylogModel = new GoodsrepertorylogModel();
        $GoodsrepertorylogModel->save($logdatas);
    }




    public function batchChangeStock ($repertorys,$repertoryIds,$goods,$goodIds,$type,$number,$order_sn='',$order_id=0) {
        $type = (int)$type;
        $number = (int)$number;
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        if ($type <= 10) {   //出库(减库存)操作
            if ($number < 1) {
                throw new Exception("出库数量小于1！");
            }
            foreach ($repertorys as $v) {
                if ($v->goods_num - $number < 0) {
                    throw new Exception("出库数量大于库存数量！");
                }
            }

            $GoodsRepertoryModel->where(['repertory_id'=>['in',$repertoryIds]])->setDec('goods_num',$number);
        } elseif ($type > 10 && $type <= 20) {  //入库(加库存)操作
            $GoodsRepertoryModel->where(['repertory_id'=>['in',$repertoryIds]])->setInc('goods_num',$number);
        }

        foreach ($repertorys as $v) {
            $logdatas[] = [
                'app_id' => $v->app_id,
                'goods_id' => $v->goods_id,
                'goods_name' => $goods[$v->goods_id]['goods_name'],
                'sku_type' => $v->sku_type,
                'spec_key' => $v->spec_key,
                'key_name' => $v->key_name,
                'order_sn' => $order_sn,
                'order_id' => $order_id,
                'stock' => $number,
                'change_type' => $type,
                'photo' => $v->photo,
                'goods_sn' => $v->goods_sn,
                'bar_code' => $v->bar_code,
                'this_stock' => $v->goods_num,
            ];
        }
        //写LOG
        $GoodsrepertorylogModel = new GoodsrepertorylogModel();
        $GoodsrepertorylogModel->saveAll($logdatas);
    }

}
