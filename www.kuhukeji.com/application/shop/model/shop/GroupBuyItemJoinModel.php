<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GroupBuyItemJoinModel extends CommonModel
{
    protected $pk = 'join_id';
    protected $name = 'app_shop_groupbuy_item_join';
    protected $insert = ["add_time", "add_ip"];



}
