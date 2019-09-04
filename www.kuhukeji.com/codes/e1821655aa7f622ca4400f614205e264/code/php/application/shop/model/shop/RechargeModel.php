<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class RechargeModel extends CommonModel
{
    protected $pk = 'rec_id';
    protected $name = 'app_shop_user_recharge';
    protected $insert = ['add_time', 'add_ip'];




}
