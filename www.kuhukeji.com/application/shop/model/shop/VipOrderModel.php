<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class VipOrderModel extends CommonModel
{
    protected $pk = 'order_id';
    protected $name = 'app_shop_user_vip_order';
    protected $insert = ['add_time','add_ip'];


}
