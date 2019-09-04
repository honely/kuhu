<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

//推广员的类  计算分佣等各方面统一入口类

class DeliveryModel extends CommonModel
{
    protected $pk = 'delivery_doc_id';
    protected $name = 'app_shop_delivery_doc';
    protected $insert = ['add_time'];



}
