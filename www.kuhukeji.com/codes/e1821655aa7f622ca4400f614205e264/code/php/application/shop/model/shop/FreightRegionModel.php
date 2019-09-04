<?php

namespace app\shop\model\shop;

use think\Model;

class FreightRegionModel extends CommentModel
{
    protected $pk = 'template_id';
    protected $name = 'app_shop_freight_region';

    public function region()
    {
        return $this->hasOne('RegionModel', 'region_id', 'region_id');
    }
    public function freightConfig()
    {
        return $this->hasOne('FreightConfigModel', 'config_id', 'config_id');
    }

}
