<?php

namespace app\shop\controller\admin\order;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\order\OrderAdminLogic;
use app\shop\logic\shop\order\OrderRejectLogic;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\OrderRejectModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class Goodsorder extends Common
{


    /**
     * 订单列表
     */
    public function index()
    {
        $where['app_id'] = $this->appId;
        $where['admin_delete'] = 0;
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
        $pay_type = (int)$this->request->param("pay_type");
        $pay_type > 0 && $where['pay_type'] = $pay_type - 1;
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
        $prom_type = (int)$this->request->param("prom_type");
        !empty($prom_type) && $where['prom_type'] = $prom_type;
        //设备来源
        $device = (string)$this->request->param("device");
        !empty($device) && $where['device'] = $device;
        //设备来源
        $keywords = (string)$this->request->param("keywords");
        $keywords_type = (int)$this->request->param("keywords_type", 1);

        if (!empty($keywords)) {
            if ($keywords_type == 1) {
                $where['order_sn'] = ["LIKE", "{$keywords}"];
            } else {
                $where["name|mobile"] = ["LIKE", "{$keywords}"];
            }
        }

        $OrderModel = new OrderModel();
        $list = $OrderModel->where($where)->order("order_id desc")->page($this->page, $this->limit)->select();
        $count = $OrderModel->where($where)->count();
        $datas = [];
        $order_status_mean = getMean("order_status");
        $order_shipping_status_mean = getMean("order_shipping_status");
        $order_pay_status_mean = getMean("order_pay_status");
        $pay_type_mean = getMean("order_payment_method");
        $prom_type = getMean('shop_prom_type');
        foreach ($list as $val) {
//            if ($val->pay_status == 0 && time() > $val->end_time) {
//                $val->order_status = 5;
//            }
            $pay_price = ($val->goods_price - $val->coupon_price - $val->youhui_price) + $val->shipping_price;
            $datas[] = [
                'order_id' => $val->order_id,
                'order_sn' => $val->order_sn,
                'name' => $val->name . ":" . $val->mobile,
                'pay_type' => empty($pay_type_mean[$val->pay_type]) ? '未知' : $pay_type_mean[$val->pay_type],
                'order_status' => empty($order_status_mean[$val->order_status]) ? '未知' : $order_status_mean[$val->order_status],
                'shipping_status' => empty($order_shipping_status_mean[$val->shipping_status]) ? '未知' : $order_shipping_status_mean[$val->shipping_status],
                'pay_status' => empty($order_pay_status_mean[$val->pay_status]) ? '未知' : $order_pay_status_mean[$val->pay_status],
                'pay_price' => moneyFormat($pay_price, true),
                'delete' => (int) $val->order_status == 5,
                'is_delete' => false,
                'goods_price' => moneyFormat($val->goods_price, true),
                'device' => $val->device,
                'prom_type_mean' => empty($prom_type[$val->prom_type]) ? '' : $prom_type[$val->prom_type],
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
                'prom_type' => statusToMap($prom_type),
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
            $OrderAdminLogic = new OrderAdminLogic();
            $detail = $OrderAdminLogic->setOrderId($orderId)
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
        $orderGoods = [];
        $commission = 0;
        foreach ($detail->orderGoods as $val) {
            $orderGoods[] = [
                'order_id' => $val->order_id,
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'goods_num' => $val->goods_num,
                'bar_code' => $val->bar_code,
                'sku_type' => $val->sku_type,
                'goods_sn' => $val->goods_sn,
                'goods_price' => moneyFormat($val->goods_price, true),
                'vip_price' => moneyFormat($val->vip_price, true),
                'spec_key_name' => specKeyToArray($val->spec_key_name),
                'prom_type' => $val->prom_type,
                'goods_photo' => $val->goods_photo,
                'commission' => moneyFormat($val->commission),
                'count' => moneyFormat($val->goods_price * $val->goods_num, true),
                'vip_count' => moneyFormat($val->vip_price * $val->goods_num, true),
            ];
            $commission += $val->commission;
        }
        $user = [];
        if (!empty($detail->orderUser)) {
            $user = [
                'nickname' => $detail->orderUser->nickname,
                'user_id' => $detail->orderUser->user_id,
                'face' => $detail->orderUser->face,
                'mobile' => $detail->orderUser->mobile,
            ];
        }
        $Trail = $OrderAdminLogic->getOrderTrail();
        $this->datas['trail'] = $Trail;
        $this->datas['detail'] = [
            'order_id' => $detail->order_id,
            'order_sn' => $detail->order_sn,
            'user' => $user,
            'pay_price' => $detail->goods_price - $detail->coupon_price - $detail->youhui_price,
            'name' => $detail->name,
            'mobile' => $detail->mobile,
            'pay_type' => empty($pay_type_mean[$detail->pay_type]) ? '未知' : $pay_type_mean[$detail->pay_type],
            'order_status_mean' => empty($order_status_mean[$detail->order_status]) ? '未知' : $order_status_mean[$detail->order_status],
            'shipping_status_mean' => empty($order_shipping_status_mean[$detail->shipping_status]) ? '未知' : $order_shipping_status_mean[$detail->shipping_status],
            'pay_status_mean' => empty($order_pay_status_mean[$detail->pay_status]) ? '未知' : $order_pay_status_mean[$detail->pay_status],
            'device' => $detail->device,
            'order_status' => $detail->order_status,
            'shipping_status' => $detail->shipping_status,
            'pay_status' => $detail->pay_status,
            'prom_type_mean' => empty($prom_type[$detail->prom_type]) ? '' : $prom_type[$detail->prom_type],
            'add_time' => date("Y/m/d H:i:s", $detail->add_time),
            'pay_time' => empty($detail->pay_time) ? '-' : date("Y/m/d H:i:s", $detail->pay_time),
            'shipping_name' => $detail->shipping_name,
            'shipping_code' => $detail->shipping_code,
            'shipping_num' => $detail->shipping_num,
            'goods_price' => moneyFormat($detail->goods_price, true),
            'shipping_price' => moneyFormat($detail->shipping_price, true),
            'coupon_price' => moneyFormat($detail->coupon_price, true),
            'youhui_price' => moneyFormat($detail->youhui_price, true),
            'user_money' => moneyFormat($detail->user_money, true),
            'payment_money' => moneyFormat($detail->goods_price + $detail->shipping_price - $detail->coupon_price - $detail->youhui_price - $detail->user_money, true),
            'shipping_data' => $detail->shipping_data,
            'user_note' => $detail->user_note,
            'buy_role' => $detail->buy_role,
            'admin_note' => $detail->admin_note,
            'is_distribut' => $detail->is_distribut,
            'commission' => moneyFormat($commission,true),
            'address' => $detail->address,
        ];
        $agent_mean = getMean("agent_group");
        $agent = $OrderAdminLogic->reckonCommission();
        foreach ($agent['agent'] as &$value){
            if(empty($value)){
                continue;
            }
            $value['agent_mean'] = empty($agent_mean[$value['now_agent_group']]) ? '' :$agent_mean[$value['now_agent_group']];
            $value['now_rate'] = round($value['now_rate']/100,2);
            $value['commission'] = moneyFormat($value['commission'],true);
            $value['money'] = moneyFormat($value['money'],true);
        }
        unset($value);
        $this->datas['agent'] = $agent;
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $res = $OrderAdminLogic->setOrderId($orderId)
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
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->deleteAdmin();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }
    }


    /**
     * 分佣
     */
    public function commission()
    {
        $orderId = (int)$this->request->param("order_id");
        try {
            $OrderAdminLogic = new OrderAdminLogic();
            $OrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->commission();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage().$exception->getFile().$exception->getLine());
        }
    }


    /**
     * 退款单
     */
    public function refundOrder()
    {
        $where['app_id'] = $this->appId;
        //开始结束如期
        $bg_add_time = (int)$this->request->param("bg_add_time", 0, "strtotime");
        $end_add_time = (int)$this->request->param("end_add_time", 0, "strtotime");
        if (!empty($bg_add_time) && !empty($end_add_time)) {
            $where['add_time'] = ['BETWEEN', [$bg_add_time, $end_add_time]];
        }
        //关键词类型
        $keywords = (string)$this->request->param("keywords");
        $keywords_type = (int)$this->request->param("keywords_type", 1);
        if (!empty($keywords)) {
            if ($keywords_type == 1) {
                $where['order_id'] = $keywords;
            } else {
                $where["name|mobile"] = ["LIKE", "{$keywords}"];
            }
        }
        //是否收到货
        $goods_status_mean = (int) $this->request->param('goods_status_mean',-999);
        if ($goods_status_mean > 0) {
            $where['reject_goods_status'] = $goods_status_mean;
        }
        //退货原因
        $reject_reason = (int) $this->request->param('reject_reason',-999);
        if ($reject_reason > 0) {
            $where['reject_goods_status'] = $goods_status_mean;
        }
        //审核状态
        $reject_status = (int) $this->request->param('reject_status',-999);
        if ($reject_status > 0) {
            $where['reject_status'] = $reject_status;
        }
        $OrderRejectModel = new OrderRejectModel();
        $reject_list_tmp = $OrderRejectModel->where($where)->page($this->page, $this->limit)->order('reject_id desc')->select();
        $count = $OrderRejectModel->where($where)->count();
        $orderIds = $userIds = [];
        foreach ($reject_list_tmp as $v) {
            $orderIds[$v->order_id] = $v->order_id;
            $userIds[$v->user_id] = $v->user_id;
        }
        $orderIds = empty($orderIds) ? '' : $orderIds;
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
                'order_sn' => $orders[$v->order_id]['order_sn'],
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
                'payment_price' => moneyFormat($orders[$v->order_id]['payment_price'], true),
                'reject_goods_status' => $v->reject_goods_status,
                'reject_goods_status_mean' => $user_goods_status_mean[$v->reject_goods_status],
                'reject_reason' => $v->reject_reason,
                'reject_reason_mean' => isset($goods_reject_reason[$v->reject_reason]) ? $goods_reject_reason[$v->reject_reason] : '--',
                'reject_content' => (string)$v->reject_content,
                'reject_photos' => (array)json_decode($v->reject_photos, true),
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
        $reject_id = (int)$this->request->param('reject_id', 0);
        $is_coupon = (int)($this->request->param('is_coupon', 0) == 1);
        $is_usermoney = (int)($this->request->param('is_usermoney', 0) == 1);
        $usermoney = (int)$this->request->param('usermoney', 0,'moneyToInt');
        $is_payment_price = (int)($this->request->param('is_payment_price', 0) == 1);
        $payment_price = (int)$this->request->param('payment_price', 0,'moneyToInt');
        $OrderRejectModel = new OrderRejectModel();
        if (!$reject = $OrderRejectModel->find($reject_id)) {
            $this->warning('参数不正确!');
        }
        try {
            $OrderRejectLogic = new OrderRejectLogic($reject->order_id, $reject->user_id);
            $OrderRejectLogic->checkCanRefund()
                            ->returnUserCoupon($is_coupon)
                            ->agreeRejectOrder($reject_id,$is_usermoney,$usermoney,$is_payment_price,$payment_price);

        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

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
        if ($reject->app_id != $this->appId) {
            $this->warning('参数不正确!');
        }

        try {
            $OrderRejectLogic = new OrderRejectLogic($reject->order_id, $reject->user_id);
            $OrderRejectLogic->refuseRejectOrder($reject_id,$refuse_reason);
        } catch (Exception $exception) {
            $this->warning($exception->getMessage());
        }

    }

}

