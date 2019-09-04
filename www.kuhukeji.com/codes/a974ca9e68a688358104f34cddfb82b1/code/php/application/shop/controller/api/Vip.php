<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\ManjianModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\VipOrderModel;
use think\Exception;

class Vip extends ShopCommon
{
    protected $checkLogin = true;


    //会员中心首页
    public function index()
    {
        //首先是判断用户是否是VIP会员 并查询价格和过期时间
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $is_vip = $UserModel->checkVip();
        $plus_expire_time = $is_vip ? $UserModel->getUser()->plus_vip_time : 0;
        //VIP专享折扣
        $DiscountModel = new DiscountModel();
        $discount_where = [
            'is_vip' => 1,
            'app_id' => $this->appId,
            'is_online' => 1,
            'start_time' => ['<=', time()],
            'end_time' => ['>=', time()],
        ];
        $discount = [];
        $discount_tmp = $DiscountModel->where($discount_where)->order('orderby desc')->find();
        if (!empty($discount_tmp)) {
            $goods_ids = json_decode($discount_tmp->goods_ids) ? json_decode($discount_tmp->goods_ids) : [];
            $vip_discount = moneyFormat($discount_tmp->vip_discount);
            $goodsIds = empty($goods_ids) ? '' : $goods_ids;
            $GoodsModel = new GoodsModel();
            $goods = $GoodsModel->itemsByIds($goodsIds);
            foreach ($goods as $v) {
                $discount[] = [
                    'discount_id' => $discount_tmp->discount_id,
                    'goods_id' => $v->goods_id,
                    'goods_name' => $v->goods_name,
                    'shop_price' => moneyFormat($v->shop_price),
                    'plus_vip_price' => moneyFormat($v->plus_vip_price),
                    'vip_price' => moneyFormat(($v->shop_price * $vip_discount)),
                    'photo' => $v->photo,
                    'vip_discount' => $vip_discount * 10,
                ];
            }
        }

        //VIP专享满减
        $ManjianModel = new ManjianModel();
        $manjian_where = [
            'is_vip' => 1,
            'app_id' => $this->appId,
            'is_online' => 1,
            'start_time' => ['<=', time()],
            'end_time' => ['>=', time()],
        ];
        $manjian_tmp = $ManjianModel->where($manjian_where)->order('orderby desc')->find();
        $goods_ids = json_decode($manjian_tmp->goods_ids) ? json_decode($manjian_tmp->goods_ids) : [];

        $goodsIds = empty($goods_ids) ? '' : $goods_ids;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);
        foreach ($goods as $v) {
            $manjian[] = [
                'manjian_id' => $manjian_tmp->manjian_id,
                'goods_id' => $v->goods_id,
                'goods_name' => $v->goods_name,
                'shop_price' => moneyFormat($v->shop_price),
                'plus_vip_price' => moneyFormat($v->plus_vip_price),
                'vip_man_price' => moneyFormat($manjian_tmp->vip_man),
                'vip_jian_price' => moneyFormat($manjian_tmp->vip_jian),
                'photo' => $v->photo,
            ];
        }


        //VIP专享优惠券
        $CouponModel = new CouponModel();
        $coupon_where = [
            'type' => 1,
            'is_online' => 1,
            'send_start_time' => ['<=', time()],
            'send_end_time' => ['>=', time()],
        ];
        $coupon_tmp = $CouponModel->where($coupon_where)->where('create_num', 'exp', '> send_num')->order("orderby desc")->select();
        //如果是VIP会员还要排一下优惠券状态
        if ($is_vip) {
            $user_coupon_where = [
                'user_id' => $this->userId,
                'type' => 1,
            ];
            $UserCouponModel = new UserCouponModel();
            $user_coupons_tmp = $UserCouponModel->where($user_coupon_where)->select();
            $user_coupons = [];
            foreach ($user_coupons_tmp as $v) {
                $user_coupons[$v->coupon_id] = $v;
            }
        }
        $coupon = [];
        foreach ($coupon_tmp as $v) {
            $is_used = 0;
            if (isset($user_coupons[$v->coupon_id])) {
                if ($user_coupons[$v->coupon_id]['is_used'] == 1) {
                    $is_used = 1;
                }
            }
            $coupon[] = [
                'coupon_id' => $v->coupon_id,
                'name' => $v->name,
                'money' => moneyFormat($v->money),
                'condition' => moneyFormat($v->condition),
                'expire_end_time' => date("Y-m-d H:i", $v->expire_end_time),
                'is_receive' => (int)isset($user_coupons[$v->coupon_id]),
                'is_used' => $is_used,
            ];
        }
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)) {
            $this->warning('VIP会员尚未设置！');
        }
        $vip_combo = floor($setting->integral_vip_combo / 100);
        $VipOrderModel = new VipOrderModel();
        $vip_order_tmp = $VipOrderModel->where(['app_id' => $this->appId])->order('order_id desc')->limit(0, 10)->select();
        $vip_order = $userIds = [];
        foreach ($vip_order_tmp as $v) {
            $userIds[$v->user_id] = $v->user_id;
        }
        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        if (!empty($vip_order_tmp)) {
            foreach ($vip_order_tmp as $v) {
                $user = $users[$v->user_id];
                $mobile = substr_replace($user->mobile, '****', 3, 4);
                $vip_order[] = "{$mobile}";
            }
        } else {
            $vip_order = [
                '138****8638',
                '177****2139',
                '159****1257',
                '151****2663',
                '155****4628',
            ];
        }
        if ($setting->vip_expire_time > 0) {
            if ($setting->vip_expire_time % 31536000 == 0) {
                $a = $setting->vip_expire_time / 31536000 == 1 ? '' : $setting->vip_expire_time / 31536000;
                $plus_price_time = "{$a}年";
            } else {
                $a = $setting->vip_expire_time / 86400;
                $plus_price_time = "{$a}天";
            }
        }

        $this->datas = [
            'coupon' => $coupon,
            'discount' => $discount,
            'manjian' => $manjian,
            'is_vip' => $is_vip,
            'plus_expire_time' => date("Y-m-d H:i", $plus_expire_time),
            'vip_price' => moneyFormat($setting->vip_price),
            'vip_huaxian_price' => moneyFormat($setting->vip_huaxian_price),
            'plus_price_time' => $plus_price_time,
            'vip_combo' => $vip_combo,
            'vip_order' => $vip_order,
            'seo' => $this->default_seo,
        ];
    }


    /**
     * 开通会员/续费会员
     */
    public function payForVip()
    {
        $is_usermoney = (int)($this->request->param('is_usermoney', 0) == 1);
        $vip_price = SettingModel::getVipPrice($this->appId);
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $user = $UserModel->getUser();
        $user_money = $UserModel->getUserMoney();

        if ($is_usermoney) {
            $money = $user_money - $vip_price['vip_price'] >= 0 ? $vip_price['vip_price'] : $user_money;
            $pay_money = $user_money - $vip_price['vip_price'] > 0 ? 0 : $vip_price['vip_price'] - $user_money;
            if ($UserModel->userMoney($money, getMean('user_money_type','key')['kthy']) == false) {
                $this->warning($UserModel->getError());
            }
        } else {
            $money = $pay_money = $vip_price['vip_price'];
        }

        $VipOrderModel = new VipOrderModel();
        $is_pay = (int)($pay_money > 0);
        $data = [
            'app_id' => $this->appId,
            'order_sn' => 'HY' . date("YmdHi") . $VipOrderModel->getAutoMaxId(),
            'user_id' => $this->userId,
            'all_money' => $vip_price['vip_price'],
            'user_money' => $money,
            'pay_money' => $pay_money,
            'type' => 1,
            'buy_role' => (int)$UserModel->checkVip(),
            'is_pay' => $is_pay,
            'pay_time' => $vip_price['vip_expire_time'],
            'pid' =>    $UserModel->getPid(),
            'device' => $this->device,
        ];
        $VipOrderModel->insert($data);
        $vip_order_id = $VipOrderModel->getLastInsID();
        $pay_type = (string)$this->request->param("pay_type",'wyu');
        empty($pay_type) && $pay_type = "wyu";
        if ($pay_money > 0) {
            $param = [
                'title' => $UserModel->checkVip() ? '续费VIP' : '开通VIP',
                'subject' => $UserModel->checkVip() ? '续费VIP' : '开通VIP',
                'openid' => $this->openId,
                'notify_url' => request()->domain() . config('callbackUrl.vip_payment_notify_callback') . '/appid/' . $this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . '/order_id/' . $vip_order_id,
                'return_url' => request()->domain() .config('callbackUrl.vip_payment_return_callback') . '/appid/' . $this->appId . '/device/' . $this->device . '/pay_type/' . $pay_type . '/order_id/' . $vip_order_id,
                'order_id' => $vip_order_id,
                'money' => $pay_money,
                'goods_id' => $vip_order_id,
                'pay_type' => $pay_type,
                'order_type' => 3,
            ];
            try {
                $res = Miniapp::makeModule($this->device, $this->appId)->createOrder($param);
                $order_info = $res['order_info'];
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
            $this->datas = [
                'order_id' => $vip_order_id,
                'is_pay' => $is_pay,
                'order_info' => $order_info,
            ];
        } else {
            $UserModel = new UserModel();
            $user = $UserModel->findUser($this->userId)->getUser();
            $plus_vip_time = $UserModel->checkVip() ? $user->plus_vip_time + $vip_price['vip_expire_time'] : $vip_price['vip_expire_time'] + time();
            $UserModel->isUpdate(true)->save(['plus_vip_time' => $plus_vip_time], ['user_id' => $this->userId]);
            $this->datas = [
                'order_id' => $vip_order_id,
                'is_pay' => 0,
                'order_info' => "",
            ];
        }

    }


    //专享折扣
    public function vipDiscount()
    {
        //VIP专享折扣
        $DiscountModel = new DiscountModel();
        $discount_where = [
            'is_vip' => 1,
            'app_id' => $this->appId,
            'is_online' => 1,
            'start_time' => ['<=', time()],
            'end_time' => ['>=', time()],
        ];
        $discount_tmp = $DiscountModel->where($discount_where)->order('orderby desc')->select();

        $discount = $goodsIds = [];
        foreach ($discount_tmp as $v) {
            $goods_ids[$v->discount_id] = json_decode($v->goods_ids) ? json_decode($v->goods_ids) : [];
            $vip_discount[$v->discount_id] = moneyFormat($v->vip_discount);
        }
        foreach ($goods_ids as $kk => $vv) {
            foreach ($vv as $vvv) {
                $goodsIds[$vvv] = $vvv;
                $goods_discount[$vvv] = $vip_discount[$kk];
            }
        }

        $goodsIds = empty($goodsIds) ? '' : $goodsIds;
        $GoodsModel = new GoodsModel();
        $goods = $GoodsModel->itemsByIds($goodsIds);

        foreach ($goods as $v) {
            $discount[] = [
                'goods_id' => $v->goods_id,
                'discount' => $goods_discount[$v->goods_id],
                'goods_name' => $v->goods_name,
                'shop_price' => moneyFormat($v->shop_price),
                'discount_price' => moneyFormat($v->shop_price * $goods_discount[$v->goods_id]),
                'photo' => $v->photo,
            ];
        }
        $this->datas = [
            'goods' => $discount
        ];
    }


}




