<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class RushBuyModel extends CommonModel
{
    protected $pk = 'rushbuy_id';
    protected $name = 'app_shop_rushbuy';
    protected $insert = ["add_time", "add_ip"];

    protected $rules = [
        ['name', 'require', '抢购活动名称'],
        ['prom_img', 'require|max:255', '封面图片不为为空|封面图片上传不正确!'],
        ['buy_limit', 'number', '每人限购数必须是数字'],
        ['start_time', '>:0|number', '开始时间必须选择|开始时间必须选择'],
        ['end_time', '>:0|number', '结束时间必须选择|结束时间必须选择'],
        ['is_online', 'require|number', '请输入是否开启|是否开启必须是数字'],
        ['is_vip', 'number', 'VIP会员专享价'],
        ['seo', 'require|min:1', 'SEO信息必须设置|SEO信息必须设置'],
    ];

    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "app_id" => (int) $appId,
            "name" => (string)$request->param("name", ""),//活动名称
            "prom_img" => (string)$request->param("prom_img",''),//商品
            "buy_limit" => (int)$request->param("buy_limit", "0"),//商品
            "start_time" => (int)$request->param("start_time", "",'strtotime'),//商品
            "end_time" => (int)$request->param("end_time", "",'strtotime'),//商品
            "is_online" => (int)($request->param("is_online") == 1),//商品
            "is_vip" => (int)($request->param("is_vip") == 1),//商品
            "orderby" => (int)$request->param("orderby",0),//商品
            "seo" => (string)$request->param("seo",'','SecurityEditorHtml'),//SEO
        ];
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


    //验证商品元数据
    public function checkGoods($param =[]){
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
        $param['goods_name'] = $detail->goods_name;
        if($detail->sku_type == 1){
            //验证spec
            $_spec_key = json_decode($param['spec'],true);
            if(empty($_spec_key)){
                return false;
            }
            $spec_key = [];

            foreach ($_spec_key as $v) {
                $spec_key[$v['spec_key']] = $v['spec_key'];
            }

            $spec = json_decode($detail->goods_spec,true);
            $specItems = [];
            foreach ($spec['itemPrice'] as $val) {
                if ($val['invalid'] == 0) {
                    $specItems[$val['spec_key']] = $val['spec_key'];
                }
            }

            foreach ($spec_key as $v) {
                if (!isset($specItems[$v])) {
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

        if($detail->start_time > time() || $detail->end_time < time()){
            return [];
        }
        return [
            'title' => $detail->getAttr('name'),
            'surplus_time' =>  $detail->end_time - time(),
            'id' => $id,
        ];

    }
}
