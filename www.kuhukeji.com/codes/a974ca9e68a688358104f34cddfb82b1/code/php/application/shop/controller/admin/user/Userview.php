<?php

namespace app\shop\controller\admin\user;

use app\shop\controller\admin\Common;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\CartModel;
use app\shop\model\shop\GoodscategoryModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsTongjiModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\RegionModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserIntegralLogModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\UserMoneyLogModel;
use think\Request;

class Userview extends Common
{

    protected $userId;
    protected $where;

    public function _initialize()
    {
        parent::_initialize();
        $this->userId = (int)$this->request->param("user_id");
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($this->userId)) {
            $this->warning();
        }
        if ($user->app_id != $this->appId) {
            $this->warning();
        }
        $this->where['user_id'] = $this->userId;
    }

    /**
     * 订单轨迹
     */
    public function order()
    {
        $OrderModel = new OrderModel();
        $list = $OrderModel->where($this->where)->order('order_id desc')->page($this->page, $this->limit)->select();
        $count = $OrderModel->where($this->where)->count();
        $orderIds = [];
        foreach ($list as $val) {
            $orderIds[$val->order_id] = $val->order_id;
        }
        $OrderGoodsModel = new OrderGoodsModel();
        $orderIds = empty($orderIds) ? '' : $orderIds;
        $goodsTmp = $OrderGoodsModel->whereIn("order_id", $orderIds)->select();
        $goods =  $order_goods_ids = [];
        foreach ($goodsTmp as $val) {
            $order_goods[$val->order_id][] = [
                'goods_name' => $val->goods_name,
                'spec_key_name' => $val->spec_key_name,
            ];
            $goods[$val->goods_id][] = [
                'goods_name' => $val->goods_name,
                'spec_key_name' => $val->spec_key_name,
            ];
        }
        $datas = [];
        $order_status = getMean("order_status");
        $order_shipping_status = getMean("order_shipping_status");
        $order_pay_status = getMean("order_pay_status");
        foreach ($list as $val) {
            if ($val->pay_status == 0 && $val->end_time < time()) {
                $val->order_status = 5;
            }
            $datas[] = [
                'order_id' => $val->order_id,
                'order_status_mena' => empty($order_status[$val->order_status]) ? '' : $order_status[$val->order_status],
                'shipping_status_mena' => empty($order_shipping_status[$val->shipping_status]) ? '' : $order_shipping_status[$val->shipping_status],
                'pay_status_mean' => empty($order_pay_status[$val->pay_status]) ? '' : $order_pay_status[$val->pay_status],
                'name' => $val->pay_status,
                'device' => $val->device,
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
                'give_integral' => $val->give_integral,
                'goods' => empty($order_goods[$val->order_id]) ? [] : $order_goods[$val->order_id],
            ];
        }
        $this->datas = [
            'list' => $datas,
            'limit' => $this->limit,
            'count' => $count,
        ];
    }

    /**
     * 浏览商品
     */
    public function goodsView()
    {
        $GoodsTongjiModel = new GoodsTongjiModel();
        $list = $GoodsTongjiModel->where($this->where)->order("orderby desc")->page($this->page, $this->limit)->select();
        $count = $GoodsTongjiModel->where($this->where)->count();
        $datas = [];
        $shop_goods_tongji_type = getMean("shop_goods_tongji_type");
        foreach ($list as $val) {
            $datas[] = [
                'type' => empty($shop_goods_tongji_type[$val->type]) ? '' : $shop_goods_tongji_type[$val->type],
                'goods_id' => $val->goods_id,
                'num' => $val->num,
                'goods_name' => $val->goods_name,
                'goods_sn' => $val->goods_sn,
                'goods_photo' => $val->goods_photo,
                'last_time' => date("Y/m/d H:i:s", $val->last_time),
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 购物车
     */
    public function cart()
    {
        $CartModel = new CartModel();
        $list = $CartModel->where($this->where)->order("cart_id desc")->page($this->page, $this->limit)->select();
        $count = $CartModel->where($this->where)->count();
        $goodsIds = [];
        foreach ($list as $val) {
            $goodsIds[$val->goods_id] = $val->goods_id;
        }
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'goods_id' => $val->goods_id,
                'goods_name' => empty($goods[$val->goods_id]) ? '' : $goods[$val->goods_id]->goods_name,
                'goods_sn' => empty($goods[$val->goods_id]) ? '' : $goods[$val->goods_id]->goods_sn,
                'goods_photo' => empty($goods[$val->goods_id]) ? '' : $goods[$val->goods_id]->photo,
//                'spec_key_name' => $val->spec_key_name,
                'is_delete' => $val->is_delete ,
                'goods_num' => $val->goods_num ,
                'is_pay' => $val->is_pay,
                'delete_time' => date("Y/m/d H:i:s", $val->delete_time),
                'pay_time' => date("Y/m/d H:i:s", $val->pay_time),
                'add_time' => date("Y/m/d H:i:s", $val->add_time),
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 余额记录
     */
    public function money()
    {
        $UserMoneyLogModel = new UserMoneyLogModel();
        $listTmp = $UserMoneyLogModel->where($this->where)->order('log_id desc')->page($this->page, $this->limit)->select();
        $count = $UserMoneyLogModel->where($this->where)->count();
        $type_means_tmp = getMean('user_money_type');
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'money' => moneyFormat($v->money,true),
                'total_user_money' => moneyFormat($v->total_user_money,true),
                'type' => $v->type,
                'add_time' => date("Y/m/d H:i:s",$v->add_time),
                'type_mean' => $type_means_tmp[$v->type]];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

    /**
     * 优惠券
     */
    public  function coupon()
    {
        $UserCouponModel = new UserCouponModel();

        $coupon_tmp = $UserCouponModel->where($this->where)->order('user_coupon_id desc')->page($this->page, $this->limit)->select();
        $count = $UserCouponModel->where($this->where)->count();

        $catId = [];
        foreach ($coupon_tmp as $val) {
            $catId[$val->cat_id] = $val->cat_id;
            $catId[$val->p_cat_id] = $val->p_cat_id;
        }
        $GoodscategoryModel = new GoodscategoryModel();
        $categorys = $GoodscategoryModel->itemsByIds($catId);
        $list = [];
        foreach ($coupon_tmp as $v) {
            $cat_name = '无限制';
            !empty($categorys[$v->p_cat_id]) && $cat_name = $categorys[$v->p_cat_id]->name;
            !empty($categorys[$v->cat_id]) && $cat_name .= "--" . $categorys[$v->cat_id]->name;
            $list[] = [
                'user_coupon_id' => $v->user_coupon_id,
                'coupon_id' => $v->coupon_id,
                'name' => $v->name,
                'money' => moneyFormat($v->money,true),
                'condition' => moneyFormat($v->condition,true),
                'expire_start_time' => date("Y-m-d H:i", $v->expire_start_time),
                'expire_end_time' => date("Y-m-d H:i", $v->expire_end_time),
                'type' => $v->type,
                'is_used' => $v->is_used == 1 ? '已使用' : '未使用' ,
                'type_mean' => getMean('coupon_use_type')[$v->type],
                'userarea' => $v->userarea == 1 ? '通用' : '范围',
                'cat_name' => $cat_name,
                'add_time' => date("Y-m-d H:i", $v->add_time),
            ];
        }

        $this->datas = [
            'list' => $list,
            'limit' => $this->limit,
            'count' => $count,

        ];
    }

    /**
     * 收货地址
     */
    public function address()
    {
        $AddressModel = new AddressModel();
        $num = config("limitnum.app_shop_address_num");
        $list = $AddressModel->where("user_id", $this->userId)->order("is_default desc,address_id desc")->limit(0, $num)->select();
        $datas = $areaIds = [];
        foreach ($list as $val) {
            $areaIds[$val->province_id] = $val->province_id;
            $areaIds[$val->city_id] = $val->city_id;
            $areaIds[$val->division_id] = $val->division_id;
        }
        $RegionModel = new RegionModel();
        $areas = $RegionModel->itemsByIds($areaIds);
        foreach ($list as $val) {
            $datas[] = [
                'address_id' => $val->address_id,

                'is_default' => (int)$val->is_default == 1 ? '是' : '否',
                'name' => (string)$val->name,
                'mobile' => (string)$val->mobile,
                'province_id' => $val->province_id,
                'city_id' => $val->city_id,
                'division_id' => $val->division_id,
                'province' => isset($areas[$val->province_id]) ? $areas[$val->province_id]['name'] : '--',
                'city' => isset($areas[$val->city_id]) ? $areas[$val->city_id]['name'] : '--',
                'division' => isset($areas[$val->division_id]) ? $areas[$val->division_id]['name'] : '--',
                'address' =>(string) $val->street .   $val->address,
            ];
        }
        $this->datas['list'] = $datas;
    }




    /**
     * 余额记录
     */
    public function jifen()
    {
        $UserIntegralLogModel = new UserIntegralLogModel();
        $listTmp = $UserIntegralLogModel->where($this->where)->order('log_id desc')->page($this->page, $this->limit)->select();
        $count = $UserIntegralLogModel->where($this->where)->count();
        $type_means_tmp = getMean('integral_log_type');
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'num' => $v->num,
                'now_total_integral' => $v->now_total_integral,
                'type_mean' => empty($type_means_tmp[$v->type]) ? '' :  $type_means_tmp[$v->type],
                'add_time' => date("Y-m-d H:i",$v->add_time),
            ];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }

}
