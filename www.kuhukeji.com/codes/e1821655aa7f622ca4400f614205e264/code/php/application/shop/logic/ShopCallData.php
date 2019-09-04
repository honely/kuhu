<?php

namespace app\shop\logic;


use app\shop\logic\shop\goods\GroupBuyLogic;
use app\shop\model\shop\BargainModel;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GroupBuyModel;

class ShopCallData
{

    public $autoPluginsMap = [
        'plugin-pintuan' => 'getPintuanCalldata',
        'plugin-kanjia' =>  'getKanjiaCalldata',
        'plugin-coupon' =>  'getCouponCalldata',
        'plugin-product' => 'getGoodsCalldata',
        'plugin-miaosha' => 'getDiscountCalldata',
    ];

    public function __construct($appId)
    {
        $this->appId = $appId;
    }


    public function getData(&$plugins)
    {
        foreach ($plugins as &$val) {
            if (!empty($this->autoPluginsMap[$val['plug']])) {
                $act = $this->autoPluginsMap[$val['plug']];
                $val['show_data'] = $this->$act($val['datas']);
            }
        }
    }

    /**
     * 拼团
     */

    public function getPintuanCalldata($param)
    {
        $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
        ];
        $showType = (int)$param['showType'];
        $showType = $showType == 2 ? 2 : 3;//目前只有 一排2个或者一排3个
        $GroupBuyModel = new GroupBuyModel();
        $datas = $GroupBuyModel->where($where)->order(['orderby' => 'desc'])->limit(0, $showType)->select();
        if (!empty($datas)) {
            $goodsIds = [];
            foreach ($datas as $val) {
                $goodsIds[$val['goods_id']] = $val['goods_id'];
            }
            if (!empty($goodsIds)) {
                $GoodsModel = new GoodsModel();
                $goods = $GoodsModel->itemsByIds($goodsIds);
                $return = [];
                foreach ($datas as $val) {
                    $return[] = [
                        'groupbuy_id' => $val['groupbuy_id'],
                        'need_num' => $val['need_num'],
                        'groupbuy_price' => round($val['groupbuy_price'] / 100, 2),
                        'photo' => isset($goods[$val['goods_id']]) ? $goods[$val['goods_id']]['photo'] : '',
                        'price' => isset($goods[$val['goods_id']]) ? round($goods[$val['goods_id']]['shop_price'] / 100, 2) : '',
                    ];
                }
                return $return;
            }
        }
    }

    /**
     * 砍价
     */
    public function getKanjiaCalldata($param)
    {
        $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
        ];
        $showType = (int)$param['showType'];
        $showType = $showType == 2 ? 2 : 3;//目前只有 一排2个或者一排3个
        $BargainModel = new BargainModel();
        $datas = $BargainModel->where($where)->order(['orderby' => 'desc'])->limit(0, $showType)->select();
        if (!empty($datas)) {
            $goodsIds = [];
            foreach ($datas as $val) {
                $goodsIds[$val['goods_id']] = $val['goods_id'];
            }
            if (!empty($goodsIds)) {
                $GoodsModel = new GoodsModel();
                $goods = $GoodsModel->itemsByIds($goodsIds);
                $return = [];
                foreach ($datas as $val) {
                    $return[] = [
                        'bargain_id' => $val['bargain_id'],
                        'bargain_price' => round($val['bargain_price'] / 100, 2),
                        'photo' => isset($goods[$val['goods_id']]) ? $goods[$val['goods_id']]['photo'] : '',
                        'price' => isset($goods[$val['goods_id']]) ? round($goods[$val['goods_id']]['shop_price'] / 100, 2) : '',
                    ];
                }
                return $return;
            }
        }

    }

    /**
     * 优惠券
     */
    public function getCouponCalldata($param)
    {
        $CouponModel = new CouponModel();
        $where['app_id'] = $this->appId;
        //只能是免费领取的显示在前台
        $where['get_type'] = 2;
        $where['send_end_time'] = ['EGT', time()];
        $order = (int)$param['order'];
        $showType = (int)$param['showType'];
        $showType = $showType == 1 ? 1 : 3; //作为LIMIT 使用
        $orderby = '';
        switch ($order) {
            case 1:
                $orderby = 'money ASC';
                break;
            case 2:
                $orderby = 'send_num desc';
                break;
            case 3:
                $orderby = 'use_num desc';
                break;
            case 4:
                $orderby = 'orderby desc';
                break;
            default:
                $orderby = 'coupon_id desc';
                break;
        }
        $datas = $CouponModel->where($where)->order($orderby)->limit(0, $showType)->select();
        $return = [];
        foreach ($datas as $val) {
            $return [] = [
                'coupon_id' => $val['coupon_id'],
                'name' => $val['name'],
                'money' => round($val['money'], 2),
                'userarea' => $val['userarea'] == 0 ? '全场通用' : '指定分类',
                'expire_start_time' => date('Y-m-d', $val['expire_start_time']),
                'expire_end_time' => date('Y-m-d', $val['expire_end_time']),
            ];
        }
        return $return;
    }

    /**
     * 商品
     */
    public function getGoodsCalldata($param)
    {
        $cid = (int)empty($param['cid']) ? 0 : $param['cid'];
        $cids = empty($param['cids']) ? '' : SecurityEditorHtml($param['cids']);
        $num = (int)$param['num'];
        $num = $num > 0 ? $num : 8;
        $cids = json_decode($cids, true);
        $where = ['app_id' => $this->appId, 'is_online' => 1, 'is_delete' => 0];
        if (!empty($cid)) {
            $where['cat_id|p_cat_id'] = $cid;
        } else {
            if (!empty($cids)) {
                foreach ($cids as $k => $val) {
                    $cids[$k] = (int)$val;
                }
                $where['cat_id|p_cat_id'] = ['IN', $cids];
            }
        }
        $order = (int)$param['order'];
        $orderby = [];
        switch ($order) {
            case 1:
                $orderby = ['shop_price' => 'asc'];
                break;
            case 2:
                $orderby = ['sales_sum' => 'desc'];
                break;
            case 3:
                $orderby = ['goods_id' => 'desc'];
                break;
            case 4:
                $orderby = ['orderby' => 'desc'];
                break;
            default:
                $orderby = ['orderby' => 'desc', 'sales_sum' => 'desc', 'views' => 'desc'];
                break;
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->where($where)->order($orderby)->limit(0, $num)->select();
        $hdTitles = $GoodsModel->getActivityTitle($goods);
        $return = [];
        foreach ($goods as $val) {
            $return  [] = [
                'goods_id' => $val['goods_id'],
                'photo' => $val['photo'],
                'goods_name' => $val['goods_name'],
                'market_price' => moneyFormat($val['market_price']),
                'shop_price' => moneyFormat($val['shop_price']),
                'hd_title' => isset($hdTitles[$val['goods_id']]) ? $hdTitles[$val['goods_id']]['hd_title'] : '',
            ];
        }
        $GoodscategoryModel = new GoodscategoryModel();
        $cats = $GoodscategoryModel->where("app_id", $this->appId)->where("is_show", 1)->where("parent_id", $cid)->select();
        return ['list' => $return,'cats'=>$cats];
    }

    /**
     * 打折商品
     */
    public function getDiscountCalldata($param)
    {
        $showType = (int)$param['showType'];
        $showType = $showType == 2 ? 2 : 3; //是显示3个还是显示10个
        $t = time();
        $where = [
            'app_id' => $this->appId,
            'is_online' => 1,
            'start_time' => ['ELT', $t],
            'end_time' => ['EGT', $t],
        ];
        $discount = DiscountModel::where($where)->find();
        if (!empty($discount)) {
            $endTime = $discount['end_time'] - $t; //还有多少时间
            $goodsId = json_decode($discount['goods_ids'], true);
            if (!empty($goodsId)) {
                $GoodsModel = new GoodsModel();
                $goods = $GoodsModel->itemsByIds($goodsId);
                if (!empty($goods)) {
                    $myGoods = [];
                    $i = 0;
                    foreach ($goods as $val) {
                        if ($val['is_online'] == 1) {
                            $i++;
                            $myGoods[] = [
                                'goods_name' => $val['goods_name'],
                                'shop_price' => round($val['shop_price'] / 100, 2),
                                'discount_price' => round($val['shop_price'] * $discount['discount'] / 10000, 2),
                                'photo' => $val['photo'],
                                'goods_id' => $val['goods_id'],
                            ];
                            if ($i == $showType) break;
                        }
                    }
                    if (!empty($myGoods)) {
                        return [
                            'goods' => $myGoods,
                            'djs' => $endTime,
                        ];
                    }
                }
            }
        }
    }

}

