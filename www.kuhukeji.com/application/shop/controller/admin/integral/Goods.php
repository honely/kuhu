<?php

namespace app\shop\controller\admin\integral;
use app\shop\controller\admin\Common;

use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\IntegralCategoryModel;
use app\shop\model\shop\IntegralGoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\GoodstypeModel;

class Goods extends Common
{

    public function create()
    {
        $IntegralGoodsModel = new IntegralGoodsModel();
        $GoodsModel = new GoodsModel();
        $param = $IntegralGoodsModel->dataFilter();
        $param['app_id'] = $this->appId;
        $param['goods_sn'] = $IntegralGoodsModel->goodsSn($param['goods_sn'],$this->appId);
        if($param['is_free_shipping'] == 0 && $GoodsModel->checkFreight($param['freight_template_id'],$this->appId) == false){
            $this->warning("物流参数错误");
        }
        if($param['goods_sn'] == false){
            $this->warning("商品编码已存在");
        }

        $res = $IntegralGoodsModel->setData($param);
        if ($res == false) {
            $this->warning($IntegralGoodsModel->getError());
        }
    }

    public function edit()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$detail = $IntegralGoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }

        $data['cat_id'] = $this->request->param('cat_id');
        //$data['goods_sn'] = $this->request->param('goods_sn');
        $data['goods_name'] = $this->request->param('goods_name');
        $data['keywords'] = $this->request->param('keywords');
        $data['market_price'] = moneyToInt($this->request->param('market_price'));
        $data['shop_price'] = moneyToInt($this->request->param('shop_price'));
        $data['integral'] = $this->request->param('integral');
        $data['photo'] = $this->request->param('photo');
        $data['is_online'] = $this->request->param('is_online');
        $data['is_free_shipping'] = $this->request->param('is_free_shipping');
        $data['orderby'] = $this->request->param('orderby');
        $data['sales_sum'] = $this->request->param('sales_sum');
        $data['goods_num'] = $this->request->param('goods_num');
        $data['is_recommend'] = $this->request->param('is_recommend');
        $data['views'] = $this->request->param('views');
        $data['shipping_area_ids'] = (string) $this->request->param('shipping_area_ids',"","SecurityEditorHtml");
        $data['photos'] = (string) $this->request->param('photos',"","SecurityEditorHtml");
        $data['goods_content'] = (string) $this->request->param('goods_content',"","SecurityEditorHtml");
        $data['comment_count'] = $this->request->param('comment_count');
        $data['last_update'] =  $this->request->time();
        $data['weight'] =  (string) $this->request->param('weight');
        $data['freight_template_id'] =  (int) $this->request->param('freight_template_id',0);
        if($data['is_free_shipping'] == 0 && $IntegralGoodsModel->checkFreight($data['freight_template_id'],$this->appId) == false){
            $this->warning("物流参数错误");
        }
        $seo_tmp = (string) $this->request->param('seo','','SecurityEditorHtml');
        $seo = json_decode($seo_tmp) ? json_decode($seo_tmp, true) : [];
        if (!empty($seo)) {
            if (!$seo['title']) {
                $this->warning("请填写百度SEO标题");
            }
            if (!$seo['keywords']) {
                $this->warning("请填写百度SEO关键词");
            }
            if (!$seo['description']) {
                $this->warning("请填写百度SEO描述");
            }
            if (!$seo['releaseDate']) {
                $this->warning("请填写百请选择百度SEO信息原始发布时间度SEO描述");
            }
            if (empty($seo['image'])) {
                $this->warning("请上传百度SEO封面图片");
            }
            if (count($seo['image']) > 3) {
                $seo['image'] = array_slice($seo['image'],0,3);
            }
            $data['seo'] = json_encode($seo,JSON_UNESCAPED_UNICODE);
        } else {
            $this->warning("请填写百度SEO相关信息");
        }
        $res = $IntegralGoodsModel->setData($data, $goods_id);
        if ($res === false) {
            $this->warning($IntegralGoodsModel->getError());
        }
    }

    public function del()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$detail = $IntegralGoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $IntegralGoodsModel->where("goods_id", $goods_id)->delete();
    }


    public function index()
    {
        $IntegralGoodsModel = new IntegralGoodsModel();
        $where['app_id'] = $this->appId;
        $is_free_shipping = (int) $this->request->param("is_free_shipping",-999) ;
        $is_recommend = (int) $this->request->param("is_recommend",-999);
        if ($is_free_shipping >= 0) {
            $where["is_free_shipping"] = $is_free_shipping;
        }
        if ($is_recommend >= 0) {
            $where["is_recommend"] = $is_recommend;
        }
        $goods_sn = (string)$this->request->param("goods_sn",'');
        if (!empty($goods_sn)) {
            $where["goods_sn"] = ["LIKE", "%{$goods_sn}%"];
        }
        $goods_name = (string)$this->request->param("goods_name",'');
        if (!empty($goods_name)) {
            $where["goods_name"] = ["LIKE", "%{$goods_name}%"];
        }

        $list = $IntegralGoodsModel->where($where)->order("goods_id desc")->page($this->page, $this->limit)->select();
        $count = $IntegralGoodsModel->where($where)->count();
        $datas = [];
        $catIds = $typeIds = [];
        foreach ($list as $val) {
            $catIds[$val->cat_id] = $val->cat_id;

        }
        $IntegralCategoryModel = new IntegralCategoryModel();
        $cats = $IntegralCategoryModel->itemsByIds($catIds);
        foreach ($list as $val) {

            $datas[] = [
                'goods_id' => $val->goods_id,
                'cat_id' => empty($cats[$val->cat_id]) ? '' : $cats[$val->cat_id]->name,
                'goods_sn' => $val->goods_sn,
                'goods_name' => $val->goods_name,
                'market_price' => moneyFormat($val->market_price),
                'shop_price' => moneyFormat($val->shop_price),
                'integral' => (int)$val->integral,
                'keywords' => $val->keywords,
                'photo' => $val->photo,
                'is_online' => $val->is_online,
                'is_free_shipping' => $val->is_free_shipping,
                'orderby' => $val->orderby,
                'sales_sum' => $val->sales_sum,
                'goods_num' => $val->goods_num,
                'is_recommend' => $val->is_recommend,
                'views' => $val->views,
                'comment_count' => $val->comment_count,
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'last_update' => date("Y/m/d H:i:s", $val->last_update),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function detail()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$detail = $IntegralGoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $this->datas['detail'] = [
            'goods_id' => $detail->goods_id,
            'cat_id' => $detail->cat_id,
            'goods_sn' => $detail->goods_sn,
            'goods_name' => $detail->goods_name,
            'market_price' => moneyFormat($detail->market_price),
            'shop_price' => moneyFormat($detail->shop_price),
            'integral' => $detail->integral,
            'keywords' => $detail->keywords,
            'photo' => $detail->photo,
            'is_online' => $detail->is_online,
            'is_free_shipping' => $detail->is_free_shipping,
            'orderby' => $detail->orderby,
            'is_recommend' => $detail->is_recommend,
            'sales_sum' => $detail->sales_sum,
            'goods_num' => $detail->goods_num,
            'views' => $detail->views,
            'comment_count' => $detail->comment_count,
            'photos' => (array)json_decode($detail->photos, true),
            'goods_content' => (array)json_decode($detail->goods_content, true),
            'freight_template_id' => $detail->freight_template_id,
            'weight' => (int)$detail->weight,
            'seo' => json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo,
        ];
    }


    public function online()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$detail = $IntegralGoodsModel->find($goods_id)) {
            $this->warning("不存在数据");
        }
        if ($detail->app_id != $this->appId) {
            $this->warning("不存在数据");
        }
        $IntegralGoodsModel->save([
            'is_online' => $detail->is_online ^ 1,
        ], ['goods_id' => $goods_id]);
    }

}
