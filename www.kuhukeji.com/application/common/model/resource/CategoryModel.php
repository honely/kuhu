<?php

namespace app\common\model\resource;

use app\common\model\CommonModel;

class CategoryModel extends CommonModel{
    protected $pk = 'category_id';
    protected $name = 'resource_category';


    protected $rules = [
        ['title', 'require|max:64', '请输入分类名称|分类名称最多不能超过64个字符'],
    ];


    public function dataFilter()
    {
        $request = request();
        $param = [
            "title" => (string)$request->param("title", ""),//分类名称
        ];
        return $param;
    }


}
