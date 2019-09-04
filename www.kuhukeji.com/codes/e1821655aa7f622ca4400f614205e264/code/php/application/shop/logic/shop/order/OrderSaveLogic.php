<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\goods\RushBuyLogic;
use app\shop\logic\shop\goods\StockLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\CouponModel;
use app\shop\model\shop\DiscountModel;
use app\shop\model\shop\ManjianModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\RushBuyGoodsModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserCouponModel;
use app\shop\model\shop\UserModel;
use think\Exception;
use think\Validate;

/**
 * 订单处理逻辑 通用计算
 * 下单逻辑
 * Class OrderSaveLogic
 * @package app\shop\logic\shop\order
 */
class OrderSaveLogic
{
    //用户ID
    private $userId;
    //用户
    private $user;
    //APPID
    private $appId;
    //购物商品信息
    private $goods;
    //用户收货地址
    private $address;
    //地区 默认北京
    private $regionId = 1;
    //无法送达的商品
    private $unableGoods;
    //这是
    private $freight;
    //优惠券
    private $coupon;
    //用户处理模型
    private $userModel;
    //用户留言
    private $userNote;
    //用户使余额
    private $userMoney;
    //在线支付余额
    private $orderModel;
    //优惠价格
    private $youhuiPrice;
    //打折
    private $discountGoods;
    //满减
    private $manjianGoods;
    //优惠信息
    private $couponPrice;

    //积分配置
    private $integralSetting;

    private $prom_id = 0;
    private $prom_type = 0;

    public function __construct()
    {
        $this->userModel = new UserModel();
    }

    /**
     * 获得无法送达的快递
     */
    public function getUnableGoods()
    {
        return $this->unableGoods;
    }

    /**
     * 设置用户使用余额
     */
    public function setUserMoney($useMoney)
    {
        if($useMoney == 1){
            $this->userMoney = $this->userModel->getUserMoney();
        }

        return $this;
    }

    /**
     * 设置用户留言
     */
    public function setUserNote($userNote)
    {
        $this->userNote = $userNote;
        return $this;
    }

    /**
     * 设置商品
     * @param $goods
     */
    public function setGoods($goods)
    {
        $this->goods = $goods;
        return $this;
    }

    /**
     * 设置用户ID
     * @param $userId
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
        $this->userModel->findUser($this->userId);
        $user = $this->userModel->getUser();
        if (empty($user)) {
            throw new Exception("系统异常");
        }
        $this->user = $user;
        return $this;
    }

    /**
     * 返回用户全部余额
     */
    public function getUserTotalMoney(){
        return $this->userModel->getUserMoney();
    }

    /**
     * 设置应用ID
     */
    public function setAppId($appId)
    {
        $this->appId = $appId;
        return $this;
    }

    /**
     * 设置收货地址
     * @param $goodsId
     */
    public function setAddress($addressId)
    {
        // -1 则为北京
        if ($addressId == -1) {
            $this->regionId = 1;
            return $this;
        }
        $AddressModel = new AddressModel();
        if (!$addresss = $AddressModel->find($addressId)) {
            throw new Exception("请选择收货地址");
        };

        if ($addresss->user_id != $this->userId) {
            throw new Exception("请选择收货地址");
        }
        $this->address = $addresss;
        $this->regionId = $this->address->division_id;
        return $this;
    }


    public function setProm($prom_id,$prom_type){
            $this->prom_id = $prom_id;
            $this->prom_type = $prom_type;
            return $this;
    }

    /**
     * 批量计算邮费
     */
    public function getFreight()
    {
        $freight = 0;
        $freightLogic = new FreightLogic();
        $freightLogic->setRegionId($this->regionId);
        $unable_goods = $freightTemplate = [];
        foreach ($this->goods as $val) {
            $freightLogic->setGoodsModel($val);
            if ($freightLogic->checkShipping() == false) {
                $unable_goods[] = $val;
            } elseif ($val['is_free_shipping'] == 0) {
                $freightTemplate[$val['freight_template_id']][] = $val;
            }

        }

        $this->unableGoods = $unable_goods;
        foreach ($freightTemplate as $tmpId => $val) {
            $temp['freight_template_id'] = $tmpId;
            $temp['weight'] = 0;
            $temp['goods_num'] = 0;
            foreach ($val as $goodsKey => $goodsVal) {
                $temp['weight'] += $goodsVal['weight'] * $goodsVal['goods_num'];
                $temp['goods_num'] += $goodsVal['goods_num'];
            }
            $temp['is_free_shipping'] = 0;
            $freightLogic->setGoodsModel($temp);
            $freightLogic->setGoodsNum($temp['goods_num']);
            $freightLogic->doCalculation();
            $freight += $freightLogic->getFreight();
            unset($temp);
        }
        $this->freight = $freight;
        return $this;
    }

    /**
     * 计算打折商品
     */
    public function reckonDiscount()
    {
        $this->youhuiPrice = 0;
        $DiscountModel = new DiscountModel();
        $discount_ids = [];
        //取出所有活动
        foreach ($this->goods as $val) {
            if ($val['prom_type'] == getMean('shop_prom_type', 'k')['dz']) {
                $discount_ids[$val['prom_id']] = $val['prom_id'];
            }
        }
        $this_time = time();
        //查找正在执行的活动ID
        $where_discount_ids = empty($discount_ids) ? 0 : $discount_ids;
        $discount = $DiscountModel->whereIn("discount_id", $where_discount_ids)
            ->where("start_time", "<=", $this_time)
            ->where("end_time", ">", $this_time)
            ->where("is_online", 1)
            ->order("start_time desc, end_time asc")
            ->find();
        if (empty($discount)) return $this;

        if ($discount->discount <= 0) return $this;
        if ($discount->is_vip == 1 && $discount->vip_discount <= 0) return $this;

        $discount_id = $discount->discount_id;
        $isVip = $this->userModel->checkVip();
        $discount_goods = [];
        foreach ($this->goods as $val) {
            if ($val['prom_id'] == $discount_id) {
                $discount_money = round(($val['price'] * $discount->discount) / 100, 2) * $val['goods_num'];
                $this_discount = round($discount->discount/10,1);

                $youhui = $val['price'] * $val['goods_num'] - $discount_money;
                if ($isVip && $discount->is_vip == 1) {
                    $this_discount = round($discount->vip_discount/10,1);
                    $discount_money = round(($val['price'] * $discount->vip_discount) / 100, 2) * $val['goods_num'];
                    $youhui = $val['price'] * $val['goods_num'] - $discount_money;
                    if ($val['is_plus_vip'] == 1 && $val['vip_price'] >= 0) {
                        $discount_money = round(($val['vip_price'] * $discount->vip_discount) / 100, 2) * $val['goods_num'];
                        $youhui = $val['vip_price'] * $val['goods_num'] - $discount_money;
                    }
                }
                $this->youhuiPrice += $youhui;
                $val['discount_money'] = $discount_money;
                $val['_discount'] = $this_discount;
                $discount_goods[] = $val;
            }
        }
        $this->discountGoods = $discount_goods;
        return $this;
    }

    /**
     * 计算满减商品
     */
    public function reckonManjian()
    {
        //如果计算了打折商品 不计算  满减
        if (!empty($this->discountGoods)) {
            return $this;
        }

        $this->youhuiPrice = 0;
        //查询最新一期满减
        $ManjianModel = new ManjianModel();
        $manjian_ids = [];
        //取出所有活动
        foreach ($this->goods as $val) {
            if ($val['prom_type'] == getMean('shop_prom_type', 'k')['mj']) {
                $manjian_ids[$val['prom_id']] = $val['prom_id'];
            }
        }
        $this_time = time();
        //查找正在执行的活动ID
        $where_manjian_ids = empty($manjian_ids) ? 0 : $manjian_ids;
        $manjian = $ManjianModel->whereIn("manjian_id", $where_manjian_ids)
            ->where("start_time", "<=", $this_time)
            ->where("end_time", ">", $this_time)
            ->where("is_online", 1)
            ->order("start_time desc,end_time asc")
            ->find();
        if (empty($manjian)) return $this;
        $manjian_id = $manjian->manjian_id;
        $isVip = $this->userModel->checkVip();
        $man = 0;
        $manjianGoods = [];
        foreach ($this->goods as $val) {
            if ($val['prom_id'] == $manjian_id) {
                $man += $val['price'] * $val['goods_num'];
                if ($isVip && $val['is_plus_vip'] == 1 && $val['vip_price'] > 0) {
                    $man += $val['vip_price'] * $val['goods_num'];
                }
                $manjianGoods[] = $val;
            }
        }

        if ($man >= $manjian->man) {
            $this->youhuiPrice = $manjian->jian;
            $this->manjianGoods = [
                'man' => $manjian->man,
                'jian' => $manjian->jian,
                'goods' => $manjianGoods
            ] ;
        }
        //会员重置优惠价格
        if ($manjian->is_vip == 1 && $isVip && $man >= $manjian->vip_man) {
            $this->youhuiPrice = $manjian->vip_jian;
            $this->manjianGoods = [
                'man' => $manjian->man,
                'jian' => $manjian->vip_jian,
                'goods' => $manjianGoods
            ] ;
        }
        return $this;
    }

    /**
     * 设置优惠券
     */
    public function setCoupon($userCouponId)
    {
        //如果参见了打折或者满减 不计算优惠券
        if (!empty($this->discountGoods) || !empty($this->manjianGoods)) {
            return $this;
        }
        $this->youhuiPrice = 0;
        $UserCouponModel = new UserCouponModel();
        $coupon = $UserCouponModel->find($userCouponId);
        //无效优惠券
        if (empty($coupon)) return $this;
        $this_time = request()->time();
        if ($coupon->expire_start_time > $this_time || $coupon->expire_end_time < $this_time) return $this;
        if ($coupon->user_id != $this->userId) return $this;
        if ($coupon->is_used == 1) return $this;
        //非法VIP
        if ($coupon->type == 1 && $this->userModel->checkVip() == false) return $this;
        //非法首单
        if ($coupon->type == 2 && OrderModel::checkFirstOrder($this->userId) == false) return $this;
        //此情况只要有该分类 即通过
        $cat_man = $man = 0;
        foreach ($this->goods as $val) {
            if ($val['is_coupon'] == 1) {
                if ($val['cat_id'] == $coupon->cat_id || $val['p_cat_id'] == $coupon->p_cat_id) {
                    $cat_man += $val['price'];
                }
                $man += $val['price'];
            }
        }
        $this->couponPrice = $coupon->money;
        $this->coupon = $coupon;
        //通用处理
        if ($coupon->userarea == 0) {
            if ($man <= 0) return $this;
            //不符合金额
            if ($coupon->condition > 0 && $coupon->condition > $man) return $this;

            //通用的时候 优惠金额 大于 支付金额 充值 优惠金额 == 支付金额
            if ($coupon->condition == 0 && $coupon->money > $man) {
                $coupon->setAttr("money", $man);
            }
        } else {
            if ($cat_man <= 0) return $this;
            if ($coupon->condition > 0 && $coupon->condition > $cat_man) return $this;
            //通用的时候 优惠金额 大于 支付金额 充值 优惠金额 == 支付金额
            if ($coupon->condition == 0 && $coupon->money > $cat_man) {
                $coupon->setAttr("money", $man);
            }
        }

        $this->couponPrice = $coupon->money;
        $this->coupon = $coupon;
        return $this;
    }

    /**
     * 指定商品 合并商品与商品规格
     * @param $goodsIds
     * @return array
     */
    private function goodsSpecMerge($goodsIds)
    {
        $goods = $_goods = [];
        foreach ($this->goods as $val) {
            $_goods[$val['goods_id']][] = $val;
        }
        foreach ($_goods as $key => $val) {
            if (in_array($key, $goodsIds, true)) {
                $goods[$key] = $val;
            }
        }
        foreach ($goods as &$val) {
            $val['count_goods_num'] = 0;
            $val['count_price'] = 0;
            foreach ($val as $goodsKey => $goodsVal) {
                if ($goodsVal['is_plus_vip'] == 1) {
                    $val['count_price'] += $goodsVal['vip_price'] * $goodsVal['goods_num'];
                } else {
                    $val['count_price'] += $goodsVal['price'] * $goodsVal['goods_num'];
                }
                $val['count_goods_num'] = $val['count_goods_num'] + $goodsVal['goods_num'];
            }
        }
        unset($val);
        return $goods;
    }

    /**
     * 计算获得积分
     */
    public function integral()
    {
        $this->integralSetting = SettingModel::getJIfen($this->appId);
        return $this;
    }


    /**
     * 获得计算价格
     * 商品总额
     * 优惠券额度
     * 快递费
     * 优惠额度
     */
    public function getGoodsPrice()
    {
        $total_price = $coupon_model = $freight = $youhui_price = 0;

        $isVip = $this->userModel->checkVip();
        foreach ($this->goods as $val) {
            if ($isVip && $val['is_plus_vip'] == 1) {
                $total_price += $val['vip_price'] * $val['goods_num'];
            } else {
                $total_price += $val['price'] * $val['goods_num'];
            }
        }
        $integral = 0;
        if (!empty($this->integralSetting)) {
            $integral = floor(($total_price * round($this->integralSetting['integral'] / 10000, 2)) / 100);
            $isVip && $integral *= round($this->integralSetting['integral_vip_combo'] / 100);
        }
        $need_price = $total_price + $this->freight -$this->youhuiPrice - $this->couponPrice;
        if ($need_price <= 0) {
            throw  new Exception("系统异常");
        }
        $this->userMoney >= $need_price  && $this->userMoney = $need_price;
        $need_price  -= $this->userMoney;
        return [
            'total_price' => (int)$total_price,
            'freight' => (int)$this->freight,
            'youhui_price' => (int)$this->youhuiPrice,
            'coupon_price' => (int)$this->couponPrice,
            'integral' => $integral,
            'count' => count($this->goods),
            'need_price' => $need_price,
            'user_money' => $this->userMoney,
            'youhui_info' => [
                'coupon' => (array)$this->coupon,
                'manjian' => (array)$this->manjianGoods,
                'discount' => (array)$this->discountGoods,
            ],
        ];
    }


    /**
     * 插入订单
     */
    public function saveOrder($device)
    {
        $price = $this->getGoodsPrice();
        $total_price = $coupon_price = $freight = $youhui_price = $payment_price = $user_money = 0;
        $total_price = $price['total_price'];
        $coupon_price = $price['coupon_price'];
        $freight = $price['freight'];
        $youhui_price = $price['youhui_price'];
        $is_pay = true;
        //订单支付价格
        $order_price = $total_price + $freight - $youhui_price - $coupon_price;
        if ($order_price < 0) {
            throw  new Exception("系统异常");
        }
        $user_money = (int) $this->userMoney;
        if ($this->userMoney >= $order_price) {
            $user_money = $order_price;
            $is_pay = false;
        }
        if ($user_money > 0) {
            $this->userModel->userMoney($user_money, getMean("user_money_type", 'k')['xf']);
        }
        if ($coupon_price > 0) {
            $this->coupon->is_used = 1;
            $this->coupon->used_time = time();
            $this->coupon->save();
        }
        if ($is_pay) {
            $payment_price = $order_price - $user_money;
        }
        $this->paymentMoney = $payment_price;
        $OrderModel = new OrderModel();
        $OrderModel->save([
            'user_id' => $this->userId,
            'app_id' => $this->appId,
            'order_sn' => date("YmdHi") . $OrderModel->getAutoMaxId(),
            'order_status' => 0,
            'shipping_status' => 0,
            'pay_status' => $is_pay ? 0 : 1,
            'name' => $this->address->name,
            'province_id' => $this->address->province_id,
            'city_id' => $this->address->city_id,
            'division_id' => $this->address->division_id,
            'address' => $this->address->address,
            'mobile' => $this->address->mobile,
            'pay_type' => $is_pay ? 0 : 4,
            'goods_price' => $total_price,
            'shipping_price' => $freight,
            'user_money' => $user_money,
            'device' => $device,
            'prom_id' => $this->prom_id,
            'prom_type' => (int) $this->prom_type,
            'coupon_price' => $coupon_price,
            'youhui_price' => $youhui_price,
            'payment_price' => $payment_price,
            'user_note' => $this->userNote,
            'buy_role' => (int)$this->userModel->checkVip(),
            'give_integral' => $price['integral'],
            'pid' => $this->userModel->getPid(),
            'end_time' => time() + 600,
        ]);
        $this->orderModel = $OrderModel;
        $orderGoods = [];
        $order_id = $OrderModel->order_id;
        $stockGoods = [];

        foreach ($this->goods as $val) {
            $stockGoods[] = [
                'goods_id' => $val['goods_id'],
                'spec_key' => $val['spec_key'],
                'sku_type' => $val['sku_type'],
                'goods_num' => $val['goods_num'],
            ];
            $orderGoods[] = [
                'order_id' => $order_id,
                'goods_id' => $val['goods_id'],
                'goods_name' => $val['goods_name'],
                'goods_num' => $val['goods_num'],
                'goods_price' => $val['price'],
                'goods_sn' => $val['goods_sn'],
                'bar_code' => $val['bar_code'],
                'vip_price' => $val['vip_price'],
                'spec_key' => $val['spec_key'],
                'spec_key_name' => $val['key_name'],
                'goods_photo' => $val['goods_img'],
                'commission' => $val['commission'],
                'prom_id' => $val['prom_id'],
                'prom_type' => $val['prom_type'],
                'sku_type' => $val['sku_type'],
            ];
        }
        $OrderGoodsModel = new OrderGoodsModel();
        $OrderGoodsModel->saveAll($orderGoods, false);
        if ($is_pay == false) {
            (new StockLogic())->StockOut($stockGoods);
        }
        return $this;
    }

    /**
     * 获取订单支付的订单信息
     */
    public function getPayOrderInfo($openId, $device, $payType = '')
    {
        if(!empty($this->unableGoods)){
            throw new Exception("有不可发货商品");
        }
        if($payType != "ali"){
            $payType = "weixin";
        }
        $is_pay = (int)($this->orderModel->payment_price > 0);
        $order_info = "";
        if ($is_pay == 1) {
            $param = [
                'title' => '商品购买',
                'subject' => "商品购买",
                'openid' => $openId,
                'notify_url' => request()->domain() . config('callbackUrl.shop_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderModel->order_id,
                'return_url' => request()->domain() . config('callbackUrl.shop_payment_return_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderModel->order_id,
                'order_id' => $this->orderModel->order_id,
                'money' => $this->orderModel->payment_price,
                'pay_type' => $payType,
                'goods_id' => $this->orderModel->order_id,
                'order_type' => 1,
            ];
            try {
                $res = Miniapp::makeModule($device, $this->appId)->createOrder($param);
                $order_info = $res['order_info'];
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        } else {
            if ($this->orderModel->prom_type == getMean('shop_prom_type','k')['qg']) {
                $OrderGoodsModel = new OrderGoodsModel();
                if ($order_goods = $OrderGoodsModel->where(['order_id'=>$this->orderModel->order_id])->find()) {
                    $RushBuyLogic = new RushBuyLogic();
                    try {
                        $RushBuyLogic->setRushGoods($order_goods['goods_id'])->setDecGoodsNum($order_goods['goods_num'],$order_goods['goods_id'],$this->orderModel->prom_id);
                    } catch (Exception $exception) {
                        \exception($exception->getMessage());
                    }
                }

            }
        }
        return [
            'order_id' => $this->orderModel->order_id,
            'is_pay' => $is_pay,
            'order_info' => $order_info,
        ];
    }

    /**
     * 获取此订单所有可用优惠券
     */
    public function getUseCoupon($needMoeny){

        $catIds = [];
        foreach ($this->goods as $val){
            $catIds[$val['p_cat_id']] = $val['p_cat_id'];
            $catIds[$val['cat_id']] = $val['cat_id'];
        }
        $where = [
            'user_id' => $this->userId,
            'is_used' => 0,
            'expire_start_time' => ["<=",time()],
            'expire_end_time'  => [">",time()],
        ];
        $UserCouponModel = new UserCouponModel();
        $couponTmp = $UserCouponModel->where($where)->select();
        $coupon = [];
        $isVip = $this->userModel->checkVip();
        foreach ($couponTmp as $val){
            if($isVip == false && $val->type == 2){
                continue;
            }
            if($val->condition != 0 && $val->condition >= $needMoeny){
                continue;
            }

            if($val->userarea == 1 && (in_array($val->cat_id,$catIds,true) || in_array($val->p_cat_id,$catIds,true))){
                continue;
            }
            $coupon[] = [
                'user_coupon_id' => $val->user_coupon_id,
                'name' => $val->name,
                'money' => moneyFormat($val->money),
                'condition' => moneyFormat($val->condition),
                'expire_start_time' => date("Y-m-d",$val->expire_start_time),
                'expire_end_time' => date("Y-m-d",$val->expire_end_time),
                'userarea' => $val->userarea == 1 ? '专属卷' : '通用卷',
                'type' => getMean("coupon_use_type")[$val->type],
            ];
        }
        return $coupon;
    }




}
