<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;


class AgentQrcodeModel extends CommonModel
{
    protected $pk = 'id';
    protected $name = 'app_shop_agent_qrcode';
    protected $insert = ["add_time", "add_ip"];

    public function getAgentQrcode ($user_id,$device='weixin') {
        $a = $this->where(['user_id'=>$user_id,'device'=>$device])->find();
        if (empty($a)) {
            return '';
        } else {
            if (!$a->agent_qrcode) {
                return '';
            }
        }
        return $a->agent_qrcode;
    }

}
