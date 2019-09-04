<?php

namespace app\shop\controller\admin\order;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\order\IntegralOrderAdminLogic;
use app\shop\logic\shop\order\OrderAdminLogic;
use app\shop\logic\shop\order\OrderRejectLogic;
use app\shop\model\shop\IntegralOrderModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\OrderRejectModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class Integralorder extends Common
{
    /**
     * 订单列表
     */
    public function index()
    {
        $where['app_id'] = $this->appId;

        //$where['admin_delete'] = 0;
        //开始结束如期
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        if (!empty($bg_add_time) && !empty($end_add_time)) {
            $where['add_time'] = ['BETWEEN', [$bg_add_time, $end_add_time]];
        }
        //支付状态
        $pay_status = (int)$this->request->param("pay_status");
        $pay_status > 0 && $where['pay_status'] = $pay_status - 1;
        //支付方式
        $pay_type = (string)$this->request->param("pay_type");
        !empty($pay_status) && $where['pay_type'] = $pay_type;
        //发货状态
        $shipping_status = (int)$this->request->param("shipping_status");
        $shipping_status > 0 && $where['shipping_status'] = $shipping_status - 1;
        //订单状态
        $order_status = (int)$this->request->param("order_status");
        $order_status > 0 && $where['order_status'] = $order_status - 1;

        //收货人搜索
        $name = (string)$this->request->param("name");
        !empty($name) && $where['name'] = ["LIKE", $name];
        //订单来源

        //设备来源
        $device = (string)$this->request->param("device");
        !empty($device) && $where['device'] = $device;

        $keywords = (string)$this->request->param("keywords");
        $keywords_type = (int)$this->request->param("keywords_type", 1);
        if (!empty($keywords)) {
            if ($keywords_type == 1) {
                $where['order_sn'] = ["LIKE", "{$keywords}"];
            } else {
                $where["name|mobile"] = ["LIKE", "{$keywords}"];
            }
        }

        
        $IntegralOrderModel = new IntegralOrderModel();
        $list = $IntegralOrderModel->where($where)->order("order_id desc")->page($this->page, $this->limit)->select();
        $count = $IntegralOrderModel->where($where)->count();
        $datas = [];
        $order_status_mean = getMean("order_status");
        $order_shipping_status_mean = getMean("order_shipping_status");
        $order_pay_status_mean = getMean("order_pay_status");
        $pay_type_mean = getMean("order_payment_method");

        foreach ($list as $val) {
            $pay_price = $val->shop_price + $val->shipping_price;

            $datas[] = [
                'order_id' => $val->order_id,
                'order_sn' => $val->order_sn,
                'name' => $val->name . ":" . $val->mobile,
                'pay_type' => empty($pay_type_mean[$val->pay_type]) ? '未知' : $pay_type_mean[$val->pay_type],
                'order_status' => empty($order_status_mean[$val->order_status]) ? '未知' : $order_status_mean[$val->order_status],
                'shipping_status' => empty($order_shipping_status_mean[$val->shipping_status]) ? '未知' : $order_shipping_status_mean[$val->shipping_status],
                'pay_status' => empty($order_pay_status_mean[$val->pay_status]) ? '未知' : $order_pay_status_mean[$val->pay_status],
                'integral' =>  $val->integral,
                'pay_price' =>  moneyFormat($pay_price,true),
                'shop_price' => moneyFormat($val->shop_price,true),
                'shipping_price' => moneyFormat($val->shipping_price,true),
                'device' => $val->device,
                'add_time' => date("Y/m/d H:i:s", $val->add_time)
            ];
        }

        $this->datas = [
            'list' => [
                'list' => $datas,
                'limit' => $this->limit,
                'count' => $count,
            ],
            'status' => [
                'status_mean' => statusToMap($order_status_mean),
                'shipping_status_mean' => statusToMap($order_shipping_status_mean),
                'pay_status_mean' => statusToMap($order_pay_status_mean),
                'pay_type_mean' => statusToMap($pay_type_mean),

            ],
        ];
    }


    /**
     * 订单详情
     */
    public function detail()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $detail = $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->getOrderDetail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

        $order_status_mean = getMean("order_status");
        $order_shipping_status_mean = getMean("order_shipping_status");
        $order_pay_status_mean = getMean("order_pay_status");
        $pay_type_mean = getMean("order_payment_method");
        $prom_type = getMean('shop_prom_type');
        $orderGoods[] = [
            'goods_id' => $detail->goods_id,
            'goods_sn' => $detail->goods_sn,
            'goods_name' => $detail->goods_name,
            'photo' => $detail->photo,
            'integral' => $detail->integral,
            'shop_price' => moneyFormat($detail->shop_price),
        ];

        if (!empty($detail->orderUser)) {
            $user = [
                'nickname' => $detail->orderUser->nickname,
                'user_id' => $detail->orderUser->user_id,
                'face' => $detail->orderUser->face,
                'mobile' => $detail->orderUser->mobile,
            ];
        }

        $Trail = $IntegralOrderAdminLogic->getOrderTrail();
        $this->datas['trail'] = $Trail;
        $this->datas['detail'] = [
            'order_id' => $detail->order_id,
            'order_sn' => (string) $detail->order_sn,
            'user' => $user,
            'pay_price' => moneyFormat($detail->shop_price,true),
            'name' => $detail->name,
            'mobile' => $detail->mobile,
            'pay_type' => empty($pay_type_mean[$detail->pay_type]) ? '未知' : $pay_type_mean[$detail->pay_type],
            'device' => (string) $detail->device,
            'order_status' => isset($order_status_mean[$detail->order_status]) ? $order_status_mean[$detail->order_status] : '--',
            'shipping_status' => empty($order_shipping_status_mean[$detail->shipping_status]) ? '未知' : $order_shipping_status_mean[$detail->shipping_status],
            'pay_status' => isset($order_pay_status_mean[$detail->pay_status]) ? $order_pay_status_mean[$detail->pay_status] : '--',
            'add_time' => date("Y/m/d H:i:s", $detail->add_time),
            'pay_time' => empty($detail->pay_time) ? '-' : date("Y/m/d H:i:s", $detail->pay_time),
            'shipping_name' => $detail->shipping_name ? $detail->shipping_name : '未设置',
            'shipping_code' => $detail->shipping_code,
            'shipping_num' => $detail->shipping_num,
            'shop_price' => moneyFormat($detail->shop_price, true),
            'shipping_price' => moneyFormat($detail->shipping_price, true),
            'user_money' => moneyFormat($detail->user_money, true),
            'payment_money' => moneyFormat($detail->shop_price + $detail->shipping_price - $detail->user_money, true),
            'shipping_data' => $detail->shipping_data,
            'user_note' => $detail->user_note,
            'admin_note' => $detail->admin_note,
            'address' => $detail->address,
        ];
        $this->datas['agent'] = [];
        $this->datas['goods'] = $orderGoods;

    }

    /**
     * order_status
     * 确认订单
     */
    public function setYesOrder()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setYesOrder();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 取消确认订单
     */
    public function setNoOrder()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setNoOrder();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     *
     * 设置为无效订单
     */
    public function setInvalid()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setInvalid();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     *
     * 设为已支付
     */
    public function setYesPay()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setYesPay();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     *
     * 设为未支付
     */
    public function setNoPay()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setNoPay();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 管理员留言
     */
    public function adminNote()
    {
        $orderId = (int)$this->request->param("order_id");
        $note = (string)$this->request->param("note");
        if (empty($note)) {
            $this->warning("请输入留言留言内容");
        }
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->setAdminNote($note);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 查看订单轨迹
     */
    public function viewShipping()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $res = $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->getOrderTrail();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 删除此订单
     */
    public function delete()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $IntegralOrderAdminLogic = new IntegralOrderAdminLogic();
            $IntegralOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->deleteAdmin();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }

    /**
     * 退款单
     */
    public function refundOrder()
    {
        $OrderRejectModel = new OrderRejectModel();
        $where['app_id'] = $this->appId;
        $reject_list_tmp = $OrderRejectModel->where($where)->page($this->page, $this->limit)->select();
        $count = $OrderRejectModel->where($where)->count();
        $orderIds = $userIds = [];
        foreach ($reject_list_tmp as $v) {
            $orderIds[$v->order_id] = $v->order_id;
            $userIds[$v->user_id] = $v->user_id;
        }
        //$orderIds = empty($orderIds) ? '' : $orderIds;
        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();
        $OrderModel = new OrderModel();
        $users = $UserModel->itemsByIds($userIds);
        $orders = $OrderModel->itemsByIds($orderIds);

        $user_goods_status_mean = getMean('user_goods_status');
        $no_goods_reject_reason = getMean('no_goods_reject_reason');
        $has_goods_reject_reason = getMean('has_goods_reject_reason');
        $order_reject_status = getMean('order_reject_status');

        $goods_reject_reason = $no_goods_reject_reason;
        foreach ($has_goods_reject_reason as $k => $v) {
            $goods_reject_reason[$k] = $v;
        }
        $list = [];

        foreach ($reject_list_tmp as $v) {
            $order_price = $orders[$v->order_id]['goods_price'] + $orders[$v->order_id]['shipping_price'] - $orders[$v->order_id]['coupon_price'] - $orders[$v->order_id]['youhui_price'];
            $list[] = [
                'reject_id' => $v->reject_id,
                'order_id' => $v->order_id,
                'user_id' => $v->user_id,
                'nickname' => $users[$v->user_id]['nickname'],
                'name' => $v->name,
                'mobile' => $v->mobile,
                'address' => $orders[$v->order_id]['address'],
                'order_price' => moneyFormat($order_price, true),
                'goods_price' => moneyFormat($orders[$v->order_id]['goods_price'], true),
                'shipping_price' => moneyFormat($orders[$v->order_id]['shipping_price'], true),
                'coupon_price' => moneyFormat($orders[$v->order_id]['coupon_price'], true),
                'youhui_price' => moneyFormat($orders[$v->order_id]['youhui_price'], true),
                'user_money' => moneyFormat($orders[$v->order_id]['user_money'], true),
                'reject_goods_status' => $v->reject_goods_status,
                'reject_goods_status_mean' => $user_goods_status_mean[$v->reject_goods_status],
                'reject_reason' => $v->reject_reason,
                'reject_reason_mean' => $goods_reject_reason[$v->reject_reason],
                'reject_content' => (string)$v->reject_content,
                'reject_photos' => json_decode($v->reject_photos, true),
                'add_time' => date("Y-m-d H:i", $v->add_time),
                'add_ip' => $v->app_id,
                'reject_status' => $v->reject_status,
                'reject_status_mean' => $order_reject_status[$v->reject_status],
                'refuse_reason' => $v->refuse_reason,
                'refund_money' => moneyFormat($v->refund_money, true),
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'goods_reject_reason' => statusToMap($goods_reject_reason),
            'order_reject_status' => statusToMap($order_reject_status),
            'goods_status_mean' => statusToMap($user_goods_status_mean),
        ];
    }

    //同意退款
    public function agreeRefund()
    {
        $refund_money = moneyToInt($this->request->param('refund_money', 0));
        $reject_id = (int)$this->request->param('reject_id', 0);
        $OrderRejectModel = new OrderRejectModel();
        if (!$reject = $OrderRejectModel->find($reject_id)) {
            $this->warning('参数不正确!');
        }

        if ($refund_money) {    //需要退款
            try {
                $OrderRejectLogic = new OrderRejectLogic($reject->order_id, $reject->user_id);
                $OrderRejectLogic->returnRepertory()
                    ->returnUserCoupon()
                    ->agreeRejectOrder($refund_money, $reject_id)
                    ->returnUserMoney()
                    ->returnOnlinePayment();
            } catch (Exception $exception) {
                $this->warning($exception->getMessage());
            }
        }

        $OrderModel = new OrderModel();
        $save_data = [
            'pay_status' => getMean('integral_order_pay_status', 'key')['ytk'],
        ];
        $OrderModel->isUpdate(true)->save($save_data, $reject->order_id);
    }

    //拒绝退款
    public function refuseRefund()
    {
        $refuse_reason = SecurityEditorHtml($this->request->param('refuse_reason', ''));
        $reject_id = (int)$this->request->param('reject_id', 0);
        if (!$refuse_reason) {
            $this->warning('请填写拒绝原因!');
        }
        $OrderRejectModel = new OrderRejectModel();
        if (!$reject = $OrderRejectModel->find($reject_id)) {
            $this->warning('参数不正确!');
        }
        $reject_data = [
            'refuse_reason' => $refuse_reason,
            'reject_status' => getMean('order_reject_status', 'key')['jjtk']
        ];
        $OrderRejectModel->isUpdate(true)->save($reject_data, ['reject_id' => $reject_id]);
        $OrderModel = new OrderModel();
        $save_data = [
            'pay_status' => getMean('integral_order_pay_status', 'key')['jjtk'],
        ];
        $OrderModel->isUpdate(true)->save($save_data, $reject->order_id);
    }
}







//        $IntegralGoodsModel = new IntegralGoodsModel();
//        if (!$integral_goods = $IntegralGoodsModel->find($detail->goods_id)) {
//            $this->warning('积分商品不存在！');
//        }
//        if ($integral_goods->app_id != $this->appId) {
//            $this->warning('参数不存在！');
//        }
//        $orderGoods[] = [
//            'goods_id' => $integral_goods->goods_id,
//            'cat_id' => $integral_goods->cat_id,
//            'goods_name' => $integral_goods->goods_name,
//            'goods_sn' => $integral_goods->goods_sn,
//            'market_price' => moneyFormat($integral_goods->market_price, true),
//            'shop_price' => moneyFormat($integral_goods->shop_price, true),
//            'integral' => $integral_goods->integral,
//            'photo' => $integral_goods->photo,
//            'is_real' => $integral_goods->is_real,
//            'is_free_shipping' => $integral_goods->is_free_shipping,
//        ];
