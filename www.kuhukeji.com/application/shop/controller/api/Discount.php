<?php

namespace app\shop\controller\api;

use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\UserModel;

class Discount extends ShopCommon
{
    protected $checkLogin = false;
    public function index()
    {
        $is_vip =  $this->request->param("is_vip",-999);
        if ($is_vip >= 0) {
            $where['is_vip'] = $is_vip;
        }
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $DiscountModel = new DiscountModel();
        $listTmp = $DiscountModel->where($where)->order("orderby desc")->page($this->page, $this->limit)->select();

        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'discount_id' => (int) $val->discount_id,
                'name' => (string) $val->name,
                'prom_img' => (string) $val->prom_img,
                'discount' => (int) ($val->discount / 10),
                'vip_discount' => (int) ($val->vip_discount / 10),
                'orderby' => (int) $val->orderby,
                'is_vip' => (int) $val->is_vip,
                'start_time' =>  date("Y-m-d H:i:s",$val->start_time),
                'end_time' =>  date("Y-m-d H:i:s",$val->end_time),
                'expire_time' => ($val->end_time - time() > 0) ? $val->end_time - time() : 0,
                'is_online' => (int) $val->is_online,
            ];
        }

        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['seo'] = $this->default_seo;
    }



    public function getList () {
        $discount_id = (int)$this->request->param("discount_id",0);
        //$is_vip = (int)$this->request->param("type",0);
        $DiscountModel = new DiscountModel();
        $GoodsModel = new GoodsModel();
        $goods = $goods_ids = [];
        if ($discount_id > 0) {
            if (!$discount = $DiscountModel->find($discount_id)) {
                $this->noPage('参数不正确！');
            }
            if ($discount->app_id != $this->appId) {
                $this->noPage('参数不正确！');
            }
            if ($discount->is_online == 0) {
                $this->noPage('该折扣活动已下线！');
            }

            $goods_ids = json_decode($discount->goods_ids, true) ? json_decode($discount->goods_ids, true) : '';
            $where = [
                'goods_id'=>['in',$goods_ids],
                'app_id'=>$this->appId,
            ];

            $goods = $GoodsModel->where($where)->page($this->page,$this->limit)->select();
        } else {
            $where = [
                'start_time' => ['<',time()],
                'end_time' => ['>',time()],
                'app_id' => $this->appId,
                'is_online' => 1,
            ];

            $discount = $DiscountModel->where($where)->order('orderby desc,discount_id desc')->find();
            if (!empty($discount)) {
                $goods_ids = json_decode($discount->goods_ids, true) ? json_decode($discount->goods_ids, true) : '';
                $goods_where = [
                    'goods_id'=>['in',$goods_ids],
                    'app_id'=>$this->appId,
                ];
                $goods = $GoodsModel->where($goods_where)->page($this->page,$this->limit)->select();
            } else {
                $this->noPage('当前没有折扣活动啦！');
            }
        }
        $list = [];
        foreach ($goods as $v) {
            $vip_discount_shop_price = moneyFormat(($discount['discount'] * $v['shop_price'])/10);
            $discount_shop_price = moneyFormat(($discount['vip_discount'] * $v['shop_price'])/10);
            $list[] = [
                'goods_id' => $v['goods_id'],
                'cat_id' => $v['cat_id'],
                'p_cat_id' => $v['p_cat_id'],
                'goods_sn' => $v['goods_sn'],
                'goods_name' => $v['goods_name'],
                'photo' => (string) $v['photo'],
                'discount' => round($discount['discount'] / 10,1),
                'vip_discount' => round($discount['vip_discount'] / 10,1),
                'shop_price' => moneyFormat($v['shop_price'], true),
                'market_price' => moneyFormat($v['market_price'], true),
//                'discount_shop_price' => $discount_shop_price,
//                'vip_discount_shop_price' => $vip_discount_shop_price,
                'is_vip' => $discount->is_vip,
            ];
        }
        $data = [
            'count' => (int)count($goods_ids),
            'name' => (string) $discount->getAttr('name'),
            'prom_img' => (string) $discount->prom_img,
            'start_time' =>  date("Y-m-d H:i:s",$discount->start_time),
            'end_time' =>  date("Y-m-d H:i:s",$discount->end_time),
            'expire_time' => ($discount->end_time - time() > 0) ? $discount->end_time - time() : 0,
        ];


        $this->datas = [
            'list' => $list,
            'data' => $data,
            'isMore' => (int) (count($list) == $this->limit),
            'seo' => $this->default_seo,
        ];
    }

}
