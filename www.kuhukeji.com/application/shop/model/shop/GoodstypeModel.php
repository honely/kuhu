<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class GoodstypeModel extends CommonModel{
    protected $pk = 'type_id';
    protected $name = 'app_shop_goods_type';

    protected $rules = [
        ['name', 'require|max:60', '请输入模型名称|模型名称最多不能超过60个字符'],
    ];

    public function dataFilter($appId){
        $request = request();
        $param = [
            "name" => (string)$request->param("name", ""),//模型名称
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
