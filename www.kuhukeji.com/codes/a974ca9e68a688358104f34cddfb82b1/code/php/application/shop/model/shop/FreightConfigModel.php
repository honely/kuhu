<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;
use think\Db;
use think\Model;

class FreightConfigModel extends CommonModel
{
    protected $pk = 'config_id';
    protected $name = 'app_shop_freight_config';

    public function freightRegion()
    {
        return $this->hasMany('FreightRegionModel', 'config_id', 'config_id');
    }

}
