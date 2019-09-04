<?php


namespace app\shop\controller\api;


use app\shop\logic\shop\goods\CartLogic;


use app\shop\logic\shop\goods\GoodsLogic;
use app\shop\logic\shop\order\OrderSaveLogic;
use think\Exception;


class Goodsbuy extends ShopCommon
{
    protected $checkLogin = true;


    /**
     * 单独购买计算
     * @return mixed
     */
    public function getGoodsPrice()
    {
        $goods_id = (int)$this->request->param("goods_id");
        $num = (int) $this->request->param('num',1);
        if($num <= 0){
        $this->warning("至少购买一件");
        }
        $spec_key = (string) $this->request->param("spec_key");
        try {
            $GoodsLogic = new GoodsLogic();
            $detail = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
            if ($GoodsLogic->checkOnline() == false) {
                $this->warning("产品已下架");
            }
            $cartGoods = $GoodsLogic->getBuyGoodsData($spec_key,$num);
        } catch (Exception $exception) {
            $this->warning("下单失败");
        }

        $address_id = (int) $this->request->param("address_id",-1);
        $user_coupon_id = (int)$this->request->param("user_coupon_id");
        $user_money = (int) ($this->request->param("user_money",'0') == 1);
        try {
            $OrderLogic = new OrderSaveLogic();
            $res = $OrderLogic->setGoods($cartGoods)//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID
            ->getFreight()//计算邮费
            ->reckonDiscount()//计算打折商品
            ->reckonManjian()//计算满减商品
            ->setUserMoney($user_money)
            ->setCoupon($user_coupon_id)//设置优惠券
            ->integral()
            ->getGoodsPrice();                       //获得计算商品
            $unableGoods = $OrderLogic->getUnableGoods();
            $coupon = $OrderLogic->getUseCoupon($res['total_price']  - $res['freight']);
            $this->datas = [
                'total_price' => moneyFormat($res['total_price'], false),
                'freight' => moneyFormat($res['freight'], false),
                'integral' => $res['integral'],
                'coupon_price' => moneyFormat($res['coupon_price'], false),
                'youhui_price' => moneyFormat($res['youhui_price'], false),
                'unable_goods' => $unableGoods,
                'youhui_info' => $res['youhui_info'],
                'pass_coupon' => $coupon,
                'need_price' => moneyFormat($res['need_price'],false),
                'count' => $res['count'],
                'user_money' => moneyFormat($OrderLogic->getUserTotalMoney()),
            ];
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }


    }

    /**
     * 单独购买下单
     * @return mixed
     */
    public function payGoods()
    {
        //获得购物车商品
        $goods_id = (int)$this->request->param("goods_id");
        $num = (int) $this->request->param('num',1);
        $spec_key = (string) $this->request->param("spec_key");
        try {
            $GoodsLogic = new GoodsLogic();
            $detail = $GoodsLogic->setAppId($this->appId)
                ->setGoodsId($goods_id)
                ->getGoods();
            if ($GoodsLogic->checkOnline() == false) {
                $this->warning("产品已下架");
            }
            $cartGoods = $GoodsLogic->getBuyGoodsData($spec_key,$num);
        } catch (Exception $exception) {
            $this->warning("下单失败");
        }

        $address_id = (int) $this->request->param("address_id");
        $user_coupon_id = (int) $this->request->param("user_coupon_id");
        $user_money = (int) $this->request->param("user_money");
        $user_note = (string) $this->request->param("user_note");
        $pay_type = (string) $this->request->param("pay_type");
        try {
            $OrderLogic = new OrderSaveLogic();
            $this->datas = $OrderLogic->setGoods($cartGoods)//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID
            ->setCoupon($user_coupon_id)//设置优惠券
            ->setUserMoney($user_money)//设置优惠券
            ->setUserNote($user_note)//用户留言
            ->getFreight()//计算邮费
            ->reckonDiscount()//计算打折商品
            ->reckonManjian()//计算满减商品
            ->integral()//获得计算商品
            ->saveOrder($this->device)//获得计算商品
            ->getPayOrderInfo($this->openId, $this->device, $pay_type);
            //清空购物车已购买的商品
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 购物车计算价格
     * @param $address_id int 地址ID
     * @param $user_coupon_id int 用户优惠券id
     */
    public function getCartPrice()
    {
        $address_id = (int)$this->request->param("address_id",-1);
        $user_coupon_id = (int)$this->request->param("user_coupon_id");
        $user_money = (int) $this->request->param("user_money");
        try {
            $CartLogic = new CartLogic($this->userId, $this->appId);
            $OrderLogic = new OrderSaveLogic();
            $CartLogic->getCartGoods();
            $res = $OrderLogic->setGoods($CartLogic->getGoodsData())//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID]
            ->setUserMoney($user_money)
            ->getFreight()//计算邮费
            ->reckonDiscount()//计算打折商品
            ->reckonManjian()//计算满减商品
            ->setCoupon($user_coupon_id)//设置优惠券
            ->integral()
            ->getGoodsPrice();                       //获得计算商品
            $unableGoods = $OrderLogic->getUnableGoods();
            $coupon = $OrderLogic->getUseCoupon($res['total_price']  - $res['freight']);
            $this->datas = [
                'total_price' => moneyFormat($res['total_price'], true),
                'freight' => moneyFormat($res['freight'], true),
                'integral' => $res['integral'],
                'coupon_price' => moneyFormat($res['coupon_price'], true),
                'youhui_price' => moneyFormat($res['youhui_price'], true),
                'unable_goods' => $unableGoods,
                'youhui_info' => $res['youhui_info'],
                'pass_coupon' => $coupon,
                'need_price' => moneyFormat($res['need_price'],false),
                'count' => $res['count'],
                'user_money' =>moneyFormat($OrderLogic->getUserTotalMoney()),
            ];

        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 购买购物车商品
     * @return mixed
     */
    public function payCartPrice()
    {
        $address_id = (int) $this->request->param("address_id");
        if($address_id <= 0){
            $this->warning("请选择地址");
        }
        $user_coupon_id = (int) $this->request->param("user_coupon_id");
        $user_money = (int) ($this->request->param("user_money",0)==1);
        $user_note = (string) $this->request->param("user_note");
        $pay_type = (string)$this->request->param("pay_type",'wyu');
        empty($pay_type) && $pay_type = "wyu";
        try {
            $CartLogic = new CartLogic($this->userId, $this->appId);
            $OrderLogic = new OrderSaveLogic();
            $CartLogic->getCartGoods();
            $this->datas = $OrderLogic->setGoods($CartLogic->getGoodsData())//获得商品
            ->setUserId($this->userId)//设置用户ID
            ->setAppId($this->appId)//设置APPID
            ->setAddress($address_id)//设置地址ID
            ->setCoupon($user_coupon_id)//设置优惠券
            ->setUserMoney($user_money)//设置优惠券
            ->setUserNote($user_note)//用户留言
            ->getFreight()//计算邮费
            ->reckonDiscount()//计算打折商品
            ->reckonManjian()//计算满减商品
            ->integral()
            ->saveOrder($this->device)//获得计算商品
            ->getPayOrderInfo($this->openId, $this->device, $pay_type);
            //清空购物车已购买的商品
            $CartLogic->clearCartSelectGoods($this->userId);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

    }


}
