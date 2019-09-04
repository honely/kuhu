<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsrepertorylogModel;
use app\shop\model\shop\GoodsRepertoryModel;

class StockLogic
{


    /**
     * 订单出库
     * @param $goods array [
     *      goods_id,
     *      goods_num,
     *      spec_key,
     *      goods_id,
     * ];
     * @param int $type
     */
    public function StockOut($goods, $type = 0)
    {
        $skuGoods = $noSkuGoods = $goodsIds = [];
        foreach ($goods as $val) {
            $goodsIds[$val['goods_id']] = $val['goods_id'];
            $skuGoods[$val['spec_key']] = $val;
            $noSkuGoods[$val['goods_id']] = $val;
        }
        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $repertory = $GoodsRepertoryModel->whereIn("goods_id", $goodsIds)->select();
        $updateData = $logData = [];
        foreach ($repertory as $val) {
            if ($val->sku_type == 1 && empty($skuGoods[$val['spec_key']]['goods_num'])) {
                continue;
            }
            if ($val->sku_type == 0 && empty($skuGoods[$val['goods_id']]['goods_num'])) {
                continue;
            }
            $num = $val->sku_type == 1 ? $skuGoods[$val['spec_key']]['goods_num'] : $skuGoods[$val['goods_id']]['goods_num'];
            $updateData[] = [
                'repertory_id' => $val->repertory_id,
                'goods_num' => $val->goods_num - $num <= 0 ? 0 : $val->goods_num - $num,
            ];
            $logData[] = [
                'app_id' => $val->app_id,
                'goods_id' => $val->goods_id,
                'change_type' => 1,
                'spec_key' => $val->spec_key,
                'key_name' => $val->key_name,
                'sku_type' => $val->sku_type,
                'photo' => empty($val->photo) ? $goods[$val->goods_id]->photo : $val->photo,
                'bar_code' => $val->bar_code,
                'stock' => $num,
                'this_stock' => $val->goods_num - $num <= 0 ? 0 : $val->goods_num - $num,
                'goods_sn' => $goods[$val->goods_id]->goods_sn,
                'goods_name' => $goods[$val->goods_id]->goods_name,
            ];
        }

        $GoodsRepertoryModel->saveAll($updateData);
        $GoodsrepertorylogModel = new GoodsrepertorylogModel();
        $GoodsrepertorylogModel->saveAll($logData);
    }

    /**
     * 订单出库
     */
    public function StockIn()
    {

    }


}
