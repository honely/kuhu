<?php

namespace app\shop\controller\admin\order;

use app\shop\controller\admin\Common;
use app\shop\logic\shop\order\VipOrderAdminLogic;
use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\VipOrderModel;
use think\Exception;

class Userorder extends Common
{
    //VIP订单列表
    public function index() {
        $VipOrderModel = new VipOrderModel();
        $where = [
            'app_id' => $this->appId,
            'is_pay' => 1,
        ];
        $list_tmp = $VipOrderModel->where($where)->order('order_id desc')->page($this->page,$this->limit)->select();
        $count = $VipOrderModel->where($where)->count();
        $list = $userIds = [];
        foreach ($list_tmp as $v) {
            $userIds[$v->user_id] = $v->user_id;
        }
        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        $payment_method = getMean('order_payment_method');
        foreach ($list_tmp as $v) {
            $list[] = [
                'order_id' => $v->order_id,
                'order_sn' => $v->order_sn,
                'user_id' => $v->user_id,
                'nickname' => isset($users[$v->user_id]) ? $users[$v->user_id]['nickname'] : '--',
                'mobile' => isset($users[$v->user_id]) ? $users[$v->user_id]['mobile'] : '--',
                'face' => isset($users[$v->user_id]) ? $users[$v->user_id]['face'] : '--',
                'user_money' => moneyFormat($v->user_money, true),
                'all_money' => moneyFormat($v->all_money, true),
                'pay_money' => moneyFormat($v->pay_money, true),
                'pay_type' => $v->pay_type,
                'pay_type_mean' => isset($payment_method[$v->pay_type]) ? $payment_method[$v->pay_type] : '--',
                'type' => $v->type,
                'type_mean' => $v->type == 1 ? '后台开通' : ($v->type == 2 ? '支付开通' : '--'),
                'add_time' => $v->add_time ? date("Y-m-d H:i",$v->add_time) : '--',
                'add_ip' => $v->add_ip,
                'buy_role' => $v->buy_role,
                'is_distribut' => (int) $v->is_distribut,
            ];
        }


        $this->datas = [
            'list' => $list,
            'count' => $count,
            'isMore' => (int) (count($list) == $this->limit),
        ];
    }


    //推广佣金
    public function getCommission() {
        $orderId = (int)$this->request->param("order_id");
        $datas = [];
        try {
            $VipOrderAdminLogic = new VipOrderAdminLogic();
            $datas = $VipOrderAdminLogic->setOrderId($orderId)
                ->setAppId($this->appId)
                ->reckonCommission();
        } catch (Exception $exception) {
            $this->warning($exception->getMessage().$exception->getFile().$exception->getLine());
        }
        $list = [];
        $level = ['pid'=>"一级","pid2"=>'二级',"pid3"=>'三级'];
        foreach ($datas['agent'] as $k=>$v) {
            if(!empty($v)){
                 $v['level'] = $level[$k];
                 $v['money'] = moneyFormat($v['money'], true);
                 $v['now_agent_group'] = getMean('agent_group')[$v['now_agent_group']]  ;
                 $list[] = $v;
            }
        }
        $this->datas = [
            'list' => $list,
            'is_commission' => $datas['is_commission'],
        ];
    }


    public function commission() {
        $orderId = (int)$this->request->param("order_id");
        $is_fenyong = (int)($this->request->param('is_fenyong',0) == 1);
        if ($is_fenyong) {
            try {
                $VipOrderAdminLogic = new VipOrderAdminLogic();
                $VipOrderAdminLogic->setOrderId($orderId)
                    ->setAppId($this->appId)
                    ->commission();
            } catch (Exception $exception) {
                $this->warning($exception->getMessage().$exception->getFile().$exception->getLine());
            }
        } else {
            $VipOrderModel = new VipOrderModel();
            if (!$vip_order = $VipOrderModel->find($orderId)) {
                $this->warning("参数不正确");
            }
            if ($vip_order->app_id != $this->appId) {
                $this->warning("参数不正确");
            }
            if ($vip_order->is_distribut == 1) {
                $this->warning("订单已分佣，请不要重复操作!");
            }
            $VipOrderModel->isUpdate(true)->save(['is_distribut'=>1],['order_id'=>$orderId]);
        }

    }


}






