<?php
namespace app\website\model\website;

use app\website\model\CommonModel;

class ProductCategoryModel extends CommonModel
{
    protected $pk = 'category_id';
    protected $name = 'app_website_product_category';

    protected $rules = [
        ['app_id', 'number', 'APPID不能为空'],
        ['title', 'require|max:64', '名称必须填写|分类名称长度已超过限制'],
        ['orderby', 'number', '排序必须是数字'],
    ];


    public function dataFilter($app_id = 0)
    {
        $request = request();
        $param = [
            "app_id" => (int)$app_id,
            "title" => (string)$request->param("title", ""),//标题
            "orderby" => (int)$request->param("orderby", 0),//排序
        ];
        return $param;
    }


}
