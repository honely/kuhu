<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class DiscountModel extends CommonModel
{
    protected $pk = 'discount_id';
    protected $name = 'app_shop_discount';
    protected $insert = ['add_time','add_ip'];

    protected $rules = [
        ['name', 'require|max:255', '活动名称必须填写|活动名称长度超过限制！'],
        ['prom_img', 'require|max:255', '活动封面图片必须上传|活动封面图片必须上传！'],
        ['discount', 'require|number', '折扣不能为空！'],
        ['vip_discount', 'require|number', 'VIP会员折扣不能为空！'],
        ['start_time', 'require|number', '领取开始时间必须选择！|领取开始时间必须选择！'],
        ['end_time', 'require|number', '领取结束时间必须选择！|领取结束时间必须选择！'],
        ['goods_ids', 'require|min:3', '必须选择商品|必须选择商品'],
        ['buy_limit', 'require|number', '限购数量必须是数字|限购数量必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须设置|SEO信息必须设置'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int) $app_id,
            "name" => (string) $request->param("name", ''),
            "prom_img" => (string) $request->param("prom_img", ''),
            "discount" => (int) ($request->param("discount", 0) * 10),
            "vip_discount" => (int) ($request->param("vip_discount", 0) * 10),
            "start_time" => $request->param("start_time", 0,"strtotime"),//领取开始时间
            "end_time" => $request->param("end_time", 0,"strtotime"),//领取结束时间
            "goods_ids" => (string) $request->param("goods_ids", '',"SecurityEditorHtml"),//领取结束时间
            "is_online" => (int) ($request->param("is_online") == 1),//是否关闭
            "is_vip" => (int) ($request->param("is_vip") == 1),//是否关闭
            "buy_limit" => (int) $request->param("buy_limit",1) ,//是否关闭
            "orderby" => (int) $request->param("orderby",0) ,//是否关闭
            "seo" => (string) $request->param("seo",'','SecurityEditorHtml') ,//是否关闭
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
    public function checkGoods($param =[],$discount_id=0){
        $param['goods_ids'] = json_decode($param['goods_ids'],true) ? json_decode($param['goods_ids'],true) : '';
        $GoodsModel = new GoodsModel();
        $detail =  $GoodsModel->itemsByIds($param['goods_ids']);
        if(empty($detail)){
            $this->error = "商品不存在";
            return false;
        }
        foreach ($detail as $v) {
            if($v->app_id != $v['app_id']){
                $this->error = "参数不正确";
                return false;
            }
            if($v->prom_type != 0 && $discount_id > 0 && $discount_id != $v->prom_id){
                $this->error = "该商品已参加其他活动 请重新选择产品";
                return false;
            }
        }
        return true;
    }


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
            'surplus_time' =>$detail->end_time - time(),
            'id' => $id,
        ];
    }

}
