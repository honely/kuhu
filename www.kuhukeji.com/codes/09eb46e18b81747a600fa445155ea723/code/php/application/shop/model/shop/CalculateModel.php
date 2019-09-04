<?php

namespace app\shop\model\shop;

/**
 * 计算商品价格
 * Class CalculateModel
 * @package app\shop\model\shop
 */
class CalculateModel{

    /**
     * 错误信息
     */
    private $error;

    //购物商品信息
    private $goods;

    //用户信息
    private $user;

    //优惠信息
    private $prom;


    /**
     * 计算订单金额
     * @param type $user_id         用户id
     * @param type $goods_id     购买的商品
     * @param type $shipping        物流code
     * @param type $shipping_price  物流费用, 如果传递了物流费用 就不在计算物流费
     * @param type $user_money      余额
     * @param type $coupon_id       优惠券
     */

    public function runCalculate($user_id = 0, $goods_id = 0, $shipping_code = '', $shipping_price = 0,$address_id = 0, $pay_points = 0, $user_money = 0, $coupon_id = 0){

    }

    /**
     * @param int $goodsId 默认则选择购物车的 否则则选取购物车
     */
    private function getByGoods($goodsId = 0){

    }

    /**
     * 获取物流价格
     * @param int $shipping_id
     * @return int
     */
    private function getShippingPrice($address_id,$shipping_id = 0,$goods_id=0) {
        return 0;
    }

    /**
     * 获取优惠券的价格
     * @return int
     */
    private function getCouponPrice(){
        return 0;
    }

    /**
     * 获取打折的价格
     * @return int
     */
    private function getDiscountPrice(){
        return 0;
    }


    /**
     * 获取满减的价格
     * @return int
     */
    private function getManjianPrice(){
        return 0;
    }

}
