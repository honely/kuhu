<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class AgentMoneyLogModel extends CommonModel {
    protected $pk = 'log_id';
    protected $name = 'app_shop_agent_money_log';
    protected $insert = ["add_time", "add_ip"];


    public function getAllAgentMoney ($user_id) {
        $where = [
            'user_id' => $user_id,
            'type' => ['<',10],
            'is_lock' => 0,
        ];
        return $this->where($where)->sum('money');
    }

}
