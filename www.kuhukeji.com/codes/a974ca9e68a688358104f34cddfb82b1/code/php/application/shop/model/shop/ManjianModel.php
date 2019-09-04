<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class ManjianModel extends CommonModel
{
    protected $pk = 'manjian_id';
    protected $name = 'app_shop_manjian';
    protected $insert = ['add_time', 'add_ip'];

    protected $rules = [
        ['name', 'require|max:255', '活动名称必须填写|活动名称长度超过限制！'],
        ['man', '>:0', '满多少不能为空！'],
        ['jian', '>:0', '减多少不能为空！'],
        ['vip_man', 'number', 'VIP会员满多少不能为空！'],
        ['vip_jian', 'number', 'VIP会员减多少不能为空！'],
        ['start_time', '>:0|number', '领取开始时间必须选择！|领取开始时间必须选择！'],
        ['end_time', '>:0|number', '领取结束时间必须选择！|领取结束时间必须选择！'],
        ['prom_img', 'require|max:255', '封面图片必须上传！|封面图片上传不正确！'],
        ['goods_ids', 'require', '必须选择商品'],
        ['is_online', 'number', '活动状态必须是数字'],
        ['seo', 'require|min:1', 'SEO信息必须设置|SEO信息必须设置'],
    ];

    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "name" => (string)$request->param("name", ''),
            "man" => moneyToInt($request->param("man", 0)),
            "jian" => moneyToInt($request->param("jian", 0)),
            "vip_man" => moneyToInt($request->param("vip_man", 0)),
            "vip_jian" => moneyToInt($request->param("vip_jian", 0)),
            "start_time" => $request->param("start_time", 0, "strtotime"),//领取开始时间
            "end_time" => $request->param("end_time", 0, "strtotime"),//领取结束时间
            "prom_img" => (string)$request->param("prom_img", ''),//领取结束时间
            "goods_ids" => (string)$request->param("goods_ids", '', "SecurityEditorHtml"),//领取结束时间
            "is_online" => (int)($request->param("is_online") == 1),//是否关闭
            "is_vip" => (int)($request->param("is_vip") == 1),//是否有VIP参加活动
            "orderby" => (int) $request->param("orderby"),
            "seo" => (string) $request->param("seo",'','SecurityEditorHtml'),
        ];
        if (empty($param['goods_ids'])) {
            $this->error = "请选择产品";
            return false;
        }
        if ($param['start_time'] >= $param['end_time']) {
            $this->error = "开始日期不得大于结束日期";
            return false;
        }
        if ($param['is_vip'] == 1 && (empty($param['vip_man']) || empty($param['vip_jian']))) {
            $this->error = "请输入会员活动价格";
            return false;
        }
        if ($param['is_vip'] == 0) {
            $param['vip_man'] = $param['vip_jian'] = 0;
        }

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
    public function checkGoods($param = [], $manjian_id = 0)
    {

        $goodsIds = json_decode($param['goods_ids'], true) ? json_decode($param['goods_ids'], true) : [];
        $goodsIds = array_unique($goodsIds);
        $GoodsModel = new GoodsModel();
        $detail = $GoodsModel->itemsByIds($goodsIds);
        if (empty($detail)) {
            return false;
        }
        foreach ($detail as $v) {
            if ($v->app_id != $v['app_id']) {
                return false;
            }
            //验证满减ID
            if ($manjian_id <= 0) {
                if ($v->prom_type != 0) {
                    $this->error = "该商品已参加其他活动 请重新选择产品";
                    return false;
                }
            } else {
                if ($manjian_id != $v->prom_id && $v->prom_id > 0) {
                    $this->error = "该商品已参加其他活动 请重新选择产品";
                    return false;
                }
            }
        }
        return $goodsIds;
    }


    public function checkActivity($id)
    {
        if (!$detail = $this->find($id)) {
            return [];
        };
        if ($detail->is_online == 0) {
            return [];
        }

        if ($detail->start_time > time() || $detail->end_time < time()) {
            return [];
        }
        return [
            'title' => $detail->getAttr('name'),
            'surplus_time' => $detail->end_time - time(),
            'id' => $id,
        ];

    }

}
