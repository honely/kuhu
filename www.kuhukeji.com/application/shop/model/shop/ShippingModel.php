<?php

namespace app\shop\model\shop;

use app\shop\model\CommonModel;

class ShippingModel extends CommonModel
{
    protected $pk = 'shipping_id';
    protected $name = 'app_shop_shipping';

    protected $rules = [
        ['shipping_code', 'require|max:20', '请输入快递代号|快递代号最多不能超过20个字符'],
        ['shipping_name', 'require|max:120', '请输入快递名称|快递名称最多不能超过120个字符'],
        ['shipping_desc', 'require|max:255', '请输入描述|描述最多不能超过255个字符'],
        ['enabled', 'require|number', '请输入是否开启|是否开启必须是数字'],
//        ['is_default', 'require|number', '请输入是否默认|是否默认必须是数字'],
    ];

    public function dataFilter($appId) {
        $request = request();
        $param = [
            "shipping_code" => (string)$request->param("shipping_code", ""),//快递代号
            "shipping_name" => (string)$request->param("shipping_name", ""),//快递名称
            "shipping_desc" => (string)$request->param("shipping_desc", ""),//描述
            "enabled"       => (int)  ($request->param("enabled", "0") == 1),//是否开启
            "is_default"    => (int)  ($request->param("is_default", "0") == 1),//是否默认
        ];
        $param['app_id'] = $appId;
        return $param;
    }






}
