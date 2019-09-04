<?php

namespace app\shop\logic\shop\user;

use app\shop\controller\api\Agent;
use app\shop\logic\shop\miniapp\Miniapp;
use app\shop\model\shop\AgentMoneyLogModel;
use app\shop\model\shop\AgentSettingModel;
use app\shop\model\shop\SettingModel;
use app\shop\model\shop\UserModel;
use think\Exception;

class AgentLogic
{

    private $agent;
    private $appId;
    private $setting;
    private $UserModel;
    private $agentParent;

    public function __construct($appId, $agentId)
    {
        $this->appId = $appId;
        $AgentSettingModel = new AgentSettingModel();
        $this->setting = $AgentSettingModel->FormatData($appId);
        $UserModel = new UserModel();
        $this->agent = $UserModel->find($agentId);
        if ($this->checkAgent() == false) {
            throw new Exception("非正式推广员");
        };
        $SettingModel = new SettingModel();
        if (!$setting = $SettingModel->find($this->appId)) {
            throw new Exception("请设置商铺设置");
        }
        if ($setting->is_fenxiao == 0) {
            throw new Exception("后台关闭了分销");
        }
        $this->UserModel = $UserModel;
    }

    public function checkAgent()
    {
        return !empty($this->agent) && $this->agent->agent_group > 0 && $this->agent->agent_lock == 0;
    }

    public function setOrderNum()
    {
        $this->agent->agent_order = $this->agent->agent_order + 1;
    }

    public function setVipNum()
    {
        $this->agent->agent_vip = $this->agent->agent_vip + 1;
    }

    public function setUserNum()
    {
        $this->agent->agent_register = $this->agent->agent_register + 1;
    }

    public function setChildAgentNum()
    {
        $this->agent->agent_num = $this->agent->agent_num + 1;
    }

    public function getParentIds()
    {
        return [
        'pid' => $this->agent->pid,
        'pid2' => $this->agent->pid2,
    ];
    }

    /**
     * 查询父级信息
     * @return array
     */
    public function getParentInfo()
    {

        $pids = [];
        foreach ($this->getParentIds() as $val) {
            $pids[$val] = $val;
        }

        $UserModel = new UserModel();
        $agent = $UserModel->itemsByIds($pids);
        //锁定用户不给分佣
        $return = [];
        foreach ($agent as $value) {
            if ($value->agent_lock == 0) {
                $return[$value->user_id] = $value;
            }
        }
        return $return;

    }

    /**
     * 升级
     */
    private function upgrade()
    {
        $this->agent->agent_group < 3 &&
        $this->agent->order_num >= $this->setting[$this->agent->agent_group]['order'] &&
        $this->agent->agent_num >= $this->setting[$this->agent->agent_group]['num'] &&
        $this->agent->agent_vip >= $this->setting[$this->agent->agent_group]['vip'] &&
        $this->agent->agent_register >= $this->setting[$this->agent->agent_group]['register'] &&
        $this->agent->agent_group = $this->agent->agent_group + 1;
    }

    /**
     * 获取订单分佣信息
     */
    public function getCommission($commission)
    {
        //当前推广员信息
        $p = [
            'user_id' => $this->agent->user_id,
            'face' => $this->agent->face,
            'nickname' => $this->agent->nickname,
            'mobile' => $this->agent->mobile,
            'now_agent_group' => $this->agent->agent_group,
            'now_rate' => $this->setting[$this->agent->agent_group]['rate'],
            'commission' => $commission,
            'agent_money' => $this->agent->agent_money,
            'money' => round($commission * ($this->setting[$this->agent->agent_group]['rate'] / 10000)),
        ];
        $parents = [];
        foreach ($this->getParentInfo() as $key => $val) {
            $parents[$key] = [
                'user_id' => $val->user_id,
                'face' => $val->face,
                'mobile' => $val->mobile,
                'nickname' => $val->nickname,
                'now_agent_group' => $val->agent_group,
                'now_rate' => $this->setting[$val->agent_group]['child_rate'],
                'commission' => $commission,
                'agent_money' => $val->agent_money,
                'money' => round($commission * ($this->setting[$val->agent_group]['child_rate'] / 10000)),
            ];
        }
        return [
            'pid' => $p,
            'pid2' => empty($parents[$this->agent->pid]) ? [] : $parents[$this->agent->pid],
            'pid3' => empty($parents[$this->agent->pid2]) ? [] : $parents[$this->agent->pid2],
        ];
    }


    /**
     * 获取订单分佣信息
     */
    public function getVipCommission()
    {

        //当前推广员信息
        $p = [
            'user_id' => $this->agent->user_id,
            'face' => $this->agent->face,
            'nickname' => $this->agent->nickname,
            'mobile' => $this->agent->mobile,
            'now_agent_group' => $this->agent->agent_group,
            'now_rate' => $this->setting[$this->agent->agent_group]['rate'],
            'commission' => $this->setting[$this->agent->agent_group]['plus'],
            'agent_money' => $this->agent->agent_money,
            'money' => $this->setting[$this->agent->agent_group]['plus'],
        ];
        $parents = [];
        foreach ($this->getParentInfo() as $key => $val) {
            $parents[$key] = [
                'user_id' => $val->user_id,
                'face' => $val->face,
                'mobile' => $val->mobile,
                'nickname' => $val->nickname,
                'now_agent_group' => $val->agent_group,
                'now_rate' => $this->setting[$val->agent_group]['child_rate'],
                'commission' => $this->setting[$val->agent_group]['child_plus'],
                'agent_money' => $val->agent_money,
                'money' => $this->setting[$val->agent_group]['child_plus'],
            ];
        }
        return [
            'pid' => $p,
            'pid2' => empty($parents[$this->agent->pid]) ? [] : $parents[$this->agent->pid],
            'pid3' => empty($parents[$this->agent->pid2]) ? [] : $parents[$this->agent->pid2],
        ];
    }

    public function getAgentMoney()
    {
        return $this->agent->agent_money;
    }

    public function changeAgentMoney($money, $type)
    {
        $AgentMoneyLogModel = new AgentMoneyLogModel();
        $data = [
            'user_id' => $this->agent->userId,
            'app_id' => $this->agent->app_id,
            'money' => $money,
            'type' => $type,
        ];
        if ($type <= 10) {   //增加
            //入账不需要考虑   直接增加
            $data['get_type'] = 1;
            $this->UserModel->where(['user_id' => $this->agent->userId])->setInc('agent_money', $money);
            $this->UserModel->where(['user_id' => $this->agent->userId])->setInc('history_agent_money', $money);
        } elseif ($type > 10 && $type <= 20) {  //减少
            //先获得用户账户余额
            if ($money > $this->getAgentMoney()) {
                throw new Exception("'消费/提现金额大于余额！");
            }
            $data['get_type'] = 2;
            $this->UserModel->where(['user_id' => $this->agent->userId])->setDec('agent_money', $money);
        }
        $AgentMoneyLogModel->save($data);
    }

    public function getQrcode($device)
    {
        if (empty($this->agent->agent_qrcode) && $device == "weixin") {
//            $param = [
//                'pid' => $this->agent->user_id,
//                'url' => '/page/page/index',
//                'app_id' => $this->appId,
//                'file_name' => $this->agent->agent_qrcode,
//            ];
            $qrcodePath = Miniapp::makeModule( $device,$this->appId)->getQrcode($this->agent->user_id);
            $this->agent->agent_qrcode = $qrcodePath;
        }else{
            $param = request()->domain() .  "/h5/shop/#/pages/index/index?appid=5&pid=1";
            return request()->domain() . "/shop/api.qrcode/getQrcode/?param=". urlencode($param);

        }
        return  $this->agent->agent_qrcode;
    }


    public function __destruct()
    {
        if (!empty($this->agent)) {
            $this->upgrade();
            $this->agent->save();
        }

    }

}


