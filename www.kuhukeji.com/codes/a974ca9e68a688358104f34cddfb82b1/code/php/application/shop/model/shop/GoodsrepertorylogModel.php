<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GoodsrepertorylogModel extends CommonModel{
    protected $pk = 'log_id';
    protected $name = 'app_shop_stock_log';
    protected $insert = ['add_time','add_ip'];
}
