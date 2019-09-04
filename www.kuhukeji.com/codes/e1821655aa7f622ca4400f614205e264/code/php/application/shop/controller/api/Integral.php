<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\goods\FreightLogic;
use app\shop\logic\shop\KuaidiniaoApi;
use app\shop\logic\shop\order\IntegralOrderAdminLogic;
use app\shop\logic\shop\order\IntegralOrderLogic;
use app\shop\logic\shop\order\IntegralOrderUserLogic;
use app\shop\model\shop\AddressModel;
use app\shop\model\shop\IntegralCategoryModel;
use app\shop\model\shop\IntegralGoodsModel;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\IntegralOrderRejectModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserIntegralModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class Integral extends ShopCommon
{
    protected $cat;
    protected $checkLogin = true;

    public function getCat()
    {
        $IntegralCategoryModel = new IntegralCategoryModel();
        $where = [
            'app_id' => $this->appId,
            'is_show' => 1,
        ];
        $catTmp = $IntegralCategoryModel->where($where)->order('orderby desc')->select();
        $cat = [];
        foreach ($catTmp as $v) {
            $cat[] = [
                'cat_id' => $v->cat_id,
                'name' => $v->name,
                'is_hot' => $v->is_hot,
            ];
        }
        $this->cat = $cat;
    }


    //积分商城首页
    public function index()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $UserIntegralModel = new UserIntegralModel();
        $user = [
            'user_id' => $this->userId,
            'face' => $UserModel->getUser()->face,
            'nickname' => $UserModel->getUser()->nickname,
            'integral' => $UserIntegralModel->getIntegral($this->userId),
        ];

        $cat_id = (int) $this->request->param('cat_id', 0);
        $IntegralCategoryModel = new IntegralCategoryModel();

            if (!$cat = $IntegralCategoryModel->find($cat_id)) {
                $whereCat = [
                    'app_id' => $this->appId,
                    'is_show' => 1,
                    'is_hot' => 1,
                ];
                if ($cat = $IntegralCategoryModel->where($whereCat)->find()) {
                    $cat_id = $cat->cat_id;
                }

            }
        if($cat_id > -1){
            $where['cat_id'] = $cat_id;
        }elseif ($cat_id == 0){
            $where['is_recommend'] = 1;
        }
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $IntegralGoodsModel = new IntegralGoodsModel();
        $listTmp = $IntegralGoodsModel->where($where)->order("is_recommend desc,orderby desc")->page($this->page, $this->limit)->select();
        $goods_ids = [];
        foreach ($listTmp as $v) {
            $goods_ids[$v->goods_id] = $v->goods_id;
        }
        $goods_ids = empty($goods_ids) ? '' : $goods_ids;
        $IntegralOrderModel = new IntegralOrderModel();
        $orders_tmp = $IntegralOrderModel->whereIn('goods_id',$goods_ids)->where(['user_id'=>$this->userId])->where('pay_status','>',0)->select();
        $order_goods_ids = [];
        foreach ($orders_tmp as $v) {
            $order_goods_ids[$v->goods_id] = $v->goods_id;
        }

        $list = [];
        foreach ($listTmp as $val) {
            $list[] = [
                'goods_id' => (int)$val->goods_id,
                'cat_id' => (int)$val->cat_id,
                'goods_name' => (string) $val->goods_name,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
                'integral' =>$val->integral,
                'photo' => (string)$val->photo,
                'is_recommend' => (int)$val->is_recommend,
                'goods_num' => (int) $val->goods_num,
                'comment_count' => (int)$val->comment_count,
                'views' => (int)$val->views,
                'is_duihuan' => (int) isset($order_goods_ids[$val->goods_id]),
            ];
        }

        $this->getCat();
        $this->datas['list'] = $list;
        $this->datas['isMore'] = (int)($this->limit == count($list));
        $this->datas['user'] = $user;
        $this->datas['cat'] = $this->cat;
        $this->datas['seo'] = $this->default_seo;

    }


    /**
     * 积分商品详情
     */
    public function detail()
    {
        $goods_id = (int)$this->request->param("goods_id", 0);
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$integral = $IntegralGoodsModel->find($goods_id)) {
            $this->noPage('参数不正确！');
        }
        if ($integral->app_id != $this->appId) {
            $this->noPage('参数不正确！');
        }
        if ($integral->is_online == 0) {
            $this->noPage('该商品已下线！');
        }
        $UserIntegralModel = new UserIntegralModel();
        $SettingModel = new SettingModel();
        $rule = $SettingModel->where(['app_id' => $this->appId])->value('integral_rule');
        $is_exchange = 0;
//        $IntegralOrderModel = new IntegralOrderModel();
//        if ($integral_order = $IntegralOrderModel->where(['user_id'=>$this->userId])->where('pay_status','>',0)->find()) {
//            $is_exchange = 1;
//        }
        $shipping_price = 0;
        if ($integral->is_free_shipping == 0) {
            $FreightLogic = new FreightLogic();
            $FreightLogic->setGoodsModel($integral);
            $FreightLogic->setRegionId(1);
            $FreightLogic->setGoodsNum(1);
            $FreightLogic->doCalculation();
            $shipping_price = $FreightLogic->getFreight();
        }
        $detail = [
            'is_buy' => (int) ($integral->integral > $UserIntegralModel->getIntegral($this->userId)),
            'is_have' => (int) ($integral->goods_num <= 0),
            'goods_id' => $integral->goods_id,
            'cat_id' => $integral->cat_id,
            'goods_sn' => $integral->goods_sn,
            'goods_name' => $integral->goods_name,
            'market_price' => moneyFormat($integral->market_price, true),
            'shop_price' => moneyFormat($integral->shop_price, true),
            'integral' => $integral->integral,
            'goods_content' => (array) json_decode($integral->goods_content, true),
            'photo' => (string)$integral->photo,
            'is_free_shipping' => $integral->is_free_shipping,
            'shipping_price' => moneyFormat($shipping_price),
            'orderby' => $integral->orderby,
            'is_recommend' => $integral->is_recommend,
            'sales_sum' => $integral->sales_sum,
            'shipping_area_ids' => explode(',', $integral->shipping_area_ids),
            'comment_count' => $integral->comment_count,
            'views' => $integral->views,
            'goods_num' => $integral->goods_num,
            'photos' => json_decode($integral->photos, true),
            'rule' => json_decode($rule, true),
            'integral_enough' => (int)($integral->integral <= $UserIntegralModel->getIntegral($this->userId)),
//            'is_exchange' => $is_exchange,
        ];
        $this->datas['detail'] = $detail;
        $this->datas['seo'] = json_decode($integral->seo) ? json_decode($integral->seo,true) : $this->default_seo;
    }


    /**
     * 订单准备下单页 根据地址获得运费
     */
    public function orderConfirm()
    {
        $goods_id = (int) $this->request->param('goods_id');
        $IntegralGoodsModel = new IntegralGoodsModel();
        if (!$goods = $IntegralGoodsModel->find($goods_id)) {
            $this->noPage('参数不正确！');
        }
        if ($goods->app_id != $this->appId) {
            $this->noPage('参数不正确！');
        }
        $address_id = (int) $this->request->param('address_id',0);
        $AddressModel = new AddressModel();
        $address = $AddressModel->find($address_id);
        if(!empty($address) && $address->user_id != $this->userId){
            $this->warning("收货地址不正确");
        }
        $regionId = empty($address) ? 1 : $address->division_id;
        $UserIntegralModel = new UserIntegralModel();
        $shipping_price = 0;
        if ($goods->is_free_shipping == 0) {
            $FreightLogic = new FreightLogic();
            $FreightLogic->setGoodsModel($goods);
            $FreightLogic->setRegionId($regionId);
            $FreightLogic->setGoodsNum(1);
            $FreightLogic->doCalculation();
            $shipping_price = $FreightLogic->getFreight();
        }
        $this->datas = [
            'is_buy' => (int) ($goods->integral > $UserIntegralModel->getIntegral($this->userId)),
            'is_have' => (int) ($goods->goods_num >= 0),
            'goods_sn' => $goods->goods_sn,
            'goods_name' => $goods->goods_name,
            'photo' => (string)$goods->photo,
            'shipping_price' => moneyFormat($shipping_price,true),
            'integral' => (int)$goods->integral,
            'shop_price' => moneyFormat($goods->shop_price),
        ];
    }


    /**
     * 下单支付
     */
    public function createOrder() {
        $goods_id = (int) $this->request->param('goods_id',0);
        $address_id = (int) $this->request->param('address_id',0);
        $use_money = (int) ($this->request->param("use_money",0 )== 1);
        $IntegralOrderLogic = new IntegralOrderLogic();
        try {
            $IntegralOrderLogic->setGoodsId($goods_id)->setAppId($this->appId)->setUserId($this->userId)->reduceGold()->setAddress($address_id)->setDevice($this->device)->getFreight()->saveOrder($use_money);
            $pay_type = (string)$this->request->param("pay_type",'wyu');
            empty($pay_type) && $pay_type = "wyu";
            $res = $IntegralOrderLogic->getPayOrderInfo($this->openId, $this->device,$pay_type);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $this->datas = $res;
    }


    /**
     * 订单列表
     */
    public function orderIndex()
    {
        $IntegralOrderModel = new IntegralOrderModel();
        $type = (int)$this->request->param('type', 0);
        $where = [
            'user_id' => $this->userId,
        ];
        switch ($type) {
            case 1: //待付款
                $where['pay_status'] = 0;
                $where['end_time'] = [">", time()];
                break;
            case 2: //已发货
                $where['order_status'] = 1;
                $where['shipping_status'] = 0;
                break;
            case 3: //
                $where['order_status'] = 1;
                $where['shipping_status'] = 1;
                break;
            case 4:
                $where['order_status'] = 3;
                break;
            case 5:
                $where['pay_status'] = 2;
                break;
        }
        $listTmp = $IntegralOrderModel->where($where)->order('order_id desc')->page($this->page, $this->limit)->select();
        $list = [];
        foreach ($listTmp as $v) {
            $list[] = [
                'order_id' => $v->order_id,
                'order_status' => $v->orderStatusDetail['order_type'],
                'order_status_mean' => $v->orderStatusDetail['order_type_mean'],
                'goods_id' => $v->goods_id,
                'goods_name' => $v->goods_name,
                'photo' => $v->photo,
                'shop_price' => moneyFormat($v->shop_price),
                'integral' => $v->integral,
                'shipping_price' => moneyFormat($v->shipping_price),
                'expire_time' => ($v->end_time > time()) ? $v->end_time - time() : 0,
            ];
        }
        $this->datas = [
            'list' => $list,
            'isMore' => (int)(count($list) == $this->limit),
        ];
    }


    /**
     * 订单详情页
     */
    public function orderDetail()
    {
        $IntegralOrderModel = new IntegralOrderModel();
        $order_id = (int)$this->request->param('order_id');
        if (!$order = $IntegralOrderModel->find($order_id)) {
            $this->noPage('参数不正确！');
        }
        if ($order->app_id != $this->appId) {
            $this->noPage('参数不正确！');
        }
        $detail = [
            'order_id' => $order->order_id,
            'user_id' => $order->user_id,
            'order_status' => $order->orderStatusDetail['order_type'],
            'order_status_mean' => $order->orderStatusDetail['order_type_mean'],
            'shipping_name' => $order->shipping_name,
            'shipping_price' => moneyFormat($order->shipping_price),
            'name' => (string)$order->getAttr('name'),
            'mobile' => (string)$order->mobile,
            'address' => (string)$order->address,
            'goods_sn' => (string)$order->goods_sn,
            'goods_id' => $order->goods_id,
            'goods_name' => $order->goods_name,
            'photo' => $order->photo,
            'shop_price' => moneyFormat($order->shop_price, true),
            'integral' => $order->integral,
            'pay_type' => isset(getMean('order_payment_method')[$order->pay_type]) ? getMean('order_payment_method')[$order->pay_type] : '未选择支付方式',
            'all_money' => moneyFormat(($order->payment_money + $order->user_money + $order->shipping_price), true),
            'end_time' => ($order->end_time > time()) ? $order->end_time - time() : 0,
            'add_time' => date("Y-m-d H:i", $order->add_time),
        ];
        $this->datas['detail'] = $detail;
    }


    //获得物流信息
    public function getShippingInfo()
    {
        $order_id = (int)$this->request->param('order_id');
        $OrderUserLogic = new IntegralOrderAdminLogic();
        try {
            $OrderUserLogic->setOrderId($order_id);
            $res = $OrderUserLogic->getOrderTrail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $order_detail = $OrderUserLogic->getOrderDetail();
        $this->datas = [
            'data' => $res['data'],
            'is_open' => $res['is_open'],
            'shipping_status' => getMean('order_shipping_status')[$order_detail['shipping_status']],
            'shipping_num' => $order_detail['shipping_num'],
            'shipping_name' => $order_detail['shipping_name'],
        ];
    }


    /**
     * 获得取消订单的选项
     */
    public function getCancelOptions () {
        $order_id = (int) $this->request->param('order_id');
        $IntegralOrderModel = new IntegralOrderModel();
        if (!$order = $IntegralOrderModel->find($order_id)) {
            $this->warning('参数不正确');
        }
        if ($order->user_id != $this->userId) {
            $this->warning('参数不正确');
        }
        if ($order->pay_status > 0) {
            $this->warning('订单已付款,不支持取消！');
        }
        $data['reason'] = statusToMap(getMean('integral_cancel_order_reason'));
        if ($order->pay_status == 1) {
            $data['integral'] = $order->integral;
            $data['shipping_price'] = moneyFormat($order->shipping_price, true);
            $data['user_money'] = moneyFormat($order->user_money, true);
            $data['payment_money'] = moneyFormat($order->payment_money, true);
        }
        $this->datas = $data;
    }

    /**
     * 取消订单
     */
    public function cancelOrder() {
        $order_id = (int) $this->request->param('order_id',0);
        $reason = (int) $this->request->param('reason',1);
        $IntegralOrderModel = new IntegralOrderModel();
        if (!$order = $IntegralOrderModel->find($order_id)) {
            $this->warning('参数不正确！');
        }
        if ($order->user_id != $this->userId) {
            $this->warning('参数不正确！');
        }
        if ($order->pay_status > 0) {
            $this->warning('订单已付款,不支持取消！');
        }
        $IntegralOrderRejectModel = new IntegralOrderRejectModel();
        $data = [
            'user_id' => $this->userId,
            'name' => $order->getAttr('name'),
            'mobile' => $order->mobile,
            'reject_goods_status' => 0,
            'reject_reason' => $reason,
            'order_id' => $order_id,
        ];
        $IntegralOrderRejectModel->save($data);
    }


    /**
     * 确认收货
     */
    public function confirmOrder() {
        $order_id = (int) $this->request->param('order_id');
        $IntegralOrderModel = new IntegralOrderModel();
        if (!$order = $IntegralOrderModel->find($order_id)) {
            $this->warning("参数错误！");
        }
        if ($order->app_id != $this->appId) {
            $this->warning("参数错误！");
        }
        if ($order->user_id != $this->userId) {
            $this->warning("参数错误！");
        }
        $IntegralOrderModel->isUpdate(true)->save(['order_status'=>2],['order_id'=>$order_id]);
    }


    /**
     * 继续支付
     */
    public function continuePay() {
        $order_id = (int) $this->request->param('order_id');
        $IntegralOrderUserLogic = new IntegralOrderUserLogic();
        try {
            $IntegralOrderUserLogic->setUserId($this->userId)->setOrderId($order_id)->getOrderDetail();
            $pay_type = (string)$this->request->param("pay_type",'wyu');
            empty($pay_type) && $pay_type = "wyu";
            $res = $IntegralOrderUserLogic->getPayOrderInfo($this->openId, $this->device,$pay_type);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
        $this->datas = $res;
    }
}



