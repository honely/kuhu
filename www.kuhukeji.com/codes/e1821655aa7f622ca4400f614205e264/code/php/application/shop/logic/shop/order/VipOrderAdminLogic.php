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
class VipOrderAdminLogic extends VipOrderBasic
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
        return $this;
    }


    /**
     * 计算订单分佣 并返回是否可以分佣
     */
    public function reckonCommission()
    {
        try {
            $AgentLogic = new AgentLogic($this->appId, $this->getOrderDetail()->pid);
            return [
                'is_commission' => 1,
                'agent' => $AgentLogic->getVipCommission(),
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
            throw  new Exception("该订单已经分佣过了");
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
                'order_type' => 1,
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
