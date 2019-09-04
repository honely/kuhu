<?php

namespace app\common\model\resource;

use app\common\model\CommonModel;

class AppCategoryModel extends CommonModel{
    protected $pk = 'category_id';
    protected $name = 'app_resource_category';


    protected $rules = [
        ['title', 'require|max:64', '请输入分类名称|分类名称最多不能超过64个字符'],
    ];


    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "title" => (string)$request->param("title", ""),//分类名称
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
