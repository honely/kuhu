<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\callback\GoodsCallback;
use app\shop\logic\shop\callback\GroupBuyCallback;
use app\shop\logic\shop\callback\IntegralCallback;
use app\shop\logic\shop\callback\MoneyCallback;
use app\shop\logic\shop\callback\VipCallback;
use app\shop\logic\shop\miniapp\Miniapp;
use think\Exception;
use think\Log;

class Callback
{
    private $pay_type = [
        'weixin' => 1,
        'ali' => 2,
        'baidu' => 3,
        'h5weixin' => 5,
        'h5ali' => 6,
        'toutiao' => 7,
    ];

    //商城支付回调通知
    public function orderCallback()
    {
        $appid =   (int)     request()->param("appid");
        $device =  (string)  request()->param("device");
        $paytype = (string)  request()->param("pay_type");
        $order_id = (int)    request()->param("order_id");
        $pay_key = $device;
        if ($device == "h5") {
            $pay_key .= $paytype;
            if($paytype == "ali"){
                $device = "ali";
            }else{
                $device = "weixin";
            }
        }

        $deviceLogic = Miniapp::makeModule($device, $appid);
        Log::error("-------获取参数----------");
        Log::error(request()->param());
        Log::error(request()->getInput());
        Log::error("-------获取参数结束----------");
        try {
            $data = $deviceLogic->checkCallback();
            if ($data == false) {
                echo $deviceLogic->response();
                return true;
            }
            $GoodsCallback = new GoodsCallback($order_id, $appid, $this->pay_type[$pay_key], $data['order_info']);
            $GoodsCallback->getResult();
            echo $deviceLogic->response();
        } catch (Exception $exception) {
            echo $deviceLogic->response();
        }
    }


    public function pintuanCallback()
    {
        $appid =   (int)     request()->param("appid");
        $device =  (string)  request()->param("device");
        $paytype = (string)  request()->param("pay_type");
        $order_id = (int)    request()->param("order_id");
        $pay_key = $device;
        if ($device == "h5") {
            $pay_key .= $paytype;
            if($paytype == "ali"){
                $device = "ali";
            }else{
                $device = "weixin";
            }
        }
        $deviceLogic = Miniapp::makeModule($device, $appid);
        Log::error("-------积分商城获取参数----------");
        Log::error(request()->param());
        Log::error(request()->getInput());
        Log::error("-------积分商城获取参数结束----------");
        try {
            $data = $deviceLogic->checkCallback();
            if ($data == false) {
                echo $deviceLogic->response();
                return true;
            }
            $GroupBuyCallback = new GroupBuyCallback($order_id, $appid, $this->pay_type[$pay_key], $data['order_info']);
            $GroupBuyCallback->getResult();
            echo $deviceLogic->response();
        } catch (Exception $exception) {
            echo $deviceLogic->response();
        }
    }



    //商城支付回调通知
    public function integralCallback()
    {
        $appid =   (int)     request()->param("appid");
        $device =  (string)  request()->param("device");
        $paytype = (string)  request()->param("pay_type");
        $order_id = (int)    request()->param("order_id");
        $pay_key = $device;
        if ($device == "h5") {
            $pay_key .= $paytype;
            if($paytype == "ali"){
                $device = "ali";
            }else{
                $device = "weixin";
            }
        }
        $deviceLogic = Miniapp::makeModule($device, $appid);
        Log::error("-------积分商城获取参数----------");
        Log::error(request()->param());
        Log::error(request()->getInput());
        Log::error("-------积分商城获取参数结束----------");
        try {
            $data = $deviceLogic->checkCallback();
            if ($data == false) {
                echo $deviceLogic->response();
                return true;
            }
            $GoodsCallback = new IntegralCallback($order_id, $appid, $this->pay_type[$pay_key], $data['order_info']);
            $GoodsCallback->getResult();
            echo $deviceLogic->response();
        } catch (Exception $exception) {
            echo $deviceLogic->response();
        }

    }


    public function vipCallback()
    {
        $appid =   (int)     request()->param("appid");
        $device =  (string)  request()->param("device");
        $paytype = (string)  request()->param("pay_type");
        $order_id = (int)    request()->param("order_id");
        $pay_key = $device;
        if ($device == "h5") {
            $pay_key .= $paytype;
            if($paytype == "ali"){
                $device = "ali";
            }else{
                $device = "weixin";
            }
        }
        $deviceLogic = Miniapp::makeModule($device, $appid);
        try {
            $data = $deviceLogic->checkCallback();
            if ($data == false) {
                echo $deviceLogic->response();
                return true;
            }
            $GroupBuyCallback = new VipCallback($order_id, $appid, $this->pay_type[$pay_key], $data['order_info']);
            $GroupBuyCallback->getResult();
            echo $deviceLogic->response();
        } catch (Exception $exception) {
            echo $deviceLogic->response();
        }
    }

    public function moneyCallback()
    {
        $appid =   (int)     request()->param("appid");
        $device =  (string)  request()->param("device");
        $paytype = (string)  request()->param("pay_type");
        $order_id = (int)    request()->param("order_id");
        $pay_key = $device;
        if ($device == "h5") {
            $pay_key .= $paytype;
            if($paytype == "ali"){
                $device = "ali";
            }else{
                $device = "weixin";
            }
        }
        $deviceLogic = Miniapp::makeModule($device, $appid);
        try {
            $data = $deviceLogic->checkCallback();
            if ($data == false) {
                echo $deviceLogic->response();
                return true;
            }
            $GroupBuyCallback = new MoneyCallback($order_id,  $appid, $this->pay_type[$pay_key], $data['order_info']);
            $GroupBuyCallback->getResult();
            echo $deviceLogic->response();
        } catch (Exception $exception) {
            echo $deviceLogic->response();
        }
    }

    /**
     * 商品回调百度专用
     */
    public function baiduCallback(){
        $request =  request();
        $param = [
            'unitPrice' =>$request->param('unitPrice'),
            'orderId' =>$request->param('orderId'),
            'payTime' => $request->param('payTime'),
            'dealId' => $request->param('dealId'),
            'tpOrderId' => $request->param('tpOrderId'),
            'count' => $request->param('count'),
            'totalMoney' => $request->param('totalMoney'),
            'hbBalanceMoney' =>$request->param('hbBalanceMoney'),
            'userId' => $request->param('userId'),
            'promoMoney' => $request->param('promoMoney'),
            'promoDetail' => $request->param('promoDetail'),
            'hbMoney' => $request->param('hbMoney'),
            'giftCardMoney' => $request->param('giftCardMoney'),
            'payMoney' => $request->param('payMoney'),
            'payType' =>$request->param('payType'),
            'returnData' => $request->param('returnData'),
            'partnerId' => $request->param('partnerId'),
            'rsaSign' => $request->param('rsaSign'),
            'status' => $request->param('status'),
        ];
        $returnData = json_decode($param['returnData'],true);
        $deviceLogic = Miniapp::makeModule("baidu", $returnData['app_id']);
        try {
            $deviceLogic->checkCallback($param);
            if($param['status'] != 2){
                echo $deviceLogic->response();
                return false;
            }
            //   百度专用 1商城 2拼团  3vip  4余额 5积分商城
            if($returnData['order_type'] == 1){
                $GoodsCallback = new GoodsCallback($returnData['order_id'],  $returnData['app_id'], 3, $param);
                $GoodsCallback->getResult();
            }elseif ($returnData['order_type'] == 2){
                $GroupBuyCallback = new GroupBuyCallback($returnData['order_id'],  $returnData['app_id'], 3, $param);
                $GroupBuyCallback->getResult();
            }elseif ($returnData['order_type'] == 3){// VIP
                $VipCallback = new VipCallback($returnData['order_id'],  $returnData['app_id'], 3, $param);
                $VipCallback->getResult();
            }elseif ($returnData['order_type'] == 4){// 余额
                $MoneyCallback = new MoneyCallback($returnData['order_id'],  $returnData['app_id'], 3, $param);
                $MoneyCallback->getResult();
            }elseif ($returnData['order_type'] == 5){// 积分商城
                $IntegralCallback = new IntegralCallback($returnData['order_id'],  $returnData['app_id'], 3, $param);
                $IntegralCallback->getResult();
            }
            echo $deviceLogic->response();
        }catch (Exception $exception){
            echo $deviceLogic->response();
        }

    }

}