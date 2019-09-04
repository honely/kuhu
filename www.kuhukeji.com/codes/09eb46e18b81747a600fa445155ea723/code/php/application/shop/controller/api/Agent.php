<?php

namespace app\shop\controller\api;

use app\shop\logic\shop\user\AgentLogic;
use app\shop\model\shop\AgentApplyModel;
use app\shop\model\shop\AgentMoneyLogModel;
use app\shop\model\shop\AgentOrderModel;
use app\shop\model\shop\AgentQrcodeModel;
use app\shop\model\shop\AgentSettingModel;
use app\shop\model\shop\GoodsModel;
use app\shop\model\shop\GoodsRepertoryModel;
use app\shop\model\shop\OrderModel;
use app\shop\model\shop\UserModel;
use app\shop\model\shop\WithdrawApplyModel;
use think\Exception;

class Agent extends ShopCommon
{
    protected $checkLogin = true;

    public function checkAgent()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $status = 2;
        if (!$UserModel->checkAgent()) {
            $AgentApplyModel = new AgentApplyModel();
            $is_apply = $AgentApplyModel->where(['user_id' => $this->userId, 'status' => 0])->find();
            $is_apply && $status = 0;
        } else {
            $status = 1;
        }
        $this->datas['status'] = $status;
    }


    public function applyAgent()
    {
        $AgentApplyModel = new AgentApplyModel();
        $msg = '';
        $status = 0;
        if ($is_apply = $AgentApplyModel->where(['user_id' => $this->userId])->find()) {
            if ($is_apply->status == 0) {
                $this->warning('审核中,请耐心等待!');
            }
            if ($is_apply->status == 1) {
                $this->warning('您已经是推广员啦！');
            }
            if ($is_apply->status == 2) {
                $status = 2;
                $msg = "您的申请已被拒绝！拒绝原因: {$is_apply->reason}";
            }
        }
        $UserModel = new UserModel();
        $user = $UserModel->findUser($this->userId);
        $apply_data = [
            'app_id' => $this->appId,
            'user_id' => $this->userId,
            'mobile' => $user->getUser()->mobile
        ];
        $AgentSettingModel = new AgentSettingModel();
        $agentSetting = $AgentSettingModel->find($this->appId);
        if ($agentSetting->condition == getMean('agent_apply_audit_setting', 'key')['sqtg']) {
            $status = 1;
            $apply_data['status'] = $status;
            $UserModel->save(['agent_group' => 1, 'agent_time' => time()], ['user_id' => $this->userId]);
            try {
                (new AgentLogic($this->appId, $user->getPid()))->setChildAgentNum();
            } catch (Exception $exception) {

            }
        }
        $AgentApplyModel->save($apply_data);

        $this->datas = [
            'status' => $status,
            'msg' => $msg,
        ];

    }


    public function index()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        if (!$UserModel->checkAgent()) {
            $this->warning('对不起！您还不是推广员！');
        }
        $my_score = $UserModel->field("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) as num")->where('user_id', $this->userId)->find();
        $rank = $UserModel->field("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) > $my_score")->where(['app_id' => $this->appId,'agent_group'=>['>',0]])->count();

        $yesterday_register = $UserModel->where(['app_id' => $this->appId])->whereTime('add_time', 'yesterday')->count();
        $AgentSettingModel = new AgentSettingModel();

        $user = [
            'user_id' => $UserModel->getUser()->user_id,
            'face' => $UserModel->getUser()->face,
            'nickname' => $UserModel->getUser()->nickname,
            'mobile' => $UserModel->getUser()->mobile,
            'agent_group' => $UserModel->getUser()->agent_group,
            'agent_group_mean' => getMean('agent_group')[$UserModel->getUser()->agent_group],
            'rank' => $rank + 1,
            'agent_money' => moneyFormat($UserModel->getUser()->agent_money, true),
            'history_agent_money' => $UserModel->getUser()->history_agent_money,
            'agent_register' => $UserModel->getUser()->agent_register,
            'agent_order' => $UserModel->getUser()->agent_order,
            'agent_vip' => $UserModel->getUser()->agent_vip,
            'agent_num' => $UserModel->getUser()->agent_num,
            'yesterday_register' => $yesterday_register,
            'agent_rate' => moneyFormat($AgentSettingModel->getRate($this->appId, $UserModel->getUser()->agent_group),true),
            'seo' => $this->default_seo,
        ];
        $this->datas = $user;
    }


    /**
     * 顾问等级
     */
    public function agentLevel()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        if (!$UserModel->checkAgent()) {
            if (!$UserModel->checkAgent()) {
                $this->warning('对不起！您还不是推广员！');
            }
        }
        $AgentSettingModel = new AgentSettingModel();
        $agentSetting = $AgentSettingModel->find($this->appId);

        if ($UserModel->getUser()->agent_group == getMean('agent_group', 'key')['ptgw']) {
            $now_rate = moneyFormat($agentSetting->ordinary_rate);
            $now_vip_rate = moneyFormat($agentSetting->ordinary_plus);
            $now_child_rate = moneyFormat($agentSetting->ordinary_child_rate);
            $now_child_vip_rate = moneyFormat($agentSetting->ordinary_child_plus);
            $next_level_num = $agentSetting->ordinary_num;
            $next_level_register = $agentSetting->ordinary_register;
            $next_level_order = $agentSetting->ordinary_order;
            $next_level_vip = $agentSetting->ordinary_vip;
        } elseif ($UserModel->getUser()->agent_group == getMean('agent_group', 'key')['zsgw']) {
            $now_rate = moneyFormat($agentSetting->senior_rate);
            $now_vip_rate = moneyFormat($agentSetting->senior_plus);
            $now_child_rate = moneyFormat($agentSetting->senior_child_rate);
            $now_child_vip_rate = moneyFormat($agentSetting->senior_child_plus);
            $next_level_num = $agentSetting->senior_num;
            $next_level_register = $agentSetting->senior_register;
            $next_level_order = $agentSetting->senior_order;
            $next_level_vip = $agentSetting->senior_vip;
        } elseif ($UserModel->getUser()->agent_group == getMean('agent_group', 'key')['zjgw']) {
            $now_rate = moneyFormat($agentSetting->expert_rate);
            $now_vip_rate = moneyFormat($agentSetting->expert_plus);
            $now_child_rate = moneyFormat($agentSetting->expert_child_rate);
            $now_child_vip_rate = moneyFormat($agentSetting->expert_child_plus);
            $next_level_num = 0;
            $next_level_register = 0;
            $next_level_order = 0;
            $next_level_vip = 0;
        }

        $ptgw_rule = [
            "推广顾问 <= {$agentSetting->ordinary_num}个",
            "推广订单 <= {$agentSetting->ordinary_order}个",
            "推广注册 <= {$agentSetting->ordinary_register}个",
            "推广VIP <= {$agentSetting->ordinary_vip}个",
        ];
        $ordinary_rate = moneyFormat($agentSetting->ordinary_rate);
        $ordinary_child_rate = moneyFormat($agentSetting->ordinary_child_rate);
        $ptgw_perm = "下级开通会员卡提成{$agentSetting->ordinary_plus}元,下级订单金额提成率{$ordinary_rate}%,子顾问推广推广会员卡提成{$agentSetting->ordinary_child_plus}元,子顾问订单提成率{$ordinary_child_rate}%";
        $zsgw_rule = [
            "推广顾问 >= {$agentSetting->senior_num}个",
            "推广订单 >= {$agentSetting->senior_order}个",
            "推广注册 >= {$agentSetting->senior_register}个",
            "推广VIP >= {$agentSetting->senior_vip}个",
        ];
        $senior_rate = moneyFormat($agentSetting->senior_rate);
        $senior_child_rate = moneyFormat($agentSetting->senior_child_rate);
        $zsgw_perm = "下级开通会员卡提成{$agentSetting->senior_plus}元,下级订单金额提成率{$senior_rate}%,子顾问推广推广会员卡提成{$agentSetting->senior_child_plus}元,子顾问订单提成率{$senior_child_rate}%";
        $zjgw_rule = [
            "推广顾问 >= {$agentSetting->expert_num}个",
            "推广订单 >= {$agentSetting->expert_order}个",
            "推广注册 >= {$agentSetting->expert_register}个",
            "推广VIP >= {$agentSetting->expert_vip}个",
        ];
        $expert_rate = moneyFormat($agentSetting->expert_rate);
        $expert_child_rate = moneyFormat($agentSetting->expert_child_rate);
        $zjgw_perm = "下级开通会员卡提成{$agentSetting->expert_plus}元,下级订单金额提成率{$expert_rate}%,子顾问推广推广会员卡提成{$agentSetting->expert_child_plus}元,子顾问订单提成率{$expert_child_rate}%";


        $setting = [
            'face' => $UserModel->getUser()->face,
            'agent_group' => $UserModel->getUser()->agent_group,
            'agent_group_mean' => getMean('agent_group')[$UserModel->getUser()->agent_group],
            'now_rate' => $now_rate,
            'now_vip_rate' => $now_vip_rate,
            'now_child_rate' => $now_child_rate,
            'now_child_vip_rate' => $now_child_vip_rate,
            'next_level_num' => $next_level_num,
            'next_level_surplus_num' => ($next_level_num - $UserModel->getUser()->agent_num > 0) ? $next_level_num - $UserModel->getUser()->agent_num : 0,
            'next_level_register' => $next_level_register,
            'next_level_surplus_register_num' => ($next_level_register - $UserModel->getUser()->agent_register > 0) ? $next_level_register - $UserModel->getUser()->agent_register : 0,
            'next_level_order' => $next_level_order,
            'next_level_surplus_order_num' => ($next_level_order - $UserModel->getUser()->agent_order > 0) ? $next_level_order - $UserModel->getUser()->agent_order : 0,
            'next_level_vip' => $next_level_vip,
            'next_level_vip_order_num' => ($next_level_vip - $UserModel->getUser()->agent_vip > 0) ? $next_level_vip - $UserModel->getUser()->agent_vip : 0,
            'ptgw_rule' => $ptgw_rule,
            'ptgw_perm' => $ptgw_perm,
            'zsgw_rule' => $zsgw_rule,
            'zsgw_perm' => $zsgw_perm,
            'zjgw_rule' => $zjgw_rule,
            'zjgw_perm' => $zjgw_perm,
        ];

        $this->datas = $setting;
    }


    /**
     *  排行榜
     */
    public function agentRank()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        if (!$UserModel->checkAgent()) {
            $this->warning('对不起！您还不是推广员！');
        }
        $history_agent_money = $UserModel->getUser()->history_agent_money;
        $my_score = $UserModel->field("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) as num")->where('user_id', $this->userId)->find();
        $my_score = $my_score['num'];
        $my_rank = $UserModel->where("(`agent_num`+`agent_register`+`agent_vip`+`agent_order`) > $my_score")->where(['app_id'=>$this->appId,'agent_group'=>['>',0]])->count();
        $agent = [
            'nickname' => (string)$UserModel->getUser()->nickname,
            'face' => (string)$UserModel->getUser()->face,
            'history_agent_money' => $history_agent_money,
            'agent_register' => $UserModel->getUser()->agent_register,
            'agent_order' => $UserModel->getUser()->agent_order,
            'my_rank' => $my_rank + 1,
        ];

        $type = (int)$this->request->param('type', 0);
        $where['app_id'] = $this->appId;
        $where['agent_group'] = ['>',0];
        if ($type == 0) { //收益
            $orderby = 'history_agent_money desc';
        } elseif ($type == 1) { //拉新
            $orderby = 'agent_register desc';
        } elseif ($type == 2) { //成交
            $orderby = 'agent_order desc';
        }
        $rank_tmp = $UserModel->where($where)->order($orderby)->page($this->page, $this->limit)->select();
        $rank = [];
        foreach ($rank_tmp as $k => $v) {
            $rank[] = [
                'rank' => $k + 1,
                'face' => (string)$v->face,
                'nickname' => (string)$v->nickname,
                'history_agent_money' => moneyFormat($v->history_agent_money, true),
                'agent_register' => $v->agent_register,
                'agent_order' => $v->agent_order,
            ];
        }
        $this->datas = [
            'rank' => $rank,
            'agent' => $agent,
        ];
    }


    /**
     *  获取推广员二维码
     */
    public function getAgentQrcode()
    {
        $UserModel = new UserModel();
        $user =  $UserModel->findUser($this->userId);
        if (!$user->checkAgent()) {
            $this->noPage('您还不是推广员!');
        }
        $AgentLogic = new AgentLogic($this->appId,$this->userId);
        $res =    $AgentLogic->getQrcode($this->device);
        $this->datas = [
            'face' => $user->getUser()->face,
            'nick_name' => $user->getUser()->nickname,
            'qrcode'  => $res,
        ];
    }


    /**
     *  我的成绩
     */
    public function getMyScore()
    {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        if ($UserModel->checkAgent()) {
            $this->noPage('您还不是推广员!');
        }
        $date_type = (int)$this->request->param('date_type', 0);
        $date_area_start = (string)$this->request->param('date_area_start');
        $date_area_end = (string)$this->request->param('date_area_end');
        $where['app_id'] = $this->appId;
        $where['pid'] = $this->userId;
        if ($date_type == 0) {
            $whereTime = ['add_time', 'yesterday'];
            $whereAgentTime = ['agent_time', 'yesterday'];
        } elseif ($date_type == 1) {
            $whereTime = ['add_time', '-7 days'];
            $whereAgentTime = ['agent_time', '-7 days'];
        } elseif ($date_type == 2) {
            $whereTime = ['add_time', '>', '2019-01-01'];
            $whereAgentTime = ['add_time', '>', '2019-01-01'];
        } elseif ($date_type == 3) {
            $whereTime = ['add_time', 'between', [$date_area_start, $date_area_end]];
            $whereAgentTime = ['agent_time', 'between', [$date_area_start, $date_area_end]];
        }
        $new_reg = $UserModel->whereTime($whereTime[0], $whereTime[1], empty($whereTime[2]) ? null : $whereTime[2])->where($where)->count();
        $new_agent = $UserModel->whereTime($whereAgentTime[0], $whereAgentTime[1], empty($whereAgentTime[2]) ? null : $whereAgentTime[2])->where($where)->count();

        $AgentMoneyLogModel = new AgentMoneyLogModel();

        $order_res = $AgentMoneyLogModel->field("count(`log_id`) as order_num,sum(`money`) as order_money")->where(['user_id' => $this->userId, 'type' => getMean('agent_money_type', 'key')['ddtc']])->whereTime($whereTime[0], $whereTime[1], empty($whereTime[2]) ? null : $whereTime[2])->find();
        $vip_res = $AgentMoneyLogModel->field("count(`log_id`) as vip_num,sum(`money`) as vip_money")->where(['user_id' => $this->userId, 'type' => getMean('agent_money_type', 'key')['kthy']])->whereTime($whereTime[0], $whereTime[1], empty($whereTime[2]) ? null : $whereTime[2])->find();
        $amount_res = $AgentMoneyLogModel->where(['user_id' => $this->userId, 'type' => ['<', 10]])->sum('money');

        $this->datas['data'] = [
            'agent_money' => moneyFormat($UserModel->getUser()->agent_money),
            'new_reg' => $new_reg,
            'new_agent' => $new_agent,
            'order_num' => (int)$order_res->order_num,
            'order_money' => moneyFormat($order_res->order_money),
            'vip_num' => (int)$vip_res->vip_num,
            'vip_money' => moneyFormat($vip_res->vip_money),
            'amount_res' => moneyFormat($amount_res),
        ];
    }


    /**
     *  推广商品
     */
    public function getAgentGoods()
    {
        //判断是不是推广员
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        if (!$UserModel->checkAgent($this->userId)) {
            $this->noPage("您还不是推广员，先去申请吧");
        }
        //判断有没有设置分佣
        $AgentSettingModel = new AgentSettingModel();
        if (!$agent_setting = $AgentSettingModel->find($this->appId)) {
            $this->warning("尚未设置推广分佣比例!");
        }
        $agent_group = $UserModel->getUser()->agent_group;
        $rate = 0;
        if ($agent_group == getMean('agent_group', 'key')['ptgw']) {
            $rate = $agent_setting->ordinary_rate;
        } elseif ($agent_group == getMean('agent_group', 'key')['zsgw']) {
            $rate = $agent_setting->senior_rate;
        } elseif ($agent_group == getMean('agent_group', 'key')['zjgw']) {
            $rate = $agent_setting->expert_rate;
        }

        $keywords = (string)$this->request->param("keywords");
        $price_order = (int)$this->request->param("price_order");
        $sales_order = (int)$this->request->param("sales_order");
        $order = (int)$this->request->param("order");
        $where['app_id'] = $this->appId;
        $where['is_online'] = 1;
        $where['is_delete'] = 0;
        $where['is_commission'] = 1;
        $orderby = [];
        if ($price_order > 0) {
            $orderby ['shop_price'] = $price_order == 1 ? 'desc' : 'asc';
        }

        if ($sales_order > 0) {
            $orderby  ['sales_sum'] = $sales_order == 1 ? 'desc' : 'asc';
        }

        if (!empty($keywords)) {
            if (is_numeric($keywords)) {
                $where['goods_id'] = $keywords;
            } else {
                $where['goods_name|goods_sn|keywords'] = $keywords;
            }
        }

        switch ($order) {
            case 0:   //默认排序
                $orderby['orderby'] = "desc";
                break;
            case 1 :  //最新上架
                $orderby['is_new'] = "desc";
                break;
            case 2 :  //评价最多
                $orderby['comment_count'] = "desc";
                break;
            case 3 :  //推荐商品
                $orderby['is_recommend'] = "desc";
                break;
            case 4 :  //最热商品
                $orderby['is_hot'] = "desc";
                break;
        }

        $GoodsModel = new GoodsModel();
        $list = $GoodsModel->where($where)->order($orderby)->page($this->page, $this->limit)->select();
        $goodIds = [];
        foreach ($list as $v) {
            $goodIds[$v->goods_id] = $v->goods_id;
        }
        $goodIds = empty($goodIds) ? '' : $goodIds;
        $GoodsRepertoryModel = new GoodsRepertoryModel();
        $goods_commission = $GoodsRepertoryModel->getCommissionByIds($goodIds);


        $datas = [];
        foreach ($list as $val) {
            $datas[] = [
                'goods_id' => $val->goods_id,
                'goods_name' => $val->goods_name,
                'market_price' => moneyFormat($val->market_price, true),
                'shop_price' => moneyFormat($val->shop_price, true),
                'plus_vip_price' => moneyFormat($val->plus_vip_price, true),
                'is_plus_vip' => $val->is_plus_vip,
                'photo' => $val->photo,
                'sales_sum' => $val->sales_sum,
                'rate' => moneyFormat($rate),
                'commission' => moneyFormat(moneyFormat($goods_commission[$val->goods_id][0] * $rate), true),
            ];
        }
        $this->datas['list'] = $datas;
        $this->datas['isMore'] = (int)($this->limit == count($datas));
    }



    //提成率
    public function agentRate() {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $user = $UserModel->getUser();
        $AgentSettingModel = new AgentSettingModel();
        $this->datas = [
            'agent_rate' => moneyFormat($AgentSettingModel->getRate($this->appId, $user->agent_group),true),
            'agent_register' => (int)$user->agent_register,
            'agent_vip' => (int)$user->agent_vip,
            'agent_order' => (int)$user->agent_order,
            'agent_num' => (int)$user->agent_num,
        ];
    }



    //佣金日志
    public function agentMoneyLog() {
        $UserModel = new UserModel();
        $UserModel->findUser($this->userId);
        $where['user_id'] = $this->userId;
        $date_type = (string)$this->request->param('date_type', '');
        $date_area_start = (int)$this->request->param('date_area_start', '', "strtotime");
        $date_area_end = (int)$this->request->param('date_area_end', '', "strtotime");
        $type = (int)$this->request->param('type', 1);
        $AgentMoneyLogModel = new AgentMoneyLogModel();
        if ($type < 10) {
            $where['type'] = ['<=',10];
        } else {
            $where['type'] = ['>',10];
        }
        if ($date_type > 0 && $date_type < 4) {
            $date_trance = [
                1 => '-3 month',
                2 => '-1 month',
                3 => '-1 week',
            ];
            $list_tmp = $AgentMoneyLogModel->where($where)->whereTime('add_time', $date_trance[$date_type])->order('log_id desc')->page($this->page,$this->limit)->select();
        } elseif ($date_area_start && $date_area_end) {
            if ($date_area_end <= $date_area_start) {
                $this->warning('请选择合理的时间区间');
            }
            if (($date_area_end - $date_area_start) / 31536000 >= 1) {
                $this->warning('仅支持时间跨度12个月以内的查询');
            }
            $list_tmp = $AgentMoneyLogModel->where($where)->whereTime('add_time', 'between', [$date_area_start, $date_area_end])->order('log_id desc')->page($this->page,$this->limit)->select();
        } else {
            $list_tmp = $AgentMoneyLogModel->where($where)->order('log_id desc')->page($this->page,$this->limit)->select();
        }

        $list = [];
        $agent_money_type = getMean('agent_money_type');
        foreach ($list_tmp as $v) {
            $list[] = [
                'log_id' => $v->log_id,
                'order_id' => $v->order_id,
                'order_sn' => $v->order_sn,
                'type_mean' => $agent_money_type[$v->type],
                'operator' => $v->type > 10 ? 'reduce' : 'increase',
                'money' => moneyFormat($v->money,true),
                'now_money' => moneyFormat($v->now_money,true),
                'add_time' => $v->add_time ? date("Y-m-d H:i",$v->add_time) : '',
            ];
        }

        $this->datas = [
            'agent_money' => moneyFormat($UserModel->getUser()->agent_money),
            'list' => $list,
            'isMore' => (int) (count($list) == $this->limit),
        ];
    }




}




