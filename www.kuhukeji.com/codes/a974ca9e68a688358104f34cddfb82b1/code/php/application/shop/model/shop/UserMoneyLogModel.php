<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class UserMoneyLogModel extends CommonModel
{
    protected $pk = 'log_id';
    protected $name = 'app_shop_user_money_log';
    protected $insert = ["add_time", "add_ip"];


    /**
     * 验证type 是否有效
     * 并且 返回 是否是增加
     */
    public function checkType($type)
    {
        $typeMap = [
            1 => 'add',
            2 => 'add',
            3 => 'add',
            11 => 'reduce',
            12 => 'reduce',
            13 => 'reduce',
            14 => 'reduce',
        ];
        return empty($typeMap[$type]) ? false : $typeMap[$type];
    }

}
