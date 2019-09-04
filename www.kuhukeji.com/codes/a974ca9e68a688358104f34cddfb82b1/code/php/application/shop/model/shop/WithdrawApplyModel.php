<?php
namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class WithdrawApplyModel extends CommonModel
{
    protected $pk = 'apply_id';
    protected $name = 'app_shop_withdraw_apply';
    protected $insert = ['add_time','add_ip'];

}
