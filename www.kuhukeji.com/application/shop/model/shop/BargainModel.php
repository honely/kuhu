<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class BargainModel extends CommonModel
{
    protected $pk = 'bargain_id';
    protected $name = 'app_shop_bargain';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['goods_id', 'require|number', '请输入商品|商品必须是数字'],
        ['need_num', '>:0|number', '请输入需要人数|需要人数必须是数字'],
        ['sold_num', 'number', '已砍成功数必须是数字'],
        ['init_price', 'number|>:0', '请输入初始化价格|初始化价格必须是数字'],
        ['bargain_price', 'number', '砍到多少钱必须是数字'],
        ['is_vip_more_bargain', 'require|number', '请输入VIP多砍一刀|VIP多砍一刀必须是数字'],
        ['orderby', 'number', '排序必须是数字'],
        ['end_time', 'number|>:0', '砍价时长必须是数字|请输入砍价周期'],
        ['is_online', 'require|number', '请输入是否开启|是否开启必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须输入|SEO信息必须输入'],
    ];

    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "goods_id" => (int)$request->param("goods_id", "0"),//商品
            "need_num" => (int)$request->param("need_num", "0"),//需要人数
            "sold_num" => (int)$request->param("sold_num", "0"),//已砍成功数
            "is_vip_more_bargain" => (int)$request->param("is_vip_more_bargain", "0"),//VIP多砍一刀
            "orderby" => (int)$request->param("orderby", "50"),//排序
            "end_time" => ((int)$request->param("end_time", "0") * 3600),//传小时存秒
            "is_online" => (int) ($request->param("is_online", "1") == 1),//是否开启
            "spec" => (string) $request->param("spec", "",'SecurityEditorHtml'),//是否开启
            "init_price" => (int)$request->param("init_price", "0","moneyToInt"),//初始化价格
            "bargain_price" => (int)$request->param("bargain_price", "0","moneyToInt"),//砍到多少钱
            "num" => (int)$request->param("num", "1"),//参与数量
            "seo" => (string)$request->param("seo", "",'SecurityEditorHtml'),//参与数量
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

    //验证商品源数据
    public function checkGoods($param =[]){
        if(($param['init_price']/2) <  $param['need_num'] ){
            $this->error = "最大人数错误,过大";
            return false;
        }
        $GoodsModel = new GoodsModel();
        $detail =  $GoodsModel->find($param['goods_id']);
        if(empty($detail)){
            return false;
        }
        if($detail->app_id != $param['app_id']){
            return false;
        }
        if($detail->prom_type != 0 ){
            $this->error = "该商品已参加其他活动 请重新选择产品";
            return false;
        }
        if($detail->sku_type == 1){
            //验证spec
            $spec_key = json_decode($param['spec'],true);
            if(empty($spec_key)){
                $this->error = "请选择规格";
                return false;
            }
            $GoodsRepertoryModel = new GoodsRepertoryModel();
            $specTmp = $GoodsRepertoryModel->where(['goods_id' => $param['goods_id']])->select();
            $spec = [];
            foreach ($specTmp as $v) {
                $spec[$v->spec_key] = [
                    'repertory_id' => $v->repertory_id,
                    'goods_id' => $v->goods_id,
                    'spec_key' => $v->spec_key,
                    'key_name' => $v->key_name,
                    'shop_price' => moneyFormat($v->shop_price),
                    'goods_num' => $v->goods_num,
                    'bar_code' => $v->bar_code,
                    'sku_type' => $v->sku_type,
                    'photo' => $v->photo,
                    'market_price' => moneyFormat($v->market_price),
                    'plus_vip_price' => moneyFormat($v->plus_vip_price),
                ];
            }
            foreach ($spec_key as $val) {
                if(!isset($spec[$val])){
                    $this->error = "请选择规格";
                    return false;
                }
                if($spec[$val]['goods_num'] == 0){
                    $this->error = "规格商品已无货";
                    return false;
                }
            }
        }
        return true;
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
        if($detail->end_time < time()){
            return [];
        }
        return [
            'title' => '砍价活动',
            'surplus_time' => $detail->end_time  - time(),
            'id' => $id,
        ];

    }



}
