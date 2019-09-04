<?php

namespace app\shop\logic\shop\order;

use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\AgentMoneyLogModel;
use app\shop\model\shop\AgentOrderModel;
use app\shop\model\shop\ShippingModel;
use app\shop\model\shop\UserModel;
use think\Exception;

/**
 * 管理员订单处理逻辑
 * Class OrderAdminLogic
 * @package app\shop\logic\shop\order
 */
class OrderAdminLogic extends OrderBasic
{


    //开放类
    public function __construct()
    {
        parent::__construct();
    }

    public function setAppId($appId)
    {
        $this->appId = $appId;
        if ($this->getOrderDetail()->app_id != $this->appId) {
            throw new Exception("系统异常");
        }
        if ($this->getOrderDetail()->admin_delete == 1) {
            throw new Exception("系统异常");
        }
        return $this;
    }


    /**
     * 设为未支付
     * @param int $status 0 设为未支付  1设为已支付
     */
    public function setNoPay()
    {
        if ($this->getOrderDetail()->order_status != 0) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 1) {
            throw new Exception("非法操作");
        }
        $this->setPayStatus(0);
    }

    /**
     * 设为已支付
     */
    public function setYesPay()
    {
        if ($this->getOrderDetail()->order_status != 0) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 0) {
            throw new Exception("非法操作");
        }
        //如果没有支付类型 则标记后台支付
        if($this->getOrderDetail()->pay_type == 0){
            $this->setOrderInfo("pay_type",8);
            $this->setOrderInfo("pay_time",time());
        }
        $this->setPayStatus(1);
    }

    /**
     * 设为已支付
     */
    public function payCallback($payType,$orderInfo)
    {
        if ($this->getOrderDetail()->order_status != 0) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 0) {
            throw new Exception("非法操作");
        }
        $this->setOrderInfo("pay_type",$payType);
        $this->setOrderInfo("pay_time",time());
        $this->setOrderInfo("pay_info",json_encode($orderInfo));
        $this->setPayStatus(1);
    }

    /**
     *  确认订单
     */
    public function setYesOrder()
    {
        if ($this->getOrderDetail()->order_status != 0) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 1) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->shipping_status != 0) {
            throw new Exception("非法操作");
        }
        $this->setOrderStatus(1);
    }





        /**
     *  取消确认订单
     */
    public function setNoOrder()
    {
        if ($this->getOrderDetail()->order_status != 1) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 1) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->shipping_status != 0) {
            throw new Exception("非法操作");
        }
        $this->setOrderStatus(0);
    }





    /**
     * 设为无效订单
     */
    public function setInvalid()
    {
        $this->setOrderStatus(5);
    }


    /**
     * 设置管理员留言
     */
    public function setAdminNote($note)
    {
        $this->setOrderInfo("admin_note", $note);
    }

    /**
     * 删除订单
     */
    public function deleteAdmin()
    {
        $isInvalid = $this->getOrderDetail()->pay_status == 0 && $this->getOrderDetail()->end_time < time();
        if ($isInvalid == false && $this->getOrderDetail()->order_status != 5) {
            throw new Exception("非法操作");
        }
        $this->setOrderInfo("admin_delete", 1);
    }

    /**
     * 订单发货
     */
    public function deliver($shippingId, $shippingNum)
    {
        if ($this->getOrderDetail()->order_status != 1) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->pay_status != 1) {
            throw new Exception("非法操作");
        }
        if ($this->getOrderDetail()->shipping_status != 0) {
            throw new Exception("非法操作");
        }
        $ShippingModel = new ShippingModel();
        $detail = $ShippingModel->find($shippingId);
        if (empty($detail) || $detail->app_id != $this->appId) {
            throw new Exception("非法操作");
        }
        $this->setOrderInfo("shipping_id", $shippingId);
        $this->setOrderInfo("shipping_name", $detail->shipping_name);
        $this->setOrderInfo("shipping_code", $detail->shipping_code);
        $this->setOrderInfo("shipping_num", $shippingNum);
        $this->setOrderInfo("shipping_time", time());
        $this->setShippingStatus(1);
    }


    /**
     * 修改用户地址
     */
    public function editAddress($name, $mobile, $address)
    {

    }


    /**
     * 计算订单分佣 并返回是否可以分佣
     */
    public function reckonCommission()
    {
        //可分佣订单类型 满减 打折 无活动
        $prom = [0, 4, 5];
        if (!in_array($this->getOrderDetail()->prom_type, $prom, true)) {
            return [
                'is_commission' => 0,
                'agent' => [],
            ];
        }
        //计算可分佣金额
        $commission = 0;
        foreach ($this->getOrderDetail()->orderGoods as $val) {
            $commission += $val->commission;
        }
        try {
            $AgentLogic = new AgentLogic($this->appId, $this->getOrderDetail()->pid);
            return [
                'is_commission' => 1,
                'agent' => $AgentLogic->getCommission($commission),
            ];
        } catch (Exception $exception) {
            return [
                'is_commission' => 0,
                'agent' => [],
            ];
        }
    }

    public function commission()
    {
        if ($this->getOrderDetail()->is_distribut == 1) {
            throw  new Exception("该订单不可以分佣");
        }
        $res = $this->reckonCommission();
        if ($res['is_commission'] == 0) {
            throw  new Exception("该订单不可以分佣");
        }
        $money_log = $order_log = [];
        $type = ['pid' => 1, 'pid2' => 2, 'pid3' => 3];
        foreach ($res['agent'] as $key => $val) {
            if (empty($val)) {
                continue;
            }
            $money_log[] = [
                'user_id' => $val['user_id'],
                'app_id' => $this->appId,
                'type' => 1,
                'money' => $val['money'],
                'order_id' => $this->getOrderDetail()->order_id,
                'order_sn' => $this->getOrderDetail()->order_sn,
                'now_money' => $val['agent_money'],
            ];
            $order_log[] = [
                'app_id' => $this->appId,
                'user_id' => $this->getOrderDetail()->user_id,
                'my_id' => $val['user_id'],
                'type' => $type[$key],
                'pid' => $this->getOrderDetail()->pid,
                'commission' => $val['commission'],
                'money' => $val['money'],
                'now_agent_group' => $val['now_agent_group'],
                'now_rate' => $val['now_rate'],
                'order_id' => $this->getOrderDetail()->order_id,
                'order_sn' => $this->getOrderDetail()->order_sn,
            ];
            $UserModel = new UserModel();
            $UserModel->IncDecCol($val['user_id'], 'agent_money', $val['money']);
        }
        if (!empty($money_log)) {
            $AgentMoneyLogModel = new AgentMoneyLogModel();
            $AgentMoneyLogModel->saveAll($money_log);
        }
        if (!empty($order_log)) {
            $AgentOrderModel = new AgentOrderModel();
            $AgentOrderModel->saveAll($order_log);
        }
        try{
            $AgentLogic = new AgentLogic($this->appId, $this->getOrderDetail()->pid);
            $AgentLogic->setOrderNum();
        }catch (Exception $exception){

        }
        $this->setOrderInfo("is_distribut",1);
    }
}
