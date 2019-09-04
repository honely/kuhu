<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\logic\shop\user\UserMoneyLogic;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\IntegralGoodsModel;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\UserIntegralModel;
use app\shop\model\shop\UserModel;
use think\Exception;

/**
 * 订单处理逻辑 通用计算
 * Class OrderSaveLogic
 * @package app\shop\logic\shop\order
 */
class IntegralOrderLogic
{

    //用户ID
    private $userId;
    //APPID
    private $appId;
    //购物商品信息
    private $goods;
    //用户收货地址
    private $address;
    //地区 默认北京
    private $regionId = 1;
    //用户处理模型
    private $userModel;
    //用户使余额
    private $userMoney = 0;
    //在线支付余额
    private $paymentMoney;
    //运费
    private $shippingPrice;

    private $device;

    private $orderId;

    private $order;

    private $IntegralOrderModel;

    private $error;


    public function setGoodsId($goods_id) {
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$goods = $IntegralGoodsModel->find($goods_id)) {
            throw new Exception('参数错误！');
        }

        if ($goods->goods_num <= 0) {
            $IntegralGoodsModel->isUpdate(true)->save(['is_online'=>0],['goods_id'=>$goods_id]);
            throw new Exception('对不起,商品已售罄！');
        }
        $this->setGoods($goods);
        return $this;
    }


    public function getError() {
        return $this->error;
    }


    /**
     * 设置应用ID
     */
    public function setAppId($appId)
    {
        $this->appId = $appId;
        if ($this->goods->app_id != $appId) {
            throw new Exception('参数错误！');
        }
        return $this;
    }

    /**
     * 设置设备
     */
    public function setDevice($device) {
        $this->device = $device;
        return $this;
    }


    /**
     * 设置用户ID
     * @param $userId
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
        $UserModel = new UserModel();
        $this->userModel = $UserModel->findUser($this->userId);
        $user = $this->userModel->getUser();
        if (empty($user)) {
            throw new Exception('参数异常！');
        }
        return $this;
    }



    public function setAddress($address_id) {
        $AddressModel = new AddressModel();
        if (!$addresss = $AddressModel->find($address_id)) {
            throw new Exception('请选择收货地址！');
        };

        if ($addresss->user_id != $this->userId) {
            throw new Exception('请选择收货地址！');
        }
        $this->address = $addresss;
        $this->regionId = $this->address->division_id;
        return $this;
    }



    /**
     * 计算运费
     */
    public function getFreight() {
        $this->shippingPrice = 0;
        if ($this->goods->is_free_shipping == 0) {
            $FreightLogic = new FreightLogic();
            $FreightLogic->setGoodsModel($this->goods);
            $FreightLogic->setRegionId($this->address->division_id);
            $FreightLogic->setGoodsNum(1);
            $FreightLogic->doCalculation();
            $this->shippingPrice = $FreightLogic->getFreight();
        }
        return $this;
    }


    /**
     * 扣除积分
     */
    public function reduceGold() {
        $UserIntegralModel = new UserIntegralModel();
        if ($UserIntegralModel->useGold($this->userId, $this->goods->integral,getMean('integral_log_type','key')['dhsp'],$this->appId) == false) {
            throw new Exception('积分扣除失败');
        }
        return $this;
    }


    /**
     * 插入订单
     */
    public function saveOrder($use_money)
    {
        $price_all = $this->getGoodsPrice();
        $price = $price_all['shop_price'];
        $total_price = $price_all['total_price'];
        $shipping_price = $price_all['shipping_price'];
        $integral = $price_all['integral'];
        $is_pay = true;
        if ($price == 0) {
            $is_pay = false;
        }
        //使用余额
        if ($use_money) {
            try {
                $this->setUserMoney($total_price);
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        }

        $this->setPaymentMoney($total_price,$use_money);
        $IntegralOrderModel = new IntegralOrderModel();
        $this->IntegralOrderModel = $IntegralOrderModel;
        $IntegralOrderModel->save([
            'app_id' => $this->appId,
            'user_id' => $this->userId,
            'order_sn' => 'JF' . date("YmdHi") . $IntegralOrderModel->getAutoMaxId(),
            'order_status' => 0,
            'shipping_status' => 0,
            'pay_status' => 0,
            'name' => $this->address->name,
            'mobile' => $this->address->mobile,
            'province_id' => $this->address->province_id,
            'city_id' => $this->address->city_id,
            'division_id' => $this->address->division_id,
            'address' => $this->address->street + $this->address->address,
            'goods_id' => $this->goods->goods_id,
            'goods_name' => $this->goods->goods_name,
            'photo' => $this->goods->photo,
            'integral' => $integral,
            'shipping_price' => $shipping_price,
            'shop_price' => $this->goods->shop_price,
            'user_money' => $this->userMoney,
            'payment_money' => $this->paymentMoney,
            'pay_type' => $is_pay ? 0 : 4,
            'end_time' => time() + 3600,
            'device' => $this->device,
        ]);
        $this->orderId = $IntegralOrderModel->order_id;
        return $this;
    }



    /**
     * 获取订单支付的订单信息
     */
    public function getPayOrderInfo($openId, $device, $payType = 'wyu')
    {
        $this->order = $this->IntegralOrderModel->find($this->orderId);
        $is_pay = (int)($this->order->payment_money > 0);
        $order_info = "";

        if ($is_pay == 1) {
            $param = [
                'title' => '积分商品',
                'subject' => $this->order->goods_name,
                'openid' => $openId,
                'notify_url' => request()->domain() . config('callbackUrl.integral_payment_notify_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderId,
                'return_url' => request()->domain() .config('callbackUrl.integral_payment_return_callback').'/appid/'.$this->appId . '/device/' . $device . '/pay_type/' . $payType . '/order_id/' . $this->orderId,
                'order_id' => $this->orderId,
                'money' => $this->paymentMoney,
                'pay_type' => $payType,
                'goods_id' => $this->order->goods_id,
                'order_type' => 5,
            ];
            try {
                $res = Miniapp::makeModule($device, $this->appId)->createOrder($param);
                $order_info = $res['order_info'];
            } catch (Exception $exception) {
                throw new Exception($exception->getMessage());
            }
        }
        return [
            'is_pay' => $is_pay,
            'order_info' => $order_info,
        ];
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
        return [
            'shop_price' => (int)$this->goods->shop_price,
            'integral' => (int)$this->goods->integral,
            'shipping_price' => (int)$this->shippingPrice,
            'total_price' => $this->goods->shop_price + $this->shippingPrice,
        ];
    }


    /**
     * 设置用户使用余额
     */
    public function setUserMoney($total_price)
    {
        try {
            $UserMoneyLogic = new UserMoneyLogic($this->userId);
        } catch (Exception $exception) {
            throw new Exception($exception->getMessage());
        }

        if ($UserMoneyLogic->getUserMoney() >= $total_price) {
            $this->userMoney = $total_price;
        }
        return $this;
    }

    /**
     * 设置在线支付金额
     */
    public function setPaymentMoney($total_price,$use_moeny)
    {
        if ($use_moeny) {
            $payment_price = $total_price - $this->userMoney > 0 ? $total_price - $this->userMoney : 0;
            $this->paymentMoney = $payment_price;
        } else {
            $this->paymentMoney = $total_price;
        }

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
     * 设置订单  继续支付
     *
     */


}
