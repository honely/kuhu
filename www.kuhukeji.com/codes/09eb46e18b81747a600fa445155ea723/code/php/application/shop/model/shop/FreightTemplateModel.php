<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;
use think\Db;
use think\Model;

class FreightTemplateModel extends CommonModel
{
    protected $pk = 'template_id';
    protected $name = 'app_shop_freight_template';

    public function freightConfig()
    {
        return $this->hasMany('FreightConfigModel', 'template_id', 'template_id');
    }



}
