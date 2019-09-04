<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GroupBuyItemModel extends CommonModel
{
    protected $pk = 'groupbuy_item_id';
    protected $name = 'app_shop_groupbuy_item';
    protected $insert = ["add_time", "add_ip"];




}
