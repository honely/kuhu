<?php

namespace app\shop\controller\admin\agent;

use app\shop\controller\admin\Common;
use app\shop\model\shop\AgentMoneyLogModel;
use app\shop\model\shop\AgentOrderModel;
use app\shop\model\shop\OrderGoodsModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\VipOrderModel;

class Agent extends Common{

    //获取推广员列表
    public function getAgentList()
    {
        $UserModel = new UserModel();
        $where = [
            'app_id' => $this->appId,
        ];
        $keyword = $this->request->param('keyword');
        if (!empty($keyword)) {
            $where['mobile|nickname'] = ['LIKE', '%' . $keyword . '%'];
        }
        $status = (int)$this->request->param('status',-999);
        if ($status >= 0) {
            $where['is_lock'] = $status;
        }

        $agentGroup = (int)$this->request->param('agentGroup',-999);
        if ($agentGroup == -999) {
            $where['agent_group'] = ['>=', 1];
        } else {
            $where['agent_group'] = $agentGroup;
        }

        $bgTime = $this->request->param('bgTime');
        $endTime = $this->request->param('endTime');
        if (!empty($bgTime) && !empty($endTime)) {
            $where['add_time'] = ['BETWEEN', [strtotime($bgTime)], strtotime($endTime)];
        } else {
            if (!empty($bgTime)) {
                $where['add_time'] = ['EGT', strtotime($bgTime)];
            }
            if (!empty($endTime)) {
                $where['add_time'] = ['ELT', strtotime($endTime)];
            }
        }
        $order = (int)$this->request->param('order',-999);
        switch ($order) {
            case 1:
                $orderby = ['agent_num' => 'desc'];
                break;
            case 2:
                $orderby = ['agent_order' => 'desc'];
                break;
            case 3:
                $orderby = ['agent_vip' => 'desc'];
                break;
            case 4:
                $orderby = ['agent_register' => 'desc'];
                break;
            default:
                $orderby = ['user_id' => 'desc'];
                break;
        }
        $user = $UserModel->where($where)->order($orderby)->page($this->page, $this->limit)->select();
        $count = $UserModel->where($where)->count();
        $datas = [];
        $agentGroup = getMean('agent_group');
        foreach ($user as $val) {
            $datas[] = [
                'user_id' => $val->user_id,
                'mobile' => $val->mobile,
                'nickname' => $val->nickname,
                'face' => $val->face,
                'money' => round($val->money / 100, 2),
                'agent_group' => $val->agent_group,
                'agent_group_mean' => isset($agentGroup[$val->agent_group]) ? $agentGroup[$val->agent_group] : '未开通',
                'agent_num' => $val->agent_num,
                'agent_order' => $val->agent_order,
                'agent_register' => $val->agent_register,
                'agent_vip' => $val->agent_vip,
                'add_time' => date('Y-m-d H:i:s', $val->add_time),
                'last_time' => empty($val->last_time) ? '-' : date('Y-m-d H:i:s', $val->last_time),
                'is_lock' => $val->is_lock,
            ];
        }
        $this->datas = [
            'list' => $datas,
            'count' => $count,
            'limit' => $this->limit,
        ];

    }


    //推广员跟踪
    public function viewAgent() {

        $user_id = (int) $this->request->param('user_id');
        $UserModel = new UserModel();
        $UserModel->findUser($user_id);
        $user = $UserModel->getUser();
        if ($user->app_id != $this->appId) {
            $this->warning('参数不正确！');
        }
        if ($user->agent_group == 0) {
            $this->warning('当前用户不是推广员！');
        }

        $my_score = $UserModel->field("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) as num")->where('user_id',$user_id)->find();
        $my_score = $my_score['num'];
        $my_rank =  $UserModel->where("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) > $my_score")->where(['app_id'=>$this->appId])->count();
        $p_userIds = [];
        $user->pid && array_push($p_userIds,$user->pid);
        $user->pid2 && array_push($p_userIds,$user->pid2);
        $user->pid3 && array_push($p_userIds,$user->pid3);
        $p_userIds = empty($p_userIds) ? '' : $p_userIds;
        $p_users = $UserModel->itemsByIds($p_userIds);

        $datas = [
            'my_rank' => $my_rank + 1,
            'agent_num' => $user->agent_num,
            'agent_register' => $user->agent_register,
            'agent_vip' => $user->agent_vip,
            'agent_order' => $user->agent_order,
            'agent_money' => moneyFormat((int)$user->agent_money,true),
            'history_agent_money' => moneyFormat($UserModel->getUser()->history_agent_money,true),
            'p_user' => isset($p_users[$user->pid]) ? $p_users[$user->pid] : [],
            'p_user2' => isset($p_users[$user->pid2]) ? $p_users[$user->pid2] : [],
            'p_user3' => isset($p_users[$user->pid3]) ? $p_users[$user->pid3] : [],
            'agent_group' => statusToMap(getMean('agent_group')),
            'agent_lock' => (int) $user->agent_lock,
        ];
        $this->datas = $datas;
    }


    //注册拉新 /发展下线(传$agent=true)
    public function agentRegister() {
        $agent_user_id = (int) $this->request->param('user_id',0);
        $is_vip = (int) $this->request->param('is_vip',0);
        $agent = (bool) $this->request->param('agent',0);
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($agent_user_id)) {
            $this->warning("参数不正确");
        }
        if ($user->agent_group == 0 || $user->app_id != $this->appId) {
            $this->warning("参数不正确");
        }
        $list = [];
        $where['pid|pid2|pid3'] = $agent_user_id;
        if ($agent) {
            $where['agent_group'] = ['>',0];
            $where['pid|pid2'] = $agent_user_id;
        }
        if ($is_vip) {
            $where['plus_vip_time'] = ['>',0];
        }
        $list_tmp = $UserModel->where($where)->order('user_id desc')->page($this->page,$this->limit)->select();
        $count = $UserModel->where($where)->count();
        $pIds = [];
        foreach ($list_tmp as $v) {
            $pIds[$v->pid] = $v->pid;
            $pIds[$v->pid2] = $v->pid2;
            $pIds[$v->pid3] = $v->pid3;
        }
        $pIds = empty($pIds) ? '' : $pIds;
        $users = $UserModel->itemsByIds($pIds);
        $agent_mean = getMean('agent_group');
        $sex_mean = getMean('user_sex');
        foreach ($list_tmp as $v) {
            $list[] = [
                'user_id' => $v->user_id,
                'nickname' => $v->nickname,
                'face' => $v->face,
                'mobile' => $v->mobile,
                'agent_group' => $v->agent_group,
                'agent_group_mean' => $agent_mean[$v->agent_group],
                'plus_vip_time' => (int)($v->plus_vip_time > time()),
                'sex' => $sex_mean[$v->sex],
                'device' => $v->device,
                'pid' => isset($users[$v->pid]) ? "{$users[$v->pid]['nickname']} ID:{$v->pid}" : '--',
                'pid2' => isset($users[$v->pid2]) ? "{$users[$v->pid2]['nickname']} ID:{$v->pid2}" : '--',
                'pid3' => isset($users[$v->pid3]) ? "{$users[$v->pid3]['nickname']} ID:{$v->pid3}" : '--',
                'is_lock' => $v->is_lock,
                'add_time' => $v->add_time ? date("Y-m-d",$v->add_time) : '--',
                'agent_time' => $v->agent_time ? date("Y-m-d",$v->agent_time) : '--',
                'add_ip' => $v->add_ip,
            ];
        }
        $this->datas = [
            'list' => $list,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    //订单佣金
    public function agentCommission() {
        $agent_user_id  = (int) $this->request->param('user_id');
        $UserModel = new UserModel();
        $UserModel->findUser($agent_user_id);
        $user = $UserModel->getUser();
        if (!$user) {
            $this->warning("参数不正确");
        }
        if ($user->agent_group == 0 || $user->app_id != $this->appId) {
            $this->warning("参数不正确");
        }
        if ($UserModel->checkAgent() == false) {
            $this->warning("用户参数不正确");
        }
        $AgentOrderModel = new AgentOrderModel();
        $where = [
            'app_id' => $this->appId,
            'my_id' => $agent_user_id,
            'order_type' => 0,
        ];
        $list_tmp = $AgentOrderModel->where($where)->order('log_id desc')->page($this->page,$this->limit)->order('log_id desc')->select();
        $count = $AgentOrderModel->where($where)->count();
        $userIds = $list = $orderIds = $orders = $orderGoods = [];
        foreach ($list_tmp as $v) {
            $userIds[$v->user_id] = $v->user_id;
            $userIds[$v->pid] = $v->pid;
            $userIds[$v->my_id] = $v->my_id;
            $orderIds[$v->order_id] = $v->order_id;
        }
        $orderIds = empty($orderIds) ? '' : $orderIds;
        $OrderModel = new OrderModel();
        $orders = $OrderModel->itemsByIds($orderIds);

        $OrderGoodsModel = new OrderGoodsModel();
        $orderGoods_tmp = $OrderGoodsModel->whereIn('order_id',$orderIds)->select();
        foreach ($orderGoods_tmp as $val) {
            $orderGoods[$val->order_id][] = $val;
        }

        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();
        $users = $UserModel->itemsByIds($userIds);
        foreach ($list_tmp as $v) {
            $user = $users[$v->user_id];
            $agent_level = ($v->my_id == $v->pid) ? '上级' : '上上级';
            $fenyong = [];

            $list[] = [
                'log_id' => $v->log_id,
                'order_id' => $v->order_id,
                'order_sn' => $v->order_sn,
                'user' => $user,
                'goods' => $orderGoods[$v->order_id],
                'goods_name' => "{$orderGoods[$v->order_id][0]['goods_name']} 等" . count($orderGoods[$v->order_id][0]) . '件商品',
                //'goods_price' => moneyFormat($orders[$v->order_id]['goods_price'], true),
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'add_ip' => $v->add_ip,
                'puser' => $users[$v->pid],
                'myuser' => $users[$v->my_id],
                'money' => moneyFormat($v->money,true),
                'agent_level' => $agent_level,
                'commission' => moneyFormat($v->commission,true),
                'now_agent_group' => getMean('agent_group')[$v->now_agent_group],
                'now_rate' => moneyFormat($v->now_rate,true),
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'isMore' => (int) ($this->limit == $list),
        ];
    }


    //推广的VIP
    public function agentVip() {
        $agent_user_id  = (int) $this->request->param('user_id');
        $UserModel = new UserModel();
        $UserModel->findUser($agent_user_id);
        $user = $UserModel->getUser();
        if (!$user) {
            $this->warning("参数不正确");
        }
        if ($user->agent_group == 0 || $user->app_id != $this->appId) {
            $this->warning("参数不正确");
        }
        if ($UserModel->checkAgent() == false) {
            $this->warning("用户参数不正确");
        }
        $AgentOrderModel = new AgentOrderModel();
        $where = [
            'app_id' => $this->appId,
            'my_id' => $agent_user_id,
            'order_type' => 1
        ];
        $list_tmp = $AgentOrderModel->where($where)->page($this->page,$this->limit)->order('log_id desc')->select();
        $count = $AgentOrderModel->where($where)->count();
        $userIds = $orderIds = $list = [];
        foreach ($list_tmp as $v) {
            $userIds[$v->user_id] = $v->user_id;
            $userIds[$v->my_id] = $v->my_id;
            $userIds[$v->pid] = $v->pid;
        }

        $userIds = empty($userIds) ? '' : $userIds;
        $UserModel = new UserModel();

        $users = $UserModel->itemsByIds($userIds);
        foreach ($list_tmp as $v) {
            $user = $users[$v->user_id];
            $list[] = [
                'log_id' => $v->log_id,
                'order_id' => $v->order_id,
                'order_sn' => $v->order_sn,
                'user' => $user,
                'money' => moneyFormat($v->money,true),
                'commission' => moneyFormat($v->commission,true),
                'myuser' => $users[$v->my_id],
                'puser' => $users[$v->pid],
                'add_time' => date("Y-m-d H:i",$v->add_time),
                'add_ip' => $v->add_ip,
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
            'isMore' => (int) ($this->limit == $list),
        ];
    }


    //推广员排名
    public function agentRank() {
        $user_id = (int) $this->request->param('user_id',0);
        $UserModel = new UserModel();
        $UserModel->findUser($user_id);
        $type = (int) $this->request->param('type',0);
        $where['app_id'] = $this->appId;
        if ($type == 0) { //收益
            $orderby = 'history_agent_money desc';
        } elseif ($type == 1) { //拉新
            $orderby = 'agent_register desc';
        } elseif ($type == 2) { //成交
            $orderby = 'agent_order desc';
        }
        $rank_tmp = $UserModel->where($where)->order($orderby)->page($this->page,$this->limit)->select();
        $count = $UserModel->where($where)->count();
        $rank = [];
        foreach ($rank_tmp as $k=>$v) {
            $rank[] = [
                'rank' => $k+1,
                'face' => (string)$v->face,
                'nickname' => (string)$v->nickname,
                'history_agent_money' => moneyFormat($v->history_agent_money, true),
                'agent_register' => $v->agent_register,
                'agent_order' => $v->agent_order,
            ];
        }

        $this->datas = [
            'list' => $rank,
            'count' => $count,
            'limit' => $this->limit,
        ];
    }


    public function changeAgent() {
        $user_id = (int) $this->request->param('user_id',0);
        $agent_group = (int) $this->request->param('agent_group',0);
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning("参数不正确!");
        }
        if ($user->app_id != $this->appId) {
            $this->warning("参数不正确!");
        }
        $UserModel->isUpdate(true)->save(['agent_group'=>$agent_group],['user_id'=>$user_id]);
    }



    public function lockAgent() {
        $user_id = (int) $this->request->param('user_id',0);
        $UserModel = new UserModel();
        if (!$user = $UserModel->find($user_id)) {
            $this->warning("参数不正确!");
        }
        if ($user->app_id != $this->appId) {
            $this->warning("参数不正确!");
        }
        if ($user->agent_group == 0) {
            $this->warning("当前用户还不是推广员!");
        }

        $UserModel->isUpdate(true)->save(['agent_lock'=>$user->agent_lock ^ 1],['user_id'=>$user_id]);
        $this->datas = $user->agent_lock ^ 1;
    }


    //佣金提现日志
    public function agentWithdraw() {
        $user_id = (int) $this->request->param('user_id',0);
        $UserModel = new UserModel();
        $UserModel->findUser($user_id);
        $user = $UserModel->getUser();
        $AgentMoneyLogModel = new AgentMoneyLogModel();
        $where = [
            'user_id' => $user->user_id,
            'type' => 10,
        ];
        $list_tmp = $AgentMoneyLogModel->where($where)->order('log_id desc')->page($this->page,$this->limit)->select();
        $count = $AgentMoneyLogModel->where($where)->count();
        $list = [];
        foreach ($list_tmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'user_id' => $v->user_id,
                'money' => moneyFormat($v->money, true),
                'now_money' => moneyFormat($v->now_money, true),
                'add_time' => $v->add_time ? date("Y-m-d H:i",$v->add_time) : '--',
            ];
        }

        $this->datas = [
            'list' => $list,
            'count' => $count,
        ];
    }
}


//推广的订单 /下线推广的订单(传$agent=true)
//    public function agentOrder() {
//        $agent_user_id = (int) $this->request->param('user_id',0);
//        $agent = (bool) $this->request->param('agent',0);
//        $UserModel = new UserModel();
//        if (!$user = $UserModel->find($agent_user_id)) {
//            $this->warning("参数不正确");
//        }
//        if ($user->agent_group == 0 || $user->app_id != $this->appId) {
//            $this->warning("参数不正确");
//        }
//        $list = [];
//        $where = [
//            'pid' => $agent_user_id,
//            //'is_pay' => 1,
//            'pay_status' => 1,
//            'order_status' => 4,
//        ];
//
//        if ($agent) {
//            //$userIds = [];
//            $where_user['pid|pid2|pid3'] = $agent_user_id;
//            $where_user['agent_group'] = ['>',0];
//            $userIds = $UserModel->where($where_user)->column('user_id');
//            $userIds = empty($userIds) ? '' : $userIds;
//            $where['pid'] = ['in',$userIds];
//        }
//
//        $OrderModel = new OrderModel();
//        $list_tmp = $OrderModel->where($where)->order('order_id desc')->page($this->page,$this->limit)->select();
//        $count = $OrderModel->where($where)->count();
//        $userIds = [];
//        foreach ($list_tmp as $v) {
//            $userIds[$v->pid] = $v->pid;
//            $userIds[$v->user_id] = $v->user_id;
//        }
//        $userIds = empty($userIds) ? '' : $userIds;
//        $users = $UserModel->itemsByIds($userIds);
//
//        $shop_prom_type = getMean('shop_prom_type');
//        foreach ($list_tmp as $v) {
//            $list[] = [
//                'order_id' => $v->order_id,
//                'order_sn' => $v->order_sn,
//                'user_id' => $v->user_id,
//                'user_info' => "{$users[$v->user_id]['nickname']} 用户ID({$v->user_id})",
//                'name' => $v->name,
//                'mobile' => $v->mobile,
//                'address' => $v->address,
//                'goods_price' => moneyFormat($v->goods_price, true),
//                'coupon_price' => moneyFormat($v->coupon_price, true),
//                'youhui_price' => moneyFormat($v->youhui_price, true),
//                'prom_type' => $shop_prom_type[$v->prom_type],
//                'is_distribut' => $v->is_distribut,
//                'device' => $v->device,
//                'add_time' => $v->add_time ? date("Y-m-d",$v->add_time) : '--',
//                'add_ip' => $v->add_ip,
//            ];
//        }
//        $this->datas = [
//            'list' => $list,
//            'count' => $count,
//            'limit' => $this->limit,
//        ];
//    }
