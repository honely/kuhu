<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\logic\shop\TongjiLogic;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\GoodsModel;
use think\Exception;


class Goods extends ShopCommon
{


    /**
     * @param int $cat_id       分类ID
     * @param int $p_cat_id     父级分类ID
     * @param string $keywords  关键字
     * @param int $price_order  价格排序  0 不排序 1降序 2升序
     * @param int $sales_order  销量      0 不排序 1降序 2升序
     * @param int $order 0      综合      最新上架 评价最多 推荐商品  最热商品
     */
    public function index()
    {
        $cat_id = (int)$this->request->param("cat_id");
        $p_cat_id = (int)$this->request->param("p_cat_id");
        $keywords = (string)$this->request->param("keywords");
        $price_order = (int)$this->request->param("price_order");
        $sales_order = (int)$this->request->param("sales_order");
        $order = (int)$this->request->param("order");
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $where['is_delete'] = 0;
        //冗余的父级ID
        $p_cat_id > 0 && $where['p_cat_id|cat_id'] = $p_cat_id;
        //一级分类
        $cat_id > 0 && $where['cat_id|p_cat_id'] = $cat_id;

        if (!empty($keywords)) {
            if (is_numeric($keywords)) {
                $where['goods_id'] = $keywords;
            } else {
                $where['goods_name|goods_sn|keywords'] = ['like',"%$keywords%"];
            }
        }

        $orderby = [];
        if ($price_order > 0) {
            $orderby ['shop_price'] = $price_order == 1 ? 'desc' : 'asc';
        }

        if ($sales_order > 0) {
            $orderby  ['sales_sum'] = $sales_order == 1 ? 'desc' : 'asc';
        }

        switch ($order) {
            case 0:   //默认排序
                $orderby['orderby'] = "desc";
                break;
            case 1 :  //最新上架
                $orderby['is_new'] = "desc";
                break;
            case 2 :  //评价最多
                $orderby['comment_count'] = "desc";
                break;
            case 3 :  //推荐商品
                $orderby['is_recommend'] = "desc";
                break;
            case 4 :  //最热商品
                $orderby['is_hot'] = "desc";
                break;
        }
        $GoodsModel = new GoodsModel();
        $list = $GoodsModel->where($where)->order($orderby)->page($this->page, $this->limit)->select();
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
                'plus_vip_price' => moneyFormat($val->plus_vip_price),
                'is_plus_vip' => $val->is_plus_vip,
                'photosales_sum' => $val->photo,
                'sales_sum' => $val->sales_sum,
                'score' => '5.0'
            ];
        }
        $this->datas['list'] = $datas;
        $this->datas['isMore'] = (int)($this->limit == count($datas));
        $this->datas['seo'] = $this->default_seo;
    }

    public function getCat()
    {
        //获取分类信息
        $GoodscategoryModel = new GoodscategoryModel();
        $this->datas['cats'] = $GoodscategoryModel->getCatTree($this->appId);

    }


    /**
     * 商品详情
     * @throws \think\exception\DbException
     */
    public function detail()
    {
        //获取商品信息
        $goods_id = (int)$this->request->param("goods_id");
        try {
            $GoodsLogic = new GoodsLogic();
            $detail = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
        } catch (Exception $exception) {
            $this->noPage($exception->getMessage());
        }
        if ($GoodsLogic->checkOnline() == false) {
            $this->noPage("产品已下架");
        }
        //获取商品评论
        $comment_type = (int)$this->request->param("comment_type");
        $comment = $GoodsLogic->getComment($comment_type, $this->page, $this->limit);
        $this->datas['comment'] =  [
            'isMore' => (int) ($this->limit == count($comment)),
            'comment' => $comment
        ];
        //page 》 1 不反回 详情
        if ($this->page > 1) return;
        //获取商品规格
        $spec = $GoodsLogic->getSpec();
        //获取商品价格
        $spec_goods_price = $GoodsLogic->getSpecPrice();
        //获取优惠券

        $coupon = [];
        if ($detail->is_coupon == 1) {
            $CouponModel = new CouponModel();
            $couponList = $CouponModel->getCoupon($this->appId);
            foreach ($couponList as $val) {
                $coupon[] = [
                    'coupom_id' => $val->coupon_id,
                    'name' => $val->name,
                    'money' => moneyFormat($val->money),
                    'type' => $val->type,
                    'userarea' => '手机/运营商/数码-小米手机-专属优惠券',
                    'date' => date("Y.m.d", $val->expire_start_time) . '-' . date("Y.m.d", $val->expire_end_time),
                ];
            }
        }
        //获取商品属性
        $attr = (array)json_decode($detail->goods_attr, true);
        $attr = empty($attr['attr']) ? [] : $attr['attr'];
        $this->datas['detail'] = [
            'goods_id' => $detail->goods_id,
            'goods_sn' => $detail->goods_sn,
            'goods_name' => $detail->goods_name,
            'market_price' => moneyFormat($detail->market_price, true),
            'shop_price' => moneyFormat($detail->shop_price, true),
            'plus_vip_price' => moneyFormat($detail->plus_vip_price, true),
            'goods_content' => (array)json_decode($detail->goods_content),
            'photos' => (array)json_decode($detail->photos, true),
            'goods_attr' => $attr,
            'is_free_shipping' => $detail->is_free_shipping,
            'sales_sum' => $detail->sales_sum,
            'goods_num' => $detail->goods_num,
            'prom_id' => $GoodsLogic->getActivity(),
            'prom_type' => $detail->prom_type,
            'sku_type' => $detail->sku_type,
            'shipping_price' => moneyFormat($GoodsLogic->getShippingPrice(), true),
            'is_plus_vip' => $detail->is_plus_vip,
            'is_coupon' => $detail->is_coupon,
            'comment_count' => $detail->comment_count,
            'bad_comment_count' => $detail->bad_comment_count,
            'middle_comment_num' => $detail->middle_comment_num,
            'views' => $detail->views,
            'coupon' => $coupon,
            'cat_id' => $detail->cat_id,
            'spec' => $spec,
            'integral' => 20,//todo：积分
            'spec_goods_price' => $spec_goods_price,
        ];
        $this->datas['seo'] = json_decode($detail->seo) ? json_decode($detail->seo,true) : $this->default_seo;
        $TongjiLogic = new TongjiLogic();
        $TongjiLogic
            ->setAppId($this->appId)
            ->setUserId($this->userId)
            ->tongjiGoods($goods_id, $detail->goods_name, $detail->goods_sn, $detail->photo, 1);
    }


}
