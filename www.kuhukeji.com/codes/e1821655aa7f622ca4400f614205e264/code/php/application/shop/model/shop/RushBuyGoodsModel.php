<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class RushBuyGoodsModel extends CommonModel
{
    protected $pk = 'rushbuy_goods_id';
    protected $name = 'app_shop_rushbuy_goods';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['goods_name', 'require|max:255', '抢购商品名称不能为空|抢购商品名称长度超过限制'],
        ['goods_id', '>:0|number', '请输入商品|商品必须是数字'],
        ['rushbuy_id', '>:0|number', '请输入抢购ID|抢购ID必须是数字'],
        ['rushbuy_price', '>:0|number', '请输入抢购价格|抢购价格必须是数字'],
        ['vip_rushbuy_price', 'require|number', '请输入VIP会员抢购价格|VIP会员抢购价格必须是数字'],
        ['is_vip', 'require|number', 'VIP会员专享价|VIP会员专享价必须是数字'],
        ['spec', 'require', '规格必须选择'],
        ['buy_limit', 'number', '每人限购数必须是数字'],
        //['buy_num', '>:0|number', '请输入需要数量|数量必须是数字'],
        //['goods_num', '>:0|number', '请输入需要抢购数量|数量必须是数字'],
        ['is_online', 'require|number', '请输入是否开启|是否开启必须是数字'],

    ];

    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "app_id" => (int) $appId,
            "goods_name" => (string)$request->param("goods_name", ""),//活动名称
            "goods_id" => (int)$request->param("goods_id", "0"),//商品
            "rushbuy_id" => (int)$request->param("rushbuy_id", "0"),//商品
            "rushbuy_price" => moneyToInt($request->param("rushbuy_price",0)),//商品
            "vip_rushbuy_price" => moneyToInt($request->param("vip_rushbuy_price", "0")),//商品
            "is_vip" => (int)($request->param("is_vip") == 1),//商品
            "spec" => (string) $request->param('spec','','SecurityEditorHtml'),
            "buy_limit" => (int)$request->param("buy_limit", "0"),//商品
            "orderby" => (int)$request->param("orderby", "0"),//商品
            "goods_num" => (int)$request->param("goods_num", "0"),//商品
            //"surplus_num" => (int)$request->param("surplus_num", "0"),//商品
            "is_online" => (int)($request->param("is_online") == 1),//商品
        ];
        return $param;
    }


    //验证商品以及库存数据
    public function checkGoods($param =[]){
        $GoodsModel = new GoodsModel();
        $detail =  $GoodsModel->find($param['goods_id']);
        if(empty($detail)){
            return false;
        }
        if($detail->app_id != $param['app_id']){
            return false;
        }

        if ($detail->prom_type != 0) {
            if ($detail->prom_type != getMean('shop_prom_type','key')['qg']) {
                $this->error = "该商品已参加其他活动 请重新选择产品";
                return false;
            }
        }

        if($detail->sku_type == 1){
            //验证spec
            $spec_key_tmp = json_decode($param['spec'],true);
            $spec_key = [];
            foreach ($spec_key_tmp as $v) {
                $spec_key[$v['spec_key']] = $v['spec_key'];
                $spec_tmp[$v['spec_key']] = $v;
            }

            if(empty($spec_key) && $detail->sku_type == 1){
                return false;
            }
            //$spec_key  =   array_flip($spec_key);
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $_specTmp = $GoodsRepertoryModel->where(['goods_id' => $param['goods_id']])->select();
            $resp_spec_tmp = [];
            foreach ($_specTmp as $v) {
                $resp_spec_tmp[$v->spec_key] = $v;
            }

            foreach ($spec_tmp as $v) {
                $spec[] = [
                    'repertory_id' => $v['repertory_id'],
                    'goods_id' => $param['goods_id'],
                    'spec_key' => $v['spec_key'],
                    'key_name' => $v['key_name'],
                    'sku_type' => $v['sku_type'],
                    'shop_price' => $v['shop_price'],
                    'market_price' => $v['market_price'],
                    'plus_vip_price' => $v['plus_vip_price'],
                    'goods_num' => $v['goods_num'],
                    'rushbuy_price' => isset($v['rushbuy_price']) ? $v['rushbuy_price'] : 0,
                    'vip_rushbuy_price' => isset($v['vip_rushbuy_price']) ? $v['vip_rushbuy_price'] : 0,
                    'photo' => $v['photo'],
                ];
            }

//            foreach ($spec_key as $val) {
//                if(!isset($resp_spec_tmp[$val])){
//                    return false;
//                }
//                if($resp_spec_tmp[$val]['goods_num'] == 0){
//                    return false;
//                }
//            }

        } else {
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $_specTmp = $GoodsRepertoryModel->where(['goods_id' => $param['goods_id']])->find();
            $spec[] = [
                'repertory_id' => $_specTmp['repertory_id'],
                'goods_id' => $param['goods_id'],
                'spec_key' => $_specTmp['spec_key'],
                'key_name' => $_specTmp['key_name'],
                'sku_type' => $_specTmp['sku_type'],
                'shop_price' => $_specTmp['shop_price'],
                'market_price' => $_specTmp['market_price'],
                'plus_vip_price' => $_specTmp['plus_vip_price'],
                'rushbuy_price' => $param['rushbuy_price'],
                'vip_rushbuy_price' => $param['vip_rushbuy_price'],
                'photo' => $_specTmp['photo'],
            ];
        }

        return $spec;
    }



}
