<?php

namespace app\shop\logic\shop\goods;

use app\shop\model\shop\CartModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use think\Exception;

class CartLogic
{

    //购物车的商品
    private $catGoods;
    //用户ID
    private $userId;
    private $appId;

    public function __construct($userId, $appId)
    {
        $this->userId = $userId;
        $this->appId = $appId;
    }

    public function getGoodsById()
    {

    }

    /**
     * 获得购物车商品
     */
    public function getCartGoods()
    {
        $CartModel = new CartModel();
        $this->catGoods = $CartModel->where("user_id", $this->userId)
            ->where("is_pay", 0)
            ->where("is_delete", 0)
            ->where("selected", 1)->select();

    }

    /**
     * 将购物车商品车商品并处理
     * @param $catGoods ['goods_id'=>1,'key'=>'','sku_type'=>0,'num'=>1]
     * @return array
     * @throws Exception
     *
     */
    public function getGoodsData()
    {
        $catGoods = $this->catGoods;
        if (empty($catGoods)) throw new Exception("购物车没有任何产品");
        $goodsIds = $skuGoodsNum = $noSkuGoodsNum = [];
        foreach ($catGoods as $val) {
            $goodsIds[$val['goods_id']] = $val['goods_id'];
            if ($val['sku_type'] == 0) {
                $noSkuGoodsNum[$val['goods_id']] = $val['goods_num'];
            } else {
                $skuGoodsNum[$val['spec_key']] = $val['goods_num'];
            }
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);

        foreach ($goods as $val) {
            if ($val->is_delete == 1 || $val->is_online == 0 || $val->app_id != $this->appId) {
                throw  new Exception("抱歉：{$val->goods_name}，已下架");
            }
        }

        //分离多规格 和 单规格产品
        $skuGoods = $noSkuGoods = [];

        $GoodsRepertoryModel = new GoodsRepertoryModel();

        $repertory = $GoodsRepertoryModel->whereIn("goods_id", $goodsIds)->select();
        foreach ($repertory as $val) {
            if ($val->sku_type == 0) {
                $noSkuGoods[$val->goods_id] = $val;
            } elseif ($val->sku_type == 1) {
                $skuGoods[$val->spec_key] = $val;
            }
        }
        $returnData = [];
        foreach ($catGoods as $val) {
            if (empty($goods[$val['goods_id']])) {
                throw new Exception("计算错误请重新下单");
            }
            //可变模型
            $skuTypeName = $val['sku_type'] == 0 ? $noSkuGoods : $skuGoods;
            $skuTypeNameKey = $val['sku_type'] == 0 ? $val['goods_id'] : $val["spec_key"];
            //计算库存
            if ($val['sku_type'] == 0) {
                $num = empty($noSkuGoodsNum[$skuTypeNameKey]) ? 0 : $noSkuGoodsNum[$skuTypeNameKey];
            } elseif ($val['sku_type'] == 1) {
                $num = empty($skuGoodsNum[$skuTypeNameKey]) ? 0 : $skuGoodsNum[$skuTypeNameKey];
            }
            //验证产品是否数据正确
            $_skuGoods = $skuTypeName;
            if (empty($_skuGoods[$skuTypeNameKey])) throw new Exception("数据异常 请重新下单");
            if ($_skuGoods[$skuTypeNameKey]->goods_num < $num || $num <= 0) {
                if (empty($_skuGoods[$skuTypeNameKey])) throw new Exception("{$goods[$val['goods_id']]->goods_name}库存不足");
            }
            $photo = $_skuGoods[$skuTypeNameKey]->photo;
            $price = $_skuGoods[$skuTypeNameKey]->shop_price;
            $bar_code = $_skuGoods[$skuTypeNameKey]->bar_code;
            $returnData[] = [
                'app_id' => $goods[$val['goods_id']]->app_id,
                'goods_id' => $val['goods_id'],
                'goods_name' => $goods[$val['goods_id']]->goods_name,
                'goods_sn' => $goods[$val['goods_id']]->goods_sn,
                'bar_code' => $bar_code,
                'is_coupon' => $goods[$val['goods_id']]->is_coupon,
                'cat_id' => $goods[$val['goods_id']]->cat_id,
                'p_cat_id' => $goods[$val['goods_id']]->p_cat_id,
                'goods_img' => $val['sku_type'] == 1 ? $photo : $goods[$val['goods_id']]->photo,
                'spec_key' => $_skuGoods[$skuTypeNameKey]->spec_key,
                'key_name' => $_skuGoods[$skuTypeNameKey]->key_name,
                'sku_type' => $val['sku_type'],
                'is_plus_vip' => $goods[$val['goods_id']]->is_plus_vip,
                'goods_num' => $num,
                'price' => $price,
                'is_free_shipping' => $goods[$val['goods_id']]->is_free_shipping,
                'prom_id' => $goods[$val['goods_id']]->prom_id,
                'prom_type' => $goods[$val['goods_id']]->prom_type,
                'weight' => $goods[$val['goods_id']]->weight,
                'freight_template_id' => $goods[$val['goods_id']]->freight_template_id,
                'vip_price' => $goods[$val['goods_id']]->is_plus_vip == 1 ? $_skuGoods[$skuTypeNameKey]->plus_vip_price : $price,
                'commission' => $goods[$val['goods_id']]->is_commission == 1 ? $_skuGoods[$skuTypeNameKey]->commission : 0,
            ];
        }
        return $returnData;
    }

    /**
     * 清空购物车的商品
     */
    public function clearCartSelectGoods($userId)
    {
        $CartModel = new CartModel();
        $CartModel->where("selected", 1)
            ->where("user_id", $userId)
            ->where("is_delete", 0)
            ->update(['is_pay' => 1]);
    }

}
