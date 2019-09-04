<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GroupBuyModel extends CommonModel
{
    protected $pk = 'groupbuy_id';
    protected $name = 'app_shop_groupbuy';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['goods_id', 'require|number', '请输入商品|商品必须是数字'],
        ['app_id', '>:0|number', '参数不正确|参数不正确'],
        ['need_num', '>:0|number', '请输入成团需要人数|需要成团人数必须是数字'],
        ['success_num', 'number', '已砍成功数必须是数字'],
        ['groupbuy_price', 'number|>:0', '请输入团购价格|团购价格必须是数字'],
        ['vip_groupbuy_price', 'number|>:0', '请输入团购价格|团购价格必须是数字'],
        ['spec', 'require', '规格'],
        ['seo', 'require|min:1', 'seo信息必须填写|seo信息必须填写'],
    ];

    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "goods_id" => (int)$request->param("goods_id", "0"),//商品
            "need_num" => (int)$request->param("need_num", "0"),//需要人数
            "success_num" => (int)$request->param("success_num", "0"),//已团成功数
            "orderby" => (int)$request->param("orderby", "50"),//排序
            "end_time" => ((int)$request->param("end_time", "0") * 3600),//传小时存秒
            "is_online" => (int) ($request->param("is_online", "1") == 1),//是否开启
            "spec" => (string) $request->param("spec", "",'SecurityEditorHtml'),//是否开启
            "groupbuy_price" => (int)$request->param("groupbuy_price", "0","moneyToInt"),//团购价格
            "vip_groupbuy_price" => (int)$request->param("vip_groupbuy_price", "0","moneyToInt"),//砍到多少钱
            "num" => (int)$request->param("num", "1"),//参与数量
            "is_vip" => (int)($request->param("is_vip") == 1),//VIP会员
            "seo" => (string)$request->param("seo",'','SecurityEditorHtml'),//VIP会员
        ];
        $param['app_id'] = $appId;
        $seo_tmp = (string)$request->param("seo",'','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->error = '请填写百度SEO标题';
                return false;
            }
            if (!$seo['keywords']) {
                $this->error = '请填写百度SEO关键词';
                return false;
            }
            if (!$seo['description']) {
                $this->error = '请填写百度SEO描述';
                return false;
            }
            if (!$seo['releaseDate']) {
                $this->error = '请选择百度SEO信息原始发布时间';
                return false;
            }
            if (empty($seo['image'])) {
                $this->error = '请上传百度SEO封面图片';
                return false;
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $param['seo'] = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->error = '请填写百度SEO相关信息';
            return false;
        }
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
        if($detail->prom_type != 0 && $detail->prom_type != getMean('shop_prom_type','key')['pt']){
            $this->error = "该商品已参加其他活动 请重新选择产品";
            return false;
        }
//        if($detail->sku_type == 0) return [];
//        if($detail->sku_type == 1){
            //验证spec
            $spec_key_tmp = json_decode($param['spec'],true);
            $spec_key = [];
            foreach ($spec_key_tmp as $v) {
                $spec_key[$v['spec_key']] = $v['spec_key'];
                $spec_tmp[$v['spec_key']] = $v;
            }

            if(empty($spec_key)){
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
                    'goods_id' => $v['goods_id'],
                    'spec_key' => $v['spec_key'],
                    'key_name' => $v['key_name'],
                    'sku_type' => $v['sku_type'],
                    'shop_price' => isset($v['shop_price']) ? moneyToInt($v['shop_price']) : 0,
                    'market_price' => isset($v['market_price']) ? moneyToInt($v['market_price']) : 0,
                    'plus_vip_price' => isset($v['plus_vip_price']) ? moneyToInt($v['plus_vip_price']) : 0,
                    'groupbuy_price' => isset($v['groupbuy_price']) ? moneyToInt($v['groupbuy_price']) : 0,
                    'vip_groupbuy_price' => isset($v['vip_groupbuy_price']) ? moneyToInt($v['vip_groupbuy_price']) : 0,
                ];
            }

            foreach ($spec_key as $val) {
                if(!isset($resp_spec_tmp[$val])){
                    return false;
                }
                if($resp_spec_tmp[$val]['goods_num'] == 0){
                    return false;
                }
            }

        //}

        return $spec;
    }


    /**
     * 验证活动是否存在或者已过期了
     */
    public function checkActivity($id){
        if(!$detail = $this->find($id)){
            return [];
        };
        if($detail->is_online == 0){
            return [];
        }
        return [
            'title' => '团购活动',
            'surplus_time' => 0,
            'id' => $id,
        ];

    }





}
