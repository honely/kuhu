<?php

namespace app\website\model\website;

use app\website\model\CommonModel;

class CategoryModel extends CommonModel
{
    protected $pk = 'category_id';
    protected $name = 'app_website_product_category';


    protected $rules = [
        ['title', 'require|max:64', '请输入分类名称|分类名称最多不能超过64个字符'],
        ['orderby', 'require|number', '排序必须是数字'],
    ];


    public function dataFilter($appId)
    {
        $request = request();
        $param = [
            "title" => (string)$request->param("title", ""),//分类名称
            "orderby" => (int)$request->param("orderby", "0"),//排序
        ];
        $param['app_id'] = $appId;
        return $param;
    }


}
