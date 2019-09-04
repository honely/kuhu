<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;


class IntegralOrderRejectModel extends CommonModel{
    protected $pk = 'reject_id';
    protected $name = 'app_shop_itergral_order_rejected';
    protected $insert = ['add_time', 'add_ip'];




}
