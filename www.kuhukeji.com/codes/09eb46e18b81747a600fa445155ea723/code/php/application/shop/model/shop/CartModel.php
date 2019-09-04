<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class CartModel extends CommonModel{
    protected $pk = 'cart_id';
    protected $name = 'app_shop_cart';
    protected $insert = ['add_time', 'add_ip'];





}
